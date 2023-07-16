.data
    	equilateral: .asciiz "equilatero"
	isosceles: .asciiz "isosceles"
    	scalene: .asciiz "escaleno"
.text
    	li $v0, 5 # syscall para ler um inteiro
    	syscall
    	
    	move $t0, $v0 # armazena o primeiro lado em $t0
    	li $v0, 5 # syscall para ler um inteiro
    	syscall
    	
    	move $t1, $v0 # armazena o segundo lado em $t1
    	li $v0, 5 # syscall para ler um inteiro
    	syscall
    	
    	move $t2, $v0 # armazena o terceiro lado em $t2
    
.globl main

main:

   # verifica se é equilátero (todos os lados iguais)
   	beq $t0,$t1,equilateral_check 
   	
   	j isosceles_check

equilateral_check:
   	beq $t1,$t2,is_equilateral 
   	
   	j isosceles_check

is_equilateral:
   	li $v0,4 
   	la $a0,equilateral 
   	syscall 
   	
   	j end

# verifica se é isósceles (dois lados iguais)
isosceles_check:
   	beq $t1,$t2,is_isosceles 
   	beq $t2,$t0,is_isosceles 
   	
   	j scalene_check

is_isosceles:
   	li $v0,4 
   	la $a0,isosceles 
   	syscall 
   	
   	j end

# caso contrário é escaleno (todos os lados diferentes)
scalene_check:
   	li $v0,4 
   	la $a0,scalene 
   	syscall 

end:
