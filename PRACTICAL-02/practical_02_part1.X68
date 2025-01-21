*-----------------------------------------------------------
* Title      :Prac 2 p1
* Written by : jamie williamson
* Date       : 21/01/2025
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

     MOVE.L #%100,  D0  ; #% == bin stores in hex
     MOVE.L #$100,  D1  ; #$ == hex stores in hex
     MOVE.L #100,   D2  ; # by its self == dec stores in hex
     
     MOVE.L D0,     $3000   ;moves D0 to reg 3000
     MOVE.L D1,     $3010   ;moves D1 to reg 3010
     MOVE.L D2,     $3020   ;moves D2 to reg 3020 
     
     

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
