; Filename random.asm

; GLOBALS
global _start ;Declared for linker this is declaring _start (entry point)
	
_start: ;linker entry point
    mov     eax, 0x0D                   ;system time interrupt 13
    xor     ebx, ebx                    ;passes null to time argument
    int     0x80                        ;eax contains number of clock ticks since midnight

    mov     [random], eax               ;move to random number reserved memory

    xor     edx, edx                    ;reset register to 0
    xor     eax, eax                    ;reset register to 0

    mov     eax, [random]               ;move time to eax
    mov     ecx, 10                     ;divisor
    div     ecx                         ;perform division
    add     edx, 0x30                   ;add HEX 0x30 (0) to number for display
    mov     [random], edx               ;store random number

msg_random:
    mov     ecx, random_msg             ;message 32 Bit Register
    mov     edx, len_random_msg         ;message length see length equ 32 Bit Register
    call    sys_write                   ;call sys_write

random_number:
    mov     ecx, random                 ;message 32 Bit Register
    mov     edx, 0x4                    ;message length see length equ 32 Bit Register
    call    sys_write                   ;call sys_write

;-------------------------------------------------------
;--------------------System Exit------------------------
;-------------------------------------------------------
system_exit:
    mov     eax, 0x1                    ;system call number (sys_exit) 32 Bit Register
    mov     ebx, 0x0                    ;return status 32 Bit Register
    int     0x80                        ;call kernel, system call 32 bit System  

;-------------------------------------------------------
;-------------------Write to stdout---------------------
;-------------------------------------------------------
sys_write:
    mov     ebx, 0x1                    ;file descriptor (stdout) 32 Bit Register
    mov     eax, 0x4                    ;system call number (sys_write) 32 Bit Register
    int     0x80                        ;call kernel, system call 32 bit System
    ret                                 ;return

;-------------------------------------------------------
;-------------------Read from stdin---------------------
;-------------------------------------------------------
sys_read:
    mov     ebx, 0x2                    ;file descriptor (stdin) 32 Bit Register
    mov     eax, 0x3                    ;system call number (sys_read) 32 Bit Register    
    int     0x80                        ;call kernel, system call 32 bit System
    ret                                 ;return

section .bss
   
random resb 4                           ;reserve a byte of memory for action

section .data

random_msg       db 'Random number: '   ;message
len_random_msg   equ $-random_msg       ;message Length