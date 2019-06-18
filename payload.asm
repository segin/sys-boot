; load four sectors into RAM;

    org 7C00h
_bootblock_start:
    jmp short _start

_start:
    hlt

     
times 0200h - 2 - ($ - $$)  db 0    ;Zerofill up to 510 bytes
 
    dw 0AA55h       ;Boot Sector signature
_bootblock_end: