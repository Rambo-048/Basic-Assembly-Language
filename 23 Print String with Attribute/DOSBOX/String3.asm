;String1.asm  --->  Print String with Attribute  --> INT 10h service 13h
;DB ==> DEFINE BYTE

.MODEL SMALL
.CODE
ORG 100h

DataString: JMP Process
String0 DB 'NEVER GIVE UP, BECAUSE GREAT THINGS TAKE TIME'

Process:
	MOV AX, 1300h		;Service 13h Subfunction 00
	MOV BL, 10011010b	;Attribute String
	MOV BH, 00		;PAGE SHOW 00
	MOV DL, 40		;POSITION X
	MOV DH, 20		;POSITION Y
	MOV CX, 50		;TOTAL CHARACTER IN STRING
	LEA BP, String0		;ES:BP String Address ---> PRINT STRING ADDRESS
	INT 10h			;Print String	
	INT 20h			;exit

END	DataString
	
