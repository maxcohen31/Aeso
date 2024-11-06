    .data
array: .word 0,1,2,3,4,5,6,7,8,9 // vettori di 10 interi

mess: .string "Il risultato è %d\n"
    .text
    .global main
    .type main, %function

main:
    ldr r0,=array // scrive in r0 l'indirizzo iniziale dell'array 
    mov r1, #10 // size
    mov r2, #0 // result = 0
    mov r3, #0 // i = 0
loop: 
    cmp r3, r1 // i == size 
    beq end
    ldr r12, [r0, r3 lsl #2] // carico in r12 array[i]
    add r2, r2, r12 // aggiorno result -> result += array[i]
    add r3, r3, #1
    b loop
end:
    ldr r0,=mess // metto in r0, che non serve più, l'indirizzo della stringa
    mov r5, lr
    mov r1, r2 // sposto result in r1
    mov r0, #0
    mov lr, r5
    mov pc, lr
