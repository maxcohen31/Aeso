    .text
    .global addDistinct
    .type addDistinct, %function

addDistinct:
    cmp r0, #0             @ se L1 (r0) == NULL, salta alla fine
    beq _end    
    cmp r1, #0             @ se L2 (r1) == NULL, salta alla fine
    beq _end
    
    push {r4-r7, lr}       
    mov r4, r0             @ r4 = L1
    mov r5, r1             @ r5 = L2

_loop:
    cmp r5, #0             @ se L2 == NULL, esco dal ciclo
    beq _end_loop
    
    ldr r6, [r5]           @ r6 = valore del nodo corrente L2
    push {r0-r3}           @ salvo i registri che verranno modificati
    mov r0, r4             @ primo parametro: puntatore alla lista L1
    mov r1, r6             @ secondo parametro: valore da cercare in L1
    bl check               @ chiamata a check(L1, valore)
    mov r12, r0            @ salvo il risultato in un registro sicuro
    pop {r0-r3}            @ ripristino r0-r3 originali 
    cmp r12, #0            @ se check restituisce 0 (non trovato), aggiungo
    beq _add               
    ldr r5, [r5, #4]       @ L2 = L2->next
    b _loop
_add:
    mov r7, r5             @ r7 = nodo corrente da aggiungere -> puntatore a L2->value
    ldr r5, [r5, #4]       @ avanzo L2 PRIMA di modificare `next`
    str r4, [r7, #4]       @ nodo->next = vecchia testa L1. str r4, [r7] scriverebbe un puntatore nel campo value di L1 
    mov r4, r7             @ aggiorno L1: nuovo nodo in testa
    b _loop
_end_loop:
    mov r0, r4             
    pop {r4-r7, lr}        
_end:
    mov pc, lr             

