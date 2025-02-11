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
    
COLLISION_CHECK:
    MOVE.B PLAYER_POSITION, D1
    CMP.B  D2, D1
    BEQ    COLLISION
    RTS
COLLISION:
    SUB.B #DAMAGE, PLAYER_HEALTH
    BRA GAME_LOOP
GAME_OVER:
    LEA MSG_GAME_OVER, A1
    MOVE.B #13, D0
    TRAP #15

    SIMHALT             ; halt simulator
PLAYER_POSITION:    DC.B 10
ENEMY_POSITION:     DC.B 50
PLAYER_HEALTH:      DC.B 100

MSG_GAME_LOOP       DC.B 'Game Loop........' ,0
MSG_GAME_OVER       DC.b 'Game Over', 0

* Put variables and constants here

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
