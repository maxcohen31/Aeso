.text
.global multiply8
.type multiply8, %function

// Hint: MUL R2, R1, R0 seguita da una AND con 0xff lascia un registro che contiene il risultato INT8 
// della moltiplicazione dei byte meno significativi di R0 ed R1 

multiply8:
    push {r4, lr}
    mov r2, #0 @ risultato
    mov r3, #4 @ 4 iterazioni (32 / 8)
loop:
    and r4, r0, #0xFF @ prende byte meno significativi di r0
    and r12, r1, #0xFF @ prende byte meno significativi di r1
    mul r4, r4, r12 @ moltiplica i byte appena isolati
    and r4, r4, #0xFF @tronca a 8 bit
    ror r2, r2, #8 @ sposto di 8 bit il risultato 
    add r2, r2, r4 @ aggiorno il risultato con il byte appena trovato
    lsr r0, r0, #8 @ scarta byte meno significativo da r0
    lsr r1, r1, #8 @ scarta byte meno significativo da r1
    subs r3, r3, #1 @ r3--
    bne loop
    ror r2, r2, #8 @ mette a posto il risultato
    mov r0, r2
    pop {r4, lr}
    bx lr

