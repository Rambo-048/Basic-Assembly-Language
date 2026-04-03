;printChar1.asm --> Print Char INT 21h Service 02h

.MODEL SMALL
.CODE
ORG 100h

DataString : JMP Process

Process:
	;PRINT CHAR
	MOV AH,02h	;Service 02h for print char
	MOV DL,'Z'	;INSERT CHAR TO DL
	INT 21h		;PRINT CHAR
	
	;CREATE NEW LINE
	MOV DL,0Dh	;Carriage Return (CR)
	INT 21h		
	MOV DL,0Ah	;Line Feed (LF)
	INT 21h	
	
	;PRINT CHAR
	MOV AH,02h	;Service 02h for print char
	MOV DL,'?'	;INSERT CHAR TO DL
	INT 21h		;PRINT CHAR
	
	;CREATE NEW LINE
	MOV DL,0Dh	;Carriage Return (CR)
	INT 21h		
	MOV DL,0Ah	;Line Feed (LF)
	INT 21h		
	
	;PRINT CHAR FROM ASCII
	MOV DL,88	;INSERT ASCII CHAR TO DL
	INT 21h		;PRINT CHAR
	
	;CREATE NEW LINE
	MOV DL,0Dh	;Carriage Return (CR)
	INT 21h		
	MOV DL,0Ah	;Line Feed (LF)
	INT 21h	
	
	;PRINT CHAR FROM ASCII
	MOV DL,185	;INSERT ASCII CHAR TO DL
	INT 21h		;PRINT CHAR

Exit:
	INT 20h

END	DataString
	
