global strToInt

section .text

;rsi bekommt Wert von Basis
;rdi bekommt den String

cmp rsi, 2 		; vergleicht Eingabewert rsi Basis mit 2
jl falsche_eingabe 	; wenn kleiner dann spring zu falsche_eingabe
cmp rsi, 36 		; check ob größer 36
JG falsche_eingabe	; wenn größer 36 dann 

mov r8, 0		; r11 = counter
mov rax, 0		; Ergebnis nach rax
mov rcx, 0		; Zwischenspeicher

mov cl, [rdi + r8]	
cmp rcx, 45 		;vergleicht rcx mit Zeichen 45 ('-')
je negativ		;wenn negativ ('-') springe zu negativ
mov r10, 0		;r10 ist negativ
jmp looop

negativ:
mov r10, 1		;Negativ ist 1
inc r11			;looop beginnt mit der ersten Zahl, wenn an erster Position ein Zeichen steht

looop: 
mov cl, [rdi + r11]	; aktueller Wert 
inc r8			; counter ++
cmp rcx, 0		; verhleicht aktuellen Wert mit 0
je return		; wenn gleich 0 dan sprig zu return


cmp rcx, 48		; vergleicht rcx mit der Ziffer 0 (48- ASCII- Tabelle)
jl falsche_eingabe	; Wert ist kleiner als 0 dann springe zu falsche_eingabe
cmp rcx, 57		; checkt rcx 57 Zahl 9 ASCII 57
jle zahl		; wenn rcx <= 9 dann spring zu Zahl			

cmp rcx, 65		; vergleicht rcx mit A (ASCII 65)
jl falsche_eingabe	; wenn kleiner dann Abbruch, weil keine großer Buchstabe und keine Zahl/ also Sonderzeichen
CMP rcx, 90		;
jle grossBuchstabe	; der Wert ist ein Großbuchstabe 

zahl: 			
sub rcx, 48		; al hat den aktuellen Wert der Zahl
jmp zaehler		; springe zu zaehler

grossBuchstabe:		;ASCII-Zeichen ist ein Großbuchstabe
sub rcx, 55		;al = aktuelle Wert für Großbuchstabe

zaehler: 		
cmp rcx, rsi		; Vergleich cl mit Basis
jg falsche_eingabe	; springt zu falsche_eingabe weil größer als Basis
mul rsi			; rax*10

add rax, rcx 		;rax + rcx
jmp looop		

return: 		; Abbruchbedingung
cmp r10, -1		; Zahl ist negativ
je negativerWert	; wenn gleich dann springe zu
ret

negativerWert:
neg rax 
ret


falsche_eingabe: 	; Falscher Zahlenwert
mov rax, -1		; Fehler angezeigt durch -1
ret
