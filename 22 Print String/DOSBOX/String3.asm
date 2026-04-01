;String3.asm  ---> print String with INT(interupt) 21h and service 09h
;DB ==> DEFINE BYTE

.MODEL SMALL
.CODE
ORG 100h

DataString: JMP Process
String0 DB 'STAY FOCUSED',13,10,'$'
String1 DB 'WITH A LITTLE SPIRIT AND POWER',13,10,'$'
String2 DB 'WE CAN ACHIEVE A GOOD GOALS',13,10,'$'

Process:
	MOV AH,09h		;Service Value -> 9
	MOV DX,OFFSET String0	;Take Address Offset from String0
	INT 21h		        ;Print character --> signed $
	MOV DX,OFFSSET String1	;Take Address Offset from String1
	INT 21h		        ;Print character --> signed $
	LEA DX,String2		;Take Address Offset from String2
	INT 21h	                ;Print character --> signed $
	INT 20h		        ;exit

END     DataString
