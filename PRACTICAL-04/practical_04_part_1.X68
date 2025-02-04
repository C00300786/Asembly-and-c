*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

    ; Move Health to Memory location $3000
    MOVE.B  #100, $3000
    
    ;Load memory adderss into adress reg A1
    LEA    $3000, A1
    
    ;hit by NPC
    SUB.B   #20, (A1)
    
    ;health pack found
    ADD.B   #10, (A1)
* Put program code here

    SIMHALT             ; halt simulator
    

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
