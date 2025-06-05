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

// r0 contiene puntatore a next 
// r1 contiene puntatore a info

insert:
    push {r4, r5, lr}
    mov r2, r0 @ salvo in r2 elem->info
    mov r3, r1 @ salvo in r3 elem->next
    bl malloc
    mov r4, r0 @ nuovo nodo
    cmp r4, #0 @ malloc fallita
    beq failed_malloc
    str r3, [r4] @ nuovo nodo -> info
    mov r5, #0 @ NULL
    str r5, [r4, #4] @ nuovo nodo -> next = NULL
    cmp r2, #0 @ lista vuota
    beq empty_list
traverse_list:
    ldr r1, [r2, #4] 
    cmp r1, #0
    beq found
    movne r2, r1 @ scorre lista fino a NULL
    b traverse_list
found:
    str r4, [r2, #4] @ ultimo_nodo -> next = nuovo_nodo
    mov r0, r0 @ restituisce nodo_originale
    pop {r4, r5, pc}
empty_list:
    mov r0, r4
    pop {r4, r5, pc}
failed_malloc:
    mov r0, r4
    pop {r4, pc}


