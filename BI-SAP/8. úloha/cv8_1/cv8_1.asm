.; definice pro nas typ procesoru
.include "m169def.inc"
; podprogramy pro praci s displejem
.org 0x1000
.include "print.inc"

; Zacatek programu - po resetu
.org 0
jmp start

.org 0x100
start:	LDI R16, 5
		LDI R17, 10
		LDI R18, 58

		lsl R16
		brvs error
		lsl R16
		brvs error
		mov R20, R16

		add R20, R17
		brvs error
		lsl R17
		brvs error
		add R20, R17
		brvs error

		sub R20, R18
		brvs error

		asr R20
		brcs error
		asr R20
		brcs error
		asr R20
		brcs error

end:    rjmp end

error:  
	; Inicializace zasobniku
	ldi r16, 0xFF
	out SPL, r16
	ldi r16, 0x04
	out SPH, r16
    ; Inicializace displeje
	call init_disp

	; *** ZDE muzeme psat nase instrukce
	ldi r16, 'E'	
	ldi r17, 2      
	call show_char  
	
	ldi r16, 'R'
	ldi r17, 3
	call show_char

	ldi r16, 'R'
	ldi r17, 4
	call show_char

	ldi r16, 'O'
	ldi r17, 5
	call show_char
	
	ldi r16, 'R'
	ldi r17, 6
	call show_char		
