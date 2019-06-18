; load four sectors into RAM;

    org 7C00h
_bootblock_start:
    jmp short _start

_start:
    ; init segment registers
    xor ax, ax
    mov ds, ax
    mov es, ax

    ; set up stack starting at 0x00500 (0050:0000), stopping at 0x07c00
    mov ax, 0050h
    mov ss, ax
    mov ax, 7800h
    mov sp, ax

    ; set up "default" payload in case payload load fails
    mov byte [7e00h], 0xf4 ; halt opcode, so we don't just crash

    cli           ; disable interrupts 
    ; load payload into RAM 
    mov ax, 0204h ; call 2, sectors = 4
    mov bx, 7e00h ; load immediately after this sector 
    mov cx, 0102h ; Disk 0x00
    mov dx, 0000h ; CHS 0/0/1
;    xor es, es    ; again, 0000:7e00
    int 13h

    ; jump to payload
    jmp near _payload_start
    hlt
     
times 0200h - 2 - ($ - $$)  db 0    ;Zerofill up to 510 bytes
 
    dw 0AA55h                       ;Boot Sector signature
_bootblock_end:
_payload_start: