    .text
    .global reverse
    .type reverse, %function

    @; r0: indirizzo array
    @; r1: size
reverse:
    push {r4, r5, r6, lr}
    cmp r0, #0 @; array null?
    moveq pc ,lr
    mov r2, r1 @; r2 diventa size
    mov r3, #0 @; r3 = i = 0
    sub r5, r1, #1 @; length - 1
loop:
    cmp r3, r5 @; i == size
    bgt end
    ldr r4, [r0, r3, lsl #2] @; legge array[i]
    ldr r6, [r0, r5, lsl #2] @; leggere array[size - 1 - i]
    str r4, [r0, r5, lsl #2] @; array[i] = array[size-1-i]
    str r6, [r0, r3, lsl #2]
    add r3, r3, #1 @; i++
    sub r5, r5, #1
    b loop 
end:
    pop {r4, r5, r6, lr}
    mov pc, lr
