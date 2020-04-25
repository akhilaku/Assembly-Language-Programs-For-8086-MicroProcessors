MOV AX, 00FFH         ; move the data FFH to AX, with the upper bytes as 00h.
MOV BL, 100           ; store the decimal value 100 (or 64H ) in BL.
DIV BL                ; divide AX by BL to find the number of hundreds in the binary number.

MOV DL, AL            ; move the quotient in AL (number of hundreds) to DL.
MOV AL, AH            ; move the remainder in AH to AL.
MOV AH, 00            ; Clear AH.
MOV BL, 10            ; Store the decimal value 10( or 0AH) in BL.
DIV BL                ; Divide AX by BL to find the number of tens in the binary number AH.
                     
MOV CL, 04            ; Has the remainder, which is the number of ones in the binary number.
ROR AL, CL            ; rotate AL content right four times to make the lower nibble as uuper nibble.

                       
