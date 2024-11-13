@; prodotto scalare tra vettori

    .data
x: .word 1, 2 ,3, 4, 5, 6, 7, 8
y: .word 8, 7, 6, 5, 4, 3, 2, 1
n: .word 8 @; size
msg: 
    .string "Il risultato è %d\n"

    .text
    .global main
    .type main, %function

main:
    ldr r0,=x @; carico indirizzo x
    ldr r1,=y @; carico indirizzo y
    ldr r2,=n @; carico indirizo size
    ldr r2, [r2] @; ora ne prendo il valore
    push {lr}
    bl ip
    mov r1, r0 @; in r0 ci va la printf quindi spostiamo r0
    ldr r0,=msg
    bl printf
    mov r0, #0
    pop {lr}
    mov pc, lr
    

