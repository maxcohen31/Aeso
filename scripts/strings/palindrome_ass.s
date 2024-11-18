    .text 
    .global is_palindrome 
    .type is_palindrome, %function @; r0: indice stringa is_palindrome:

is_palindrome:
    push {r4, r5, r6, r7, lr}
    cmp r0, #0 @; null string?
    moveq pc, lr @; exit
    mov r1, r0 @; inizio stringa
    mov r2, #0 @; c = 0
    @; calcola la lunghezza della stringa
length:
    ldrb r3, [r1], #1 @; leggo str[i]
    cmp r3, #0 @; array[i] == '\0'
    beq save_indexes
    add r2, r2, #1 @; c++
    b length
save_indexes:
    @; salvo gli indici trovati
    mov r4, r0 @; r4 punta all'inizio della stringa
    sub r5, r1, #2 @; r5 punta all'ultimo carattere 
    @;mov r5, r1
check:
    @; while loop (i < j)
    cmp r4, r5 @; controllo str[i] e str[j]
    bgt true @; gli indici si sono incrociati -> la stringa è palindroma
    ldrb r6, [r4], #1 @; carica str[i]
    ldrb r7, [r5], #-1 @; carica str[strlen(str) - 1 - i]
    cmp r6, r7
    bne false @; caratteri diversi -> stringa non palindroma
    b check
true:
    mov r0, #1
    pop {r4, r5, r6, r7, lr}
    mov pc, lr
false:
    mov r0, #0
    pop {r4, r5, r6, r7, lr}
    mov pc, lr

     

