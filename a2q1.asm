;
; a2q1.asm
;
; Write a program that displays the binary value in r16
; on the LEDs.
;
; See the assignment PDF for details on the pin numbers and ports.
;


		ldi r16, 0xFF
		out DDRB, r16		; PORTB all output
		sts DDRL, r16		; PORTL all output

		ldi r16, 0x33		; display the value
		mov r0, r16			; in r0 on the LEDs

; Your code here
		clr r18 ;for L
		clr r19 ;for B
		mov r17, r0
		ANDI r17, 0b000001 
		brne turn_on_pin42
	one_is_on:
		mov r17, r0
		ANDI r17, 0b000010
		brne turn_on_pin44
	two_is_on:
		mov r17, r0
		ANDI r17, 0b000100
		brne turn_on_pin46
	three_is_on:
		mov r17, r0
		ANDI r17, 0b001000
		brne turn_on_pin48
	four_is_on:
		mov r17, r0
		ANDI r17, 0b010000
		brne turn_on_pin50
	five_is_on:
		mov r17, r0
		ANDI r17, 0b100000
		brne turn_on_pin52
	six_is_on:
		sts PORTL, r18
		out PORTB, r19
		jmp done



		

turn_on_pin42:
	ori r18, 0b10000000
	jmp one_is_on

turn_on_pin44:
	ori r18, 0b00100000
	jmp two_is_on
	
turn_on_pin46:
	ori r18, 0b00001000
	jmp three_is_on

turn_on_pin48:
	ori r18, 0b00000010
	jmp four_is_on

turn_on_pin50:
	ori r19, 0b00001000
	jmp five_is_on

turn_on_pin52:
	ori r19, 0b00000010
	jmp six_is_on


;
; Don't change anything below here
;
done:	jmp done
