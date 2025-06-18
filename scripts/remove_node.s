    .text
    .global remove_node
    .type remove_node, %function 
/* 
 * r0: indirizzo del primo nodo (head) della lista collegata
 * r1: valore target da cercare e rimuovere
 * ritorna: nuovo head (r0)
*/

remove_node:
    push {r4, r5, lr}            @ salva registri temporanei e return address

    cmp r0, #0                   @ lista vuota? (head == NULL)
    beq _end                     @ termina e ritorna NULL 

    ldr r2, [r0]                 @ r2 = head->val
    cmp r2, r1                   @ il primo nodo ha il valore da rimuovere?
    bne _while                   @ se no, passa alla ricerca nei nodi successivi

    ldr r3, [r0, #4]             @ r3 = head->next
    mov r0, r3                   @ aggiorna head: r0 = nuovo head
    pop {r4, r5, lr}             @ ripristina i registri salvati
    bx lr                       
_while:
    mov r4, r0                   @ r4 = prev = head
    ldr r5, [r4, #4]             @ r5 = curr = head->next
_start:
    cmp r5, #0                   @ curr == NULL
    beq _end                  
    ldr r2, [r5]                 @ r2 = curr->val
    cmp r2, r1                   @ il valore corrente è il target?
    beq _remove                  @ se sì, salta alla rimozione del nodo
    mov r4, r5                   @ prev = curr
    ldr r5, [r5, #4]             @ curr = curr->next
    b _start                     @ ripeti il ciclo
_remove:
    ldr r2, [r5, #4]             @ r2 = curr->next
    str r2, [r4, #4]             @ prev->next = curr->next (salta curr)
                                 @ il nodo curr è "rimosso" dalla lista
    pop {r4, r5, lr}             @ ripristina i registri salvati
    bx lr                        @ ritorna (head rimane invariato in r0)
_end:
    pop {r4, r5, lr}             @ ripristina registri
    bx lr                        @ ritorna senza modifiche a head

