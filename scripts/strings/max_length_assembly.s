    .text
    .global max_length
    .type max_length, %function


max_length:
    push {r4, r5, r6, r7, lr} @; r4: indice lunghezza massima 
                              @; r5: indice al primo puntatore dell'array
                              @; r6: lunghezza parola in lettura
                              @; r7: legge carattere della stringa

    cmp r1, #0 @; array vuoto?
    mov r2, #0 ; @; lunghezza massima
    mov r3, #0 @; indice ciclo -> i = 0
main_loop:
    cmp r3, r1 @; i == size
    beq end
    ldr r5, [r0, r3, lsl #2] @; leggo puntatore alla prima stringa
    mov r6, #0 @; lunghezza corrente
strlen_loop:
    ldrb r7, [r5], #1 @; carico array[i][i]
    cmp r7, #0 @; array[i][i] == '\0'
    beq strlen_compare
    add r6, r6, #1 @; aggiorna contatore della lunghezza della parola in lettura
    b strlen_loop 
strlen_compare:
    cmp r6, r2 @; confronto la lunghezza della stringa attuale con la massima lunghezza
    ble update @; se len(stringa) <= max_length (r2) continua l'iterazione
    mov r2, r6 @; aggiorna lunghezza massima
    mov r4, r3 @; aggiorna indice lunghezza_massima
update:
    add r3, r3, #1 @; i++
    b main_loop 
end:
    mov r0, r4 @; ritorno l'indice della stringa di lunghezza massima 
    pop {r4, r5, r6, r7, lr}
    mov pc, lr

