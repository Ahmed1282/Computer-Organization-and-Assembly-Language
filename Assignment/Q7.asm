;Muhammd Ahmed Baig_20i-1884_Assignment#1_Section B

.MODEL SMALL
.STACK 100H
.DATA
amount1 dw 0

totals dw 0
amount2 dw 0

tempvar dw 0
amount3 dw 0


aa db "Total  : $"
amount4 dw 0
amount5 dw 0


count db 0
.CODE

mov ax,@data
mov ds,ax


takeinput1:
mov ah,01h
Int 21h
cmp al,13
je takeinput2
sub al,48
mov ah,0
mov tempvar,ax
mov ax,amount1
mov bx,10
mul bx
add ax,tempvar
mov amount1,ax
jmp takeinput1
takeinput2:
mov ah,01h
Int 21h
cmp al,13
je takeinput3
sub al,48
mov ah,0
mov tempvar,ax
mov ax,amount2
mov bx,10
mul bx
add ax,tempvar
mov amount2,ax
jmp takeinput2
takeinput3:
mov ah,01h
Int 21h
cmp al,13
je takeinput4
sub al,48
mov ah,0
mov tempvar,ax
mov ax,amount3
mov bx,10
mul bx
add ax,tempvar
mov amount3,ax
jmp takeinput3
takeinput4:
mov ah,01h
Int 21h
cmp al,13
je takeinput5
sub al,48
mov ah,0
mov tempvar,ax
mov ax,amount4
mov bx,10
mul bx
add ax,tempvar
mov amount4,ax
jmp takeinput4
takeinput5:
mov ah,01h
Int 21h
cmp al,13
je sum
sub al,48
mov ah,0
mov tempvar,ax
mov ax,amount5
mov bx,10
mul bx
add ax,tempvar
mov amount5,ax
jmp takeinput5

sum:
MOV DX, offset aa
MOV AH, 09h
INT 21h
mov bx, amount1
add totals, bx
mov bx, amount2
add totals, bx
mov bx, amount3
add totals, bx
mov bx, amount4
add totals, bx
mov bx, amount5
add totals, bx

mov ax, totals
makingoutput:
mov dx, 0
mov bx, 10
div bx
push dx
inc count
cmp AX, 0
je showprice
jmp makingoutput
showprice:
pop DX
dec count
add dl, 48
mov ah, 02
int 21H
cmp count, 0
jne showprice
mov ah, 4ch
int 21h
end