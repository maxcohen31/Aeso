.text
.global linearSum
.type linearSum, %function

@ r0 = base address array
@ r1 = size
@ r2 = target k

linearSum:
    push {r4, r5, r6, lr}

    cmp r1, #0          @ array vuoto?
    beq _end
    cmp r0, #0          @ puntatore nullo?
    beq _end

    mov r3, #0          @ i = 0
    mov r12, r1         @ j = size
    sub r12, r12, #1    @ j = size - 1

_loop:
    cmp r3, r12         @ i > j ?
    bgt _done

    ldr r4, [r0, r3, lsl #2]   @ a[i]
    ldr r5, [r0, r12, lsl #2]  @ a[j]
    add r6, r4, r5             @ somma
    cmp r6, r2                 @ somma == k ?
    beq _found

    cmp r6, r2
    blt _increment_i           @ somma < k → i++
    sub r12, r12, #1           @ somma > k → j--
    b _loop

_increment_i:
    add r3, r3, #1
    b _loop

_found:
    mov r0, #1                 @ coppia trovata
    pop {r4, r5, r6, lr}
    mov pc, lr

_done:
    mov r0, #0                 @ nessuna coppia
    pop {r4, r5, r6, lr}
    mov pc, lr

_end:
    mov r0, #0                 @ array non valido
    pop {r4, r5, r6, lr}
    mov pc, lr

