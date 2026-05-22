.text
.global f1
.type f1, %function

/* f1: r0: x, r1: b */

f1:
    push {r4, r5, r6, lr}
    add r2, r0, r1 // a + b
    sub r3, r0, r1 // a - b
    mul r4, r2, r3 // (a + b) * (a - b)
    mov r5, #0     // i = 0
_for:
    cmp r5, r0     // i == a
    beq _return
    push {r0, r1}
    add r0, r1, r5 // b + i è il parametro della funzione f2 
    bl _f2
    add r4, r4, r0
    pop {r0, r1}
    add r5, r5, #1 // i++
    b _for
_f2:
    add r6, r0, #5 // r = p + 5
    add r0, r0, r6
    mov pc, lr
_return:
    mov r0, r4
    pop {r4, r5, r6, lr} 
    mov pc, lr
