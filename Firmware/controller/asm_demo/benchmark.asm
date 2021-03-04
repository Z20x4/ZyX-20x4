    output "benchmark.bin", t 
    nop
    jp main



    
main:
    ld a, 1

lp_outer:
    ld hl, 0
    out (0x02), a

loop:
    inc hl
    jp nz, loop

    ; out (0x0f), a
    ; out (0x01), a
    inc a
    jp lp_outer


  

outend     