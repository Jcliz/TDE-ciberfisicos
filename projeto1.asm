.data
numeros:    .word   4, 3, 9, 5, 2, 1  
tamanho:     .word   6

.text
.globl main

main:
	lw   $s0, tamanho      
	li   $t0, 0         

loop_externo:
    	subi $t1, $s0, 1    
    	beq  $t0, $t1, finalizar_ajuste

    	la   $s1, numeros     
    	li   $t2, 0          

loop_interno:
    	sub  $t3, $s0, $t0
    	subi $t3, $t3, 1
    	beq  $t2, $t3, finalizar_loop_interno 

    	lw   $t4, 0($s1)     
    	lw   $t5, 4($s1)     

    	ble  $t4, $t5, sem_troca

    	sw   $t5, 0($s1)     
    	sw   $t4, 4($s1)    

sem_troca:
    	addi $s1, $s1, 4     
    	addi $t2, $t2, 1     
    	j    loop_interno       

finalizar_loop_interno:
    	addi $t0, $t0, 1    
    	j    loop_externo      

finalizar_ajuste:
	li   $t0, 0          
    	la   $s1, numeros      

printar_loop:
    	beq  $t0, $s0, sair

    	lw   $a0, 0($s1)     
    	li   $v0, 1         
    	syscall              

    	addi $s1, $s1, 4
    	addi $t0, $t0, 1
    	j    printar_loop

sair:
    	li   $v0, 10
    	syscall
