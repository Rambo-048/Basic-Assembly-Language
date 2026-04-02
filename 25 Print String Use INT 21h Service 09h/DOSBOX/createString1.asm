;creatString1.asm --> Print String ---> INT 21h Service 09h

.MODEL SMALL
.CODE
ORG 100h

DataString: JMP Process
String DB 'EVEN MIRACLES NEED A LITTLE TIME $'
Change DB 13,10,'$'
Stacks DW

Process:
	 LEA DX,String		;BX=0
	 PUSH DX
	 MOV AH,09		;Service 09h for print Character
	 INT 21h
	
Exit:	 INT 20h		;Exit

END      DataString
