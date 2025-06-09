.text
.global main

main:
    push {r4, lr} @ salviamo r4, che si utilizza per il puntatore alla lista
    mov r0, #16 @ 16 elementi nella lista
    mov r1, #8 @ tra 0 e 8
    bl l_alloca @ restituisce in r0 la lista
    mov r4, r0 @ salviamo indirizzo lista
    bl l_stampa @ stampa la lista inizile
    mov r0, r4 @ puntatore alla lista
    bl subst @ r0 vero/falso
    mov r0, r4 @ puntatore alla lista
    bl l_stampa @ stampa lista finale
    pop {r4, lr} @ restituisce il controllo al chiamante
