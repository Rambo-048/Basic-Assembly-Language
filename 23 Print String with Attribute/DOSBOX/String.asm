;String.asm  --->  Print String with Attribute  --> INT 10h service 13h
;DB ==> DEFINE BYTE

.MODEL SMALL
.CODE
ORG 100h

Process:
TData: JMP Process
String0 DB 'Write String with Attribute'

Process:
	MOV AX, 1300h		;Service 13h Subfunction 00
	MOV BL, 11011011b	;Attribute String
	MOV BH, 00		;PAGE SHOW 00
	MOV DL, 20		;POSITION X
	MOV DH, 10		;POSITION Y
	MOV CX, 35		;TOTAL CHARACTER IN STRING
	LEA BP, String0		;ES:BP String Address ---> PRINT STRING ADDRESS
	INT 10h			;Print String	
	INT 20h			;exit

END	TData
	
		


