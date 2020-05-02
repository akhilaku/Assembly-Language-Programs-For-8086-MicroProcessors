ASSUME               CS:CODE, DS:DATA
DATA SEGMENT
                     DIM EQU 09H
					 MAT1 DB 01, 02, 03, 04, 05, 06, 07, 08, 09   ; input matrix 1
					 MAT2 DB 01, 02, 03, 04, 05, 06, 07, 08, 09   ; input matrix 2
					 RMAT3 D 09H DUP(?)
DATA ENDS
CODE SEGMENT
START:               MOV AX, DATA
                     MOV DS, AX
					 MOV CX, DIM                                  ; dimensions 
					 MOV SI, OFFSET MAT1                          ; mebstioning the offset
					 MOV DI, OFFSET MAT2
					 MOV BX, OFFSET RMAT3
NEXT:                XOR AX, AX
                     MOV AL,[SI]
					 ADD AL,[DI]                                  ; adding
					 MOV WORD PTR [BX],AX
					 INC SI
					 INC DI
					 ADD BX,02                                    ; adding elements in matrix
					 LOOP NEXT                                    ; looping
					 MOV AH, 4CH
					 INT 21H
					 CODE ENDS                                    ; stoping the coding part
					 END START                                    ; end 
					 
