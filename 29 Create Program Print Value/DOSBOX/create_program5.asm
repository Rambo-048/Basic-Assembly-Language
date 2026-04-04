;create_program3.asm  --> program to create a value

.MODEL SMALL
.CODE
ORG 100h

DataString:	JMP Process

String DB "PROGRAM TO CREATE STRING", 13,10           ;13,10 ==> New Line/Enter
       DB "---------------------------------", 13,10
       DB "VALUE: ", 13,10
       DB "A,B,C,D,E,F", 13,10
       DB "PRESS Q TO QUIT PROGRAM", 13,10
       DB "Choose Value (A/B/C/D/E/F) :  $"
    
String_A DB 13,10,"WITHOUT A STRUGGLE THERE CAN BE NO PROGRESS $"
String_B DB 13,10,"IT IS NEVER TOO LATE TO BE BETTER $"
String_C DB 13,10,"STAY HOPEFUL YOU NEVER KNOW WHAT TOMORROW MAY BRING $"
String_D DB 13,10,"LEAVE A LITTLE MAGIC, WHEREVER YOU GO $"
String_E DB 13,10,"EVEN MIRACLES NEED A LITTLE TIME $"
String_F DB 13,10,"THE ONLY WAY TO DO GREAT WORK IS TO LOVE WHAT YOU DO $"

Compare:
	CMP AL,"A"
	JE VALUE_A
	CMP AL,"a"
	JE VALUE_A
	
	CMP AL,"B"
	JE VALUE_B
	CMP AL,"b"
	JE VALUE_B
	
	CMP AL,"C"
	JE VALUE_C
	CMP AL,"c"
	JE VALUE_C
	
	CMP AL,"D"
	JE VALUE_D
	CMP AL,"d"
	JE VALUE_D
	
	CMP AL,"E"
	JE VALUE_E
	CMP AL,"e"
	JE VALUE_E
	
	CMP AL,"F"
	JE VALUE_F
	CMP AL,"f"
	JE VALUE_F
	
	CMP AL,"Q'
	JE Quit
	
Quit:
	INT 20h
	
VALUE_A: 
	JMP Function_A
VALUE_B: 
	JMP Function_B
VALUE_C: 
	JMP Function_C
VALUE_D: 
	JMP Function_D
VALUE_E: 
	JMP Function_E
VALUE_F: 
	JMP Function_F
	
	
Function_A:
	    MOV AH,09h
	    LEA DX,String_A
	    INT 21h
	    JMP Process
Function_B:
	    MOV AH 09h
	    LEA DX,String_B
	    INT 21h
	    JMP Process
Function_C:
	    MOV AH,09h
	    LEA DX,String_C
	    INT 21h
	    JMP Process
Function_D:
	    MOV AH,09h
	    LEA DX,String_D
	    INT 21h
	    JMP Process
Function_E:
	    MOV AH,09h
	    LEA DX,String_E
	    INT 21h
	    JMP Process
Function_F:
	    MOV AH,09h
	    LEA DX,String_F
	    INT 21h
	    JMP Process
	
Process:
	    MOV AH,09h		;Service for print string
	    LEA DX,String	;Call String
	    INT 21h		;Print String
	
	    MOV AH,01h		;Service for write character
	    INT 21h		;print character (Output)
	    JMP Compare
	
Exit:
	    INT 20h		;EXIT

END	    DataString
