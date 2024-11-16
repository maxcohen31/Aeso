    .text
    .global merge
    .type merge, %function

    @; r0 indirizzo prima lista
    @; r1 indirizzo seconda lista

merge:
    cmp r0, #0 @; lista nulla?
    moveq r0, r1
    moveq pc, lr
    cmp r1, #0 @; seconda lista nulla?
    moveq pc, lr
    @; se nessuna delle due liste è vuota dobbiamo scorrere la prima
    @; fino all'ultimo elemento ma tenendo da parte il puntatore al primo elemento
    mov r2, r0  
loop:
    cmp r2, #0 @; prima lista vuota?
    beq end
    mov r3, r2 @; r3 elemento precedente
    ldr r2, [r2, #4] @; contiene elemento succesivo
    b loop 
end:
    str r1, [r3, #4]
    mov pc, lr
    

