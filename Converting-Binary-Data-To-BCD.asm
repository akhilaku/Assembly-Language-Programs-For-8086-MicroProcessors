ASSUME           CS:CODE, DS:DATA
                 DATA SEGMENT
				 BIN EQU
				 RESULT DW(?)
				 DATA ENDS
				 CODE SEGMENT
START:           MOV AX, DATA        ;initialize data segment
                 MOV DS, AX  
				 MOV BX, BIN
				 MOV AX, 0           ;initialize to 0
				 MOV CX, 0           ;initialize to 0
CONTINUE:        CMP BX, 0           ;comparison for zero binary number
                 JZ ENDPROG          ;if zero end the program
				 DEC BX              ;decrement BX by 1
				 MOV AS, CL
				 ADD AL, 1           ;add 1 to AL
				 DAA                 ;decimal adjust after addition
				 MOV CL, AL          ;storing result in CL register
				 MOV AL, CH
				 ADC AL, 00H         ;add with carry
				 DAA
				 MOV CH, AL          ;storing result in CH register
				 JMP CONTINUE
ENDPROG:         MOV RESULT, CX      ;result is stored in data segment
                 MOV AH, 4CH         ;termination of program
				 INT 21H             ;termination of program
				 CODE ENDS
				 
				 