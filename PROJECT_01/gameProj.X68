


    ORG    $1000
EXIT    EQU 0            ; Used to exit the program

START:
    BSR     WELCOME             ; Branch to the WELCOME subroutine
    BSR     OPEN_SCENE          ; Branch to opening scene
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
    BEQ     TOWER        ; If '2', branch to RUN_AWAY

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

    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    
    MOVE.B  USER_INPUT, D1   ; Load user input into D1

    CMP.B   #'1', D1         ; Compare input to '1'
    BEQ     MINE_ROOM_1            ; If '1', branch to FIGHT
    
    
    MOVE.B  #3,E_HP
    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     MINE_FIGHT_1     ; If '2', branch to 
    
    
    BSR     ENDL
    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     MINE           ; Repeat input prompt

MINE_ROOM_1:
    BSR     ENDL
    
    MOVE.B  #3,E_HP
    
    LEA     MINES_MSG1, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    
    MOVE.B  USER_INPUT, D1   ; Load user input into D1

    CMP.B   #'1', D1         ; Compare input to '1'
    BEQ     MINE_ROOM_2      ; If '1', branch to FIGHT
    
    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     MINE_FIGHT_2     ; If '2', branch to
    
    
    BSR     ENDL
    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     MINE_ROOM_1           ; Repeat input prompt
    
    
MINE_FIGHT_1:
    BSR     ENDL
    LEA     FIGHT_T_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    MOVE.B  #3,E_HP
    BSR FIGHT
    BSR HP_CHECK
    BSR MINE_ROOM_3
    
MINE_ROOM_2:
    BSR     ENDL
    
    MOVE.B  #3,E_HP
    
    LEA     MINES_MSG1, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    
    MOVE.B  USER_INPUT, D1   ; Load user input into D1

    CMP.B   #'1', D1         ; Compare input to '1'
    BEQ     MINE_ROOM_3      ; If '1', branch to FIGHT
    
    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     MINE_FIGHT_3     ; If '2', branch to
    
    
    BSR     ENDL
    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     MINE_ROOM_2           ; Repeat input prompt
    
    
MINE_FIGHT_2:
    BSR     ENDL
    LEA     FIGHT_T_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    MOVE.B  #3,E_HP
*    BSR FIGHT
    BSR HP_CHECK
    BSR MINE_ROOM_4

MINE_ROOM_3:
    BSR     ENDL
    
    MOVE.B  #3,E_HP
    
    LEA     MINES_MSG2, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    
    MOVE.B  USER_INPUT, D1   ; Load user input into D1

    CMP.B   #'1', D1         ; Compare input to '1'
    BEQ     MINE_ROOM_4      ; If '1', branch to FIGHT
    
    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     MINE_FIGHT_4     ; If '2', branch to
    
    
    BSR     ENDL
    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     MINE_ROOM_2           ; Repeat input prompt
    
    
MINE_FIGHT_3:
    BSR     ENDL
    LEA     FIGHT_T_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    MOVE.B  #3,E_HP
*    BSR FIGHT
    BSR HP_CHECK
    BSR MINE_ROOM_5

MINE_ROOM_4:
    BSR     ENDL
    
    MOVE.B  #3,E_HP
    
    LEA     MINES_MSG3, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message

    BSR     RNG
    CMP     #1,D2
    BEQ     HEAL_M
    
    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    
    MOVE.B  USER_INPUT, D1   ; Load user input into D1

    CMP.B   #'1', D1         ; Compare input to '1'
    BEQ     MINE_ROOM_5      ; If '1', branch to FIGHT
    
    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     MINE_FIGHT_5     ; If '2', branch to
    
    
    BSR     ENDL
    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     MINE_ROOM_5           ; Repeat input prompt
    
    
MINE_FIGHT_4:
    BSR     ENDL
    LEA     FIGHT_T_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    MOVE.B  #3,E_HP
*    BSR FIGHT
    BSR HP_CHECK
    BSR MINE_ROOM_6

