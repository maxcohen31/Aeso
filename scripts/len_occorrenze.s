.text
.global lenOccorrenze
.type lenOccorrenze, %function

lenOccorrenze:
    push {r4-r8, lr}
    mov r4, r0 @ salva indirizzo del vettore v
    mov r5, #0 @ i = 0
    mov r6, #0 @ risultato
loop:
    cmp r5, r1 @ i == n
    beq end
    add r3, r4, r5, lsl #3  @ r3 = &v[i] - calcola indirizzo di v[i]
    ldr r12, [r3] @ carica v[i]->key
    cmp r12, r2 @ confronto le chiavi
    bne skip
    ldr r8, [r3, #4] @ carica v[i]->s
    mov r9, #0 @ k - indice per ciclare sulla stringa
strlen:
    ldrb r7, [r8], #1 @ carico la stringa s[i]
    cmp r7, #0 @ stringa null
    beq update
    add r9, r9, #1 @ k++
    b strlen
update:
    add r6, r6, r9 @ aggiorna il risultato con la lunghezza della stringa
skip:
    add r5, r5, #1
    b loop
end:
    mov r0, r6
    pop {r4-r8, pc}

