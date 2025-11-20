    .text
    .global higher
    .type higher, %function

@ r0 -> indirizzo base array
@ r1 -> size
@ r2 -> indirizzo della prima istruzione della funzione

higher:
    push {r4, lr}
    mov r4, #0 @ i = 0
_loop:
    cmp r4, r1
    beq _fine
    ldr r3, [r0, r4, lsl #2] @ a[i]
    push {r0, r1, r2}
    mov r0, r3 @ metto in r0 a[i] che verrà passato alla funzione
    blx r2 @ chiama doubling(a[i])
    mov r12, r0 @ salvo il risultato di doubling
    pop {r0, r1, r2}
    str r12, [r0, r4, lsl #2]
    add r4, r4, #1
    b _loop
   
_fine:
    pop {r4, lr}
    mov pc, lr
