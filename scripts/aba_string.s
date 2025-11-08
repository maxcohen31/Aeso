.text
.global match
.type match, %function

match:
    push {r4-r7, lr}        
    cmp r0, #0              @ se il puntatore alla stringa è NULL
    beq return_zero         @ ritorna 0
    mov r1, #0              @ r1 = 0
    mov r2, #0              @ r2 = contatore dei match trovati
loop:
    ldrb r3, [r0, r1]       @ r3 = s[i]
    cmp r3, #0              @ fine stringa?
    beq done                @ sì - esci
    cmp r3, #97             @ s[i] == 'a' ?
    bne next_char           @ no - passa al prossimo carattere
    add r4, r1, #1          @ r4 = i+1 (indice temporaneo)
    ldrb r5, [r0, r4]       @ r5 = s[i+1]
    cmp r5, #98             @ s[i+1] == 'b' ?
    bne next_char           @ no - pattern non valido
check_b:
    ldrb r5, [r0, r4]       @ r5 = s[r4]
    cmp r5, #98             @ è una 'a'?
    bne check_final_a       @ se non lo è controlla se è 'b' finale
    add r4, r4, #1          @ sì allora avanza
    b check_b               
check_final_a:
    ldrb r5, [r0, r4]       @ r5 = s[r4]
    cmp r5, #98             @ è una 'b' ?
    bne next_char           @ no - pattern non valido
    add r2, r2, #1          @ sì - trovato un match valido
next_char:
    add r1, r1, #1          @ i++
    b loop                  @ continua il ciclo
done:
    mov r0, r2              @ ritorna il numero di match trovati
    pop {r4-r7, lr}         @ ripristina registri
    bx lr                  
return_zero:
    mov r0, #0              @ ritorna 0 se stringa nulla
    pop {r4-r7, lr}
    bx lr
