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
    
    MOVE.B  #14, D0
    MOVE.B  #14, D1
    
    MOVE.L D0,  -(SP)
    MOVE.L  D1, -(SP)
    
    JSR GAME_LOOP
    BSR HEAS_UP_DISPLAY
    BRA END_GAME
    
GAME_LOOP:
    MOVE.L 4(SP),  D1
    MOVE.L 8(SP),  D0
 
    CMP D0, D1
    BEQ DAMAGE
    BRA NO_DAMAGE
    
DAMAGE
    MOVE.L  12(SP), A1
    SUB.B   #10,   (A1)
    
NO_DAMAGE:
    RTS
    
   
HEADS_UP_DISPLAY:
    MOVE.B  HEALTH, D1
    MOVE.B  #3, D0
    TRAP    #15
    RTS
    
HEALTH: DC.B    100

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
    
    MOVE.B  #14, D0
    MOVE.B  #14, D1
    
    MOVE.L D0,  -(SP)
    MOVE.L  D1, -(SP)
    
    JSR GAME_LOOP
    BSR HEAS_UP_DISPLAY
    BRA END_GAME
    
GAME_LOOP:
    MOVE.L 4(SP),  D1
    MOVE.L 8(SP),  D0
 
    CMP D0, D1
    BEQ DAMAGE
    BRA NO_DAMAGE
    
DAMAGE
    MOVE.L  12(SP), A1
    SUB.B   #10,   (A1)
    
NO_DAMAGE:
    RTS
    
   
HEADS_UP_DISPLAY:
    MOVE.B  HEALTH, D1
    MOVE.B  #3, D0
    TRAP    #15
    RTS
    
HEALTH: DC.B    100

* Put variables and constants here
    
    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
>>>>>>> 85ba522ef54a383be21beaf4ed4a2b088a1ae756
