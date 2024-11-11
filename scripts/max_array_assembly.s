    .data
array: 
    .word 4, 6, 2, 1, 8, 3, 11, 7

msg: 
    .string "max is -> %d\n"
    .text
    .global main
    .type main, %function

main_:
    push {r4, lr}
    ldr r0,=array @ scrive l'indirizzo dell'array
    ldr r1, [r0] @ primo elemento è massimo
    mov r2, #8 @ size
    mov r3, #1 @ i = 1
loop:
    cmp r3, r2 @ i == size
    beq end
    ldr r4, [r0, r3, lsl #2]
    cmp r1, r4
    blt update_max @ r3 < r12 aggiorna massimo
    add r3, r3, #1
update_max:
    movlt r1, r4
end:
    ldr r0,=msg
    mov r1, r1
    bl printf
    pop {r4, lr}
    mov pc, lr



