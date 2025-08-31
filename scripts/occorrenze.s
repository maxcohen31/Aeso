    .text
    .global occorrenze
    .type occorrenze, %function

occorenze:
    @ r0 -> indirizzo al primo elemento dell'array
    @ r1 -> lunghezza array
    @ r2 -> numero da comparare
    push {r4, lr}
    mov r4, #0

_loop:
    cmp r1, #0 @ controllo array NULL
    beq _end
    ldr r3, [r0], #4 @ incremento con somma - carica primo elemento dell'array
    ldr r12, [r3], #4 @ carica primo elemento della struct
    cmp r2, r12 @ num == primo elem struct
    sub r1, r1, #1 @ r1--
    bne _loop
_strlen:
    ldrb r12, [r3], #1 @ carica primo elemento str[i]
    cmp r12, #0
    beq _loop
    add r4, r4, #1 @ r4++
    b _strlen

_end:
    mov r0, r4
    pop {r4, lr}
    bx lr