MINE_ROOM_5:
    BSR     ENDL
    
    MOVE.B  #3,E_HP
    
    LEA     MINES_MSG1, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    
    MOVE.B  USER_INPUT, D1   ; Load user input into D1

    CMP.B   #'1', D1         ; Compare input to '1'
    BEQ     MINE_ROOM_6      ; If '1', branch to FIGHT
    
    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     MINE_FIGHT_6     ; If '2', branch to
    
    
    BSR     ENDL
    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     MINE_ROOM_6           ; Repeat input prompt
    
    
MINE_FIGHT_5:
    BSR     ENDL
    LEA     FIGHT_T_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    MOVE.B  #3,E_HP
*    BSR FIGHT
    BSR HP_CHECK
    BSR MINE_ROOM_7

MINE_ROOM_6:
    BSR     ENDL
    
    MOVE.B  #3,E_HP
    
    LEA     MINES_MSG3, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message

    BSR     RNG
    CMP     #1,D2
    BEQ     HEAL_M
    
    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    
    MOVE.B  USER_INPUT, D1   ; Load user input into D1

    CMP.B   #'1', D1         ; Compare input to '1'
    BEQ     MINE_ROOM_7      ; If '1', branch to FIGHT
    
    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     MINE_FIGHT_7     ; If '2', branch to
    
    
    BSR     ENDL
    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     MINE_ROOM_6           ; Repeat input prompt
    
    
MINE_FIGHT_6:
    BSR     ENDL
    LEA     FIGHT_T_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    MOVE.B  #3,E_HP
*    BSR FIGHT
    BSR HP_CHECK
    BSR MINE_ROOM_8
    
MINE_ROOM_7:
    BSR     ENDL
    
    MOVE.B  #3,E_HP
    
    LEA     MINES_MSG2, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    
    MOVE.B  USER_INPUT, D1   ; Load user input into D1

    CMP.B   #'1', D1         ; Compare input to '1'
    BEQ     MINE_ROOM_8      ; If '1', branch to FIGHT
    
    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     MINE_FIGHT_8     ; If '2', branch to
    
    
    BSR     ENDL
    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     MINE_ROOM_7           ; Repeat input prompt
    
    
MINE_FIGHT_7:
    BSR     ENDL
    LEA     FIGHT_T_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    MOVE.B  #3,E_HP
*    BSR FIGHT
    BSR HP_CHECK
    BSR MINE_ROOM_9

MINE_ROOM_8:
    BSR     ENDL
    
    MOVE.B  #3,E_HP
    
    LEA     MINES_MSG3, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message

    BSR     RNG
    CMP     #1,D2
    BEQ     HEAL_M
    
    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    
    MOVE.B  USER_INPUT, D1   ; Load user input into D1

    CMP.B   #'1', D1         ; Compare input to '1'
    BEQ     MINE_ROOM_9      ; If '1', branch to FIGHT
    
    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     MINE_FIGHT_9    ; If '2', branch to
    
    
    BSR     ENDL
    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     MINE_ROOM_8           ; Repeat input prompt
    
    
MINE_FIGHT_8:
    BSR     ENDL
    LEA     FIGHT_T_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    MOVE.B  #3,E_HP
*    BSR FIGHT
    BSR HP_CHECK
    BSR MINE_ROOM_10
    
MINE_ROOM_9:
    BSR     ENDL
    
    MOVE.B  #3,E_HP
    
    LEA     MINES_MSG1, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    
    MOVE.B  USER_INPUT, D1   ; Load user input into D1

    CMP.B   #'1', D1         ; Compare input to '1'
    BEQ     MINE_ROOM_10      ; If '1', branch to FIGHT
    
    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     MINE_ROOM_10     ; If '2', branch to
    
    
    BSR     ENDL
    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     MINE_ROOM_9           ; Repeat input prompt
    
    
MINE_FIGHT_9:
    BSR     ENDL
    LEA     FIGHT_T_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    MOVE.B  #3,E_HP
