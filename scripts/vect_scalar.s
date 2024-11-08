.text
.global vect_scal
.type vect_scal, %function


vact_scalar:
        mov r3, #0 // i = 0 - indice loop
    loop:cmp r3, r2 // i == size
        beq end // se uguali salta a fine
        ldr r12, [r0, r3 lsl #2] // carica l'array
        mul r12, r12, #r1 // moltiplica array[i] con lo scalare passato alla funzione
                        // che è in r2

        str r12, [r0, r3 lsl #2] // carica il nuovo elemento
        add r3, r3, #1 // i++
        b loop
    fine:
        mov pc, lr


    
    

