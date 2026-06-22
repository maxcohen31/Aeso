.text
.global one_bit_count
.type one_bit_count, %function

// r0: n
// r1: puntatore alla funzione

/*
    // Codice per la funzione f in ARMv7
    mov r2, #0 // risultato
_loop:
    cmp r0, #0 // n == 0
    beq _end
    and r1, r0, #1
    add r2, r2, r1 
    lsr r0, r0, #1
    b _loop

_end:
    mov r0, r2
    mov pc, lr




*/

one_bit_count:
    push {lr} // salvo lr perché non sono una funzione foglia
    blx r1
    pop {pc}
