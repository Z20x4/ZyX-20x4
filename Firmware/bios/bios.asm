    include "bios.inc"
    IFDEF TEST
        incbin "unit_tests.bin"
    ENDIF
    output "bios.bin", t

    .porg 0x00
RST0:
    jp init
    
;Args: A, HL, DE, BC
    .porg 0x08
RST8:
    call lookup
    .dw RST8_LOOKUP  ;  Address of lookup table RST8_FUNCS 

    .porg 0x10
RST10:
    call lookup
    .dw RST10_LOOKUP  ;  Address of lookup table RS10_FUNCS

    .porg 0x18
RST18:
    call lookup
    .dw RST18_LOOKUP  ;  Address of lookup table RS18_FUNCS

    .porg 0x20
RST20:
    call lookup
    .dw RST20_LOOKUP  ;  Address of lookup table RS20_FUNCS

    .porg 0x28
RST28:
    call lookup
    .dw RST28_LOOKUP  ;  Address of lookup table RS28_FUNCS

    .porg 0x30
RST30:
    call lookup
    .dw RST30_LOOKUP  ;  Address of lookup table RS30_FUNCS

    .porg 0x38
RST38:
    ei
    reti

    ; .porg 0x100
lookup:
    ; add hl, bc
    push de       ;save handler index
    di            ;disable nested interrupts
    exx           ;replace registers with their shadow copies
    pop bc        ;load handler index into bc
    pop hl        ;load return address(with address of lookup table) into hl
    ld de, (hl)   ;load lookup table address into de
    ex de, hl     ;Put the lookup table address into hl
    add hl, bc    ;Get lookup table cell address(table address + handler index)
    ld e, (hl)    ;Load lower byte of handler address
    inc hl        ;Increment by one byte - Z80 is big endian
    ld d, (hl)    ;Load higher byte of handler address
;-------------------------------------------------Current Version
    push de       ;Seems better than FAKE_CALL: push handler address as return address
    exx           ;load back regular registers
    ei            ;enable interrupts
    ret           ;Call handler: stack top will be the return address from RST and will be popped by subsequent return from handler

;-------------------------------------------------Fake call version
    ; ex de, hl   ;Handler address is in HL
;     call FAKE_CALL;Push return address
; FAKE_CALL:
;     ex (sp), hl   ;Change return address to handler address. Disgard old return address
    ; exx           ;load back regular registers
    ; ei            ;enable interrupts
    ; ret           ;Call handler: stack top will be the return address from RST and will be popped by subsequent return from handler
;------------------------------------------------

;------------------------------------------------ Self-modifying version
;     ld (CALL_TO_CHANGE + 1), de ;Set call address to be the one from the table  :SELF_MODYFYING
;     exx
;     ei
; CALL_TO_CHANGE:
;     call    0x0000      ;Dummy address, to be replaced by previous load
;     ret
; -----------------------------------------------


    ; .porg 0x200
RST8_LOOKUP: ;IO handlers
    .dw io_init
    .dw io_putc
    .dw io_puts
    ; .dw io_bufsize ;TODO
    .dw io_getc
    .dw io_gets
    ; .dw io_wait ;???

    ; .porg 0x210
RST10_LOOKUP: ;Storage handlers
    .dw st_init    ;TODO
    .dw st_seek    ;TODO
    .dw st_read    ;TODO
    .dw st_write   ;TODO
    ; .dw st_steps   ;TODO
    ; .dw st_moves   ;TODO
    ; .dw st_chunks  ;TODO
    ; .dw st_readc   ;TODO
    ; .dw st_writec  ;TODO

RST18_LOOKUP: ;Virtual memory handlers
    ; .dw vm_init    ;TODO
    ; .dw vm_reset   ;TODO
    ; .dw vm_pt_load ;TODO
    ; .dw vm_pt_store;TODO

RST20_LOOKUP: ;Timer handlers
    .dw tm_init    ;TODO
    .dw tm_scales  ;TODO
    .dw tm_cmps    ;TODO
    .dw tm_ints    ;TODO
    .dw tm_start   ;TODO
    .dw tm_stop    ;TODO
    ; .dw tm_wait    ;TODO
    .dw tm_valg    ;TODO

RST28_LOOKUP: ;Debug handler
    ; .dw db_break   ;TODO

RST30_LOOKUP: ;Other device custom handlers
    ;TODO


    .porg 0x100          ; dreserve space for io bufffer
io_buf:                     
    .block 0x100         ; io buffer content

    .porg 0x200         
start_pointer:           ; io buffer begin offset
    .dw 0000  
    .porg 0x202         
end_pointer:             ; io buffer end offset
    .dw 0000


