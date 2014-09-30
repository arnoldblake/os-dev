; nasm chapter-3.asm -f bin -o chapter-3.bin
; od -t x1 -A n chapter-3.bin
; Template program

[org 0x7c00]

mov bx, 30

cmp bx, 4
jle move_a

cmp bx, 40
jl move_b

jmp move_default

end:
mov ah, 0x0e
int 0x10

jmp $

move_default:
  mov al, "C"
  jmp end
move_a:
  mov al, "A"
  jmp end
move_b:
  mov al, "B"
  jmp end

; Padding and magic number
times 510-($-$$) db 0
dw 0xaa55

