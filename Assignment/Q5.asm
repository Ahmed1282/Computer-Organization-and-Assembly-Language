

.MODEL SMALL
.STACK 100H
.DATA

	;Variables
	numA dw ?
	numB dw ?
	numC dw ?
	
	max dw ?
	min dw ?
	
	s1 db 'Enter First Number: $'
	s2 db 'Enter Second Number: $'
	s3 db 'Enter Third Number: $'
	str1 db 'Maximum: $'
	str2 db 'Minimum: $'
	intro db 'Display Maximum and Minimum from three Numbers$'

	digitCount 		db 0
	temp dw ?
	c1 db 0

.CODE
start:
 
    MOV AX, @DATA 
    MOV DS, AX

	MOV DX, offset intro
	MOV AH, 09h 
	INT 21h
	
	MOV DL, 10
	MOV AH, 02h
	INT 21h
    
;TAKING INPUT OF NUMBERS

	;Number 1
		
		MOV DX, offset s1
		MOV AH, 09h
		INT 21h
		
		;Taking Input
		o1:
		
			MOV AH,01H
			INT 21H
			CMP AL, 13
			JE endinput1
			
			SUB AL, 48
			MOV AH, 0
			MOV temp, AX
				
			MOV AX, numA
			MOV BX, 10
			MUL BX
				
			ADD AX, temp
				
			MOV numA, AX
			MOV DX, AX
				
		JMP o1
	
	endinput1:
	;Item 2
	
		MOV DX, offset s2
		MOV AH, 09h
		INT 21h
		
		;Taking Input
		o2:
		
			MOV AH,01H
			INT 21H
			CMP AL, 13
			JE endinput2
			
			SUB AL, 48
			MOV AH, 0
			MOV temp, AX
				
			MOV AX, numB
			MOV BX, 10
			MUL BX
				
			ADD AX, temp
				
			MOV numB, AX
			MOV DX, AX
				
		JMP o2
	
	endinput2:
	;Item 3
	
		MOV DX, offset s3
		MOV AH, 09h ;Displays String
		INT 21h
		
		;Taking Input
		o3:
		
			MOV AH,01H
			INT 21H
			CMP AL, 13
			JE calMax
			
			SUB AL, 48
			MOV AH, 0
			MOV temp, AX
				
			MOV AX, numC
			MOV BX, 10
			MUL BX
				
			ADD AX, temp
				
			MOV numC, AX
			MOV DX, AX
				
		JMP o3

calMax:

	MOV AX, numA ;A
	MOV BX, numB ;B
	MOV CX, numC ;C
	
	CMP AX, BX ; A > B
	JA comp1
	JB comp2
	
	comp1: 
		
		CMP AX, CX ; A > C
		JA maxA
		JB maxC
	
	comp2:
		
		CMP BX, CX ; B > C
		JA maxB
		JB maxC
	
;Setting Maximum
	maxA:
		
		MOV max, AX
		JMP displayMax
	
	maxB:
		
		MOV max, BX
		JMP displayMax
	
	maxC:
		
		MOV max, CX
		JMP displayMax
		
;Display

	;Maximum
	displayMax:
		
		MOV DX, offset str1
		MOV AH, 09
		INT 21h
	
		Pushing1:
		
			MOV AX, max
			MOV DX, 0
			MOV BX, 10
			DIV BX    
			PUSH DX
	 
			MOV max, AX
			INC digitCount
			CMP AX, 0
			JNE Pushing1
	 
		display1:
			
			CMP digitCount, 0
			JE calMin
			DEC digitCount 
			POP DX
			ADD DX, 48
			MOV AH, 02h
			INT 21h
			JMP display1

calMin:

	MOV AX, numA ;A
	MOV BX, numB ;B
	MOV CX, numC ;C
	
	CMP AX, BX ; A > B
	JA comp3
	JB comp4
	
	comp3: 
		
		CMP BX, CX ; B > C
		JA minC
		JB minB
	
	comp4:
		
		CMP AX, CX ; A > C
		JA minC
		JB minA
	
;Setting Maximum
	minA:

		MOV min, AX
		JMP displayMin
	
	minB:

		MOV min, BX
		JMP displayMin
	
	minC:
		
		MOV min, CX
		JMP displayMin
		
;Display
	
	;Minmum
	displayMin:
		
		MOV DL, 10
		MOV AH, 02h
		INT 21h
		
		MOV DX, offset str2
		MOV AH, 09
		INT 21h
	
		Pushing2:
		
			MOV AX, min
			MOV DX, 0
			MOV BX, 10
			DIV BX    
			PUSH DX
	 
			MOV min, AX
			INC digitCount
			CMP AX, 0
		
		JNE Pushing2
	 
		display2:
			
			CMP digitCount, 0
			JE exit 
			DEC digitCount 
			POP DX
			ADD DX, 48
			MOV AH, 02h
			INT 21h
		
		JMP display2
		
	exit:
	
		MOV AH, 4ch
		INT 21h		

END start
	