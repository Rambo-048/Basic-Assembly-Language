;print_char.asm --> print char use ASCII code

.MODEL
.CODE
ORG 100h
Process:
	   MOV AH,02h		;Service Value
	   MOV DL,'A'		;DL=41h
	   MOV CX,30		;Total Loop
	   
Data_Loop:
	   INT 21h		;Print Character
	   DEC DL               ;DEC=DL-1
	   LOOP Data_Loop       ;Jump to Loop
	   
END        Process

