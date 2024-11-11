.text
.global fibonacci
.type fibonacci, %function


fibonacci:
    push {r4, lr} @ salva registro r4
    cmp r0, #0
    beq end
    cmp r0, #1
    beq end
    mov r1, #0 @ a = 0 
    mov r2, #1 @ b = r2 = 1
    mov r3, #1 @ i = 1 
loop:
    cmp r3, r0 @ i == n?
    beq end
    add r4, r1, r2 @ c = a + b
    mov r1, r2 @ a = b
    mov r2, r4 @ b = c
    add r3, r3, #1 @ i++
    b loop
end:
    mov r0, r2
    pop {r4, pc} @ ripristina r4 
