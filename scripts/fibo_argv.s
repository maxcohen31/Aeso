.text
.global main
.type main, %function

/* Calcola l'ennesimo numero di Fibonacci con n passato dalla riga di camndo */

main:
    push {lr} /* main non è un a funzione foglia: devo salvare il link register */
    cmp r0, #2 /* argc != 2 */
    bne _exit

    ldr r2, [r1, #4] /* carica argv[1] */
    mov r0, r2 /* sposto argv[1] in r0 */
    bl atoi /* chiama atoi(argv[1]) */
    push {r0} /* salvo n */
    bl fibo /* chiamata a fibo(atoi(argv[1])) */
    mov r2, r0 /* salvo il risultato della chiamata */
    pop {r1} /* r1 = n */
    
    ldr r0,=_string
    bl printf
     
    pop {lr}
    mov pc, lr
    
fibo:
    cmp r0, #1
    movle pc, lr /* caso base: ritorna se n <= 1 */
    /* fibo(n-1) + fibo(n-2) */
    sub r0, r0, #1 /* r0 = n - 1 */
    push {r0, lr} /* salvo r0 = n - 1 e lr */
    bl fibo /* fibo(n-1) */
    pop {r1, lr} /* r1 = n - 1 */
    push {r0, lr} /* salva il risultato di fibo(n-1) */
    sub r0, r1, #1 /* r0 = n - 2*/
    bl fibo /* fibo(n-2) */
    pop {r1, lr} /* in r1 ho il risultato di fibo(n - 1)*/
    add r0, r0, r1 /* scrivo in r0 fibo(n-1) + fibo(n-2) */
    mov pc, lr

_exit:
    pop {pc}

.data
_string:
    .string "Fibonacci(%d) is equal to: %d\n"
