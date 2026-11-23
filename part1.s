# Program that counts consecutive 1’s.
.globl _start # Remember to change to .global
.text

_start:
    la s2, LIST # Load the memory address into s2
    lw s3, 0(s2)
    addi s10, zero, 0 # Register s10 will hold the current max count
    addi s7, zero, -1 # Sentinel Value

    LOOP1:
    beq s3, s7, ENDLOOP1
    jal ONESCOUNT
    bge s10, a0, KEEPMAX
    mv s10, a0
    KEEPMAX:
    addi s2, s2, 4
    lw s3, 0(s2)
    j LOOP1
    ENDLOOP1:
END: j END

ONESCOUNT:
    addi a0, zero, 0 # Hold count for this word
    addi a2, zero, 0
    add a2, a2, s2
    addi a3, zero, 0
    add a3, a3, s3

    LOOP2:
    beqz a3, ENDLOOP2 # Loop until data contains no more 1’s
    srli a2, a3, 1 # Perform SHIFT, followed by AND
    and a3, a3, a2
    addi a0, a0, 1 # Count the string lengths so far
    j LOOP2
ENDLOOP2:
    jr ra

.globl LIST # Remember to change to .global
.data
LIST:
.word 0x103fe00f, 0x1423, 0xceffd, 0x1, 0x3452, 0x8, 0x11, 0xec3b049f,0x4, 0x14, 0x21, -1