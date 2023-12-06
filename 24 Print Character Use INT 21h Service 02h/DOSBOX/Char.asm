;Char.asm --> Print Character ---> INT 21h Service 02h
;DB ==> DEFINE BYTE

.MODEL
.CODE
ORG 100h

TData: JMP Proces
String DB 'Good Afternoon'13,10
DB 'Good Morning',7,7,'*'

Process:
	   XOR BX,BX			;BX=0
	   MOV AH,02h			;Service for print character
	
Data_Loop:
	   CMP String[BX],'*'		;COMPARE with '*'
	   JE Exit			;if Condition same jump to step EXIT
	   MOV DL,String[BX]		;INSERT CHARACTER IN BX TO DL
	   INT 21h			;Print Character
	   INC BX			;INC=BX+1
	   JMP Data_Loop		;Jump to Step Data_Loop

Exit:	   INT 20h			;Exit

END        TData
