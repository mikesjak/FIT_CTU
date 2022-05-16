@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "X:\BI-SAP\AVR\cv8_2\labels.tmp" -fI -W+ie -C V2E -o "X:\BI-SAP\AVR\cv8_2\cv8_2.hex" -d "X:\BI-SAP\AVR\cv8_2\cv8_2.obj" -e "X:\BI-SAP\AVR\cv8_2\cv8_2.eep" -m "X:\BI-SAP\AVR\cv8_2\cv8_2.map" "X:\BI-SAP\AVR\cv8_2\cv8_2.asm"
