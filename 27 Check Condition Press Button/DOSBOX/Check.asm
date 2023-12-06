;Check.asm ---> Check Button Condition Press Or Not

.MODEL
.CODE
ORG 100h

TData:	JMP Process
String0 DB 'Press any key to exit or stop.!'
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

END       TData
