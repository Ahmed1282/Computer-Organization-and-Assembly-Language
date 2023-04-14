;Muhammd Ahmed Baig_20i-1884_Assignment#1_Section B

.MODEL SMALL
.STACK 100H
.DATA

;variables declaring
o1 dw ?
o2 dw ?
o3 dw ?
o4 dw ?
o5 dw ?
t1 dw ?
t2 dw ?
t3 dw ?
t4 dw ?
t5 dw ?
Tsum dw 0
Osum dw 0
perc dw 0
count db 0
temp dw ?
sub1 db 'subject 1 $'
sub2 db 'subject 2 $'
sub3 db 'subject 3 $'
sub4 db 'subject 4 $'
sub5 db 'subject 5 $'
st1 db 'Please enter the obtained marks = $'
st2 db 'Please enter the total marks = $'
st3 db 'The total obtained marks = $'
st4 db 'The percentage = $'

.CODE
start:
 
	mov AX,@DATA
	mov DS,AX
	mov DL,10
	mov AH,02h
	int 21h
	mov DX,offset sub1
	mov AH,09h 
	int 21h
	mov DL,10 
	mov AH,02h
	int 21h
	mov DX,offset st1
	mov AH,09h
	int 21h
	
ob1:

	mov AH,01H
	int 21H
	cmp AL,13
	je tot1
	sub AL,48
	mov AH,0
	mov temp,AX
	mov AX,o1
	mov BX,10
	mul BX
	add AX,temp
	mov o1,AX
	mov DX,AX		
	jmp ob1
	
tot1:
	
	mov DX,offset st2
	mov AH,09h
	int 21h

inputing1:

	mov AH,01H
	int 21H
	cmp AL,13
	je inputend1
	sub AL,48
	mov AH,0
	mov temp,AX
	mov AX,t1
	mov BX,10
	mul BX
	add AX,temp
	mov t1,AX
	mov DX,AX
	jmp inputing1
	
inputend1:

	mov DX,offset sub2
	mov AH,09h 
	int 21h
	mov DL,10 
	mov AH,02h
	int 21h
	mov DX,offset st1
	mov AH,09h 
	int 21h

ob2:

	mov AH,01H
	int 21H
	cmp AL,13
	je tot2
	sub AL,48
	mov AH,0
	mov temp,AX
	mov AX,o2
	mov BX,10
	mul BX
	add AX,temp
	mov o2,AX
	mov DX,AX		
	jmp ob2

tot2:
			
	mov DX,offset st2
	mov AH,09h 
	int 21h

inputing2:

	mov AH,01H
	int 21H
	cmp AL,13
	je inputend2
	sub AL,48
	mov AH,0
	mov temp,AX
	mov AX,t2
	mov BX,10
	mul BX
	add AX,temp
	mov t2,AX
	mov DX,AX		
	jmp inputing2
		
inputend2:
	
	mov DX,offset sub3
	mov AH,09h 
	int 21h
	mov DL,10 
	mov AH,02h
	int 21h
	mov DX,offset st1
	mov AH,09h
	int 21h

ob3:
	
	mov AH,01H
	int 21H
	cmp AL,13
	je tot3	
	sub AL,48
	mov AH,0
	mov temp,AX
	mov AX,o3
	mov BX,10
	mul BX
	add AX,temp
	mov o3,AX
	mov DX,AX
	jmp ob3
	
tot3:
			
	mov DX,offset st2
	mov AH,09h
	int 21h

inputing3:

	mov AH,01H
	int 21H
	cmp AL,13
	je inputend3
	sub AL,48
	mov AH,0
	mov temp,AX
	mov AX,t3
	mov BX,10
	mul BX
	add AX,temp
	mov t3,AX
	mov DX,AX	
	jmp inputing3

inputend3:
	
	mov DX,offset sub4
	mov AH,09h 
	int 21h
	mov DL,10 
	mov AH,02h
	int 21h
	mov DX,offset st1
	mov AH,09h
	int 21h

ob4:
	
	mov AH,01H
	int 21H
	cmp AL,13
	je tot4
	sub AL,48
	mov AH,0
	mov temp,AX
	mov AX,o4
	mov BX,10
	mul BX
	add AX,temp
	mov o4,AX
	mov DX,AX
	jmp ob4

tot4:
			
	mov DX, offset st2
	mov AH, 09h 
	int 21h

inputing4:

	mov AH,01H
	int 21H
	cmp AL,13
	je inputend4
	sub AL,48
	mov AH,0
	mov temp,AX
	mov AX,t4
	mov BX,10
	mul BX
	add AX,temp
	mov t4,AX
	mov DX,AX
	jmp inputing4

inputend4:

	
	mov DX,offset sub5
	mov AH,09h
	int 21h
	mov DL,10 
	mov AH,02h
	int 21h
	mov DX,offset st1
	mov AH,09h
	int 21h

ob5:
		
	mov AH,01H
	int 21H
	cmp AL,13
	je tot5
	sub AL,48
	mov AH,0
	mov temp,AX
	mov AX,o5
	mov BX,10
	mul BX
	add AX,temp
	mov o5,AX
	mov DX,AX
	jmp ob5
	
tot5:
			
	mov DX,offset st2
	mov AH,09h 
	int 21h

inputing5:
		
	mov AH,01H
	int 21H
	cmp AL,13
	je sum
	sub AL,48
	mov AH,0
	mov temp,AX
	mov AX,t5
	mov BX,10
	mul BX
	add AX,temp
	mov t5,AX
	mov DX,AX		
	jmp inputing5
		
sum:
	
	mov BX,t1
	add Tsum,BX
	mov BX,t2
	add Tsum,BX
	mov BX,t3
	add Tsum,BX
	mov BX,t4
	add Tsum,BX
	mov BX,t5
	add Tsum,BX
	mov BX,o1
	add Osum,BX
	mov BX,o2
	add Osum,BX
	mov BX,o3
	add Osum,BX
	mov BX,o4
	add Osum,BX
	mov BX,o5
	add Osum,BX

	mov AX,Osum
	mov BX,100
	mul BX
	mov BX,Tsum
	div BX
	mov perc,AX

	mov DX,offset st3
	mov AH,09h
	int 21h
		
Pushing1:
	
	mov AX,Osum
	mov DX,0
	mov BX,10
	div BX    
	push DX
	mov Osum,AX
	inc count
	cmp AX,0
	jne Pushing1
 
display1:
	
	cmp count,0
	je output2
	dec count 
	pop DX
	add DX,48
	mov AH,02h
	int 21h	
	jmp display1

output2:
		
	mov DL, 10
	mov AH, 02h
	int 21h
	mov DX,offset st4
	mov AH,09h
	int 21h
	
Pushing2:

	mov AX,perc
	mov DX,0
	mov BX,10
	div BX    
	push DX
	mov perc,AX
	inc count
	cmp AX,0
	jne Pushing2

display2:
		
	cmp count,0
	je exit
	dec count 
	pop DX
	add DX, 48
	mov AH, 02h
	int 21h
	jmp display2

exit:  
		
	mov DL,'%'
	mov AH,02h
	int 21h
	mov AH,4CH
	int 21h

END start