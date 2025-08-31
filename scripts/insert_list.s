/*
    Implementare in assembler ARMv7 una procedura di signature:
    ELEM * insert(ELEM * lista, int info)
    che opera su elementi definiti come
    typedef struct __e { int info, struct __e * next} ELEM;
    inserendo, in fondo alla lista puntata dal parametro lista un nuovo elemento con informazione info
    restituendo il puntatore (modificato, se necessario) alla lista. La procedura deve rispettare tutte le
    convenzioni ARMv7, in modo che possa essere chiamata da altro codice, C o assembler. Per allocare
    la memoria necessaria a contenere il nuovo elemento, si faccia uso di una chiamata alla funzione di
    libreria malloc.
*/

    .text
    .global insert
    .type insert, %function

insert:
    push {r4, r5, lr}        @ Salvo registri callee-saved che userò + link register

    mov r4, r0               @ r4 = lista (salvo copia per restituire la testa)
    mov r5, r1               @ r5 = info  (valore da inserire)

    mov r0, #8               @ sizeof(ELEM) = 8 byte (2 campi int/pointer)
    bl malloc                @ malloc(8) -> r0 = nuovo nodo o NULL

    cmp r0, #0
    beq failed_malloc        @ Se malloc fallisce, ritorna NULL

    str r5, [r0]             @ nuovo->info = info
    mov r1, #0
    str r1, [r0, #4]         @ nuovo->next = NULL

    cmp r4, #0
    beq empty_list           @ Se lista == NULL -> nuovo nodo diventa la testa

    /* Caso lista NON vuota: scorri fino all’ultimo nodo */
    mov r2, r4               @ r2 = cursore = lista
traverse_list:
    ldr r1, [r2, #4]         @ r1 = cursore->next
    cmp r1, #0
    beq found                @ se cursore->next == NULL, ho trovato la fine
    mov r2, r1               @ cursore = cursore->next
    b traverse_list

found:
    str r0, [r2, #4]         @ cursore->next = nuovo
    mov r0, r4               @ restituisco la testa originale
    pop {r4, r5, pc}         @ ripristina registri e ritorna

empty_list:
    mov r0, r0               @ r0 già contiene nuovo nodo, che è la testa
    pop {r4, r5, pc}

failed_malloc:
    mov r0, #0               @ malloc fallita: ritorna NULL
    pop {r4, r5, pc}

