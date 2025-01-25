/*
    Scrivere una funzione ARMv7 che prende come parametri un puntatore a una matrice quadrata NxN 
    di interi e la dimensione N della matrice. 
    La funzione deve calcolare e restituire la somma degli elementi della diagonale principale.
*/


.text
.global diagonale
.type diagonale, %function

diagonale:
    @; r0 puntatore matrice
    @; r1 size
    mov r2, #0 @; risultato
    mov r3, #0 @; i = 0
loop:
    cmp r3, r1 @; i == size
    beq fine
    ldr r4, [r0, r3 lsl #2] 
    ldr r5, [r0, r4 lsl #2]
    add r2, r2, r5 @; res = res + n[i][i]
    add r3, #1 @; i++
    b loop
fine:
    pop {r4, r5, lr}
    mov r0, r2
    mov pc, lr

