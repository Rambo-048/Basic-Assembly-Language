;String.asm  ---> print String with INT(interupt) 21h and service 09h
;DB ==> DEFINE BYTE

.MODEL SMALL
.CODE
ORG 100h

Proses:
TData: JMP Process
String0 DB 'PROCESS PRINT STRING',13,10,'$'
String1 DB 'GOOD MORNING',13,10,'$'
String2 DB 'BEHIND SIGNED $ STRING CANNOT PRINT',13,10,'$'

Process:
	MOV AH,09h		;Service Value -> 9
	MOV DX,OFFSET String0	;Take Address Offset from String0	
	INT 21h			;Print character --> signed $
	LEA DX,String1		;Take Address Offset from String1
	INT 21h			;Print String0
	LEA DX,String2		;Take Address Offset from String2
	INT 21h			;Print Behind $ Signed
	INT 20h			;exit
	
END	TData
	
		


