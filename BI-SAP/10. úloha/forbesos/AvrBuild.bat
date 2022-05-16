@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "X:\BI-SAP\AVR\forbesos\labels.tmp" -fI -W+ie -C V2E -o "X:\BI-SAP\AVR\forbesos\forbesos.hex" -d "X:\BI-SAP\AVR\forbesos\forbesos.obj" -e "X:\BI-SAP\AVR\forbesos\forbesos.eep" -m "X:\BI-SAP\AVR\forbesos\forbesos.map" "X:\BI-SAP\AVR\forbesos\forbesos.asm"
