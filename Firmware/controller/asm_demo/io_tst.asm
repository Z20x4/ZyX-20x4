    output "io_tst.bin", t 
    nop
    ld a, 0x05
    jp main


main:
    out (0x02), a
    out (0x00), a
    in a, (0x25)
    ; ld (0xff25), a
    ; ld (0x0001), a
    ; ld (0x0002), a
    ; ld (0x0004), a
    ; ld (0x0008), a

    ; ld (0x0010), a
    ; ld (0x0020), a
    ; ld (0x0040), a
    ; ld (0x0080), a

    ld (0x0100), a
    ld (0x0200), a
    ld (0x0400), a
    ld (0x0800), a

    ld (0x1000), a
    ld (0x2000), a
    ld (0x4000), a
    ld (0x8000), a

    jp main