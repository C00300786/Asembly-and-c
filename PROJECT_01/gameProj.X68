
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
*                   OPEN SCENE SUBROUTINE
*-------------------------------------------------------
OPEN_SCENE:
    BSR     ENDL             ; New line
    LEA     OPEN_MSG, A1  ; Load welcome message
    MOVE.B  #14, D0
    TRAP    #15              ; Print message
    BSR     ENDL
    RTS                      ; Return

*-------------------------------------------------------
*                  Mines or Tower
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
    BEQ     MINE            ; If '1', branch to FIGHT

    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     RUN_AWAY         ; If '2', branch to RUN_AWAY

    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     OPEN_PATH           ; Repeat input prompt
    

*-------------------------------------------------------
*                   MINE SEQUENCE
*-------------------------------------------------------
MINE:
    BSR     ENDL
    LEA     MINES_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    BSR     FIGHT
    BSR MINE_ROOM_1
    

MINE_ROOM_1:

    BSR MINE
MINE_FIGHT_1:
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
    
*---------------------------------------------------------
*                       Fight SUB
*---------------------------------------------------------
FIGHT:
    
    BSR RNG
    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    MOVE.B  USER_INPUT, D1   ; Load user input into D1
    BSR CONVR
    
    CMP     D3,D2
    BEQ     DRAW
    
    ADD.B   D3,D2
    
    CMP     #3,D2
    BEQ     PAPER
    
    CMP     #4,D2
    BEQ     ROCK
    
    CMP     #5,D2
    BEQ     SIS
    
    MOVE.B  D2,D7
    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     FIGHT
    RTS
    
DMG:
    LEA     DMG_MSG,  A1   ; loads first draw msg
    MOVE.B  #14, D0
    TRAP    #15              ; Prints message
    RTS

DRAW:
    CMP.B   #0, D6
    BEQ     FDRAW
    
    LEA     DRAW_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Prints message
    ADDQ.B  #1, D6         ; Adds to the draw count
    RTS
    
FDRAW:
    LEA     FDRAW_MSG,  A1   ; loads first draw msg
    MOVE.B  #14, D0
    TRAP    #15              ; Prints message
    RTS

PAPER:
    LEA     R_MSG,  A1   ; loads first draw msg
    MOVE.B  #14, D0
    TRAP    #15              ; Prints message
    ;BSR     GAME_OVER
    RTS
    
ROCK:
    LEA     P_MSG,  A1   ; loads first draw msg
    MOVE.B  #14, D0
    TRAP    #15              ; Prints message
    ;BSR     GAME_OVER
    RTS
    
SIS:
    LEA     S_MSG,  A1   ; loads first draw msg
    MOVE.B  #14, D0
    TRAP    #15              ; Prints message
    RTS


         
*---------------------------------------------------------
*               RNG for fights
*---------------------------------------------------------
RNG:              
    MOVE    #1, D5
    MOVE    #3, D6
    SUB     D5,D6             ;You should give Min in D5 and Max in D6
    MOVE    D6,D7
    ADDI    #1,D6
    MULU    #$FFFF,D7
    LEA     SEED,A1
    MOVE.B  #8,d0
    TRAP    #15
    ADD     (A1),D1
    MULU    #$FFFF,D1
    EOR.L   #$F321F23A,D1
    MOVE    D1,(A1)
    AND.L   D7,D1    ;PREVENT OVERFLOW FOR (Max-Min)
    DIVU    D6,D1         ;time count / (Max-Min)
    SWAP    D1              ;swap upper and lower words of D1 to put remainder in low word
    ADD     D5,d1           ;D1.W contains number in the range of (Min,Max)
    CLR     D0
    CLR     D7
    CLR     D2
    MOVE.B  D1,D2
    CLR     D5
    CLR     D6
    
    RTS                    ; Return from subroutine, control passes back to the calling code


CONVR:
    CMP #'1', D1
    BEQ ONE
    
    CMP #'2', D1
    BEQ TWO
    
    CMP #'3', D1
    BEQ THREE

ONE:
    MOVE.W #1, D3
    RTS
    
TWO:
    MOVE.W #2, D3
    RTS
    
THREE:
    MOVE.W #3, D3
    RTS
  
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
TOWER_MSG:    DC.B 'You go to tower', $0D, $0A, 0
FIGHT_MSG:    DC.B 'Your opponent stands before you unwavering the only way out is trough you must defeat them', $0D, $0A ,0
INVALID_MSG:  DC.B 'Invalid choice. Try again.', $0D, $0A, 0
DRAW_MSG:     DC.B 'Yet another draw occurs the tensions rise as to who will be victorious', $0D, $0A ,0
FDRAW_MSG:    DC.B 'A draw occurs first time this fight who will be the victor', $0D, $0A ,0
DMG_MSG:      DC.B 'A blow has been dealt the fight draws closer to its end', $0D, $0A ,0
GO_MSG:       DC.B 'GAME OVER', $0D, $0A ,0
R_MSG:        DC.B 'ROCK WIN', 0
P_MSG:        DC.B 'PAPER WIN', 0
S_MSG:        DC.B 'SISSORS WIN', 0
SEED          DC.W    1
P_HP          DS.B    2
E_HP          DS.B    2

GAME_OVER:
       LEA     GO_MSG,  A1   ; loads first draw msg
       MOVE.B  #14, D0
       TRAP    #15              ; Prints messag
    END    START




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~







*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
