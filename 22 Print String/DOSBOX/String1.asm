;String1.asm  ---> print String with INT(interupt) 21h and service 09h
;DB ==> DEFINE BYTE

.MODEL SMALL
.CODE
ORG 100h

DataString: JMP Process
String0 DB 'SOMETIMES THE QUESTIONS ARE COMPLICATED, AND THE ANSWERS ARE SIMPLE',13,10,'$'

Process:
	MOV AH,09h		;Service Value -> 9
	MOV DX,OFFSET String0	;Take Address Offset from String0
	INT 21h		        ;print character --> signed $
	INT 20h		        ;exit

END     DataString


	
;NOTED
;,13,10, <-- ENTER
