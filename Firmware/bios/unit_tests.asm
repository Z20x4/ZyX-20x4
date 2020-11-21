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


UT_io_queue_push:
    call io_init 
    ld a, 'a'

    ld de, 0
    ld bc, 0
    ld hl, 0
    call io_queue_push
    TEST_DREG de, 0
    TEST_DREG bc, 0
    TEST_DREG hl, 0

    TEST_MEMORY_WORD start_pointer, 0x0100
    TEST_MEMORY_WORD end_pointer, 0x0101

    ld hl, (start_pointer)
    ld a, (hl)
    TEST_A 'a'
    ld a, 'f'
    call io_getc

 TC_END

UT_io_getc:
    call io_init
    ld a, 'a'
    call io_queue_push
    ld a, 's'
    call io_getc
    TEST_A 'a'
    TEST_MEMORY_WORD start_pointer, 0x0101
    TEST_MEMORY_WORD end_pointer, 0x0101
 TC_END

UT_io_bufsize:
    call io_init
    call io_bufsize
    TEST_REG a, 0
    call io_queue_push
    call io_bufsize
    TEST_REG a, 1
    call io_getc
    call io_bufsize
    TEST_REG a, 0    
    
 TC_END


UT_io_init:
    
    DEFAULT_REGS
    call io_init
    TEST_MEMORY_WORD start_pointer, 0x0100
    TEST_MEMORY_WORD end_pointer, 0x0100
 
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