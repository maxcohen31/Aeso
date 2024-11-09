.text
.global even_sum
.type even_sum, %function


even_sum:
    mov r2, #0 // i = 0
    mov r3, #0 // result = 0
loop:
    cmp r2, r1 // i == size
    beq fine
    ldr r12, [r0, r2, lsl #2] // carica array[i]
    tst r12, #1 // il primo elemento è pari?
    addeq r3, r3, r12
    add r2, r2, #1
    b loop // se non pari continua
fine:
    mov r0, r3
    mov pc, lr
