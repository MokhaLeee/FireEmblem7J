.SUFFIXES:

# ==================
# = PROJECT CONFIG =
# ==================

BUILD_NAME := FireEmblem7J

SRC_DIR = src
ASM_DIR = asm
BUILD_DIR = build

# VERSION=jp : original Japanese ROM (default)
# VERSION=cn : Chinese fan-translation patch, base ROM given by BASEROM_CN
VERSION ?= jp
ROM_NAME := $(BUILD_NAME)
SHA1_FILE := $(BUILD_NAME).sha1

ifeq ($(VERSION),cn)
  BUILD_DIR = build_cn
  ROM_NAME := $(BUILD_NAME)_cn
  SHA1_FILE := $(BUILD_NAME)_cn.sha1
  BASEROM_CN ?= ../baserom/fire.gba
  # extra symbols for data the patch moved or added
  LD_EXTRA := ../$(BUILD_NAME)_cn_syms.ld
endif

CLEAN_FILES :=
CLEAN_DIRS  :=

all: compare

# ====================
# = TOOL DEFINITIONS =
# ====================

ifeq ($(OS),Windows_NT)
  EXE := .exe
else
  EXE :=
  UNAME_S := $(shell uname -s)
endif

TOOLCHAIN ?= $(DEVKITARM)
AGBCC_HOME ?= tools/agbcc

ifneq (,$(TOOLCHAIN))
  export PATH := $(TOOLCHAIN)/bin:$(PATH)
endif

PREFIX := arm-none-eabi-

ifeq ($(UNAME_S),Darwin)
  ifneq (,$(TOOLCHAIN))
    PREFIX := $(TOOLCHAIN)/bin/$(PREFIX)
  endif
  SHASUM ?= shasum
endif

export OBJCOPY := $(PREFIX)objcopy
export OBJDUMP := $(PREFIX)objdump
export AS := $(PREFIX)as
export CPP := $(PREFIX)cpp
export LD := $(PREFIX)ld
export STRIP := $(PREFIX)strip

CC1     := $(AGBCC_HOME)/bin/old_agbcc$(EXE)
CC1_NEW := $(AGBCC_HOME)/bin/agbcc$(EXE)

SHASUM ?= sha1sum
PERL := perl

# ================
# = BUILD CONFIG =
# ================

CPPFLAGS := -I $(AGBCC_HOME)/include -iquote include -iquote . -nostdinc -undef
CFLAGS := -g -mthumb-interwork -Wimplicit -Wparentheses -Werror -fhex-asm -ffix-debug-line -O2
ASFLAGS := -mcpu=arm7tdmi -I asm/include -I include
LDFLAGS := # --no-warn-rwx-segments

ifeq ($(VERSION),cn)
  CPPFLAGS += -DVERSION_CN
  ASFLAGS += --defsym VERSION_CN=1
endif

LDS := $(BUILD_NAME).lds
C_SRCS := $(shell find $(SRC_DIR) -name *.c)
ASM_SRCS := $(shell find $(SRC_DIR) -name *.s) $(shell find $(ASM_DIR) -name *.s)
DATA_SRCS := $(shell find data -name *.s)

C_GENERATED :=

# =========
# = Texts =
# =========
TEXT_DIR := texts
TEXT_TOOLS := tools/texttools

TEXT_DECODER := $(TEXT_TOOLS)/textdecoder.py
TEXT_DPARSER := $(TEXT_TOOLS)/textdeparser.py
TEXT_PROCESS := $(TEXT_TOOLS)/textprocess.py
TEXT_ENCODE := tools/textencode/textencode

TEXT_MAIN := $(TEXT_DIR)/texts.txt
TEXT_DEFS := $(TEXT_DIR)/textdefs.txt
TEXT_SRC  := $(TEXT_MAIN) $(shell find $(TEXT_DIR) -type f -name "*.txt")

# TEXT_HEADER := include/constants/msg.h
MSG_LIST    := src/msg_data.c

# this should just be used for testing
$(TEXT_MAIN):
	@echo "[GEN]	$@"
	@$(PYTHON) $(TEXT_DECODER) > $@

$(MSG_LIST) $(TEXT_HEADER): $(TEXT_SRC) $(TEXT_DEFS)
	@echo "[GEN]	$@"
	@$(PYTHON) $(TEXT_PROCESS) $(TEXT_MAIN) $(TEXT_DEFS) $(MSG_LIST) $(TEXT_HEADER) cp932

# C_GENERATED += $(MSG_LIST)
CLEAN_FILES += $(MSG_LIST) # $(TEXT_HEADER)

# ===========
# = Targets =
# ===========

ROM := $(ROM_NAME).gba
ELF := $(ROM:%.gba=%.elf)
MAP := $(ROM:%.gba=%.map)
SYM := $(ROM:%.gba=%.sym)

ifeq (,$(findstring $(C_GENERATED),$(C_SRCS)))
C_SRCS += $(C_GENERATED)
endif

