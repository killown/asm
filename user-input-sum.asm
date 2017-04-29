; sum of two digits by user input
sys_write equ 4
sys_read  equ 3
sys_exit equ 1
stdin     equ 0
stdout    equ 1

segment .data

   value1 db "First Digit ", 0xA,0xD
   length1 equ $- value1

   value2 db "Second digit", 0xA,0xD
   length2 equ $- value2

   value3 db "Result: "
   length3 equ $- value3

segment .bss

   number1 resb 2
   number2 resb 2
   res resb 1

section	.text
   global _start

_start:
   mov eax, sys_write   ;First Digit
   mov ebx, stdout
   mov ecx, value1
   mov edx, length1
   int 0x80

   mov eax, sys_read
   mov ebx, stdin
   mov ecx, number1
   mov edx, 2
   int 0x80

   mov eax, sys_write   ;Second Digit
   mov ebx, stdout
   mov ecx, value2
   mov edx, length2
   int 0x80

   mov eax, sys_read
   mov ebx, stdin
   mov ecx, number2
   mov edx, 2
   int 0x80

   mov eax, sys_write   ;Result
   mov ebx, stdout
   mov ecx, value3
   mov edx, length3
   int 0x80


   mov eax, [number1]   ;subtracting ascii '0'
   sub eax, '0'

   mov ebx, [number2]
   sub ebx, '0'

   add eax, ebx         ;convert the sum from decimal to ascii
   add eax, '0'

   mov [res], eax       ; storing the sum


   mov eax, sys_write   ; print the sum
   mov ebx, stdout
   mov ecx, res
   mov edx, 1
   int 0x80

exit:

   mov eax, sys_exit
   xor ebx, ebx
   int 0x80
