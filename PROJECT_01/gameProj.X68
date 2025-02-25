
    ORG    $1000
EXIT    EQU 0            ; Used to exit the program

START:
    BSR     WELCOME          ; Branch to the WELCOME subroutine
    BSR     OPEN_SCENE           ; Branch to opening scene
    BSR     OPEN_PATH           ; Branch to the CHOICE subroutine

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
*                   WELCOME SUBROUTINE
*-------------------------------------------------------
OPEN_SCENE:
    BSR     ENDL             ; New line
    LEA     OPEN_MSG, A1  ; Load welcome message
    MOVE.B  #14, D0
    TRAP    #15              ; Print message
    BSR     ENDL
    RTS                      ; Return
*-------------------------------------------------------
*                  location choice 1
*-------------------------------------------------------
OPEN_PATH:
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
    LEA     MINES_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print fight message
    RTS

*-------------------------------------------------------
*                  RUN AWAY SEQUENCE
*-------------------------------------------------------
RUN_AWAY:
    BSR     ENDL
    LEA     TOWER_MSG, A1
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
              DC.B 'the first peice has been taken by the wizards and is held at their tower', $0D, $0A
              DC.B 'the second peice is being held by the cobalts at the bottom of the mine', $0D, $0A
              DC.B 'now you must guide dingle dorf on his journy and beat monsters and mages', $0D, $0A
              DC.B 'IN THE LEGENDARY AINCHENT RIGHT OF!!', $0D, $0A
              DC.B 'ROCK!! PAPER!! SISSORS!!!!', $0D, $0A, 0
              
OPEN_MSG:
              DC.B 'You awaken in a forrest the smell of due filling your lungs', $0D, $0A
              DC.B 'as you come to your feet you obesrver your suroundings', $0D, $0A
              DC.B 'you are at the base of the mountian containing the grear forge', $0D, $0A
              DC.B 'your camp the same as whenst you lay your head to rest', $0D, $0A
              DC.B 'as you look to the top of the mountian', $0D, $0A
              DC.B 'you see a dwarf atop the mountian looking down at you' $0D, $0A
              DC.B 'unable to see his face as the sun blinds you, there is an unease wash over you as you look', $0D, $0A
              DC.B 'the dwarf decend foward dissapering from your sight', $0D, $0A
              DC.B 'you meet a diverging path', $0D, $0A
              DC.B 'path 1. enter the mines', $0D, $0A
              DC.B 'path 2. go to tower', $0D, $0A, 0

CHOICE_MSG:   DC.B 'Where will you go? (1 or 2): ', 0
MINES_MSG:    DC.B 'You enter the mines', $0D, $0A, 0
TOWER_MSG:      DC.B 'You go to tower', $0D, $0A, 0
INVALID_MSG:  DC.B 'Invalid choice. Try again.', $0D, $0A, 0

    END    START




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
