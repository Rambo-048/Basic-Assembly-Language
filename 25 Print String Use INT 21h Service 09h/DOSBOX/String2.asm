;String.asm --> Print String ---> INT 21h Service 09h
;DB ==> DEFINE BYTE

.MODEL
.CODE
ORG 100h

TData: JMP Process
String DB 'A B C D E $'
Change DB 13,10,'$'
Stacks DW

Process:
	 LEA DW, String		;BX=0
	 PUSH DX
	 MOV AH, 09		;Service for print Character
	 INT 21h
	 LEA DX, Change
	 INT 21h
	 POP DX
	 INT 21h
	 
Exit:	 INT 20h		;Exit

END      TData
