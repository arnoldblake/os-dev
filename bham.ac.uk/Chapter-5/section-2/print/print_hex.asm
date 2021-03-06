; 
; 
;

print_hex:
  pusha

    xor ax, ax					; Zero AX and move bitmask into AX
    add ax, 0x000F

  print_hex_start:				; Move input DX into BX, and it with the bitmask
    mov bx, dx
    and bx, ax
    cmp bx, 9
    jle print_hex_number
    jmp print_hex_alpha

  print_hex_number:
    add bx, 48
    jmp print_hex_end

  print_hex_alpha:
    add bx, 55
    jmp print_hex_end

  print_hex_end:
    push bx
    shr dx, 4
    cmp dx, 0
    jg print_hex_start

  mov bx, HEX_OUT  

  print_hex_load:
    pop ax
    mov [bx], ax
    add bx, 1
    cmp bx, 0
    jne print_hex_load

  mov bx, HEX_OUT
  call print_string

  popa
  ret

HEX_OUT: db "0x0000", 0
