;Muhammd Ahmed Baig_20i-1884_Assignment#1_Section B

.MODEL SMALL
.STACK 100H
.DATA

;variables declaring
num dw ?
temp dw ?
fac dw 1
count db 0
str1 db 'Please enter a number from 1 to 8 = $'
str2 db 'The Factorial = $'

.CODE

mov AX,@DATA
mov DS,AX

starting:
	mov AX,@DATA
    	mov DS,AX
    
;displaying
mov DX,offset str1
mov AH,09h 
int 21h

input:
	mov AH,01H
	int 21H
	cmp AL,13
	JE calculation
	sub AL,48
	mov AH,0
	mov temp,AX			
	mov AX,num
	mov BX, 10
	mul BX
	add AX,temp
	mov num,AX
	mov DX,AX
	jmp input
	
;factorial
calculation:
	mov CX, num
		
factorial:

	mov AX,fac	
	mov BX,num
	mul BX
	mov fac,AX
	dec num
	loop factorial
	
;outputing	
mov DX,offset str2
mov AH,09h 
int 21h
		
Pushing:

	mov AX,fac
	mov DX,0
	mov BX,10
	div BX    
	push DX
	mov fac,AX
	inc count
	cmp AX,0
	jne Pushing
 
displaying:
		
	cmp count, 0
	je exit
	dec count 
	pop DX
	add DX,48
	mov AH,02h
	int 21h
	jmp displaying

exit:  	

	mov AH,4CH	
	int 21h
		
END starting