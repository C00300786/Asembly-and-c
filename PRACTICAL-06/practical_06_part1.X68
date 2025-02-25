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
    MOVE.B  #2, D0
    TRAP    #15
    
    LEA     MESSAGE, A1
    MOVE.B  #13,    D0
    TRAP    #15

* Put variables and constants here
MESSAGE: DC.B   'Trap Task Test',0
    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
