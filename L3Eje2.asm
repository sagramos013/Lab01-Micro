.MODEL small
.STACK

.DATA
	;declaracion de variables
	num1 DB ?			
	num2 DB ?

	txt1 DB 'ingrese el primer número : $'
	txt2 DB 'ingrese el segundo número : $'
	
	suma DB 'Total: $'
	resta DB 'Diferencia: $'
	multi DB 'Producto: $'	
	txt_cociente DB 'Cociente: $'
	txt_residuo DB 'Residuo: $'
	res DB ?
	
.CODE
Programa:;inicio de programa
	Mov AX,@DATA
	Mov DS,AX
	
	MOV DX, OFFSET txt1;se pide el primer dato
	MOV AH,09h
	INT 21h
	
	MOV AH,01h
	INT 21h
	
	SUB AL, 30h
	MOV num1,AL
	
	MOV DX, 10
	MOV AH,02H
	INT 21h
	
	MOV DX, OFFSET txt2;se pide el segundo dato
	MOV AH,09h				
	INT 21h	
	
	MOV AH,01h;leemos el valor dado por el usuario
	INT 21h;se lee
	
	SUB AL, 30h
	MOV num2,AL
	
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

	MOV BH, num1
	MOV BL, num2
		
	ADD BH, BL
	ADD BH, 30H
	
	MOV DL, BH
	Mov AH, 02h
	Int 21h
	
	MOV DX, 10
	MOV AH,02H
	INT 21h
	
	;---CALCULO DE LA RESTA
	MOV DX, OFFSET resta
	MOV AH,09h				
	INT 21h
	
	XOR BX,BX
	
	MOV BH, num1
	MOV BL, num2
	
	SUB BH, BL						
	ADD BH, 30h
	MOV DL, BH
	MOV AH, 02h
	INT 21h

	MOV DX,10
	MOV AH,02H
	INT 21H
	
	;---CALCULO DE LA MULTIPLICACION
	MOV DX, OFFSET multi
	MOV AH,09h				
	INT 21h
	
	MOV DL, num1
	MOV AL, num2
	
	MUl DL 
	Add AX, 30h
	Mov Dx, Ax 
	MOV AH, 02h
	INT 21h

	MOV DX,10
	MOV AH,02H
	INT 21H
	
	;---CALCULO DE LA DIVISION
	MOV DX, OFFSET txt_cociente
	MOV AH,09h				
	INT 21h
	
	MOV AH, 0H
	MOV AL, num1
	MOV BL, num2
	
	DIV BL 
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
	
	
	;FIN DE PROGRAMA
	MOV DX, 10
	MOV AH,02H
	INT 21h
	
	MOV DX, 10
	MOV AH,02H
	INT 21h
	
	MOV ah, 4ch
	INT 21H
	
END Programa
