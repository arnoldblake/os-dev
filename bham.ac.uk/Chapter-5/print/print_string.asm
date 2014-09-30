; Prints a NULL terminated string to the monitor using BIOS
; Uses BX as the address to the string

print_string:
  pusha

  mov ah, 0x0E

start:
  cmp byte [bx], 0
  je end

  mov al, [bx]
  int 0x10
  add bx, 1
  jmp start

end:
  popa
  ret
