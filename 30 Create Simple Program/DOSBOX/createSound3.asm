;createSound3.asm

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
       DB "A,B,C,D,E,F,G", 13,10
       DB "Choose Value (A/B/C/D/E) :  $"
    
String_A DB 13,10,"EVERY PROBLEM IS A GIFT, WITHOUT THEM WE WOULDNT GROW. $"
String_B DB 13,10,"SOMETIMES EVEN TO LIVE IS AN ACT OF COURAGE $"
String_C DB 13,10,"EVEN MIRACLES NEED A LITTLE TIME $"
String_D DB 13,10,"THE ONLY WAY TO DO GREAT WORK IS TO LOVE WHAT YOU DO $"
String_E DB 13,10,"STAY HOPEFUL YOU NEVER KNOW WHAT TOMORROW MAY BRING $"
String_F DB 13,10,"THE ONLY WAY TO DO GREAT WORK IS TO LOVE WHAT YOU DO $"
String_G DB 13,10,"STAY HOPEFUL YOU NEVER KNOW WHAT TOMORROW MAY BRING $"

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
	
	CMP AL,"G"
	JE VALUE_G
	CMP AL,"g"
	JE VALUE_G
	
	CMP AL, "Q'
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
VALUE_G: 
	JMP Function_G
		
	
Function_A:
	    MOV AH,09h
 	    LEA DX,String_A
	    INT 21h
	    PCsound 8000	;Frekuensi 8000Hz
	    MOV AH,00
	    INT 16h		;Read Key
	    NoPCsound		;Turn Off Sound
	    JMP Process
	    
Function_B:
	    MOV AH,09h
	    LEA DX,String_B
	    INT 21h
	    PCsound 7000	;Frekuensi 7000Hz
	    MOV AH,00
	    INT 16h		;Read Key
	    NoPCsound		;Turn Off Sound
	    JMP Process
	    
Function_C:
	    MOV AH,09h
	    LEA DX,String_C
	    INT 21h
	    PCsound 6000	;Frekuensi 6000Hz
	    MOV AH,00
	    INT 16h		;Read Key
	    NoPCsound		;Turn Off Sound
	    JMP Process
	    
Function_D:
	    MOV AH,09h
	    LEA DX,String_D
	    INT 21h
	    PCsound 5000	;Frekuensi 5000Hz
	    MOV AH,00
	    INT 16h		;Read Key
	    NoPCsound		;Turn Off Sound
	    JMP Process
	    
Function_E:
	    MOV AH,09h
	    LEA DX,String_E
	    INT 21h
	    PCsound 4000	;Frekuensi 4000Hz
	    MOV AH,00
	    INT 16h		;Read Key
	    NoPCsound		;Turn Off Sound
	    JMP Process
	    
Function_F:
	    MOV AH,09h
	    LEA DX,String_F
	    INT 21h
	    PCsound 3000	;Frekuensi 3000Hz
	    MOV AH,00
	    INT 16h		;Read Key
	    NoPCsound		;Turn Off Sound
	    JMP Process
	    
Function_G:
	    MOV AH,09h
	    LEA DX,String_G
	    INT 21h
	    PCsound 2000	;Frekuensi 2000Hz
	    MOV AH,00
	    INT 16h		;Read Key
	    NoPCsound		;Turn Off Sound
	    JMP Process
	
Process:
	    MOV AH, 09h		;Service for print string
	    LEA DX, String	;Call String
	    INT 21h		;Print String	
	    MOV AH, 01h		;Service for write character
	    INT 21h		;print character (Output)
	    JMP Compare		;Jump to Compare
	
Exit:
	    INT 20h		;EXIT

END         DataString
