;create_program3.asm  --> program to create a value

.MODEL SMALL
.CODE
ORG 100h

DataString:	JMP Process

String DB "PROGRAM TO CREATE STRING",13,10           ;13,10 ==> New Line/Enter
       DB "---------------------------------",13,10
       DB "VALUE: ",13,10
       DB "1,2,3,4,5",13,10
       DB "PRESS Q TO QUIT PROGRAM",13,10
       DB "Choose Value (1/2/3/4/5) :  $" 
    
String_1 DB 13,10,"Not Good!! $"
String_2 DB 13,10,"Good!! Wonderfull $"
String_3 DB 13,10,"Bad!! Whoopssyy $"
String_4 DB 13,10,"Not Bad!! I Got Supplies $"
String_5 DB 13,10,"Thats Good!! Nice $"

Compare:
	CMP AL,"1"
	JE VALUE_1
	
	CMP AL,"2"
	JE VALUE_2
	
	CMP AL,"3"
	JE VALUE_3
	
	CMP AL,"4"
	JE VALUE_4
	
	CMP AL,"5"
	JE VALUE_5
	
	CMP AL,"Q'
	JE Quit
	
Quit:
	INT 20h
	
VALUE_1: 
	JMP Function_1
VALUE_2: 
	JMP Function_2
VALUE_3: 
	JMP Function_3
VALUE_4: 
	JMP Function_4
VALUE_5: 
	JMP Function_5
	
	
Function_1:
	    MOV AH,09h
	    LEA DX,String_1
	    INT 21h
	    JMP Process
Function_2:
	    MOV AH 09h
	    LEA DX,String_2
	    INT 21h
	    JMP Process
Function_3:
	    MOV AH,09h
	    LEA DX,String_3
	    INT 21h
	    JMP Process
Function_4:
	    MOV AH,09h
	    LEA DX,String_4
	    INT 21h
	    JMP Process
Function_5:
	    MOV AH,09h
	    LEA DX,String_5
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
