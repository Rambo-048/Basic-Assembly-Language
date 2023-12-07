;valueAndSound.asm  --> program to create a value and sound

.MODEL
.CODE
ORG 100h

TData:	JMP Process
String DB "PROGRAM TO CREATE A VALUE", 13,10           ;13,10 ==> New Line/Enter
       DB "---------------------------------", 13,10
       DB "Nilai: ", 13,10
       DB "A,B,C,D,E", 13,10
       DB "Insert Value Here (A/B/C/D/E) :  $"
    
StringA DB 13,10,"That's Good!! Nice $"
StringB DB 13,10,"Good!! Fantastic $"
StringC DB 13,10,"Not Bad!! I Got Supplies $"
StringD DB 13,10,"Bad!! Whoopssyy $"
StringE DB 13,10,"Poor!! Request Back up $"

Compare:
	CMP AL, "A"
	JE NilaiA
	CMP AL, "a"
	JE NilaiA
	CMP AL, "B"
	JE NilaiB
	CMP AL, "b"
	JE NilaiB
	CMP AL, "C"
	JE NilaiC
	CMP AL, "c"
	JE NilaiC
	CMP AL, "D"
	JE NilaiD
	CMP AL, "d"
	JE NilaiD
	CMP AL, "E"
	JE NilaiE
	CMP AL, "e"
	JE NilaiE
	CMP AL, "Q'
	JE Quit
Quit:
	INT 20h
	
ValueA: 
	JMP FunctionA
ValueB: 
	JMP FunctionB
ValueC: 
	JMP FunctionC
ValueD: 
	JMP FunctionD
ValueE: 
	JMP FunctionE
		
	
FunctionA:
	    MOV AH, 09h
 	    LEA DX, KalA
	    INT 21h
	    PCsound 1000	;Frekuensi 1000Hz
	    MOV AH, 00
	    INT 16h		;Read Key
	    NoPCsound		;Turn Off Sound
	    JMP Process
FunctionB:
	    MOV AH, 09h
	    LEA DX, StringB
	    INT 21h
	    PCsound 750		;Frekuensi 750Hz
	    MOV AH, 00
	    INT 16h		;Read Key
	    NoPCsound		;Turn Off Sound
	    JMP Process
FunctionC:
	    MOV AH, 09h
	    LEA DX, StringC
	    INT 21h
	    PCsound 500		;Frekuensi 500Hz
	    MOV AH,00
	    INT 16h		;Read Key
	    NoPCsound		;Turn Off Sound
	    JMP Process
FunctionD:
	    MOV AH, 09h
	    LEA DX, StringD
	    INT 21h
	    PCsound 350		;Frekuensi 350Hz
	    MOV AH, 00
	    INT 16h		;Read Key
	    NoPCsound		;Turn Off Sound
	    JMP Process
FunctionE:
	    MOV AH, 09h
	    LEA DX, StringE
	    INT 21h
	    PCsound 100		;Frekuensi 100Hz
	    MOV AH, 00
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

END         TData
