; boot payload

    org 7e00h
_payload_start:
    jmp msgend

msg:    db "Hey, is this thing on?", 0
msgend:
    
    mov bx, msg
.loop:    
    mov ah, 0eh

    mov byte al, [bx]
    int 10h
    inc bx
    cmp bx, msgend
    jnz .loop
    hlt
     
times 0800h - ($ - $$)  db 0    ;Zerofill up to 2048 bytes
 
    dw 0AA55h       ;Boot Sector signature
_payload_end: