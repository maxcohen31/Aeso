.text
.global make_array
.type make_array, %function


make_array:
    push {lr}
    mov r0, #1
    lsl r0, #20 // 2^20
    lsr r1, r0, #2 // divido per 4 byte (size di un intero)
    bl malloc // in r0 ho i byte allocati
    mov r2, #0 // i = 0
_loop:
    cmp r2, r1
    beq _return
    str r1, [r0, r3, lsl #2]
    add r2, r2, #1
    b _loop
_return:
    pop {lr}
    mov pc, lr
