.text 
.global aggiungi
.type aggiungi, %function

/* r0 char */
/* r1 indirizzo primo elemento lista*/

aggiungi:
    push {r4-r5, lr}
    mov r12, r0
_loop:
    cmp r1, #0 @ lista null
    beq _crea_elemento
    ldrb r2, [r1] @ carica primo carattere
    cmp r2, r8 @ confronto del carattere nella lista con quello da aggiungere
    beq _uguali
    ldr r1, [r1, #8] @ scorro lista se i caratteri sono diversi
    b _loop
_uguali:
    ldr r3, [r1, #4] @ carica occ
    add r3, r3, #1 @ occ + 1
    str r3, [r1, #4] @ salva occ + 1
    mov r0, r1
    bx lr
_crea_elemento:
    bl malloc @ alloca memoria per un nuovo nodo
    mov r4, r0 @ salva indirizzo del nuovo nodo in r4
    strb r12, [r4] @ salva il carattere in offset 0
    mov r5, #1
    str r5, [r4, #4] @ salva occorrenze = 1 in offset 4
    str r1, [r4, #8] @ collega il nuovo nodo alla lista 
    mov r0, r4 @ restituisci il nuovo nodo in r0 
    pop {r4-r5, lr}
    bx lr        