*    BSR FIGHT
    BSR HP_CHECK
    BSR MINE_ROOM_10

MINE_ROOM_10:
    BSR     ENDL
    LEA     CUT_MINE, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    BSR     ENDL
    ADD.B   #1,D4
    
    CMP.B   #2,D4
    BEQ     MOUNT
    
    BSR     TOWER
   
    
    


*-------------------------------------------------------
*                  TOWER SEQUENCE
*-------------------------------------------------------
TOWER:
    BSR     ENDL
    LEA     TOWER_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print run message
    BSR TOWER_ROOM_1

TOWER_ROOM_1:
    BSR     ENDL
    
    MOVE.B  #3,E_HP
    
    LEA     TOWER_MSG1, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    
    MOVE.B  USER_INPUT, D1   ; Load user input into D1

    CMP.B   #'1', D1         ; Compare input to '1'
    BEQ     TOWER_ROOM_2      ; If '1', branch to FIGHT
    
    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     TOWER_FIGHT_2    ; If '2', branch to
    
    
    BSR     ENDL
    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     TOWER_ROOM_1           ; Repeat input prompt
    
    
TOWER_FIGHT_1:
    BSR     ENDL
    LEA     FIGHT_T_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    MOVE.B  #3,E_HP
    SUB.B   #1,P_HP
*    BSR FIGHT
    BSR HP_CHECK
    BSR TOWER_ROOM_3

TOWER_ROOM_2:
    BSR     ENDL
    
    MOVE.B  #3,E_HP
    
    LEA     TOWER_MSG2, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    
    MOVE.B  USER_INPUT, D1   ; Load user input into D1

    CMP.B   #'1', D1         ; Compare input to '1'
    BEQ     TOWER_ROOM_3      ; If '1', branch to FIGHT
    
    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     TOWER_FIGHT_3    ; If '2', branch to
    
    
    BSR     ENDL
    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     TOWER_ROOM_3           ; Repeat input prompt
    
    
TOWER_FIGHT_2:
    BSR     ENDL
    LEA     FIGHT_T_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    MOVE.B  #3,E_HP
*    BSR FIGHT
    BSR HP_CHECK
    BSR TOWER_ROOM_4

TOWER_ROOM_3:
    BSR     ENDL
    
    MOVE.B  #3,E_HP
    
    LEA     TOWER_MSG3, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message

    BSR     RNG
    CMP     #1,D2
    BEQ     HEAL_T
    
    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    
    MOVE.B  USER_INPUT, D1   ; Load user input into D1

    CMP.B   #'1', D1         ; Compare input to '1'
    BEQ     TOWER_ROOM_4      ; If '1', branch to FIGHT
    
    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     TOWER_FIGHT_4    ; If '2', branch to
    
    
    BSR     ENDL
    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     TOWER_ROOM_3           ; Repeat input prompt
    
    
TOWER_FIGHT_3:
    BSR     ENDL
    LEA     FIGHT_T_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    MOVE.B  #3,E_HP
*    BSR FIGHT
    BSR HP_CHECK
    BSR TOWER_ROOM_5
    

TOWER_ROOM_4:
    BSR     ENDL
    
    MOVE.B  #3,E_HP
    
    LEA     TOWER_MSG1, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    
    MOVE.B  USER_INPUT, D1   ; Load user input into D1

    CMP.B   #'1', D1         ; Compare input to '1'
    BEQ     TOWER_ROOM_5      ; If '1', branch to FIGHT
    
    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     TOWER_FIGHT_5    ; If '2', branch to
    
    
    BSR     ENDL
    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     TOWER_ROOM_4           ; Repeat input prompt
    
    
TOWER_FIGHT_4:
    BSR     ENDL
    LEA     FIGHT_T_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    MOVE.B  #3,E_HP
*    BSR FIGHT
    BSR HP_CHECK
    BSR TOWER_ROOM_6
