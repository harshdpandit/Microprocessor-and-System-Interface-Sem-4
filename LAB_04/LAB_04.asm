ORG 0000H
AJMP START
START: 
MOV SP,#030H
MOV A,#00H
MOV P1,A
ACALL DELAY
ORL A,#01H

AGAIN: 
MOV P1,A
ACALL DELAY

RL A
CJNE A,00H,NEXT
AJMP START

NEXT: SJMP AGAIN

DELAY:
MOV TMOD,#10H
MOV TL1,#18H
MOV TH1,#0FCH
MOV TCON,#40H
WAIT: JNB TCON.7,WAIT

RET
END
