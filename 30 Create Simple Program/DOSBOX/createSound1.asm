;createSound1.asm

NoPCsound MACRO
IN AL,61h	;Take Data from Port 61h
AND AL,0FCh	;1111 1100, Turn Off bit 0 and 1
OUT 61h,AL	;Insert Value on Port 61h
ENDM

PCSound Macro Hz
MOV AL,0B6h	;Control World Timer
OUT 43h,AL	;Address PIT Control

MOV DX,0012h
MOV AX,3540h	;Share 123540h with Frekuensi
MOV BX,Hz	;result
DIV BX		;<123540:Hz> result to AX

OUT 42h,AL	;Insert Low byte AX First
MOV AL,AH	;Port From AL/AX
OUT 42h,AL	;Insert High Byte
IN AL,61h	;Take Data from port 61h <Speaker>
OR AL,03	;0000 0011, Change Bit 0 to 1 and 0 to 1
OUT 61h,AL	;Turn On Speaker
ENDM


;program to create a value and sound

.MODEL SMALL
.CODE
ORG 100h

DataString:	JMP Process
String DB "PROGRAM TO CREATE STRING", 13,10           ;13,10 ==> New Line/Enter
       DB "---------------------------------", 13,10
       DB "VALUE: ", 13,10
       DB "1,2,3,4,5,6,7", 13,10
       DB "Choose Value (1/2/3/4/5/6/7) :  $"
    
String_1 DB 13,10,"SOMETIMES THE QUESTIONS ARE COMPLICATED, AND THE ANSWERS ARE SIMPLE $"
String_2 DB 13,10,"YOU DONT HAVE TO BE PERFECT, YOU JUST HAVE TO BE BETTER THAN THE LAST TIME $"
String_3 DB 13,10,"SOMETIMES WE NEED FANTASY TO SURVIVE THE REALITY $"
String_4 DB 13,10,"NEVER GIVE UP, BECAUSE GREAT THINGS TAKE TIME $"
String_5 DB 13,10,"SOMETIMES IT IS BETTER TO STAY SILENT AND SMILE $"
String_6 DB 13,10,"BELIEVE IN YOURSELF AND YOU WILL ACHIVE GREATNESS $"
String_7 DB 13,10,"THE ONLY THING THAT OVERCOMES HARD LUCK IS HARD WORK $"


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
	
	CMP AL,"6"
	JE VALUE_6
	
	CMP AL,"7"
	JE VALUE_7
	
	CMP AL, "Q'
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
VALUE_6: 
	JMP Function_6
VALUE_7: 
	JMP Function_7
		
	
Function_1:
	    MOV AH,09h
 	    LEA DX,String_1
	    INT 21h
	    PCsound 1000	;Frekuensi 1000Hz
	    MOV AH,00
	    INT 16h		;Read Key
	    NoPCsound		;Turn Off Sound
	    JMP Process
	    
Function_2:
	    MOV AH,09h
	    LEA DX,String_2
	    INT 21h
	    PCsound 750		;Frekuensi 750Hz
	    MOV AH,00
	    INT 16h		;Read Key
	    NoPCsound		;Turn Off Sound
	    JMP Process
	    
Function_3:
	    MOV AH,09h
	    LEA DX,String_3
	    INT 21h
	    PCsound 500		;Frekuensi 500Hz
	    MOV AH,00
	    INT 16h		;Read Key
	    NoPCsound		;Turn Off Sound
	    JMP Process
	    
Function_4:
	    MOV AH,09h
	    LEA DX,String_4
	    INT 21h
	    PCsound 350		;Frekuensi 350Hz
	    MOV AH,00
	    INT 16h		;Read Key
	    NoPCsound		;Turn Off Sound
	    JMP Process
	    
Function_5:
	    MOV AH,09h
	    LEA DX,String_5
	    INT 21h
	    PCsound 250		;Frekuensi 250Hz
	    MOV AH,00
	    INT 16h		;Read Key
	    NoPCsound		;Turn Off Sound
	    JMP Process

Function_6:
	    MOV AH,09h
	    LEA DX,String_6
	    INT 21h
	    PCsound 100		;Frekuensi 100Hz
	    MOV AH,00
	    INT 16h		;Read Key
	    NoPCsound		;Turn Off Sound
	    JMP Process

Function_7:
	    MOV AH,09h
	    LEA DX,String_7
	    INT 21h
	    PCsound 100		;Frekuensi 100Hz
	    MOV AH,00
	    INT 16h		;Read Key
	    NoPCsound		;Turn Off Sound
	    JMP Process
	
Process:
	    MOV AH,09h		;Service for print string
	    LEA DX,String	;Call String
	    INT 21h		;Print String	
	    MOV AH,01h		;Service for write character
	    INT 21h		;print character (Output)
	    JMP Compare		;Jump to Compare
	
Exit:
	    INT 20h		;EXIT

END         DataString
