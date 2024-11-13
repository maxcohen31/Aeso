    .data
    .text
    .global ip
    .type ip, %function


ip:
    push {r4, r5}
    mov r3, #0 // result = 0
loop:
    cmp r2, #0 // size == 0
    beq end
    ldr r4, [r0], #4 @; leggo x[i]
    ldr r5, [r1], #4 @; leggo y[i]
    mul r4, r4, r5
    add r3, r3, r4
    sub r2,r2, #1 @; n--
    b loop
end:
    mov r0, r3
    pop {r4, r5}
    mov pc, lr

