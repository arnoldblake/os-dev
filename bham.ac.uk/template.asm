; nasm <file>.asm -f bin -o <file>.bin
; od -t x1 -A n <file>.bin
; qemu-system-i386 <file>.bin
; Template program

[org 0x7c00]

jmp $

; Padding and magic number
times 510-($-$$) db 0
dw 0xaa55
