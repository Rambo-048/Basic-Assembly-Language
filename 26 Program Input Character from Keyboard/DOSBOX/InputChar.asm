;input.asm --> Input One Character from Keyboard --> INT 16h Service 00h

.MODEL SMALL
.CODE
ORG 100h

TData: JMP Process
T_ASCII DB 13,10,'This is ASCII Button: $'
T_Extended DB 13,10,'This is Extended Button $'

Process:
	  MOV AH,0		;Service Input One Character
	  INT 16h		;Run Program
	  PUSH AX		;Save result on Stack
	  
	  CMP AL,00		;Check Character Condition
	  JE Extended		;If Condition TRUE, Jump to Extended
	  LEA DX,T_ASCII	;TAKE EFECTIVE ADDRESS FROM T_ASCII
	  MOV AH,09		;Service Print String
	  INT 21h		;print string
	  
	  POP AX		;TAKE BACK VALUE AX FROM STACK
	  MOV DL,AL		;TAKE ASCII CODE WE WANT TO INSERT
	  MOV AH,2		;SERVICE PRINT STRING
	  INT 21h		;PRINT STRING
	  
	  CMP AL'Q'		;CHECK CONDITION, PRESS FONT Q?
	  JE Exit		;If condition TRUE, Jump To Exit
	  CMP AL'q'		;CHECK CONDITION, PRESS FONT q?
	  JE Exit		;If condition TRUE, Jump to Exit
	  JMP Process		;Jump to Process
	  
Extended:
	  LEA DX,T_Extended	;Take Effective Address T_Extended
	  MOV AH,09		;SERVICE PRINT STRING
	  INT 21h		;PRINT STRING
	  JMP Process		;JUMP TO PROCESS

Exit:     INT 20h	
 
END       TData
	
