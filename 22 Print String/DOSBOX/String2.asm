;String2.asm  ---> print String with INT(interupt) 21h and service 09h
;DB ==> DEFINE BYTE

.MODEL SMALL
.CODE
ORG 100h

DataString: JMP Process
String0 DB 'SHOW THE STRING $ CANNOT SHOW THE STRING',13,10,'$'

Process:
	MOV AH,09h		;Service Value -> 9
	LEA DX,String0		;Take Address Offset from String0
	INT 21h			;Print Behind $ Signed
	INT 20h			;exit
	
END	DataString
	
		

