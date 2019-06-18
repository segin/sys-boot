; boot payload

    org 7e00h
_payload_start:

     
times 0800h - ($ - $$)  db 0    ;Zerofill up to 2048 bytes
 
    dw 0AA55h       ;Boot Sector signature
_payload_end: