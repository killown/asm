;to run in x86_64 use elf64: nasm -f elf64 filename.asm; ld filename.o -o filename
section .data
    text1 db "What is your name? "
    text2 db "Hello, "
 
section .bss
    name resb 16 ; reserve 16 bytes
 
section .text
    global _start
_start:
 
    call _printText1  ; function like def printText1()
    call _getName 
    call _printText2
    call _printName
 
    mov rax, 60 ; (Accumulator register (AX). Used in arithmetic operations.)
    mov rdi, 0 ; (Destination Index register (DI). Used as a pointer to a destination in stream operations.) 
    syscall
 
_getName:
    mov rax, 0 
    mov rdi, 0 
    mov rsi, name  ; source index
    mov rdx, 16   ; data (max length 16)
    syscall
    ret      ; return to _start
 
_printText1:
    mov rax, 1
    mov rdi, 1
    mov rsi, text1
    mov rdx, 19 ; data (19 is the length of the text1)
    syscall
    ret
 
_printText2:
    mov rax, 1
    mov rdi, 1
    mov rsi, text2
    mov rdx, 7 ; data (7 is the length of the text2)
    syscall
    ret
 
_printName:
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 16
    syscall
    ret
