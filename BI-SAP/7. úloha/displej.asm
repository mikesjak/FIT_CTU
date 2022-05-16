; definice pro nas typ procesoru
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

	; *** ZDE muzeme psat nase instrukce
	ldi r16, 'J'	; znak
	ldi r17, 2      ; pozice (zacinaji od 2)
	call show_char  ; zobraz znak

	; *** ZDE muzeme psat nase instrukce
	ldi r16, 'A'	; znak
	ldi r17, 3      ; pozice (zacinaji od 2)
	call show_char  ; zobraz znak

	; *** ZDE muzeme psat nase instrukce
	ldi r16, 'K'	; znak
	ldi r17, 4      ; pozice (zacinaji od 2)
	call show_char  ; zobraz znak

	; *** ZDE muzeme psat nase instrukce
	ldi r16, 'U'	; znak
	ldi r17, 5      ; pozice (zacinaji od 2)
	call show_char  ; zobraz znak

	; *** ZDE muzeme psat nase instrukce
	ldi r16, 'B'	; znak
	ldi r17, 6      ; pozice (zacinaji od 2)
	call show_char  ; zobraz znak

end: jmp end        ; Zastavime program - nekonecna smycka
