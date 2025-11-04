    .text
    .global trasforma
    .type trasforma, %function
@ void trasforma(char *s, char *from, char *to, int N)

trasforma:
    push {r4, r5, r6, r7, lr}
    
    cmp r0, #0              @ controlla se string è NULL
    beq _end
    
    mov r4, r0              @ r4 = puntatore alla stringa s
    mov r5, r1              @ r5 = from (salviamo)
    mov r6, r2              @ r6 = to (salviamo)
    mov r7, r3              @ r7 = N (salviamo)
    
_loop:
    ldrb r0, [r4]           @ r0 = s[i] (carattere corrente)
    cmp r0, #0              @ controlla fine stringa
    beq _end
    
    @ Prepara i parametri per cambia
    @ r0 contiene già il carattere
    mov r1, r5              @ from
    mov r2, r6              @ to
    mov r3, r7              @ N
    
    bl cambia               @ chiama cambia, risultato in r0
    
    strb r0, [r4], #1       @ salva il carattere trasformato e incrementa puntatore
    
    b _loop
    
_end:
    pop {r4, r5, r6, r7, lr}
    mov pc, lr

