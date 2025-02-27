<<<<<<< HEAD
*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

    SIMHALT             ; halt simulator

    MOVE.L #HEALTH, -(SP)
    JSR GAME_LOOP
    BSR HEAS_UP_DISPLAY
    BRA END
    
GAME_LOOP:
    MOVEA.L 4(SP),  A1
    SUB.B   #10,   (A1)
    RTS
   
HEADS_UP_DISPLAY:
    LEA MESSAGE,    A1
    MOVE.B  #14,    D0
    TRAP    #15
    MOVE.B  HEALTH, D1
    MOVE.B  #3, D0
    TRAP    #15
    RTS
    
HEALTH: DC.B    100
MESSAGE:DC.B    'Health:',0

* Put variables and constants here
    
    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
=======
*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

    SIMHALT             ; halt simulator

    MOVE.L #HEALTH, -(SP)
    JSR GAME_LOOP
    BSR HEAS_UP_DISPLAY
    BRA END
    
GAME_LOOP:
    MOVEA.L 4(SP),  A1
    SUB.B   #10,   (A1)
    RTS
   
HEADS_UP_DISPLAY:
    LEA MESSAGE,    A1
    MOVE.B  #14,    D0
    TRAP    #15
    MOVE.B  HEALTH, D1
    MOVE.B  #3, D0
    TRAP    #15
    RTS
    
HEALTH: DC.B    100
MESSAGE:DC.B    'Health:',0

* Put variables and constants here
    
    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
>>>>>>> 85ba522ef54a383be21beaf4ed4a2b088a1ae756
