; Filename gamerinput.asm

; GLOBALS
global _start ;Declared for linker this is declaring _start (entry point)
	
_start: ;linker entry point

msg_player:
    mov     ecx, action_msg             ;message 32 Bit Register
    mov     edx, len_action_msg         ;message length see length equ 32 Bit Register
    call    sys_write                   ;call sys_write

enter_action:                 
    mov     ecx, action                 ;move input to action  
    mov     edx, 1                      ;size of input
    call    sys_read                    ;call sys_read

gameplay_loop:
    mov     ecx, action                 ;message 32 Bit Register                 
    mov     edx, 0x1                    ;message length see length equ 32 Bit Register
    call    sys_write                   ;call sys_write

    mov     ecx, gameplay_msg           ;message 32 Bit Register 
    mov     edx, len_gameplay_msg       ;message length see length equ 32 Bit Register
    call    sys_write                   ;call sys_write

    mov     ecx, [action]               ;move action to ecx
    dec     ecx                         ;decrement action with decrement register
    mov     [action], ecx               ;move ecx value to action
    mov     ebx, action                 ;message 32 Bit Register
    cmp     byte [ebx], 0x30            ;compare value in register with 0x30 Hex ASCII for 0
    jne     gameplay_loop               ;jump tp gameloop if not equals 0 
    
;-------------------------------------------------------
;--------------------System Exit------------------------
;-------------------------------------------------------
system_exit:
    mov     ebx, 0x0                    ;return status 32 Bit Register
    mov     eax, 0x1                    ;system call number (sys_exit) 32 Bit Register
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
    action resb 1                           ;reserve a byte of memory for action

section .data
    action_msg       db 'How many times would you like to play? 0 Exit >=1 No of plays, please enter number: ' ;Ask the user to enter a number
    len_action_msg   equ $-action_msg           ;action message length
    gameplay_msg     db 0x20, 'Game Loopy', 0xA ;gameloop message
    len_gameplay_msg equ $-gameplay_msg         ;gameloop message length              