.text
.global rec_exp
.type rec_exp, %function

/* Calcola la potenza di un numero ricorsivamente */
/* r0 = base; r1 = esp */

rec_exp:
    /* caso base */
    cmp r1, #0
    beq _return

    /* ricorsione: base * rec_exp(base, pow - 1) */
    sub r1, r1, #1 /* r1 = pow - 1 */
    push {r0, r1, lr} /* salvo r0, r1, lr */
    bl rec_exp /* chiama rec_exp(base, pow - 1). Risultato in r0 */
    pop {r2, r3, lr} /* ripristina base in r2 e pow - 1 in r3 */
    mul r0, r0, r2 /* salvo in r0 il risultato di base * rec_exp(base, pow - 1) */
    mov pc, lr
    
_return:
    mov r0, #1
    mov pc, lr