TOWER_ROOM_5:
    BSR     ENDL
    
    MOVE.B  #3,E_HP
    
    LEA     TOWER_MSG2, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    
    MOVE.B  USER_INPUT, D1   ; Load user input into D1

    CMP.B   #'1', D1         ; Compare input to '1'
    BEQ     TOWER_ROOM_6      ; If '1', branch to FIGHT
    
    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     TOWER_FIGHT_6    ; If '2', branch to
    
    
    BSR     ENDL
    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     TOWER_ROOM_5           ; Repeat input prompt
    
    
TOWER_FIGHT_5:
    BSR     ENDL
    LEA     FIGHT_T_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    MOVE.B  #3,E_HP
*    BSR FIGHT
    BSR HP_CHECK
    BSR TOWER_ROOM_7

    
TOWER_ROOM_6:
    BSR     ENDL
    
    MOVE.B  #3,E_HP
    
    LEA     TOWER_MSG3, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message

    BSR     RNG
    CMP     #1,D2
    BEQ     HEAL_T
    
    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    
    MOVE.B  USER_INPUT, D1   ; Load user input into D1

    CMP.B   #'1', D1         ; Compare input to '1'
    BEQ     TOWER_ROOM_7      ; If '1', branch to FIGHT
    
    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     TOWER_FIGHT_7    ; If '2', branch to
    
    
    BSR     ENDL
    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     TOWER_ROOM_7           ; Repeat input prompt
    
    
TOWER_FIGHT_6:
    BSR     ENDL
    LEA     FIGHT_T_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    MOVE.B  #3,E_HP
*    BSR FIGHT
    BSR HP_CHECK
    BSR TOWER_ROOM_8

TOWER_ROOM_7:
    BSR     ENDL
    
    MOVE.B  #3,E_HP
    
    LEA     TOWER_MSG1, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    
    MOVE.B  USER_INPUT, D1   ; Load user input into D1

    CMP.B   #'1', D1         ; Compare input to '1'
    BEQ     TOWER_ROOM_8      ; If '1', branch to FIGHT
    
    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     TOWER_FIGHT_8    ; If '2', branch to
    
    
    BSR     ENDL
    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     TOWER_ROOM_7           ; Repeat input prompt
    
    
TOWER_FIGHT_7:
    BSR     ENDL
    LEA     FIGHT_T_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    MOVE.B  #3,E_HP
*    BSR FIGHT
    BSR HP_CHECK
    BSR TOWER_ROOM_9


TOWER_ROOM_8:
    BSR     ENDL
    MOVE.B  #3,E_HP
    
    LEA     TOWER_MSG2, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    
    MOVE.B  USER_INPUT, D1   ; Load user input into D1

    CMP.B   #'1', D1         ; Compare input to '1'
    BEQ     TOWER_ROOM_9      ; If '1', branch to FIGHT
    
    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     TOWER_FIGHT_9    ; If '2', branch to
    
    
    BSR     ENDL
    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     TOWER_ROOM_8           ; Repeat input prompt
    
    
TOWER_FIGHT_8:
    BSR     ENDL
    LEA     FIGHT_T_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15  ; Print MINES message
    
    
    MOVE.B  #3,E_HP
*    BSR FIGHT
    BSR HP_CHECK
    BSR TOWER_ROOM_10

    
TOWER_ROOM_9:
    BSR     ENDL
    
    MOVE.B  #3,E_HP
    
    LEA     TOWER_MSG3, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    BSR     RNG
    CMP     #1,D2
    BEQ     HEAL_T

    
    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    
    MOVE.B  USER_INPUT, D1   ; Load user input into D1

    CMP.B   #'1', D1         ; Compare input to '1'
    BEQ     TOWER_ROOM_10      ; If '1', branch to FIGHT
    
    CMP.B   #'2', D1         ; Compare input to '2'
    BEQ     TOWER_ROOM_10     ; If '2', branch to
    
    
    BSR     ENDL
    BSR     INVALID_CHOICE   ; If input is invalid, show error
    BSR     TOWER_ROOM_9           ; Repeat input prompt
    
    
