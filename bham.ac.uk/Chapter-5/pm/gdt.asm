; GDT
gdt_start:

gdt_null:						; mandatory null descriptor
  dd 0x0
  dd 0x0

gdt_code:						; code segment descriptor
								; base=0x0, limit=0xfffff,
								; 1st flags:  (present)1 (privilege)00 (descriptor type)1 -> 1001b
								; type flags: (code)1 (conforming)0 (readable)1 (accessed)0 - 1010b
								; 2nd flags:  (gran)1 (32-bit default)1 (64-bit seg)0 (AVL)0 -> 1100b
  dw 0xffff						; Limit
  dw 0x0						; Base
  db 0x0						; Base
  db 10011010b					; 1st flags, type flags
  db 11001111b					; 2nd flags, Limit
  db 0x0						; Base

gdt_data:						; the data segment descriptor
								; Same as code segment except for the type flags:
								; type flags: (code)0 (expand down)0 (writable)1 (accessed)0 -> 0010b
  dw 0xffff						; Limit
  dw 0x0						; Base
  db 0x0						; Base
  db 10010010b					; 1st flags, type flags
  db 11001111b					; 2nd flags, Limit
  db 0x0						; Base

gdt_end:

gdt_descriptor:
  dw gdt_end - gdt_start - 1	; Size of DGT, less than one of true size for 0 indexing
  dd gdt_start					; Start address of GDT

CODE_SEG equ gdt_code - gdt_start	; 0x08 Code Segment
DATA_SEG equ gdt_data - gdt_start   ; 0x10 Data Segment 
