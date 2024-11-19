    .text
    .global pari
    .type pari, %function

pari:
    cmp r0, #0 @; array null
    moveq pc, lr
    mov r2, #0 @; i = 0; 
    mov r3, #0 @; result = 0
loop: 
    cmp r2, r1 @;i == size
    beq end
    ldr r12, [r0, r2, lsl #2]
    tst r12, #1 @; testa bit meno significativo
    beq update @; se pari aagiorna result
    add r2, r2, #1 @; i++
    b loop
update:
    add r3, r3, #1
    add r2, r2, #1
    b loop
end:
    mov r0, r3
    mov pc, lr
