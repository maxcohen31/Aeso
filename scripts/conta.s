    .text
    .global conta
    .type conta, %function

conta:
    push {r4, r5, r6, lr}
    cmp r0, #0 @; stringa nulla
    moveq pc, lr
    mov r1, #0 @; i = 0
    mov r2, #0 @; result = 0
    mov r5, #1 @; j = 1 
loop:
    cmp r1, r5
    beq end
    ldrb r3, [r1] @; carica s[i]
    ldrb r4, [r5] @; carica s[i+1]
    sub r6, r4, r3 @; sottrare s[i+1] - s[i]
    cmp r6, #1 @; se la differenza è uguale a 1 aggiorna result
    beq update
    add r1, r1, #1 @; aggiorna i
    add r5, r5, #1 @; aggiorna i+1
    b loop
update:
    add r2, r2, #1 @; result++
    add r1, r1, #1 @; i++
    add r5, r5, #1 @; (i+1)++
    b loop
end:
    mov r0, r2
    pop {r4, r5, r6, lr}
    mov pc, lr
