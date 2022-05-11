.dseg                ; prepnuti do pameti dat 1
.org 0x100           ; od adresy 0x100 (adresy 0 - 0x100 nepouzivejte)

flag: .byte 1        ; rezervovani mista pro 1 bajt

.cseg                ; prepnuti do pameti programu
; definice pro nas typ procesoru
.include "m169def.inc"
; podprogramy pro praci s displejem
.org 0x1000
.include "print.inc"

; Zacatek programu - po resetu
.org 0
jmp	start
.org 0xA             ; 2
jmp interrupt

.org 0x100
signs:  .db "ABCDE", 0
begin:  .db "START", 0
winner: .db "WINNER", 0
loser:  .db "LOSER", 0

start:
    ; Inicializace zasobniku
    ldi r16, 0xFF
    out SPL, r16
    ldi r16, 0x04
    out SPH, r16
    ; Inicializace displeje
    call init_disp
    ; Inicializace preruseni od casovace
    call init_int
    call init_joy

    ldi r16, 0       ; 3
    sts flag, r16

    ldi r17, 2
    ldi r16, '0'

; ====================================================================

beginning:
    ldi r30, low(2*begin)
    ldi r31, high(2*begin)

    lpm r16, Z+
    ldi r17, 2

    call print

pressing:
    call read_joy
    cpi r20, 1
    brne pressing

unpressing:
    call read_joy
    cpi r20, 0
    brne unpressing
    call clean_display


signs_reset:
    ldi r30, low(2*signs)
    ldi r31, high(2*signs)
    ldi r17, 2
    lpm r16, Z+

rotating:
    cpi r16, 0
    breq signs_reset
    call print_signs

    call read_joy
    cpi r20, 1
    breq stop2

    jmp rotating

print_signs:
    ldi r17, 2
    call show_char
    ldi r17, 4
    call show_char
    ldi r17, 6
    call show_char
    lpm r16, Z+
    call preruseni
    ret

clean_display:
    ldi r17, 2
    ldi r16, ' '
    call show_char
    inc r17
    call show_char
    inc r17
    call show_char
    inc r17
    call show_char
    inc r17
    call show_char
    inc r17
    call show_char
    ret

stop2:
    mov r22, r16 ; ulozeny znak

unpressing2:
    call read_joy
    cpi r20, 0
    brne unpressing2
    call preruseni

print2:
    jmp rotating2

signs_reset2:
    ldi r30, low(2*signs)
    ldi r31, high(2*signs)
    ldi r17, 2
    lpm r16, Z+

rotating2:
    cpi r16, 0
    breq signs_reset2
    call print_signs2

    call read_joy
    cpi r20, 1
    breq stop3

    jmp rotating2

print_signs2:
    ldi r17, 4
    call show_char
    ldi r17, 6
    call show_char
    lpm r16, Z+
    call preruseni
    ret

stop3:
    mov r23, r16 ; ulozeny znak

unpressing3:
    call read_joy
    cpi r20, 0
    brne unpressing3
    call preruseni

print3:
    jmp rotating3

signs_reset3:
    ldi r30, low(2*signs)
    ldi r31, high(2*signs)
    ldi r17, 2
    lpm r16, Z+

rotating3:
    cpi r16, 0
    breq signs_reset3
    call print_signs3

    call read_joy
    cpi r20, 1
    breq stop4

    jmp rotating3

print_signs3:
    ldi r17, 6
    call show_char
    lpm r16, Z+
    call preruseni
    ret

ladder1:
	jmp beginning

stop4:
    mov r24, r16

unpressing4:
    call read_joy
    cpi r20, 0
    brne unpressing4
    call preruseni

finish:
    call clean_display
    cp r22, r23
    brne print_loser
    cp r23, r24
    brne print_loser
	jmp print_winner

print_winner:
    ldi r30, low(2*winner)
    ldi r31, high(2*winner)
	lpm r16, Z+
    ldi r17, 2
    call print
    call preruseni
    call clean_display
    call preruseni
	ldi r30, low(2*winner)
    ldi r31, high(2*winner)
	lpm r16, Z+
    ldi r17, 2
    call print
    call preruseni
    call clean_display
    call preruseni
	ldi r30, low(2*winner)
    ldi r31, high(2*winner)
	lpm r16, Z+
    ldi r17, 2
    call print
    call preruseni
    jmp end

print_loser:
    ldi r30, low(2*loser)
    ldi r31, high(2*loser)
	lpm r16, Z+
    ldi r17, 2
    call print
    call preruseni
    call clean_display
    call preruseni
	ldi r30, low(2*loser)
    ldi r31, high(2*loser)
	lpm r16, Z+
    ldi r17, 2
    call print
    call preruseni
    call clean_display
    call preruseni
	ldi r30, low(2*loser)
    ldi r31, high(2*loser)
	lpm r16, Z+
    ldi r17, 2
    call print
    call preruseni
    jmp end

print:
    call show_char
    inc r17
    lpm r16, Z+
    cpi r16, 0
    brne print
    ret

preruseni:
    lds r21, flag
    cpi r21, 1
    brne preruseni
    ldi r21, 0
    sts flag, r21
    ret

end:
    jmp pressing_end

pressing_end:
    call read_joy
    cpi r20, 1
    brne pressing_end

unpressing_end:
    call read_joy
    cpi r20, 0
    brne unpressing_end
    call clean_display
    jmp ladder1

; ====================================================================
init_joy:                ; inicializace joysticku
    in r17, DDRE
    andi r17, 0b11110011
    in r16, PORTE
    ori r16, 0b00001100
    out DDRE, r17
    out PORTE, r16
    ldi r16, 0b00000000
    sts DIDR1, r16
    in r17, DDRB
    andi r17, 0b00101111
    in r16, PORTB
    ori r16, 0b11010000
    out DDRB, r17
    out PORTB, r16
ret

; joystick =============================================

read_joy:                ; ulozi smer joysticku do registru r20
    push r16             ; uklid r16 a r17
    push r17

joy_reread:
    in r16, PINB         ; nacti hodnotu joysticku 1

    ldi r20, 255         ; chvili cekej 2
joy_wait: dec r20
    brne joy_wait

    in r17, PINB         ; nacti jeste jednou

    andi r16, 0b00010000 ; vymaskuj ostatni bity 3
    andi r17, 0b00010000

    cp r16, r17
    brne joy_reread      ; hodnoty se nerovnaly -> nacti znovu

    ldi r20, 0           ; vychozi hodnota - nic neni aktivni
    cpi r16, 0
    brne joy_no_enter    ; hodnota je inverzni -> neni 0 znamena neni aktivni 4
    ldi r20, 1           ; r20 = 1, kdyz je enter aktivni
joy_no_enter:

   pop r17               ; obnoveni r16 a r17
   pop r16
ret

; preruseni ===============================================

init_int:
    cli              ; globalni zakazani preruseni
    ldi r16, 0b00001000
    sts ASSR, r16    ; vyber hodin od externiho krystaloveho oscilátoru 32768 Hz
    ldi r16, 0b00000001
    sts TIMSK2, r16  ; povoleni preruseni od casovace 2
    ldi r16, 0b00000100
    sts TCCR2A, r16  ; nastaveni deliciho pomeru 128
    clr r16
    out EIMSK, r16   ; zakazani preruseni od joysticku
    sei              ; globalni povoleni preruseni
ret


interrupt:           ; 5
    push r16
    in r16, SREG
    push r16         ; uklid SREG

    ldi  r16, 1
    sts  flag, r16   ; nastaveni flag-u

    pop r16
    out SREG, r16
    pop r16          ; obnoveni SREG
reti                 ; 6
