; load four sectors into RAM;

    org 7C00h
_bootblock_start:
    jmp short _start

_start:
    mov [7e00h], f4h ; move halt opcode in case read fails
    mov ax, 0204h ; call 2, sectors = 4
    mov bx, 7e00h ; load immediately after this sector 
    mov cx, 0001h ; Disk 0x00
    mov dx, 0000h ; CHS 0/0/1
    mov es, 0000h ; again, 0000:7e00
    int 13h
    jmp short 7e00h
    hlt
     
times 0200h - 2 - ($ - $$)  db 0    ;Zerofill up to 510 bytes
 
    dw 0AA55h                       ;Boot Sector signature
_bootblock_end: