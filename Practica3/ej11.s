.data
arr:.word 3,1,4,1,5,9,2,6
long:.word 8
# arr:.word 3
# long:.word 1
# arr:.word #error
# long:.word 0

.text
la t0 arr
lw t1 long

lw t3 0(t0) #Cargar el primer valor

while:
    beq t1 zero fin
    lw t2 0(t0)
    blt t2 t3 menor
    add t3 zero t2
    menor:
    addi t0 t0 4 #Salta a la siguiente palabra
    addi t1 t1 -1 #Restar a la longitud
    j while
fin:
    nop