ASSUME        CS:CODE, DS:DATA
DATA SEGMENT
              LIST DW 235H, 0A57H, 0C322H, 0C91EH, 0C000H,0957H
			  COUNT EQU 006H
DATA ENDS
CODE SEGMENT
START:        XOR BX, BX
              XOR DX,DX
			  MOV AZ, DATA
			  MOV DS, AX
			  MOV CL, COUNT
			  MOV SI, OFFSET LIST
AGAIN:        MOV AZ,[SI]
              ROR AX, 01
			  JC ODD
			  INC BX
			  JMP NEXT
ODD:          INC DX
NEXT:         ADD SI, 02
              DEC CL
			  JNZ AGAIN
			  MOV AH, 4CH
			  INT 21H
			  CODE ENDS
			  END START