TOWER_FIGHT_9:
    BSR     ENDL
    LEA     FIGHT_T_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    
    MOVE.B  #3,E_HP
*    BSR FIGHT
    BSR HP_CHECK
    BSR TOWER_ROOM_10

TOWER_ROOM_10:
    BSR     ENDL
    LEA     CUT_TOWER, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Print MINES message
    BSR     ENDL
    ADD.B   #1,D4
    
    CMP.B   #2,D4
    BEQ     MOUNT
    
    BSR     MINE

*-------------------------------------------------------
*                  FINAL SEQUENCE
*-------------------------------------------------------
MOUNT:
    BSR     ENDL
    LEA     FINAL_CUT , A1
    MOVE.B  #14, D0
    TRAP    #15  ; Print MINES message
    BSR     GAME_OVER
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
*                       Fight Suff
*---------------------------------------------------------
FIGHT:
    
    BSR     ENDL
    BSR     RNG
    LEA     USER_INPUT, A1   ; Load input buffer address
    MOVE.B  #2, D0           ; Max input length (1 char + NULL)
    TRAP    #15              ; Read input (D0=2 -> Read 1 char)
    MOVE.B  USER_INPUT, D1   ; Load user input into D1
    BSR CONVR
    
    CMP     D3,D2
    BEQ     DRAW
  
    ADD.B   D2,D3
    
    CMP     #3,D3
    BEQ     PAPER
    
    CMP     #4,D3
    BEQ     ROCK
    
    CMP     #5,D3
    BEQ     SIS
    
    BRA    HP_CHECK
    BRA    E_CHECK
    
    
     
    
    RTS
    
    
HP_CHECK:
    CMP.B #0,P_HP
    BEQ GAME_OVER

    RTS 

E_CHECK:
    CMP.B #0,E_HP
    BEQ FOVER
    
    RTS  
DMG_P:
    BSR ENDL
    LEA     DMG_MSG,  A1   ; loads first draw msg
    MOVE.B  #14, D0
    TRAP    #15              ; Prints message
    SUB.B   #1,P_HP
    BRA HP_CHECK
    BRA FIGHT

DMG_E:
    BSR ENDL
    LEA     DMG_MSG,  A1   ; loads first draw msg
    MOVE.B  #14, D0
    TRAP    #15              ; Prints message
    SUB.B   #1,E_HP
    BRA E_CHECK
    BRA FIGHT 

DRAW:
    BSR ENDL
    LEA     DRAW_MSG, A1
    MOVE.B  #14, D0
    TRAP    #15              ; Prints message
    ADD.B   #1, D6         ; Adds to the draw count
    RTS
    
FOVER:
    BSR ENDL
    MOVE.B  #3,E_HP
    
    LEA     FOVER_MSG,  A1   ; loads first draw msg
    MOVE.B  #14, D0
    TRAP    #15              ; Prints message
    ADD.B   #1,  D0
    
    RTS
    
PAPER:
    BSR ENDL
    LEA     R_MSG,  A1   ; loads first draw msg
    MOVE.B  #14, D0
    TRAP    #15              ; Prints message
    ;BSR     GAME_OVER
    
    CMP.B     #2,D2
    BEQ       DMG_E
    
    CMP.B     #2,D2
    BGT       DMG_P
    
    CMP.B     #2,D2
    BLT       DMG_P
      
    RTS
    
ROCK:
    BSR ENDL
    LEA     P_MSG,  A1   ; loads first draw msg
    MOVE.B  #14, D0
    TRAP    #15              ; Prints message
    
    
    CMP.B     #1,D2
    BEQ       DMG_E
    
    CMP.B     #1,D2
    BGT       DMG_P
    
    CMP.B     #1,D2
    BLT       DMG_P
      

    RTS
    
