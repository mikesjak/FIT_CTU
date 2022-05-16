@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "X:\BI-SAP\AVR\avr_text\labels.tmp" -fI -W+ie -C V2E -o "X:\BI-SAP\AVR\avr_text\text.hex" -d "X:\BI-SAP\AVR\avr_text\text.obj" -e "X:\BI-SAP\AVR\avr_text\text.eep" -m "X:\BI-SAP\AVR\avr_text\text.map" "X:\BI-SAP\AVR\avr_text\text.asm"
