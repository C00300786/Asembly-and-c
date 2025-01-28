*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

    LEA PHEALTH,A3
    LEA PPOSX,  A4
    LEA PPOSY,  A5
    LEA PPOINT, A6
    
    MOVE.L (A3), D1
    MOVE.B (A4), D2
    MOVE.W (A5), D3
    MOVE.L (A6), D4
    SIMHALT             ; halt simulator

* Put variables and constants here
PHEALTH dc.l    $64
PPOSX   dc.b    $19
PPOSY   dc.w    $17
PPOINT  dc.l    $12

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
