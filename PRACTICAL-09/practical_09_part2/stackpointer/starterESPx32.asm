; Filename starterESPx32.asm

; GLOBALS
global _start ;Declared for linker this is declaring _start (entry point)

; TEXT SECTION
section	.text
_start:	                                 ;linker entry point

   mov   [esp],   byte 'E'                ; move byte onto ESP stack pointer

   mov   [esp+1], byte 'S'                ; move byte onto ESP stack pointer

   mov   [esp+2], byte 'P'                ; move byte onto ESP stack pointer

   mov	edx,  3                          ;message length see length equ 32 Bit Register

   mov	ecx,  esp                        ;message 32 Bit Register

   mov	ebx,  0x1                        ;file descriptor (stdout) 32 Bit Register
   
   mov	eax,  0x4                        ;system call number (sys_write) 32 Bit Register

   int	0x80                             ;call kernel 32 bit System

   mov	edx,  msg_length                 ;message length see length equ 32 Bit Register
   
   mov	ecx,  message                    ;message 32 Bit Register

   mov	ebx,  0x1                        ;file descriptor (stdout) 32 Bit Register
   
   mov	eax,  0x4                        ;system call number (sys_write) 32 Bit Register

   int	0x80                             ;call kernel 32 bit System

   mov	eax,  0x1                        ;system call number (sys_exit) 32 Bit Register

   mov   ebx,  0x0                        ;return status 32 Bit Register

   int	0x80                             ;call kernel, system call 32 bit System

; DATA SECTION
section	.data

message db 0xA, 'Chars on Stack!', 0xA    ;string to be printed
msg_length equ $-message                  ;length of the string
