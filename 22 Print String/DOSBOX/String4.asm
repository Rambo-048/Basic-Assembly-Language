;String4.asm  ---> print String with INT(interupt) 21h and service 09h
;DB ==> DEFINE BYTE

.MODEL SMALL
.CODE
ORG 100h

DataString: JMP Process
String0 DB 'TO BE A LITTLE BETTER $ TRY A LITTLE HARDER',13,10,'$'
String1 DB 'STAY FOCUSED',13,10,'$'
String2 DB 'WITH A LITTLE SPIRIT AND POWER',13,10,'$'
String3 DB 'WE CAN ACHIEVE A GOOD GOALS',13,10,'$'
String4 DB 'TO BE A LITTLE BETTER $ TRY A LITTLE HARDER',13,10,'$'

Process:
	MOV AH,09h		;Service Value -> 9
	LEA DX,String0		;Take Address Offset from String0
	INT 21h			;Print Behind $ Signed
	MOV DX,OFFSET String1	;Take Address Offset from String1	
	INT 21h			;Print Behind $ Signed
	MOV DX,OFFSET String2	;Take Address Offset from String2
	INT 21h			;Print character --> signed $
	LEA DX,String3		;Take Address Offset from String3
	INT 21h			;Print character --> signed $
	LEA DX,String4		;Take Address Offset from String5
	INT 21h			;Print Behind $ Signed
	INT 20h			;exit
	
END	DataString
	
		

