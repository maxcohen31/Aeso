.text 
.global ce
.type ce, %function

// L'esercizio richiede di ritornare 1 se l'elemento x è presente nel vettore v. NON è possibile usare i registri non temporanei

ce:
    cmp r1, #0 @ vettore nullo
    beq end
    mov r12, #0 @ i = 0
loop:
    cmp r12, r2 @ i == dim
    beq end
    ldr r3, [r1, r12, lsl #2] @ carica v[i]
    cmp r3, r0 @ v[i] == target
    beq true
    add r12, r12, #1 @ i++
    b loop
true:
    mov r0, #1
    mov pc, lr
end:
    mov r0, #0
    mov pc, lr





