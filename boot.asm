; load four sectors into RAM;

    org 7C00h
_bootblock_start:
    jmp short _start

_start:
    ; set up "default" payload in case payload load fails
    mov al, f4h ; halt opcode, so we don't just crash
    mov [7e00], al

    ; load payload into RAM 
    mov ax, 0204h ; call 2, sectors = 4
    mov bx, 7e00h ; load immediately after this sector 
    mov cx, 0001h ; Disk 0x00
    mov dx, 0000h ; CHS 0/0/1
    mov es, 0000h ; again, 0000:7e00
    int 13h

    ; jump to payload
    jmp short 7e00h
    hlt
     
times 0200h - 2 - ($ - $$)  db 0    ;Zerofill up to 510 bytes
 
    dw 0AA55h                       ;Boot Sector signature
_bootblock_end: