;; definice pro nas typ procesoru
.include "m169def.inc"
; podprogramy pro praci s displejem
.org 0x1000
.include "print.inc"

; Zacatek programu - po resetu
.org 0
jmp start

; Zacatek programu - hlavni program
.org 0x100
start:
    ; Inicializace zasobniku
	ldi r16, 0xFF
	out SPL, r16
	ldi r16, 0x04
	out SPH, r16
    ; Inicializace displeje
	call init_disp

	ldi r26, 0xC5
	ldi r22, 0x41 ; 65
	ldi r23, 0x30 ; 48
	ldi r24, 0x01
	ldi r17, 0x02 ; pozice na displeji

	mov r20, r26
	mov r21, r26

	asr r20
	asr r20
	asr r20
	asr r20

	andi r20, 0x0F
	andi r21, 0x0F
	
hex_to_char:
	cpi r20, 0x0A
	brlo number
	cpi r20, 0x0A
	brge letter

letter:
	subi r20, 0x0A
	add r20, r22
	jmp show_letter
	
number:
	add r20, r23
	jmp show_letter

show_letter:
	mov r16, r20
	call show_char
	add r17, r24
	cpi r17, 0x03
	breq next_digit
	brsh end

next_digit:
	mov r20, r21
	jmp hex_to_char

end: jmp end
