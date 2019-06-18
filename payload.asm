; boot payload

    org 7e00h
_payload_start:
    jmp msgend

msg:    db "Hey, is this thing on?", 0
msgend:
    
    mov cx, msg
.loop:    
    mov ah, 0eh
    mov bx, cx
    mov byte al, [bx]
    mov bx, 0000h
    int 10h
    inc cx
    cmp cx, msgend
    jnz .loop
    hlt
     
times 0800h - ($ - $$)  db 0    ;Zerofill up to 2048 bytes
 
 _payload_end: