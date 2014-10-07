;
; A boot sector that prints a string using our function
;

[org 0x7C00]

  mov bx, HELLO_MSG	; Use BX as a parameter to our function, so
  call print_string	; we can specify the address of a string.

  mov bx, GOODBYE_MSG
  call print_string

  jmp $			; hang

%include "print_string.asm"

HELLO_MSG:
  db "Hello, World!", 0
GOODBYE_MSG:
  db "Goodbye!", 0

  times 510-($-$$) db 0
  dw 0xAA55
