.text
.global conta_bit_a_uno
.type conta_bit_a_uno, %function

conta_bit_a_uno:
    push {lr}
    mov r1, #0 @; contatore
    mov r2, #0
loop:
    cmp r0, #0 @; n < 0
    beq end
    and r2, r0, #1 @; salva in r2 il risultato dell'AND bit a bit tra l'intero e 1
    add r1, r1, r2
    lsr r0, r0, #1 @; shift a destra di uno
    b loop
end:
    mov r0, r1
    pop {lr}
    bx lr
