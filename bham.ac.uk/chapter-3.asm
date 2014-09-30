; nasm chapter-3.asm -f bin -o chapter-3.bin
; od -t x1 -A n chapter-3.bin
; A simple boot sector program that prints a message to the screen using BIOS.

  mov ah, 0x0e		; int 10/ah = 0eh -> scrolling teletype BIOS

  mov al, "H"
  int 0x10
  mov al, "e"
  int 0x10
  mov al, "l"
  int 0x10
  mov al, "l"
  int 0x10
  mov al, "o"
  int 0x10

  jmp $			; jump to current position forever

  times 510-($-$$) db 0
  dw 0xaa55		; Two byte magic number to mark boot sector