;---IO FUNCTIONS START---;

; Args: character to print in A
    .porg 0x220
io_putc:
    out (0x01), a
    ret

; Tested
io_init:
    push hl						; save registers contents
	push de
    ld hl, start_pointer        
    ld de, io_buf
    ld (hl), de
    ld hl, end_pointer
	ld (hl), de
    pop de
    pop hl
    ret
    
; Tested
io_gets:                        ; Recieves destination buffer in HL, number of bytes to read in B, returns number of read bytes in A
    push bc
    push hl
    ld a, 0                     ; check if B is 0
    cp b                        
    jp z, io_gets_loop_end
    ld c, 0                     ; Counter of read bytes
io_gets_loop: 
    call io_getc
    ld (hl), a                  ; load content of A to destination
    or a                        ; check if A is zero
    jp z, io_gets_loop_end       ; finish loop if getc returned 0
    inc c                       
    inc hl                      
    djnz io_gets_loop           ; dec b
io_gets_loop_end:
    ld a, c
    pop hl
    pop bc
    ret
    

io_bufsize:
    push hl
    ld hl, (start_pointer)
    ld de, (end_pointer)
    ld a, e
    sub l
    pop hl
    ret


; Tested
io_getc:
    push hl                     ; save registers contents
    push de
    ld a, (start_pointer)       ; load high byte of start_queue address
    ld de, (end_pointer)        ; load high byte of end_queue address 
    sub e                       ; compare a and e registers
    jp nz, load_from_queue      ; go on execution if they are not equal
    ld a, (start_pointer + 1)   ; load low byte of start_queue address
    ld de, (end_pointer + 1)    ; load low byte of end_queue address
    sub e
    jp z, io_getc_end           ; if zero flag is set, a is 0 anyway, so no need to set it to 0, we can go ot return
load_from_queue:
    ld hl, (start_pointer)
    ld d, (hl)                  ; load character to D
    inc l                       ; increment the address of queue start (jump to 0x%%00 if the size was 0x%%FF)
    ld (start_pointer), hl
    ld a, d
io_getc_end:
    pop de                      ; restore registers content
    pop hl
    ret


; Tested
io_queue_push:  ;Value to push in A. Push a character to IO queue
    push hl                     ; store registers content
    push de
	push bc
    ld hl, (end_pointer)        ; load address of queue end to hl via 
 	ld (hl), a                  ; store the character
   	inc l                       ; move end of queue 
  	 

	ld d, h                     ; load hl to de
	ld e, l
	ld hl, end_pointer          ; load end of queue address to hl
 	ld (hl), de                 ; store new high byte of end of queu                  ; store new low byte of queue
	pop bc                      ; restore registers content
	pop de
	pop hl
    ret


io_puts:
    push hl
io_puts_loop:
    ld a, (hl)
    out (0x01), a
    inc hl
    or a
    jp nz, io_puts_loop
io_puts_ret:
    pop hl
    ret


io_wait:
    call io_bufsize
    ret nz
    halt
    jr io_wait

;---IO FUNCTIONS END---;

;---STORAGE FUNCTIONS START---;
st_init:
    out (0x48), a
    in a, (0x00)
    ret

st_seek:
    push bc
    ld c, 0x49                  ; 0x49 is the output port for the first byte of block address
    outi                        ; output data stored at HL into port C, then increment HL
    inc c                       ; Increment C, next port is for the next byte of address
    outi                        ; Repeat for all four bytes
    inc c 
    outi 
    inc c 
    outi 
    inc c  
    pop bc
    in a, (0x00)
    ret

st_read:
    ld a, h   ;load into A, since out with immediates only works with A
    out (0x53), a
    in a, (0x00)
    ret

st_write:
    ld a, h   ;load into A, since out with immediates only works with A
    out (0x54), a
    in a, (0x00)
    ret

;---STORAGE FUNCTIONS END---;

; TIMER FUNCTIONS
tm_init:
    out (0x47), a
    ret

tm_scales:
    out (0x41), a
    ret

tm_cmps:
    out (0x42), a
    ret

tm_ints:
    out (0x43), a
    ret

tm_start:
    out (0x44), a
    ret

tm_stop:
    out (0x45), a
    ret

tm_valg:
    in a, (0x46)
    ret

; END OF TIMER FUNCTIONS



;    .porg 0x300
init: 
    ld sp, stack_top
    ld a, 'r'
    push af
    ld de, 0x0002
    rst 0x08        ;RST08 with e=0x02 calls putc
    ; jp stack_top
    halt

stack_bottom:
    .porg 0xFF00
stack_top:
    nop
    
    outend


