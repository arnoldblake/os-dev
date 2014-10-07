; Ensures we jump straight into kernel code
[bits 32]
[extern main]

 call main
 jmp $
