;Muhammd Ahmed Baig_20i-1884_Assignment#1_Section B

.MODEL SMALL
.STACK 100H
.DATA

;variables declaring 
x dw ?
y dw ?
z dw ?
Seven dw 0
Sodd dw 0
count	db 0
temp dw ?
s1 db 'Please enter 1st Number =  $'
s2 db 'Please enter 2nd Number =  $'
s3 db 'The sum of even Numbers = $'
s4 db 'The sum of odd  Numbers = $'
	
.CODE

start:

	mov AX,@DATA
    mov DS,AX
	mov DL,10
	mov AH,02h
	int 21h
	mov DX,offset s1
	mov AH,09h
	int 21h

input: 
			
	mov AH,01H
	int 21H
	cmp AL,13
	je endinput
	sub AL,48
	mov AH,0
	mov temp,AX
	mov AX,x
	mov BX,10
	mul BX	
	add AX,temp
	mov x,AX
	mov DX,AX
	jmp input

endinput:

	mov DX,offset s2
	mov AH,09h
	int 21h
	
input1: 
		
	mov AH,01H
	int 21H
	cmp AL,13
	je sum
	sub AL,48
	mov AH,0
	mov temp,AX
	mov AX,y
	mov BX,10
	mul BX	
	add AX,temp	
	mov y,AX
	mov DX,AX
	jmp input1
		
sum:
	inc y
	mov BX,x

looping:
	
	mov CX,y
	cmp BX,CX
	jae print
	mov AX,BX
	mov DL,2
	div DL 
	cmp AH,0
	je yes
	add Sodd,BX
	inc BX
	jmp looping

yes:
	
	add Seven,BX
	inc BX
	jmp looping

print:
	
	mov DL,10
	mov AH,02h
	int 21h
	mov DX,offset s3
	mov AH,09h 
	int 21h
	
Push1:

	mov AX,Seven
	mov DX,0
	mov BX,10
	div BX    
	push DX
	mov Seven,AX
	inc count
	cmp AX,0
	jne Push1

display:
	
	cmp count,0
	je printOdd
	dec count 
	pop DX
	add DX,48
	mov AH,02h
	int 21h
	jmp display

printOdd:
	
	mov DL,10
	mov AH,02h
	int 21h
	mov DX,offset s4
	mov AH,09h 
	int 21h

Push2:
	
	mov AX,Sodd
	mov DX,0
	mov BX,10
	div BX    
	push DX
	mov Sodd,AX
	inc count
	cmp AX,0
	jne Push2

display1:
	
	cmp count,0
	je exit
	dec count 
	pop DX
	add DX,48
	mov AH,02h
	int 21h
	jmp display1

exit:  
	
	mov AH,4CH
	int 21h
		
END start