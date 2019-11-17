ORG 00H
	START:	MOV R0,#05H
			MOV R1,#03H
			;MOV R2,#00001111B
			;MOV R3,#10101010B
			;MOV	R4,#11110000B
	
	TEST:	ORL	P3,#0FFH
			JNB	P3.7,CASE1
			JNB	P3.6,CASE2
			JNB	P3.5,CASE3
			JNB	P3.4,CASE4
			AJMP	TEST
			
			CASE1:	
					AJMP	TEST
					
			CASE2:		
						
				FUN1:	MOV A,#01010101B
						MOV	P1,A
						ACALL DELAY
						MOV A,#00000000B
						MOV P1,A
						ACALL DELAY
						DJNZ	R0,FUN1
						
						
						
					

						
				FUN2:	MOV A,#10101010B
						MOV P2,A
						ACALL DELAY
						MOV A,#00000000B
						MOV P2,A
						ACALL DELAY
						DJNZ	R1,FUN2
						ACALL DELAY
						AJMP	TEST
					
			CASE3:	
					AJMP	TEST
					
			CASE4:	
					AJMP	TEST
	
	DELAY:	MOV		R5,#200
	DL1:	MOV		R6,#250
	DL2:	MOV		R7,#200
	DL3:	DJNZ	R7,DL3
			DJNZ	R6,DL2
			DJNZ	R5,DL1
			RET
END