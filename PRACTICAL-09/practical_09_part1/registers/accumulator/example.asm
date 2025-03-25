global ax16bit
global eax32bit
global rax64bit

section .data
section .text

ax16bit:
    mov ax, 64h ; Hex 100
    ret

eax32bit:
    mov eax, edi ; first argument
    add eax, esi ; second argument
    ret

rax64bit:
    mov rax, rdi ; first argument
    add rax, rsi ; second argument
    ret