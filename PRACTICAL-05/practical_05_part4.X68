*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
DAMAGE EQU 10
START:
    LEA PLAYER_X, A2
    LEA ENEMY_POSITIONS, A3
    BRA GAME_LOOP             
GAME_LOOP:
    BSR COUNT_ENEMIES
    MOVE.B D0, D4
    
    LEA MSG_GAMELOOP, A1
    BSR DRAW
    
    BSR UPDATE
    BRA GAME_LOOP
UPDATE: 
    MOVE.B PLAYER_HEALTH, D1
    
    LEA MSG_HEALTH, A1
    BSR DRAW
    
    
    MOVE.B  #3, D0
    TRAP    #15
    
    LEA CRLF, A1
    BSR DRAW
    
    CMP #0,D1
    BLE GAME_OVER
    ADD.L   #1, (A2)
    BSR COLLISION
    RTS
    
DRAW:
    MOVE.B  #13,D0
    TRAP    #15
    RTS
    
COLLISION:
    MOVE.B  #1,D5
    LEA ENEMY_POSITIONS, A3
   
ITERATE:
    CMP D5,D4
    ADD.B #1,D5
    BEQ GAME_LOOP
    BNE CHECK_ENEMIES
    RTS
 
CHECK_ENEMIES:
    MOVE.L  (A3)+,D2
    MOVE.L  (A2),D3
    
    CMP.L   D2,D3
    BEQ REDUCE_HEALTH
    BNE ITERATE
    
REDUCE_HEALTH:
    LEA MSG_COLLOSION , A1
    BSR DRAW
    
    SUB.B   #DAMAGE,PLAYER_HEALTH
    
    LEA MSG_DAMAGE, A1
    BSR DRAW
    
    BRA GAME_LOOP
GAME_OVER:
    LEA MSG_GAMEOVER, A1
    BSR DRAW

    SIMHALT             ; halt simulator
COUNT_ENEMIES:
    MOVE.B  #0,D0
    LEA ENEMY_POSITIONS, A0
    
COUNT_ENEMIES_LOOP:
    TST.L   (A0)+
    BEQ END_COUNTING
    
END_COUNTING:
    RTS
    
PLAYER_X            DC.L  1
PLAYER_HEALTH       DC.B  100
MSG_HEALTH          DC.B 'Health : ', 0
MSG_GAMELOOP       DC.B 'Game Loop........' ,0
MSG_GAMEOVER       DC.B 'Game Over', 0
MSG_COLLOSION       DC.B 'Collision',0
MSG_DAMAGE          DC.B 'Taking Damage',0
CRLF                DC.B $0D,$0A,0
ENEMY_POSITIONS     DC.L 20,30,40,50,60,70,80,90,200,300,500,0

* Put variables and constants here

    END    START        ; last line of source





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
