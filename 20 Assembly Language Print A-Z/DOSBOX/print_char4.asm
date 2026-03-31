;print_char.asm - Print ASCII Character 
;CREATE AND COMPILE USE DOSBOX


.MODEL
.CODE
ORG 100h

Process:
	   MOV AH,02h               ;value service
	   MOV DL,'0'               ;DL = char '0' atau DL = 30h
	   MOV CX,2Ah               ;total Loop (print 0 - Y)

Data_Loop:
	   INT 21h                  ;Print Character
	   INC DL                   ;INC = DL + 1 (Increment)
	   LOOP Data_Loop           ;Jump to Loop
	   INT 20h                  ;Exit
	
END        Process


;INT --> Interupt
