;
; a2q2.asm
;
;
; Turn the code you wrote in a2q1.asm into a subroutine
; and then use that subroutine with the delay subroutine
; to have the LEDs count up in binary.

		ldi r16, 0xFF
		out DDRB, r16		; PORTB all output
		sts DDRL, r16		; PORTL all output

; Your code here
; Be sure that your code is an infite loop
		ldi r16, 0 ;set r16 to be the counter
		ldi r20, 0x40

	loop:
		; if r16 = 1 display 1
		;r16 = 2 display 2
		;keep going until r16 = 64 then reset
		;so we just need to display the value of r16 then incriment it
		inc r16
		call display
		call delay
		andi r16, 0b00111111
		breq reset
		jmp loop
		reset:
			ldi r16, 0x00
			jmp loop 









done:		jmp done	; if you get here, you're doing it wrong

;
; display
; 
; display the value in r0 on the 6 bit LED strip
;
; registers used:
;	r0 - value to display
;
display:
		clr r18 ;for L
		clr r19 ;for B
		mov r17, r16
		ANDI r17, 0b000001 
		brne turn_on_pin42
	one_is_on:
		mov r17, r16
		ANDI r17, 0b000010
		brne turn_on_pin44
	two_is_on:
		mov r17, r16
		ANDI r17, 0b000100
		brne turn_on_pin46
	three_is_on:
		mov r17, r16
		ANDI r17, 0b001000
		brne turn_on_pin48
	four_is_on:
		mov r17, r16
		ANDI r17, 0b010000
		brne turn_on_pin50
	five_is_on:
		mov r17, r16
		ANDI r17, 0b100000
		brne turn_on_pin52
	six_is_on:
		sts PORTL, r18
		out PORTB, r19
		ret

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
; delay
;?20 =19
; set r20 before calling this function
; r20 = 0x40 is approximately 1 second delay
;
; registers used:
;	r20
;	r21
;	r22
;
delay:	
del1:	nop
		ldi r21,0xFF
del2:	nop
		ldi r22, 0xFF
del3:	nop
		dec r22
		brne del3
		dec r21
		brne del2
		dec r20
		brne del1	
		ret
