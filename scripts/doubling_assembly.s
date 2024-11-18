    .text
    .global map
    .type map, %function

map:
    push {r4, r5, lr}
    cmp r0, #0 @; controllo array nullo 
    moveq pc, lr
    cmp r1, #0 @; size == 0?
    beq end
    mov r3, r0 @; salvo indirizzo array
    mov r4, r1 @; salvo size in r4
    mov r5, #0 @; i = 0
loop:
    cmp r5, r4 @; i == size
    beq end
    ldr r0, [r3, r5, lsl #2] @; leggo array[i]
    blx r2  @; chiama la doubling
    str r0, [r3, r5, lsl #2] @; salvo il risultato di doubling
    add r5, r5, #1 @; i++ 
    b loop
end:
    mov r0, #0
    pop {r4, r5, lr}
    mov pc, lr



