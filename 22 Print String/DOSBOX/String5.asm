;String.asm  ---> print String with INT(interupt) 21h and service 09h
;DB ==> DEFINE BYTE

.MODEL SMALL
.CODE
ORG 100h

Process:
TData: JMP Process
String0 DB 'TO BE A LITTLE BETTER, TRY A LITTLE HARDER',13,10,'$'
String1 DB 'SOMETIMES THE QUESTIONS ARE COMPLICATED $ AND THE ANSWERS ARE SIMPLE',13,10,'$'

Process:
	MOV AH,09h		;Service Value -> 9
	MOV DX,OFFSET String0	;Take Address Offset from String0	
	INT 21h			;Print character --> signed $
	LEA DX,String1		;Take Address Offset from String2
	INT 21h			;Print Behind $ Signed
	INT 20h			;exit
	
END	TData
