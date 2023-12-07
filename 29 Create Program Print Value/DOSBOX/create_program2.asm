;create_program.asm  --> program to create a value

.MODEL
.CODE
ORG 100h

TData:	JMP Process
String DB "PROGRAM TO CREATE A VALUE", 13,10           ;13,10 ==> New Line/Enter
       DB "---------------------------------", 13,10
       DB "Nilai: ", 13,10
       DB "A,B,C,D,E", 13,10
       DB "Insert Value Here (A/B/C/D/E) :  $"
    
String_A DB 13,10,"That's Good..!! Nice $"

Compare:
	    CMP AL,"A"
	    JE Value_A
	    CMP AL,"a"
	    JE Value_A
	
Value_A: 
	    JMP Function_A

Function_A:
	    MOV AH, 09h
	    LEA DX, String_A
	    INT 21h
	    JMP Process
	
Process:
	    MOV AH, 09h		;Service for print string
	    LEA DX, String	;Call String
	    INT 21h		;Print String
	
	    MOV AH, 01h		;Service for write character
	    INT 21h		;print character (Output)
	
Exit:
	    INT 20h		;EXIT

END	    TData
