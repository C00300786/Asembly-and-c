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
    
    ;move player location  x first byte y second
    MOVE.B  #$12, D2
    
    ;move npc location x first byte y second
    MOVE.B  #$22, D3
    
    ;Bitwise and of d2 and d3
    ;player location stays same(d2) npc location (d3) becomes 02
    AND.B D2 ,D3
    
    ;Load memory adderss into adress reg A1
    LEA    $3000, A1
    
    ;hit by NPC
    SUB.B   #20, (A1)
    
    ;health pack found
    ADD.B   #10, (A1)
    
    ;Move health to mem loc $3000
    MOVE.B #100, $3000
    
    ;load mem addr $3000 into addr reg A1
    LEA     $3000, A1
    
    ; Branch to taking dmg
    BSR     TAKING_DAMAGE
    
BACK_IN_THE_GAME:
    ;revive
    BSR HEALTH_PICKUP
    BRA GAME_END
  
TAKING_DAMAGE:
    ;HIT BY NPC
    SUB.B   #10, (A10)
    BRA BACK_IN_THE_GAME
    
HEALTH_PICKUP:
    ;medpack used
    ADD.B   #10, (A1)
    RTS
    
GAME_END:
    ;game over
    MOVE.B  #$00,   (A1)
* Put program code here

    SIMHALT             ; halt simulator
    

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
