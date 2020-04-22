ASSUME                      CS:CODE, DS:DATA
DATA SEGMENT                LIST DB 52H, 23H, 56H, 45H
                            COUNT EQU OF
                            LARGEST DB 01H DUP(?)
DATA ENDS
CODE SEGMENT                
START:                      MOV AX, DATA
                            MOV DS, AX
                            MOV SI, OFFSET LIST
                            MOV CL, COUNT
                            MOV AL, [SI]
AGAIN:                      CMP AL, [SI+1]
                            JNL NEXT
                            MOV AL, [SI+1]
NEXT:                       INC SI
                            DEC CL
                            JNZ AGAIN
                            MOV SI, OFFSET LARGEST
                            MOV [SI], AL
                            MOV AH, 4CH
                            INT 21H
                            CODE ENDS
                            END START
                            
                            
                            
