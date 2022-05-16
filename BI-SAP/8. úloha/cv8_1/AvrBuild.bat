@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "X:\BI-SAP\AVR\cv8_1\labels.tmp" -fI -W+ie -C V2E -o "X:\BI-SAP\AVR\cv8_1\cv8_1.hex" -d "X:\BI-SAP\AVR\cv8_1\cv8_1.obj" -e "X:\BI-SAP\AVR\cv8_1\cv8_1.eep" -m "X:\BI-SAP\AVR\cv8_1\cv8_1.map" "X:\BI-SAP\AVR\cv8_1\cv8_1.asm"
