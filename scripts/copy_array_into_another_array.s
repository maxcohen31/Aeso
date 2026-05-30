.text
.global copy
.type copy, %function

// r0: indirizzo array a
// r1: indirizzo array b
// r2: size degli array (uguale)

copy:
    cmp r2, #0
    beq _exit
    
    push {r4, r5}
    mov r3, #0 // i = 0
_loop:
    cmp r2, r3 // size == i
    beq _return
    ldr r4, [r0, r3, lsl #2] // carico a[i]
    ldr r5, [r1, r3, lsl #2] // carico b[i]
    str r5, [r0, r3, lsl #2] // scrive b[i] in a[i]
    add r3, r3, #1
    b _loop
_return:
    mov r0, r4
    pop {r4, r5}
    mov pc, lr
_exit:
    mov pc, lr

