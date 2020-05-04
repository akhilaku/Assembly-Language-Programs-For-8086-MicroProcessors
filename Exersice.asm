;Write a program for the second serial port of the DS89C4x0 to
;continuously transfer the letter "A" serially at 4800 baud.
;Use 8-bit data and 1 stop bit.
;Use timer 1.

           SBUF1 EQU 0C1H             ; 2nd serial SBUF addr
           SCON1 EQU OCOH             ; 2nd serial SCON addr
           TI1 BIT 0C1H               ; 2nd serial TI bit addr
           RI1 BIT 0C0H               ; 2nd serial RI bit addr
           ORG 0H

MAIN:      MOV TMOD,#20H              ; COM2 uses Timer 1 on reset
           MOV TH1,#-6                ; 4800 baud rate
           MOV SCON1,#50H             ; 8-bit, 1 stop, REN enabled
AGAIN:     MOV A,#"A"                 ; start timer 1
           ACALL SENDCOM2             ; send char 'A'
           SJMP AGAIN
           
     
