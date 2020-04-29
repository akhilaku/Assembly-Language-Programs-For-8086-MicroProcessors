;Write a program to convert the given 8-bit binary number into ASCII codes.
;The 8-bit binary number is present in the memory location 2000H:5000H and the result is to be stored at the offset addressess 1000H and 1001H in the same segment.

MOV AX, 2000H
MOV DS, AX                            ; initilaize DS with 2000h
MOV AL, [5000H]                       ; move the binary data to AL.
MOV BL, AL                            ; save a copy of AL in BL.
AND AL, 0F0H                          ; mask the lower nibble in AL.
MOV CL, 04
ROR AL, CL                            ; Rotate AL right four times, to get the upper nibble.
CALL ASCII                            ; call the subroutine ASCII.
MOV[1000H], AL                        ; store the result in AL in the memory.


