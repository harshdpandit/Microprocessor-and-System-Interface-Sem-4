	ORG 0000H
	MAIN:
	MOV P1,#38H    // USE 2 LINES AND 5X7 MATRIX
	ACALL COMMAND	//CALL COMMAND SUBROUTINE
	ACALL DELAY	//GIVE LCD SOME TIME
	MOV P1,#0EH     // LCD ON, CURSOR BLINKING 
	ACALL COMMAND
	ACALL DELAY
	MOV P1,#01H	//CLEAR DISPLAY SCREEN
	ACALL COMMAND
	ACALL DELAY
	MOV P1,#0C0H	//FORCE CURSOR TO BEGINING OF SECOND LINE
	ACALL COMMAND
	ACALL DELAY
	MOV P1,#1CH	//Move entire display to right
	ACALL COMMAND
	ACALL DELAY
	MOV P1,#04H	//INCREMENT CURSOR, SHIFT CURSOR TO LEFT
	ACALL COMMAND
	ACALL DELAY
	MOV P1,#14H	//SHIFT CURSOR POSITION TO RIGHT
	ACALL COMMAND
	ACALL DELAY
	MOV P1,#14H	//SHIFT CURSOR POSITION TO RIGHT
	ACALL COMMAND
	ACALL DELAY
	MOV P1,#14H	//SHIFT CURSOR POSITION TO RIGHT
	ACALL COMMAND
	ACALL DELAY
	MOV P1,#14H	//SHIFT CURSOR POSITION TO RIGHT
	ACALL COMMAND
	ACALL DELAY
	MOV P1,#14H	//SHIFT CURSOR POSITION TO RIGHT
	ACALL COMMAND
	ACALL DELAY
	MOV P1,#14H	//SHIFT CURSOR POSITION TO RIGHT
	ACALL COMMAND
	ACALL DELAY
	MOV P1,#14H	//SHIFT CURSOR POSITION TO RIGHT
	ACALL COMMAND
	ACALL DELAY
	MOV P1,#14H	//SHIFT CURSOR POSITION TO RIGHT
	ACALL COMMAND
	ACALL DELAY
	MOV P1,#14H	//SHIFT CURSOR POSITION TO RIGHT
	ACALL COMMAND
	ACALL DELAY
	MOV P1,#14H	//SHIFT CURSOR POSITION TO RIGHT
	ACALL COMMAND
	ACALL DELAY
	MOV P1,#14H	//SHIFT CURSOR POSITION TO RIGHT
	ACALL COMMAND
	ACALL DELAY
	MOV P1,#14H	//SHIFT CURSOR POSITION TO RIGHT
	ACALL COMMAND
	ACALL DELAY
	MOV P1,#14H	//SHIFT CURSOR POSITION TO RIGHT
	ACALL COMMAND
	ACALL DELAY
	MOV P1,#14H	//SHIFT CURSOR POSITION TO RIGHT
	ACALL COMMAND
	ACALL DELAY
	MOV P1,#'W'	//DATA TO BE DISPLAYED 
	ACALL DATAL
	ACALL DELAY
	MOV P1,#'E'    //DATA TO BE DISPLAYED
	ACALL DATAL
	ACALL DELAY
	MOV P1,#'L'	//DATA TO BE DISPLAYED
	ACALL DATAL
	ACALL DELAY
	MOV P1,#'C'     //DATA TO BE DISPLAYED
	ACALL DATAL
	ACALL DELAY
	MOV P1,#'O'	//DATA TO BE DISPLAYED
	ACALL DATAL
	ACALL DELAY
	MOV P1,#'M'	//DATA TO BE DISPLAYED
	ACALL DATAL
	ACALL DELAY
	MOV P1,#'E'	//DATA TO BE DISPLAYED
	ACALL DATAL
	ACALL DELAY
	HERE: SJMP HERE	//STAY HERE, DISPLAY AGAIN AND AGAIN
	COMMAND:	//SEND COMMAND TO LCD
	CLR P3.0	//CLEAR RS, PORT-3 PIN-10
	CLR P3.1	//CLEAR RW, PORT-3 PIN-11
	SETB P3.2	//SET E, PORT-3 PIN-12
	ACALL DELAY
	CLR P3.2	// CLEAR E, PORT-3 PIN-12
	RET
	DATAL:		//WRITE DATA TO LCD
	SETB P3.0	//SET RS, PORT-3 PIN-10	
	CLR P3.1	//CLEAR RW, PORT-3 PIN-11
	SETB P3.2	//SET E, PORT-3 PIN-12
	ACALL DELAY
	CLR P3.2	// CLEAR E, PORT-3 PIN-12
	RET
	DELAY:
	MOV R3, #50		//50 OT HIGHER FOR FAST CPUS
	WAIT1: MOV R4, #255	//R4=255
	WAIT: DJNZ R4, WAIT	//STAY UNTIL R4 BECOMES 0
	DJNZ R3, WAIT1		//STAY UNTIL R3 BECOMES 0
	RET
	END
