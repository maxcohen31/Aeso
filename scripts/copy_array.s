.text
.global copy_array
.type copy_array, %function

copy_array:
    cmp r1, #0 // size 0
    beq _exit

    // Chiama malloc per un array di 10 interi: 40 byte
    push {r4, r5, lr} // salvo l'indirizzo dell'array
    mov r4, r0  // salvo in r4 l'indirizzo contenuto in r0
    mov r6, r1  // salvo size
    mov r0, r1, lsl #2 // malloc(size * 4)
    bl malloc
    cmp r0, #0
    beq _fail
    mov r12, #0 // i = 0
    mov r5, r0  // puntatore al nuovo array
_loop:
    cmp r12, r6 // i == size
    beq _end_loop
    ldr r2, [r4, r12, lsl #2] // carica a[i]
    add r2, r2, #2   // a[i] + 2
    str r2, [r5, r12, lsl #2] // scrive res[i] = a[i] + 2
    add r12, r12, #1 // i++
    b _loop
_end_loop:
    mov r0, r5
    pop {r4, r5, lr}
    mov pc, lr
_fail:
    pop {r4, r5, lr}
    mov r0, #0
    mov pc, lr
_exit:
    mov r0, #0
    mov pc, lr
