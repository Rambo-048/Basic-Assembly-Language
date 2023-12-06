;Char.asm --> PRINT CHAR (.COM)
;CREATE AND COMPILE USE DOSBOX

.MODEL                                   ;TINY,SMALL,LARGE,HUGE
.CODE
ORG 100h

Process:                                ;label or address
	 MOV AX,02h                     ;value Service for print char
	 MOV DL,'A'                     ;DL = print char ASCII
	 INT 21h                        ;print char
	 INT 20h                        ;EXIT, return to DOS
END      Process