SIS:
    BSR ENDL
    LEA     S_MSG,  A1   ; loads first draw msg
    MOVE.B  #14, D0
    TRAP    #15              ; Prints message
    
    
    CMP.B     #3,D2
    BEQ       DMG_E
    
    CMP.B     #3,D2
    BGT       DMG_P
    
    CMP.B     #3,D2
    BLT       DMG_P
      
   
    RTS



HEAL_T:
    BSR ENDL 
    LEA     HEAL_MSG,  A1   ; loads first draw msg
    MOVE.B  #14, D0
    TRAP    #15              ; Prints message
    MOVE.B #1,P_HP
    BSR TOWER_ROOM_9
HEAL_M:
    BSR ENDL 
    LEA     HEAL_MSG,  A1   ; loads first draw msg
    MOVE.B  #14, D0
    TRAP    #15              ; Prints message
    MOVE.B #1,P_HP
    BSR MINE_ROOM_9
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
MINES_MSG:    DC.B 'You enter the mines', $0D, $0A
              DC.B 'As you enter a cavity in the mines you see two dirverging paths', $0D, $0A
              DC.B 'The first a gradual slope down with mushrooms lining the floor', $0D, $0A
              DC.B 'The second a steep slope down a smell of blood wafting from it', $0D, $0A
              DC.B 'Which will you enter', $0D, $0A, 0
             
MINES_MSG1:   DC.B 'As you enter the next cavity in the mines you see two dirverging paths', $0D, $0A
              DC.B 'The first a gradual slope down with mushrooms lining the floor', $0D, $0A
              DC.B 'The second a steep slope down a smell of blood wafting from it', $0D, $0A
              DC.B 'Which will you enter', $0D, $0A, 0
              
MINES_MSG2:   DC.B 'You enter the next room it again has only two paths', $0D, $0A
              DC.B 'the mine all blending together only being seperated', $0D, $0A
              DC.B 'by the occaisonal campfire or fight', $0D, $0A
              DC.B 'The first a steep slope down a smell of blood wafting from it', $0D, $0A
              DC.B 'The second a gradual slope down with mushrooms lining the floor', $0D, $0A
              DC.B 'Which will you enter', $0D, $0A, 0
         
MINES_MSG3:   DC.B '', $0D, $0A
              DC.B 'As you move twords the next cavity you see a faint glow', $0D, $0A
              DC.B 'There is a campfire unattended in the room (33% chance to heal)', $0D, $0A
              DC.B 'There are also two paths ahead' $0D, $0A
              DC.B 'The first a steep slope down a smell of blood wafting from it', $0D, $0A
              DC.B 'The second a gradual slope down with mushrooms lining the floor', $0D, $0A
              DC.B 'Which will you enter', $0D, $0A, 0

FIGHT_T_MSG:  DC.B 'A fight will be here you take 1 dammage', $0D, $0A, 0

CUT_MINE:     DC.B 'As you aproch the botom of the mine you see before you', $0D, $0A
              DC.B 'The cobalt king sitting upon his throne made of crude iron', $0D, $0A
              DC.B 'As you inch closer you begin to knowtace the blade in his back', $0D, $0A
              DC.B 'the kobalt king is dead as you look around the room you see', $0D, $0A
              DC.B 'In a pile of iron ore a glint you rumage through to find half the relic', $0D, $0A
              DC.B 'Now you must continue your journy .', $0D, $0A, 0
CUT_TOWER:    DC.B 'As you reach the top of the tower having gone through many battles to get here', $0D, $0A
              DC.B 'before you lies an empty room of the archmage filled with pods full of liques ', $0D, $0A
              DC.B 'Within the liquid there is small childern each labled  attempt along with a number', $0D, $0A
              DC.B 'As you walk past this you see on a pedistal a half of the relic', $0D, $0A
              DC.B 'You take it and contine on your journy', $0D, $0A, 0 

