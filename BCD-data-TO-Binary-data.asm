ASSUME    CS:CODE, DS:DATA
          DATA SEGMENT 
	      BCD_NUM EQU 4576H
	      BIN_NUM DW
	      DATA ENDS
	      CODE SEGMENTS
START:    MOV AX, DATA                    
          MOV DS, AX
	      MOV BX, BCD_NUM       
	      MOV CX, 0             ; initialization
CONTINUE: CMP BX, 0             ; comparison to check BCD num is zero
          JZ ENDPROG            ; if zero end the program 
		  MOV AL, BL            ; 8 LSBs of number is transfered to AL
		  SUM AL, 1             ; substract one from AL
		  DAS                   ; decimal adjust after subtraction
		  MOV BL, AL            ; result is stored in BL
		  MOV AL, BH            ; 8 MSBs of number is transfered to AL
		  SBB AL, 00H           ; subtraction with borrow
		  DAS                   ; decimal adjust after subtraction
		  MOV BH, AL            ; result back in BH register
		  INC CX                ; increment CX by 1
		  JMP CONTINUE
ENDPROG:  MOV BIN_NUM, CX       ; result is stored in data segment
          MOV AH, 4CH           ; termination of program
          INT 21H               ; termination of program
          CODE ENDS
          END START		  
