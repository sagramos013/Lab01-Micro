.MODEL small
.DATA
; variable que contiene el texto que queremos mostrar
name DB 'tu name$' ; $  -> siginica el final de la cadena
carne DB 'tu carne$'

.STACK
.CODE

programa: ;etiqueta de inicio del programa
;inicializar programa
MOV AX, @DATA ; guardando direccion de inicio segmento de 
MOV DS, AX    
; Imprimir cadena
MOV DX, OFFSET cadena ;asignando a DX la variable cadena
MOV AH, 09h           ;decimos que se imprima una cadena
INT 21H               ;ejecuta la interrupcion, imprimir

MOV AX, @DATA ; guardando direccion de inicio segmento de 
MOV DS, AX  
; Imprimir cadena
MOV DX, OFFSET carne ;asignando a DX la variable cadena
MOV AH, 09h           ;decimos que se imprima una cadena
INT 21H   

;finalizar programa
MOV AH, 4CH     ;finalizar proceso
INT 21H         ;ejecuta la interrupcion
END programa