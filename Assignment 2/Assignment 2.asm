ORG 00H
MOV R0, #00H
MOV SP, #08H
UP: MOV P1, R0
INC R0
CJNE R0, #0FFH, UP
DOWN: MOV P1, R0
DJNZ R0, DOWN
LJMP UP
RET
END
