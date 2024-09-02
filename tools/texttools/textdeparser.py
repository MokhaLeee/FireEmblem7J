#!/bin/python3
# decoded data ---> parsed string

def parse_string_direct(u16_data):
    output = ""
    if u16_data == 0:
        return "\\x00"

    data_hi = (u16_data >> 8) & 0xFF
    data_lo = u16_data & 0xFF

    # little eddin!
    output = output + f"[0x{data_lo:02X}]"
    if data_hi != 0:
        output = output + f"[0x{data_hi:02X}]"

    return output

def parse_string_face_id(u16_data):
    if u16_data == 0xFFFF:
        return "[FID_Active]"
    else:
        fid = u16_data & 0xFF
        return f"[FID_0x{fid:02X}]"

def parse_string_core(data, cur_idx):

    appr_len = 0

    u16_data = data[cur_idx]

    if u16_data == 0:
        output = "[X]"
    elif u16_data == 1:
        output = "[LF]\n"   # replace of [NL]
    elif u16_data == 2:
        output = "[CR]"     # replace of [NL2]
    elif u16_data == 3:
        output = "[A]"
    elif u16_data == 4:
        output = "[....]"
    elif u16_data == 5:
        output = "[.....]"
    elif u16_data == 6:
        output = "[......]"
    elif u16_data == 7:
        output = "[.......]"
    elif u16_data == 8:
        output = "[OpenFarLeft]"
    elif u16_data == 9:
        output = "[OpenMidLeft]"
    elif u16_data == 10:
        output = "[OpenLeft]"
    elif u16_data == 11:
        output = "[OpenRight]"
    elif u16_data == 12:
        output = "[OpenMidRight]"
    elif u16_data == 13:
        output = "[OpenFarRight]"
    elif u16_data == 14:
        output = "[OpenFarFarLeft]"
    elif u16_data == 15:
        output = "[OpenFarFarRight]"
    elif u16_data == 16:
        output = "[LoadFace]" 
        # output = output + parse_string_direct(data[cur_idx + 1])
        output = output + parse_string_face_id(data[cur_idx + 1])
        appr_len = 1
    elif u16_data == 17:
        output = "[ClearFace]"
    elif u16_data == 18:
        output = "[NormalPrint]"
    elif u16_data == 19:
        output = "[FastPrint]"
    elif u16_data == 20:
        output = "[CloseSpeechFast]"
    elif u16_data == 21:
        output = "[CloseSpeechSlow]"
    elif u16_data == 22:
        output = "[ToggleMouthMove]"
    elif u16_data == 23:
        output = "[ToggleSmile]"
    elif u16_data == 24:
        output = "[Yes]"
    elif u16_data == 25:
        output = "[No]"
    elif u16_data == 26:
        output = "[BuySell]"
    elif u16_data == 27:
        output = "[ShopContinue]"
    elif u16_data == 28:
        output = "[SendToBack]"
    elif u16_data == 29:
        output = "[FastPrint]" # fe8 only
    elif u16_data == 31:
        output = "[.]"
    elif u16_data == 0x7F:
        output = "[DashedLine]"
    elif u16_data == 0xE9:
        output = "[AccentedE]"
    elif u16_data == 0x80: # face ctrl
        appr_len = 1
        ctrl = data[cur_idx + 1]
        if ctrl == 0 or ctrl == 1 or ctrl == 2 or ctrl == 3 or ctrl == 4 or ctrl == 7 or ctrl == 8 or ctrl == 9:
            output = f"[Unused800{ctrl}]"
        if ctrl == 4:
            output = "[LoadOverworldFaces]"
        elif ctrl == 5:
            output = "[G]"
        elif ctrl == 6:
            output = "[Unknown8006]"
        elif ctrl == 0xA:
            output = "[MoveFarLeft]"
        elif ctrl == 0xB:
            output = "[MoveMidLeft]"
        elif ctrl == 0xC:
            output = "[MoveLeft]"
        elif ctrl == 0xD:
            output = "[MoveRight]"
        elif ctrl == 0xE:
            output = "[MoveMidRight]"
        elif ctrl == 0xF:
            output = "[MoveFarRight]"
        elif ctrl == 0x10:
            output = "[MoveFarFarLeft]"
        elif ctrl == 0x11:
            output = "[MoveFarFarRight]"
        elif ctrl == 0x16:
            output = "[EnableBlinking]"
        elif ctrl == 0x17:
            output = "[Unknown8017]"
        elif ctrl == 0x18:
            output = "[DelayBlinking]"
        elif ctrl == 0x19:
            output = "[PauseBlinking]"
        elif ctrl == 0x1B:
            output = "[DisableBlinking]"
        elif ctrl == 0x1C:
            output = "[OpenEyes]"
        elif ctrl == 0x1D:
            output = "[CloseEyes]"
        elif ctrl == 0x1E:
            output = "[HalfCloseEyes]"
        elif ctrl == 0x1F:
            output = "[Wink]"
        elif ctrl == 0x20:
            output = "[Tact]"
        elif ctrl == 0x21:
            output = "[ToggleRed]"
        elif ctrl == 0x22:
            output = "[Item]"
        elif ctrl == 0x23:
            output = "[SetName]"
        elif ctrl == 0x25:
            output = "[ToggleColorInvert]"
        else:
            output = f"[!!ERROR:0x{ctrl:02X}]"
    elif u16_data == 0x4081:
        output = "[TAB]"
    elif u16_data == 0xE3:
        output = "\\xE3"
    else:
        output = parse_string_direct(u16_data)

    return appr_len, output


def parse_string(decoded_data):
    parsed_string = ""
    idx = 0
    while True:
        if idx >= len(decoded_data):
            break

        cur = idx
        idx = idx + 1

        data_cur = decoded_data[cur]

        decoded = False
        try:
            decoded_ch = data_cur.to_bytes(2, byteorder='little').decode('cp932', errors='strict')
            decoded = True
        except UnicodeDecodeError:
            decoded = False

        if decoded and decoded_ch.isprintable():
            parsed_string = parsed_string + decoded_ch
        else:
            appr_len, this_string = parse_string_core(decoded_data, cur)

            parsed_string = parsed_string + this_string
            idx = idx + appr_len

    return parsed_string
    # just for test
    # return [f"0x{_data:04X}" for _data in decoded_data]
