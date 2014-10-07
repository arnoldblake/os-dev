; nasm chapter-3_3.asm -f bin -o chapter-3_3.bin
; od -t x1 -A n chapter-3_3.bin
; Template program

[org 0x7c00]
  

  mov ah, 0x0e

  mov bp, 0x8000
  mov sp, bp

  push "A"
  push "B"
  push "C"

  pop bx
  mov al, bl
  int 0x10

  pop bx
  mov al, bl
  int 0x10

  mov al, [0x7ffe]
  int 0x10

  jmp $

  times 510-($-$$) db 0
  dw 0xaa55		; Two byte magic number to mark boot sector
