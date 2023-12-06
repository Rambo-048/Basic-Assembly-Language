section .data
	text db "A", 10

section .text
	global _start

_start:
	MOV RAX, 1           ; system call for write
	MOV RDI, 1           ; file handle 1 is stdout
	MOV RSI, text        ; address of string to output
	MOV RDX, 5           ; number of bytes
	syscall
	
	MOV RAX, 60          ; system call for exit
	MOV RDI, 0           ; exit code 0
	syscall              ; invoke operating system to exit
