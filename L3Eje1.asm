.MODEL small			; Modelo para ejecutables
.STACK

.DATA
	Num1 DB 'Numero 1: 3$'
	Num2 DB 'Numero 2: 2$'
	
	suma DB 'Total  $'
	resta DB 'Diferencia : $'
	multi DB 'Producto : $'	
	txt_cosiente DB 'Cociente : $'
	txt_residuo DB 'Residuo : $'
	res DB ?
.CODE
programa:
	Mov AX,@DATA
	Mov DS,AX
	
	MOV DX, OFFSET Num1	
	MOV AH,09h				
	INT 21h	
	
	MOV DX, 10
	MOV AH,02H
	INT 21h
	
	MOV DX, OFFSET Num2	
	MOV AH,09h				
	INT 21h	
	
	MOV DX, 10
	MOV AH,02H
	INT 21h
	
	MOV DX, 10
	MOV AH,02H
	INT 21h
	
	;---CALCULO DE LA SUMA
	MOV DX, OFFSET suma	
	MOV AH,09h				
	INT 21h
	
	XOR BX,BX

	MOV BH, 4h
	MOV BL, 2h
		
	ADD BH, BL	
	ADD BH, 30H	
	
	MOV DL, BH
	Mov AH, 02h
	Int 21h

	MOV DX,10
	MOV AH,02H
	INT 21H
	
	;---CALCULO DE LA RESTA
	MOV DX, OFFSET resta
	MOV AH,09h				
	INT 21h
	
	XOR BX,BX
	
	MOV BH, 4h
	MOV BL, 2h
	
	SUB BH, BL						
	ADD BH, 30h
	MOV DL, BH
	MOV AH, 02h	
	INT 21h

	MOV DX,10
	MOV AH,02H
	INT 21H
	
	;---CALCULO DE MULTIPLICACION
	MOV DX, OFFSET multi
	MOV AH,09h				
	INT 21h
	
	MOV DL, 4h
	MOV AL, 2h
	
	MUl DL 
	Add AX, 30h	
	Mov Dx, Ax 
	MOV AH, 02h	
	INT 21h

	MOV DX,10
	MOV AH,02H
	INT 21H
	
	;---CALCULO DE LA DIVISION
	MOV DX, OFFSET txt_cosiente
	MOV AH,09h				
	INT 21h
	
	MOV AX, 4h
	MOV DL, 2h
	
	DIV DL 
	MOV res,AH
	ADD res,30H
	
	Add AL, 30H						
	MOV DL, AL
	MOV AH, 02h
	INT 21h
	
	MOV DX,10
	MOV AH,02H
	INT 21H
	
	MOV DX, OFFSET txt_residuo
	MOV AH,09h				
	INT 21h
	
	MOV DL,res
	MOV AH, 02h
	INT 21h
	
	;Fin de programa
	MOV DX, 10
	MOV AH,02H
	INT 21h
	
	MOV DX, 10
	MOV AH,02H
	INT 21h
	
	MOV ah, 4ch
	INT 21H
END programa