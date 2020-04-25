MOV AX, 00FFH         ; move the data FFH to AX, with the upper bytes as 00h.
MOV BL, 100           ; store the decimal value 100 (or 64H ) in BL.
DIV BL                ; divide AX by BL to find the number of hundreds in the binary number.

MOV DL, AL            ; move the quotient in AL (number of hundreds) to DL.
