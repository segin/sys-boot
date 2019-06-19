; boot payload

    org 7e00h
_payload_start:
    jmp msgend

msg:    db "Hey, is this thing on?", 0
msgend:
    
    mov cx, msg         ; move pointer to cx
.loop:    
    mov ah, 0eh         ; service call 0x0E, Write Character
    mov bx, cx          ; Can't use cx as source address for
    mov byte al, [bx]   ; move from memory
    mov bx, 0000h       ; reset bx back to zero, the call uses bl
    int 10h             ; call BIOS
    inc cx              ; advance character pointer  
    cmp cx, msgend      ; did we reach the end of the message?
    jnz .loop           ; if not, jump back and display next byte
    hlt                 ; stop the CPU.
     
times 0800h - ($ - $$)  db 0    ;Zerofill up to 2048 bytes
 
 _payload_end: