;charAndAttribute.asm ---> Print Char and Attribute
;CREATE AND COMPILE USE DOSBOX

.MODEL
.CODE
ORG 100h

Process:
	MOV AH,09h                     ;value Service for print character
	MOV AL,'A'                     ;AL = 'char'
	MOV BH,00h                     ;number page screen
	MOV BL,93h                     ;color or attribute
	MOV CX,03h                     ;total loop for print character 
	INT 10h                        ;Run Program
	INT 20h                        ;Exit
END     Process
