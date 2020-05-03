ASSUME             CS:CODE, DS:DATA
                   DATA SEGMENT
				   STR1 DB 'MADAM', '$'
				   STRLEN1 DW $-STR1
				   STRREV DB 20 DUP('')
				   STR_PALIN DB 'STRING IS PALINDROME','$'
				   STR_NOT_PALIN DB 'STRING IS NOT PALINDROME','$'
DATA ENDS
CODE SEGMENTS
START:             MOV AX, DATA
                   MOV DS, AX
				   MOV ES, AX                                          ; moving AX into ES.
				   MOV CX, STRLEN1                                     ; mesuring the length of the string.
				   ADD CX, -2
				   LEA SI, STR1
				   LEA DI, STRREV
				   ADD SI, STRLEN1
				   ADD SI, -2
L1:                MOV AL,[SI]
                   MOV[DI], AL
				   DEC SI
				   INC DI
				   LOOP L1
				   MOV AL,[SI]
				   MOV[DI], AL
				   INC DI
				   MOV DL, '$'
				   MOV[DI],DL
				   MOV CX,STRLEN1
PALIN_CHECK:       LEA SI, STR1
                   LEA DI, STRREV
				   REPE CMPSB
				   JNE EXIT
NOT_PALIN:         MOV AH,09H
                   LEA DX,STR_NOT_PALIN
				   INT 21H
EXIT:              MOV AX, 4C00H
                   INT 21H
				   CODE ENDS
				   END START
