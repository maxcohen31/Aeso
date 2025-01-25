    .text
    .global conta_strings
    .type conta_strings, %function
conta_strings:
    cmp r0, #0 @; array nullo
    moveq pc, lr
    mov r2, #0 @; result = 0
    mov r3, #0 @; i = 0 - indice per ciclare sull'array
loop:
    cmp r3, r1 @; i == size
    ldr r0, [r3], #4 @; carica la prima stringa - puntatore a 4 byte
    cmp r0, #0 @; stringa nulla
    beq stringa_nulla
    bl conta
    add r2, r2, #1 @; result++
    add r3, r3, #1 @; i++
    b loop
stringa_nulla:
    mov r0, #0
    pop {r4, lr}
    mov pc, lr
end:
    mov r0, r2
    mov pc, lr

