;String2.asm  --->  Print String with Attribute  --> INT 10h service 13h
;DB ==> DEFINE BYTE

.MODEL SMALL
.CODE
ORG 100h

DataString: JMP Process
String0 DB 'SOMETIMES WE NEED FANTASY TO SURVIVE THE REALITY'

Process:
	MOV AX, 1300h		;Service 13h Subfunction 00
	MOV BL, 00011000b	;Attribute String
	MOV BH, 00			;PAGE SHOW 00
	MOV DL, 30			;POSITION X
	MOV DH, 15			;POSITION Y
	MOV CX, 50			;TOTAL CHARACTER IN STRING
	LEA BP, String0		;ES:BP String Address ---> PRINT STRING ADDRESS
	INT 10h				;Print String	
	INT 20h				;exit

END	DataString
	