C_OBJS := $(C_SRCS:%.c=$(BUILD_DIR)/%.o)
ASM_OBJS := $(ASM_SRCS:%.s=$(BUILD_DIR)/%.o)
DATA_OBJS := $(DATA_SRCS:%.s=$(BUILD_DIR)/%.o)

ALL_OBJS := $(C_OBJS) $(ASM_OBJS) $(DATA_OBJS)
ALL_DEPS := $(ALL_OBJS:%.o=%.d)

SUBDIRS := $(sort $(dir $(ALL_OBJS)))
$(shell mkdir -p $(SUBDIRS))

# ===========
# = RECIPES =
# ===========

compare: $(ROM)
	@echo "[SHA]	$<"
	@$(SHASUM) -c $(SHA1_FILE)

.PHONY: compare

syms: $(SYM)

%.gba: %.elf
	@echo "[GEN]	$@"
	@$(OBJCOPY) --strip-debug -O binary $< $@

CLEAN_FILES += $(ROM)

$(ELF): $(ALL_OBJS) $(LDS) $(LD_EXTRA:../%=%)
	@echo "[ LD]	$@"
	@cd $(BUILD_DIR) && $(LD) -T ../$(LDS) -Map ../$(MAP) -L../tools/agbcc/lib $(ALL_OBJS:$(BUILD_DIR)/%=%) $(LD_EXTRA) -lc -lgcc -o ../$@ $(LDFLAGS)

CLEAN_FILES += $(ELF) $(MAP)

# C dependency file
$(BUILD_DIR)/%.d: %.c
	@$(CPP) $(CPPFLAGS) $< -o $@ -MM -MG -MT $@ -MT $(BUILD_DIR)/$*.o

# C object
$(BUILD_DIR)/%.o: %.c $(BUILD_DIR)/%.d
	@echo "[ CC]	$<"
	@$(CPP) $(CPPFLAGS) $< | iconv -f UTF-8 -t CP932 | $(CC1) $(CFLAGS) -o $(BUILD_DIR)/$*.s
	@printf ".text\n\t.align\t2, 0\n" >> $(BUILD_DIR)/$*.s
	@$(AS) $(ASFLAGS) $(BUILD_DIR)/$*.s -o $@
	@$(STRIP) -N .gcc2_compiled. $@

# ASM dependency file (dummy, generated with the object)
$(BUILD_DIR)/%.d: $(BUILD_DIR)/%.o
	@touch $@

# ASM object
$(BUILD_DIR)/%.o: %.s
	@echo "[ AS]	$<"
	@$(AS) $(ASFLAGS) $< -o $@ --MD $(BUILD_DIR)/$*.d

ifeq ($(VERSION),cn)
# gas looks for .incbin files in the current directory first, so data is
# assembled from inside the build dir where the base ROM name points at the
# Chinese ROM instead of the original one.
CN_BASEROM_LINK := $(BUILD_DIR)/$(BUILD_NAME).base.gba

$(CN_BASEROM_LINK):
	@ln -sf $(abspath $(BASEROM_CN)) $@

CN_DATA_ASFLAGS := -mcpu=arm7tdmi -I ../asm/include -I ../include --defsym VERSION_CN=1

$(DATA_OBJS): $(BUILD_DIR)/%.o: %.s | $(CN_BASEROM_LINK)
	@echo "[ AS]	$<"
	@cd $(BUILD_DIR) && $(AS) $(CN_DATA_ASFLAGS) ../$< -o $*.o --MD $*.d
endif

ifneq (clean,$(MAKECMDGOALS))
  -include $(ALL_DEPS)
  .PRECIOUS: $(BUILD_DIR)/%.d
endif

CLEAN_DIRS += $(BUILD_DIR)

# =====================
# = CFLAGS overrides =
# =====================

# not yet supported by agbcc :/
# %/main.o:            CFLAGS += -mtpcs-frame

%/irq.o:             CFLAGS += -O0
%/random.o:          CFLAGS += -O0
%/agb-sram.o:        CFLAGS += -O1
%/hardware.o:        CFLAGS += -O0
%/move-data.o:       CFLAGS += -O0
%/oam.o:             CFLAGS += -O0

# ===============
# = Symbol file =
# ===============

$(SYM): $(ELF)
	@echo "[GEN]	$@"
	@$(OBJDUMP) -t $< | sort -u | grep -E "^0[2389]" | $(PERL) -p -e 's/^(\w{8}) (\w).{6} \S+\t(\w{8}) (\S+)$$/\1 \2 \3 \4/g' > $@

CLEAN_FILES += $(SYM)

# ==============
# = Make clean =
# ==============
CLEAN_DIRS += $(shell find . -type d -name "__pycache__")

clean:
	@rm -f $(CLEAN_FILES)
	@rm -rf $(CLEAN_DIRS)
	@echo "all cleaned..."

.PHONY: clean
