.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
   # YOUR CODE HERE
   addi sp, sp -16
    sw ra, 12(sp)
    sw s2, 8(sp)
    sw s1, 4(sp)
    sw s0, 0(sp)

    beq a0, x0, xis0

    mv s0, a0
    addi s1, s0, -1
    mv a0, s1

    # s1 = factorial(s1 - 1)
    jal ra, factorial
    mv s1, a0

    # calculate (s1 * s0) (or, (x * factorial(x - 1))
    mul s2, s1, s0
    mv a0, s2

    # jump to epilogue
    j fact

xis0:
    # return value is 1 if x == 0
    li a0, 1
    j fact

fact:
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    lw ra, 12(sp)
    addi sp, sp, 16

    # return
    jr ra 
#8! = 8*7*6*5*4*3*2*1 = 40320
