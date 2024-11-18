    .text
    .global cambia
    .type cambia, %function

cambia:
    push {r4, r5, lr}
    mov r4, r0 @; salvo r0 in r4
    mov r5, #0 @; i = 0
loop:
    cmp r5, r3 @; i == size?
    beq end
    ldrb r2, [r1, r5] @; carico from[i]
    cmp r2, r4 @; confronto c e from[i]
    beq uguali
    add r5, r5, #1
    b loop
uguali:
    @; devo ritornare to[j]
    ldrb r0, [r2, r5] 
    pop {r4, r5}
    mov pc, lr
end:
    pop {r4, r5, lr}
    mov pc, lr
    
