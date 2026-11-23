.globl _start #* Remember to change to .global
.text

_start:

la s0, LIST #* Load the memory 
lw s1, 0(s0) #* Load count of LIST
addi s4, zero, 1 #* LIST starting index counter 1
addi s5, zero, 0 #* LIST starting index counter 2

add t1, zero, s0 #* Set temp register to address stored in s0
addi t1, t1, 4 #* Move temp register address by 4 bytes to second word in the list

li t0, 2 #* Load immediate 2 into t0
bltu s1, t0, END #! Branch if s1 < t0 (2), END. This checks if LIST has fewer than 2 elements

LOOP1:
    beq s4, s1, ENDLOOP1 #! Branch if s4 == s1, ENDLOOP1
    addi s5, zero, 0 #* Reset s5 to 0
    sub t0, s1, s4 #* t0 = s1 - s4 (equivalent of n - i)
LOOP2:
    beq s5, t0, ENDLOOP2 #! Brnach if s5 == (s1 - s4), ENDLOOP2
    slli t2, s5, 2 #* t2 = s5 * 4 ; which is number of bytes from starting address
    add a0, t1, t2 #* Set a0 to the current address that we are at in the list at iteration n

    jal SWAP #? Jump to SWAP function

    addi s5, s5, 1 #* Increment s5 by 1

    j LOOP2 #? Jump back to LOOP2
ENDLOOP2:

    addi s4, s4, 1 #* Increment s4 by 1

    j LOOP1 #? Jump back to LOOP2
ENDLOOP1:
END: j END

SWAP:
    addi a1, a0, 4 #* a1 holds the address at index n+1
    lw a2, 0(a0) #* Load the value at address a0 into a2
    lw a3, 0(a1) #* Load the value at address a1 into a3
    bgeu a3, a2, ENDSWAP #! Branch if a3 >= a2, ENDSWAP
    sw a3, 0(a0) #* Store second value at the first address
    sw a2, 0(a1) #* Store first value at the second address
    li a0, 1 #* Return a0 with 1 to say that it has swapped
    jr ra
ENDSWAP:
    li a0, 0 #* Return a0 with 0 to say no swap
    jr ra

.globl LIST #* Remember to change to .global
.data
LIST:
.word 10, 1400, 45, 23, 5, 3, 8, 17, 4, 20, 33
