/*
    La procedura EL * aggiungi(char c, EL * lista) lavora su una lista di elementi EL che sono sequenze di tre
    campi:
    • un carattere c, rappresentato come intero da 32 bit. Il codice ASCII è contenuto nel byte meno significativo della parola;
    • un intero occ, di 32 bit, che rappresenta un numero di occorrenze del carattere c;
    • un puntatore next, anch’esso di 32 bit, che rappresenta il puntatore al prossimo elemento della lista.

    La procedura riceve in ingresso un carattere ASCII e un puntatore alla lista:

    • se il puntatore è NULL (ovvero 0), crea un elemento EL con il campo c inizializzato con il carattere
    ricevuto come primo parametro, il campo occ uguale a 1, il campo next uguale a NULL, e
    restituisce l’indirizzo dell’elemento appena creato;

    • se il puntatore non è NULL, scorre la lista fino a che non trova un elemento con il campo c uguale
    al carattere passato come primo argomento, oppure finché non si raggiunge la fine della lista
    senza trovare il carattere cercato. Nel primo caso, aggiorna il campo occ (occ = occ + 1) e
    restituisce il secondo parametro (puntatore alla lista). Nel secondo caso, aggiunge (in testa alla
    lista) un nuovo elemento EL con il campo c uguale al primo parametro, il campo occ a 1 e il
    campo next settato al puntatore alla lista, e ne restituisce l’indirizzo.
*/

.text
.global aggiungi
.type aggiungi, %function

aggiungi:   
    push {r4, r5, lr}
loop:
    cmp r1, #0 @; lista nulla
    beq crea_nodo
    ldr r2, [r1] @; carica primo carattere 
    cmp r2, r0 @; confronta il primo carattere con quello dato
    beq uguali
    ldr r1, [r1, #8] @; scorre la lista
    b loop
uguali:
    ldr r2, [r1, #4] @; carica occ
    add r2, r2, #1 @; occ++
    str r2, [r1, #4] @; salva occ
    mov r0, r1
    pop {r4, r5, lr}
    mov pc, lr
crea_nodo:
    bl malloc
    mov r4, r0 @; puntatore al nuovo elemento
    strb r0, [r4] @; salva c
    mov r5, #1 @; occ=1
    str r5, [r4, #4] @; salva occ
    str r1, [r4, #8] @; next -> lista
    mov r0, r4
    pop {r4, r5, lr}
    mov pc, lr
