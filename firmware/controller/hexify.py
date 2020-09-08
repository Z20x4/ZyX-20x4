import sys

def hexify(binary, outfile="program.h"):

    with open(binary, 'rb') as f:
        
        hexcode = f.read()
        # print(hexcode)
        fromatted_hex = ", ".join(map(hex, hexcode))
        # print(fromatted_hex)
        header = f"""
#ifndef Z80ASM_PROG
#define Z80ASM_PROG

#define PROG_SIZE {len(hexcode)}

uint8_t program_CUSTOM[] = {{
{fromatted_hex}
}};

#endif
"""
    return header
        # with open(outfile, 'w') as of:

        #     of.write(header)
        

if __name__=="__main__":
    print(hexify(f"{sys.argv[1]}"))