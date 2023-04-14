;Muhammd Ahmed Baig_20i-1884_Assignment#1_Section B

.MODEL SMALL
.STACK 100H
.DATA

;variables declaring
x dw ?
y dw ?
z dw ?
temp dw ?	
count db 0
s1 db 'Please enter 1st Number =  $'
s2 db 'Please enter 2nd Number =  $'
s3 db 'even numbers = $'
s4 db 'odd  numbers = $'

.CODE

starting:
 
    mov AX,@DATA
    mov DS,AX
	
;Displaying
mov DX,offset s1
mov AH,09h
int 21h

intput:
	;Inputing
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
	jmp intput

endinput:

	;Display
	mov DX,offset s2
	mov AH,09h
	int 21h
	
input2:
		
	;Inputing
	mov AH,01H
	int 21H
	cmp AL,13
	je evenp
	sub AL,48
	mov AH,0
	mov temp,AX
	mov AX,y
	mov BX,10
	mul BX
	add AX,temp
	mov y,AX
	mov DX,AX
	jmp input2

evenp:
	mov DL,10
	mov AH,02h
	int 21h
	mov DX,offset s3
	mov AH,09h 
	int 21h	
	inc y
	mov BX, x

print:
	mov CX,y
	cmp BX,CX
	jae odd
	mov AX,BX
	mov DL,2
	div DL 
	cmp AH,0
	je true
	inc BX			
	jmp print
		
true:
	mov z,BX
	inc BX
	mov DL,' '
	mov AH,02h
	int 21h
			
pushing:
			
	mov AX,z
	mov DX,0
	mov CX,10
	div CX    
	push DX
	mov z,AX
	inc count
	cmp AX,0
	jne pushing
		 
display:
			
	cmp count,0
	je print
	dec count 
	pop DX
	add DX,48
	mov AH,02h
	int 21h
	jmp display

odd:

	mov DL, 10
	mov AH, 02h
	int 21h
	mov DX,offset s4
	mov AH,09h
	int 21h
	mov BX,x

print2:
			
	mov CX,y
	cmp BX,CX
	jae exit
	mov AX,BX
	mov DL,2
	div DL 
	cmp AH,0
	jne true2
	inc BX			
	jmp print2
		
true2:
			
	mov z,BX
	inc BX
	mov DL,' '
	mov AH,02h
	int 21h
	
Pushing2:
	
	mov AX,z
	mov DX,0
	mov CX,10
	div CX    
	push DX
	mov z,AX
	inc count
	cmp AX,0
	jne Pushing2
	 
display2:
		
	cmp count,0
	je print2
	dec count 
	pop DX
	add DX,48
	mov AH,02h
	int 21h
	jmp display2
		
exit:  
	mov AH,4CH
	int 21h

END starting