.text
.global make_array
.type make_array, %function


make_array:
    push {r4, r5, lr} // salvo il link register perché make_array non è una funzione foglia
    mov r0, #1
    lsl r0, #20 // 2^20
    lsr r4, r0, #2 // divido per 4 byte (size di un intero) e ottengo il numero di elementi
    bl malloc // in r0 ho i byte allocati
    mov r5, r0 // r5 = puntatore base
    mov r2, #0 // i = 0
_loop:
    cmp r2, r4
    beq _return
    str r2, [r5, r2, lsl #2]
    add r2, r2, #1
    b _loop
_return:
    mov r0, r5 // in r0 ho l'indirizzo base del nuovo array
    pop {r4, r5, pc}
