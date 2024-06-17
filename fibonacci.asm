.data
valor30: .word 0
valor40: .word 0
valor41: .word 0

msg1: .asciiz "Valor do 30º: "
msg2: .asciiz "Valor do 41º: "
msg3: .asciiz "Valor do 40º: "


.text
.globl main

main:
    #Valor maior, mas na posição 30°
    li $a0, 31  
    jal fibonacci
    move $s1, $v0
    sw $s1, valor30

    #Valor maior, mas na posição 40°
    li $a0, 41
    jal fibonacci
    move $s2, $v0
    sw $s2, valor40

    #Valor maior, mas na posição 41°
    li $a0, 42
    jal fibonacci
    move $s3, $v0
    sw $s3, valor41


    lw $t0, valor41
    lw $t1, valor40
    mtc1 $t0, $f2
    mtc1 $t1, $f3
    cvt.s.w $f2, $f2
    cvt.s.w $f3, $f3
    div.s $f0, $f2, $f3

    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 1
    move $a0, $s1
    syscall
    

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    move $a0, $s2
    syscall

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $s3
    syscall
    

    li $v0, 10
    syscall

fibonacci:
    li $t0, 0
    li $t1, 1
    li $t2, 2
    blez $a0, base
    beq $a0, 1, fib

loop:
    add $t3, $t0, $t1
    move $t0, $t1
    move $t1, $t3
    addi $t2, $t2, 1
    bne $t2, $a0, loop

    move $v0, $t3
    jr $ra

base:
    move $v0, $t0
    jr $ra

fib:
    move $v0, $t1
    jr $ra
