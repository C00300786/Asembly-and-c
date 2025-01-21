*-----------------------------------------------------------
* Title      :Prac2 p4
* Written by : jamie williamson
* Date       : 21/01/25
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
     MOVE.L #%01100100, D0          ; bin to hex store in reg D0 MOVE.L(32 bits)(100 in bin)
     MOVE.L #$64,       D1          ; hex to hex store in reg D1 MOVE.L(32 bits)(100 in hex)
     MOVE.L #100,       D2          ; dec to hex store in reg D2 MOVE.L(32 bits)(100 in dec)
     
     MOVE.L D0,         $3000       ; MOVE.L(32 bits) moves whats stored in D0 to reg 3000
     MOVE.L D1,         $3010       ; MOVE.L(32 bits) moves whats stored in D1 to reg 3010
     MOVE.L D2,         $3020       ; MOVE.L(32 bits) moves whats stored in D2 to reg 3020
     
     MOVE.W #100,       $3030       ; dec to hex store in reg 3030 MOVE.W(64 bits)(4 in dec)
     MOVE.W #$100,      $3040       ; hex to hex store in reg 3040 MOVE.W(64 bits)(4 in dec)
     MOVE.W #%100,      $3050       ; bin to hex store in reg 3050 MOVE.W(64 bits)(4 in dec)
        
     MOVE.B #100,       $3060       ; dec to hex store in reg 3060 MOVE.B(8 bits) (100 in dec)
     MOVE.B #$64,       $3070       ; hex to hex store in reg 3070 MOVE.B(8 bits) (100 in dec)
     MOVE.B #%10001111, $3080       ; bin to hex store in reg 3080 MOVE.B(8 bits) (143 in dec)
     

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
