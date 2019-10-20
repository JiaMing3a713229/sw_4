ORG 0000H
	
	MOV	R1,#07H
	
	TEST:	ORL	P3,#0FFH
			JNB	P3.7,CASE1
			JNB P3.6,CASE2
			JNB P3.5,CASE3
			JNB P3.4,CASE4
			AJMP	TEST
			
			CASE1:
					MOV		A,#11111110B
				LEFT:
					MOV		P1,A
					ACALL	DELAY
					RL		A
					DJNZ	R1,LEFT
					MOV		R1,07H
					AJMP	TEST
			CASE2:
					MOV		A,#01111111B
				RIGHT:
					MOV		P1,A
					ACALL	DELAY
					RR		A
					DJNZ	R1,RIGHT
					MOV		R1,07H
					AJMP	TEST
			CASE3:
					MOV		R0,#OK1-TABLE1+1
					MOV		DPTR,#TABLE1
					MOV		R2,#00H
				DIFFUSION:
					MOV		A,R2
					MOVC	A,@A+DPTR
					MOV		P1,A
					ACALL	DELAY
					INC		R2
					DJNZ	R0,DIFFUSION
					AJMP	TEST
			CASE4:
					MOV		R0,#OK2-TABLE2+1
					MOV		DPTR,#TABLE2
					MOV		R2,#00H
				CONCENTRATED:
					MOV		A,R2
					MOVC	A,@A+DPTR
					MOV		P1,A
					ACALL	DELAY
					INC		R2
					DJNZ	R0,CONCENTRATED
					AJMP	TEST
	

	DELAY:	MOV	R5,#2
	DL1:	MOV	R6,#250
	DL2:	MOV R7,#200
	DL3:	DJNZ	R7,DL3
			DJNZ	R6,DL2
			DJNZ	R5,DL1
			RET
	
	TABLE1:	DB	11100111B
			DB	11011011B
			DB	10111101B
	OK1:	DB	01111110B
		
	TABLE2:	DB	01111110B
			DB	10111101B
			DB	11011011B
	OK2:	DB	11100111B
		
	END