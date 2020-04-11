ASSUME               CS:CODE, DS:DATA
DATA SEGMENT
                     DIM EQU 09H
					 MAT1 DB 01, 02, 03, 04, 05, 06, 07, 08, 09
					 MAT2 DB 01, 02, 03, 04, 05, 06, 07, 08, 09
					 RMAT3 D 09H DUP(?)
DATA ENDS
CODE SEGMENT
START:               MOV AX, DATA
                     MOV DS, AX
					 MOV CX, DIM
					 MOV SI, OFFSET MAT1
					 MOV DI, OFFSET MAT2
					 MOV BX, OFFSET RMAT3
NEXT:                XOR AX, AX
                     MOV AL,[SI]
					 ADD AL,[DI]
					 MOV WORD PTR [BX],AX
					 INC SI
					 INC DI
					 ADD BX,02
					 LOOP NEXT
					 MOV AH, 4CH
					 INT 21H
					 CODE ENDS
					 END START
					 