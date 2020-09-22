    include "unit_tests.inc"
    include "bios.label"
    
    output "unit_tests.bin",t
    
    UNITTEST_INITIALIZE
    ret

    module TestSuite_IO

UT_io_putc:

    DEFAULT_REGS
    ld a, 'r'
    ld de, 0x0002
    ; rst 0x08
    call io_putc
    TEST_UNCHANGED_BC

    TEST_UNCHANGED_HL
    TEST_DREG de, 0x0002
    TEST_A 'r'

 TC_END

start: equ start_pointer

UT_io_init:
    
    DEFAULT_REGS
    call io_init
    ; ld de, 0xffff
    ; ld hl, 0xf0f0
    ; ld a, 0x01
    ; ld (hl), a
    ; TEST_MEMORY_BYTE start, 0x01
    ; TEST_MEMORY_WORD start_pointer, io_buf
    ; TEST_MEMORY_BYTE start_pointer, 0x01
    ; TEST_MEMORY_BYTE start_pointer+1, 0x00

    TEST_MEMORY_WORD start_pointer, 0x0100

    TEST_MEMORY_BYTE end_pointer, 0x01
    TEST_MEMORY_BYTE end_pointer+1, 0x00
 
 TC_END

low_addr: equ 0x3FFF
    .db 00

UT_ld_low_addrs:

    ld hl, low_addr
    ld a, 0xff
    ld (hl), a
    TEST_MEMORY_BYTE low_addr, 0xff 

 TC_END

high_addr: equ 0x4000
    .db 00

UT_ld_high_addrs:

    ld hl, high_addr
    ld a, 0xff
    ld (hl), a
    TEST_MEMORY_BYTE high_addr, 0xff

 TC_END

    endmodule
    outend