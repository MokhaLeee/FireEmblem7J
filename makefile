.SUFFIXES:

# ==================
# = PROJECT CONFIG =
# ==================

BUILD_NAME := FireEmblem7J

SRC_DIR = src
ASM_DIR = asm
BUILD_DIR = build

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

LDS := $(BUILD_NAME).lds
ROM := $(BUILD_NAME).gba
ELF := $(ROM:%.gba=%.elf)
MAP := $(ROM:%.gba=%.map)
SYM := $(ROM:%.gba=%.sym)

C_SRCS := $(wildcard $(SRC_DIR)/*.c)
C_OBJS := $(C_SRCS:%.c=$(BUILD_DIR)/%.o)

ASM_SRCS := $(wildcard $(SRC_DIR)/*.s) $(wildcard $(ASM_DIR)/*.s)
ASM_OBJS := $(ASM_SRCS:%.s=$(BUILD_DIR)/%.o)

DATA_SRCS := $(wildcard data/*.s)
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
	@$(SHASUM) -c FireEmblem7J.sha1

.PHONY: compare

all: $(ROM) $(ELF) $(MAP) $(SYM)

clean:
	@echo "[ RM]	$(ROM) $(ELF) $(MAP) $(BUILD_DIR)/"
	@rm -f $(ROM) $(ELF) $(MAP) $(SYM)
	@rm -fr $(BUILD_DIR)/

.PHONY: clean

syms: $(SYM)

%.gba: %.elf
	@echo "[GEN]	$@"
	@$(OBJCOPY) --strip-debug -O binary $< $@

$(ELF): $(ALL_OBJS) $(LDS)
	@echo "[ LD]	$@"
	@cd $(BUILD_DIR) && $(LD) -T ../$(LDS) -Map ../$(MAP) -L../tools/agbcc/lib $(ALL_OBJS:$(BUILD_DIR)/%=%) -lc -lgcc -o ../$@

# C dependency file
$(BUILD_DIR)/%.d: %.c
	@$(CPP) $(CPPFLAGS) $< -o $@ -MM -MG -MT $@ -MT $(BUILD_DIR)/$*.o

# C object
$(BUILD_DIR)/%.o: %.c
	@echo "[ CC]	$<"
	@$(CPP) $(CPPFLAGS) $< | iconv -f UTF-8 -t CP932 | $(CC1) $(CFLAGS) -o $(BUILD_DIR)/$*.s
	@echo ".ALIGN 2, 0" >> $(BUILD_DIR)/$*.s
	@$(AS) $(ASFLAGS) $(BUILD_DIR)/$*.s -o $@

# ASM dependency file (dummy, generated with the object)
$(BUILD_DIR)/%.d: $(BUILD_DIR)/%.o
	@touch $@

# ASM object
$(BUILD_DIR)/%.o: %.s
	@echo "[ AS]	$<"
	@$(AS) $(ASFLAGS) $< -o $@ --MD $(BUILD_DIR)/$*.d

ifneq (clean,$(MAKECMDGOALS))
  -include $(ALL_DEPS)
  .PRECIOUS: $(BUILD_DIR)/%.d
endif

# =====================
# = CFLAGS overrides =
# =====================

# not yet supported by agbcc :/
# %/main.o:            CFLAGS += -mtpcs-frame

%/irq.o:             CFLAGS += -O0
%/random.o:          CFLAGS += -O0
%/agb-sram.o:        CFLAGS += -O1

# ===============
# = Symbol file =
# ===============

$(SYM): $(ELF)
	@echo "[GEN]	$@"
	@$(OBJDUMP) -t $< | sort -u | grep -E "^0[2389]" | $(PERL) -p -e 's/^(\w{8}) (\w).{6} \S+\t(\w{8}) (\S+)$$/\1 \2 \3 \4/g' > $@
