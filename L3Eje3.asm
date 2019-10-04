.MODEL small
.STACK

.DATA
	;declaracion de variables
	num1 DB ?; 1er numero
	num2 DB ?; 2do numero
	unidad DB ?; Variable para unidades
	diez DB 10; dato para calcular las decenas
	decena DB ?; variable para cadena

	txt1 DB 'Ingrese el primer numero: $'
	Tnum2 DB 'Ingrese el segundo numero: $'
	
	suma DB 'Total: $'
	resta DB 'Diferencia: $'
	multi DB 'Producto: $'	
	txt_cociente DB 'Cociente: $'
	divir DB 'Residuo: $'

	cociente DB ?					
	residuo DB ?						
	
.CODE
Programa:
	Mov AX,@DATA					
	Mov DS,AX							
	
	;SOLICITAR EL PRIMER NUMERO Y GUARDARLO EN SU VARIABLE
	MOV DX, OFFSET txt1					;se pide el primer valor
	MOV AH,09h				
	INT 21h	
	
	MOV AH,01h
	INT 21h	
	
	SUB AL, 30h	
	MOV num1,AL
	
	MOV DX, 10
	MOV AH,02H
	INT 21h
	
	;SOLICITAR EL SEGUNDO NUMERO Y GUARDARLO EN SU VARIABLE
	MOV DX, OFFSET txt2					;se pide el segundo valor
	MOV AH,09h				
	INT 21h	
	
	MOV AH,01h
	INT 21h	
	
	SUB AL, 30h	
	MOV num2,AL	
	
	MOV DX, 10	
	MOV AH,02H
	INT 21h
	
	MOV DX, 10	
	MOV AH,02H
	INT 21h
	
	;---CALCULO DE LA SUMA
	XOR AX,AX
	
	MOV AL, num1
	ADD AL, num2
	DIV diez
	MOV decena, AL	
	MOV unidad, AH	
	
	MOV DX, OFFSET suma	
	MOV AH,09h	
	INT 21h
	
	Mov DL, decena 
    Add DL, 30h 
	Mov AH, 02 
    Int 21h    
	
	Mov DL, unidad 
    Add DL, 30h 
	Mov AH, 02
    Int 21h    
	
	MOV DX, 10; Salto de linea
	MOV AH,02H
	INT 21h
	
;---CALCULO DE LA RESTA
 	XOR AX,AX
	
	MOV AL, num1
	SUB AL, num2
	DIV diez
	MOV decena, AL
	MOV unidad, AH
	
	MOV DX, OFFSET resta
	MOV AH,09h				
	INT 21h
	
	Mov DL, decena 
    Add DL, 30h
	Mov AH, 02
    Int 21h    
	
	Mov DL, unidad 
    Add DL, 30h 
	Mov AH, 02
    Int 21h 
	
	MOV DX, 10;salto de linea
	MOV AH,02H
	INT 21h
;---CALCULO DE LA MULTIPLICACION

	XOR AX,AX
	XOR DX,DX
	
	MOV DL, num1
	MOV AL, num2
	
	MUl DL
	DIV diez
	MOV decena, AL
	MOV unidad, AH
	
	MOV DX, OFFSET multi
	MOV AH,09h
	INT 21h
	
	Mov DL, decena
    Add DL, 30h
	Mov AH, 02
    Int 21h 
	
	Mov DL, unidad
    Add DL, 30h
	Mov AH, 02
    Int 21h 
	
	MOV DX, 10
	MOV AH,02H
	INT 21h
	
	;---CALCULO DE LA DIVISION
;--divisor
	XOR AX,AX
	XOR BX,BX
	
	MOV AH, 0H
	MOV AL, num1
	MOV BL, num2
	
	DIV BL
	MOV cociente, AL
	MOV residuo, AH
	
;cociente
	XOR AX,AX
	XOR DX,DX
	
	MOV AL, cociente					
	DIV diez
	MOV decena, AL
	MOV unidad, AH
	
	MOV DX, OFFSET txt_cociente	
	MOV AH,09h				
	INT 21h
	
	Mov DL, decena 
    Add DL, 30h 
	Mov AH, 02
	
	Mov DL, unidad
    Add DL, 30h
	Mov AH, 02
    Int 21h   
	
	MOV DX,10;salto de linea
	MOV AH,02H
	INT 21H
	
;residuo
	XOR AX,AX
	XOR DX,DX
	
	MOV AL, Residuo
	DIV diez
	MOV decena, AL
	MOV unidad, AH
	
	MOV DX, OFFSET divir
	MOV AH,09h				
	INT 21h
	
	Mov DL, decena
    Add DL, 30h
	Mov AH, 02
    Int 21h  
	
	Mov DL, unidad
    Add DL, 30h
	Mov AH, 02
    Int 21h 

	
	;Finalizar el programa
	MOV DX, 10
	MOV AH,02H
	INT 21h
	
	MOV DX, 10
	MOV AH,02H
	INT 21h
	
	MOV ah, 4ch
	INT 21H
	
END Programa
