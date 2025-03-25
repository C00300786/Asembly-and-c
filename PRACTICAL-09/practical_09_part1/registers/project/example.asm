; Filename: project.asm
;
global _start                       ; Declared for linker this is declaring _start (entry point)
section .text
_start:                             ; linker entry point
    ; Print prompt
    mov     rdx, prompt_length      ; message length see length equ 64 Bit Register 
    mov     rsi, prompt             ; message 64 Bit Register
    mov     rbx, 0x01               ; file descriptor (stdout) 64 Bit Register
    mov     rax, 0x01               ; system call number (sys_write) 64 Bit Register
    syscall                         ; call kernel 64 Bit System
    
    ; Read input
    mov     rbx, 0x00               ; file descriptor (stdin) 64 Bit Register
    mov     rax, 0x00               ; system call number (sys_read) 64 Bit Register
    mov     rsi, num1               ; move address to store to input num1
    syscall                         ; call kernel 64 Bit System
    
    ; Print input
    mov     rdx, 64                 ; message length see length equ 64 Bit Register 
    mov     rsi, num1               ; message 64 Bit Register
    mov     rbx, 0x01               ; file descriptor (stdout) 64 Bit Register
    mov     rax, 0x01               ; system call number (sys_write) 64 Bit Register
    syscall                         ; call kernel 64 Bit System
    
    ; Exit program
    mov     rax, 0x3c               ; system call number (sys_exit) 64 Bit Register
    mov     rdi, 0x0                ; return status 64 Bit Register
    syscall                         ; call kernel 64 Bit System

section .bss
    num1 resb 64 ; Reserve 64 bits for input

section .data
    prompt db 'Enter Number: ', 0   ; string to be printed
    prompt_length equ $ - prompt    ; Length of the prompt string
