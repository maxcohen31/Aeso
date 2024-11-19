    .text
    .global map
    .type map, %function

map:
    push {lr}
    cmp r0, #0 @; controllo array nullo 
    moveq pc, lr
    cmp r1, #0 @; size == 0?
    beq end
    mov r3, r0
    mov r12, #0 @; i = 0
loop:
    cmp r12, r1 @; i == size
    beq end
    push {r0, r12}
    ldr r0, [r3, r12, lsl #2] @; leggo array[i]
    blx r2  @; chiama la doubling
    str r0, [r3, r12, lsl #2] @; salvo il risultato di doubling
    pop {r0, r12}
    add r12, r12, #1 @; i++ 
    b loop
end:
    mov r0, r3 
    pop {lr}
    mov pc, lr