FINAL_CUT     DC.B 'You have reached the top of the mountian both parts of the relic in hand', $0D, $0A
              DC.B 'You stop for a moment looking down to see how far you have come', $0D, $0A
              DC.B 'As you look down you spot someone standing up', $0D, $0A
              DC.B 'You realise that they are in the same place you started your journy', $0D, $0A
              DC.B 'You take a step closer to have a coser look at their face', $0D, $0A
              DC.B 'You see you and you recall the figure on top of the mountian you saw', $0D, $0A
              DC.B 'Then you feel a percing pain from behind you turn to see yourself', $0D, $0A
              DC.B 'It is you wearing the robes of a wizzard he mutters a few words to you', $0D, $0A
              DC.B 'I am sorry clone but their can only be one of me', $0D, $0A
              DC.B 'You fall forwards and everything fades to black', $0D, $0A
              
TOWER_MSG:    DC.B 'You go to tower', $0D, $0A
              DC.B 'as you enter the first room of the tower you see two stair cases', $0D, $0A
              DC.B 'the first a stairs lined with blue crysrals', $0D, $0A
              DC.B 'the second a stairs lined with red crystals', $0D, $0A
              DC.B 'Which will you enter(1 OR 2)', $0D, $0A, 0
              
TOWER_MSG1:   DC.B 'as you enter the next room of the tower you see two stair cases', $0D, $0A
              DC.B 'the first a stairs lined with blue crysrals', $0D, $0A
              DC.B 'the second a stairs lined with red crystals', $0D, $0A
              DC.B 'Which will you enter(1 OR 2)', $0D, $0A, 0

TOWER_MSG2:   DC.B 'as you enter the next room of the tower you see two stair cases', $0D, $0A
              DC.B 'The buliding like a maze designed to confuse and blend together', $0D, $0A
              DC.B 'the first a stairs lined with red crysrals', $0D, $0A
              DC.B 'the second a stairs lined with blue crystals', $0D, $0A
              DC.B 'how many more rooms could there be you wonder as you procede', $0D, $0A
              DC.B 'Which will you enter(1 OR 2)', $0D, $0A, 0
   
TOWER_MSG3:   DC.B 'as you enter the room see a faint red glow', $0D, $0A
              DC.B 'infront of you lays a stand of potions each with a diffrent ', $0D, $0A
              DC.B 'label it says formula number but the numbers are gone(33% heal', $0D, $0A
              DC.B 'and two stair cases as always are behind the stand', $0D, $0A
              DC.B 'chance )the first a stairs lined with red crysrals', $0D, $0A
              DC.B 'the second a stairs lined with blue crystals', $0D, $0A
              DC.B 'Which will you enter(1 OR 2)', $0D, $0A, 0

HEAL_MSG:     DC.B 'As you rest alowing your body to heal you knowtace something', $0D, $0A
              DC.B 'A button in the wall you press it an a passage opens', $0D, $0A
              DC.B 'As you follow it you realies it takes you before the final room', $0D, $0A
              DC.B 'You heal 1 hp', $0D, $0A,0

FIGHT_MSG:    DC.B 'Your opponent stands before you unwavering', $0D, $0A
              DC.B 'the only way out is trough you must defeat them', $0D, $0A ,0
INVALID_MSG:  DC.B 'Invalid choice. Try again.', $0D, $0A, 0
DRAW_MSG:     DC.B 'Yet another draw occurs the tensions rise as to who will be victorious', $0D, $0A ,0
FDRAW_MSG:    DC.B 'A draw occurs first time this fight who will be the victor', $0D, $0A ,0
FOVER_MSG:    DC.B 'The fight comes to its end you have survived yet again but can you keep this up' $0D, $0A ,0
DMG_MSG:      DC.B 'A blow has been dealt the fight draws closer to its end', $0D, $0A ,0
GO_MSG:       DC.B 'GAME OVER YOU ARE DEAD', $0D, $0A ,0
R_MSG:        DC.B 'ROCK WIN', 0
P_MSG:        DC.B 'PAPER WIN', 0
S_MSG:        DC.B 'SISSORS WIN', 0
SEED          DC.W    1
P_HP          DS.B    1
E_HP          DS.B    1

GAME_OVER:
       BSR     ENDL
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
