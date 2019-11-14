global strToInt

section .text

strToInt: 

	mov r10, 0		
	;r10 as counter
	mov rax, 0
	;rax for solution		
	mov rcx, 0		
	;rcx as puffer

read_loop: 
	mov cl, [rdi + r10]	
	;read 8 Bit in rxc
	inc r10			
	;increment counter
	cmp rcx, 0
	;Null?
	jne check
	ret

check:
;check ASCII
	cmp rcx, 48
	;wrong sign
	jl false		
	cmp rcx, 58
	jl number
	cmp rcx, 97
	jl false
	;wrong sign		
	cmp rcx, 122
	;character
	jle character
	jmp false 
	;wrong sign		

number: 		
	sub rcx, 48
	;ASCII to number		
	jmp calculator

character:			
	sub rcx, 87
	;ASCII to "number"


calculator: 		
	cmp rcx, rsi
	;check basis		
	jg false

honer:		
	mul rsi			
	add rax, rcx
	;mul solution and base and add new value 		
	jmp read_loop		

false: 		
	mov rax, -1
	;wrong input, return -1		 
	ret 

