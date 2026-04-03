;CheckButton1.asm ---> Check Button Condition Press Or Not

.MODEL SMALL
.CODE
ORG 100h

DataString:	JMP Process
String0 DB 'PRESS ANY KEY TO EXIT OR STOP...!!!'
DB 13,10,'$'

Process:
	  MOV AH,1		;Service for check buffer keyboard
	  INT 16h		;Run Program
	  JNZ Exit		;If Button Press, Jump to Exit
	  MOV AH,09		;SERVICE PRINT STRING
	  LEA DX,String0	;Take Data from String0
	  INT 21h		;Print String
	  JMP Process		;Jump to Process
	  
Exit:	  INT 20h		;Exit

END       DataString
