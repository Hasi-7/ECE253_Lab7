###Start

Load address of list into s0
Load first word of list into s1, this will be the number of words to sort

Initialize s4 to hold the index of the list (indexed starting at 1)
Initialize s5 to hold the index of the list (indexed starting at 1)

#Bubble sort requires 2 nested loops

LOOP 1: Branch if s4 is equal to s1 to ENDLOOP1
Reset s5 back to 1
LOOP 2: Branch if s5 is equal to s1 - s4 to ENDLOOP2


Load word at index stored in s5 into s2, this will hold the value of the current position (n) in the list
Load word at index stored in s5 + 1 into s3, this will hold the value at index n + 1  of the list

set a0 to address of s2
Call Subroutine SWAP

Index s2 forward by 1 and s3 forward by 1 (Use s5 to "multiply by 4" to know how many bytes to increment. Can shift left by 2 to multiply value by 4 "slli t0, s5, 2": t0 = s5 * 4)

Branch if a0 is equal to 0 to LOOP 1.


Increment s5 by 1
Jump back to LOOP 2
ENDLOOP2
Increment s4 by 1
Jump back to LOOP 1
ENDLOOP1

END

SWAP
store values of s2 and s3 by using the address in a0 to create temp registers to store their values
if s2 is greater than s3
make the memory swap by storing the words in each other's address locations
return a0 = 1
otherwise return a0 = 0