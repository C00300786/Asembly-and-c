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
    LEA $4000, SP
    
    MOVE.B  #1, -(SP)
    MOVE.B  #2, -(SP)
    MOVE.B  #3, -(SP)
    MOVE.B  #4, -(SP)
    
    MOVE.B  (SP)+, D1
    MOVE.B  (SP)+, D1
    MOVE.B  (SP)+, D1
    MOVE.B  (SP)+, D1

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
    LEA $4000, SP
    
    MOVE.B  #1, -(SP)
    MOVE.B  #2, -(SP)
    MOVE.B  #3, -(SP)
    MOVE.B  #4, -(SP)
    
    MOVE.B  (SP)+, D1
    MOVE.B  (SP)+, D1
    MOVE.B  (SP)+, D1
    MOVE.B  (SP)+, D1

* Put variables and constants here
    
    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
>>>>>>> 85ba522ef54a383be21beaf4ed4a2b088a1ae756
