.data
ano:    .word 2003, 2004, 2005
equipe: .word 3
txt:    .asciiz "Soma: "

.text
.globl main

main:
    la $t0, ano
    lw $t1, equipe($zero)
    li $s0, 0

loop:
    beq $t1, $zero, printar_loop
    lw $t2, 0($t0)
    addu $s0, $s0, $t2
    addi $t0, $t0, 4
    addi $t1, $t1, -1
    j loop

printar_loop:
    li $v0, 4
    la $a0, txt
    syscall
    li $v0, 1
    move $a0, $s0
    syscall
    li $v0, 10
    syscall
