;createString3.asm --> Print String 1 ---> INT 21h Service 02h
;DB ==> DEFINE BYTE

.MODEL SMALL
.CODE
ORG 100h

DataString: JMP Process
String DB 'WITHOUT A STRUGGLE THERE CAN BE NO PROGRESS',13,10
DB 'STAY HOPEFUL YOU NEVER KNOW WHAT TOMORROW MAY BRING',7,7,'*'

Process:
	   XOR BX,BX			;BX=0
	   MOV AH,02h			;Service 02h for print string
	
Data_Loop:
	   CMP String[BX],'*'		;COMPARE with '*'
	   JE Exit			;if Condition same jump to step EXIT
	   MOV DL,String[BX]		;INSERT STRING IN BX TO DL
	   INT 21h			;Print STRING
	   INC BX			;INC=BX+1
	   JMP Data_Loop		;Jump to Step Data_Loop

Exit:	   INT 20h			;Exit

END        DataString
