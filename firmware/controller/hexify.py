import sys

def hexify(binary, outfile="program.h"):

    with open(binary, 'rb') as f:
        
        hexcode = f.read()
        fromatted_hex = ", ".join(map(hex, hexcode))
    return f"""
#ifndef Z80ASM_PROG
#define Z80ASM_PROG

#define PROG_SIZE {len(hexcode)}

uint8_t program_CUSTOM[] = {{
{fromatted_hex}
}};

#endif
"""

if __name__=="__main__":
    print(hexify(f"{sys.argv[1]}"))