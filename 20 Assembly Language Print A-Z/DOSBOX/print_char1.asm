;print_char.asm - Print ASCII Character 
;CREATE AND COMPILE USE DOSBOX


.MODEL
.CODE
ORG 100h

Process:
	   MOV AH,02h               ;value service
	   MOV DL,'A'               ;DL = char 'A' atau DL = 41h
	   MOV CX,10h               ;total Loop (print A - P)

Data_Loop:
	   INT 21h                  ;Print Character
	   INC DL                   ;INC = DL + 1 (Increment)
	   LOOP Data_Loop           ;Jump to Loop
	   INT 20h                  ;Exit
	
END        Process


;INT --> Interupt

