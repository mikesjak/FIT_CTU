.cseg ; nasledujici umistit do pameti programu (implicitni)
; definice pro nas typ procesoru
.include "m169def.inc"
; podprogramy pro praci s displejem
.org 0x1000
.include "print.inc"

; Zacatek programu - po resetu
.org 0
jmp start

.org 0x100
retezec: .db "NEBUDE-LI PRSET NEZMOKNEM",0 ; retezec zakonceny nulou (nikoli znakem "0")

start:
    ; Inicializace zasobniku
    ldi r16, 0xFF
    out SPL, r16
    ldi r16, 0x04
    out SPH, r16
    ; Inicializace displeje
    call init_disp

    ldi r30, low(2*retezec)
    ldi r31, high(2*retezec)
	ldi r28, 4; delka

	ldi r20, 0 ; pozice zleva doprava
	ldi r21, 0
	ldi r22, 0
	ldi r23, 0
	ldi r24, 0
	ldi r25, 0

	ldi r18, 7
	ldi r17, 2 
	ldi r29, 2 

	jmp shifting

waitingos:
	ldi r26, 5
waitingos3:
	ldi r27, 175 
waitingos2:	
	ldi r17, 250
waitingos1:
	dec r17
    brne waitingos1
    dec r27
    brne waitingos2
	dec r26
	brne waitingos3

	cpi r25, 0
	brne shifting

	cpi r18, 0
	brne ladder
	jmp start
shifting:
	mov r20, r21
	mov r21, r22
	mov r22, r23
	mov r23, r24
	mov r24, r25
	lpm r25, Z+
	jmp print
ladder:
	jmp finish
ladder2:
	jmp waitingos
print:
	ldi r29, 2
	mov r16, r20
	cpi r16, 0x00
	breq pos1
	mov r17, r29
	call show_char
pos1:
	inc r29
	mov r16, r21
	cpi r16, 0x00
	breq pos2
	mov r17, r29
	call show_char
pos2:
	inc r29
	mov r16, r22
	cpi r16, 0x00
	breq pos3
	mov r17, r29
	call show_char
pos3:	
	inc r29
	mov r16, r23
	cpi r16, 0x00
	breq pos4
	mov r17, r29
	call show_char
pos4:
	cpi r28, 0x04
	breq ladder2
	inc r29
	mov r16, r24
	cpi r16, 0x00
	breq pos5
	mov r17, r29
	call show_char
pos5:
	cpi r28, 0x05
	breq ladder2
	inc r29
	mov r16, r25
	cpi r16, 0x00
	breq pos6
	mov r17, r29
	call show_char
pos6:	
	cpi r25, 0
	breq lastPrint
	jmp waitingos
lastPrint:
	ldi r17, 6
	ldi r25, ' '
	mov r16, r25
	mov r17, r29
	call show_char
	ldi r25, 0
	jmp waitingos
finish:
	dec r18

	mov r20, r21
	mov r21, r22
	mov r22, r23
	mov r23, r24
	ldi r24, ' '
	ldi r25, ' '

	ldi r29, 2
	mov r16, r20
	mov r17, r29
	call show_char

	inc r29
	mov r16, r21
	mov r17, r29
	call show_char

	inc r29
	mov r16, r22
	mov r17, r29
	call show_char

	inc r29
	mov r16, r23
	mov r17, r29
	call show_char

	inc r29
	mov r16, r24
	mov r17, r29
	call show_char

	inc r29
	mov r16, r25
	mov r17, r29
	call show_char
	ldi r25, 0

	jmp waitingos
