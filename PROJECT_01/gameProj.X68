<<<<<<< HEAD
    ORG    $1000
EXIT    EQU 0            ; Used to exit the program

START:
    BSR     WELCOME          ; Branch to the WELCOME subroutine
    BSR     CHOICE           ; Branch to the CHOICE subroutine

    SIMHALT                  ; Halt simulator

*-------------------------------------------------------
*                   WELCOME SUBROUTINE
*-------------------------------------------------------
WELCOME:
    BSR     ENDL             ; New line
    LEA     WELCOME_MSG, A1  ; Load welcome message
    MOVE.B  #14, D0
    TRAP    #15              ; Print message
    BSR     ENDL
    RTS                      ; Return

*-------------------------------------------------------
*                  CHOICE SUBROUTINE (READ INPUT)
*-------------------------------------------------------
CHOICE:
    LEA     CHOICE_MSG, A1   ; Load choice message
    MOVE.B  #14, D0
    TRAP    #15              ; Print message

    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    
    MOVE.B  USER_INPUT, D1   ; Load user input into D1

    CMP.B   #'1', D1         ; Compare input to '1'
    BEQ     FIGHT            ; If '1', branch to FIGHT

    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     RUN_AWAY         ; If '2', branch to RUN_AWAY

    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     CHOICE           ; Repeat input prompt
    RTS

*-------------------------------------------------------
*                   FIGHT SEQUENCE
*-------------------------------------------------------
FIGHT:
    BSR     ENDL
    LEA     FIGHT_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print fight message
    RTS

*-------------------------------------------------------
*                  RUN AWAY SEQUENCE
*-------------------------------------------------------
RUN_AWAY:
    BSR     ENDL
    LEA     RUN_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print run message
    RTS

*-------------------------------------------------------
*                INVALID INPUT HANDLING
*-------------------------------------------------------
INVALID_CHOICE:
    BSR     ENDL
    LEA     INVALID_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print invalid input message
    RTS

*-------------------------------------------------------
*                ENDL SUBROUTINE (NEW LINE)
*-------------------------------------------------------
ENDL:
    LEA     CRLF, A1    ; Load newline characters
    MOVE.B  #14, D0
    TRAP    #15         ; Print new line
    RTS                 ; Return

*-------------------------------------------------------
*                  DATA SECTION
*-------------------------------------------------------
USER_INPUT:   DS.B  2   ; Reserve 2 bytes for input (1 char + NULL)
CHOICE_VAR:   DC.B  0

CRLF:   DC.B  $0D, $0A, 0   ; Carriage Return + Line Feed (New Line)

WELCOME_MSG:  DC.B 'Welcome to the Adventures of dingle dorf!', $0D, $0A
              DC.B 'Dingle dorf has set out on an epic adventure to fix the relic of equinox', $0D, $0A
              DC.B 'the relic has been broken in half and the peices stolen', $0D, $0A
              DC.B 'the e', $0D, $0A
              DC.B '1. enter the mines', $0D, $0A
              DC.B '2. go to town', $0D, $0A, 0

CHOICE_MSG:   DC.B 'What will you do? (1 or 2): ', 0
MINES_MSG:    DC.B 'You enter the mines!', $0D, $0A, 0
TOWN_MSG:      DC.B 'You go to town', $0D, $0A, 0
INVALID_MSG:  DC.B 'Invalid choice. Try again.', $0D, $0A, 0

    END    START




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
=======
    ORG    $1000
EXIT    EQU 0            ; Used to exit the program

START:
    MOVE.B  #100, $4000      ; Set bravery points in memory location $4000
    LEA     $4000, A3        ; Assign address A3 to that memory location

    BSR     WELCOME          ; Branch to the WELCOME subroutine
    BSR     CHOICE           ; Branch to the CHOICE subroutine

    SIMHALT                  ; Halt simulator

*-------------------------------------------------------
*                   WELCOME SUBROUTINE
*-------------------------------------------------------
WELCOME:
    BSR     ENDL             ; New line
    LEA     WELCOME_MSG, A1  ; Load welcome message
    MOVE.B  #14, D0
    TRAP    #15              ; Print message
    BSR     ENDL
    RTS                      ; Return

*-------------------------------------------------------
*                  CHOICE SUBROUTINE (READ INPUT)
*-------------------------------------------------------
CHOICE:
    LEA     CHOICE_MSG, A1   ; Load choice message
    MOVE.B  #14, D0
    TRAP    #15              ; Print message

    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    
    MOVE.B  USER_INPUT, D1   ; Load user input into D1

    CMP.B   #'1', D1         ; Compare input to '1'
    BEQ     FIGHT            ; If '1', branch to FIGHT

    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     RUN_AWAY         ; If '2', branch to RUN_AWAY

    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     CHOICE           ; Repeat input prompt
    RTS

*-------------------------------------------------------
*                   FIGHT SEQUENCE
*-------------------------------------------------------
FIGHT:
    BSR     ENDL
    LEA     FIGHT_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print fight message
    RTS

*-------------------------------------------------------
*                  RUN AWAY SEQUENCE
*-------------------------------------------------------
RUN_AWAY:
    BSR     ENDL
    LEA     RUN_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print run message
    RTS

*-------------------------------------------------------
*                INVALID INPUT HANDLING
*-------------------------------------------------------
INVALID_CHOICE:
    BSR     ENDL
    LEA     INVALID_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print invalid input message
    RTS

*-------------------------------------------------------
*                ENDL SUBROUTINE (NEW LINE)
*-------------------------------------------------------
ENDL:
    LEA     CRLF, A1    ; Load newline characters
    MOVE.B  #14, D0
    TRAP    #15         ; Print new line
    RTS                 ; Return

*-------------------------------------------------------
*                  DATA SECTION
*-------------------------------------------------------
USER_INPUT:   DS.B  2   ; Reserve 2 bytes for input (1 char + NULL)
CHOICE_VAR:   DC.B  0

CRLF:   DC.B  $0D, $0A, 0   ; Carriage Return + Line Feed (New Line)

WELCOME_MSG:  DC.B 'Welcome to the Adventures of dingle dorf!', $0D, $0A
              DC.B '1. enter the mines', $0D, $0A
              DC.B '2. go to town', $0D, $0A, 0

CHOICE_MSG:   DC.B 'What will you do? (1 or 2): ', 0
MINES_MSG:    DC.B 'You enter the mines!', $0D, $0A, 0
TOWN_MSG:      DC.B 'You go to town', $0D, $0A, 0
INVALID_MSG:  DC.B 'Invalid choice. Try again.', $0D, $0A, 0

    END    START


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
>>>>>>> e96ab5ba67696eb20da0cfee3b13fb5117978c40
