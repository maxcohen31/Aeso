.text
    .global main
    .extern printf
    .extern atoi
main:
    push {r4-r7, lr}
    mov r4, r0 @ argc
    mov r5, r1 @ argv
    mov r3, #0 @ sum = 0
    mov r2, #1 @ index = 1
    cmp r4, #1 @ argv[0]
    ble no_arg
for:
    cmp r2, r4 @ i == argc 
    bge end
    ldr r0, [r5, r2, lsl #2] @ r0 = argv[r2]
    push {r2, r3, r4, r5} @ save registers before calling atoi
    bl atoi
    pop {r2, r3, r4, r5} @ free the registers
    mov r6, r0 @ save r0 in r6
    and r7, r6, #7 @ argv[i] % 8 
    cmp r7, #0 @ if argv[i] % 8 == 1 then skip
    bne skip
    add r3, r3, r6 @ sum += parsed number
skip:
    add r2, r2, #1 @ i++
    b for
no_arg:
    ldr r0, =str2
    bl printf
    b return
end:
    ldr r0, =str
    mov r1, r3
    bl printf
return:
    pop {r4-r7, lr}
    bx lr

.data
str:   .asciz "somma = %d\n"
str2:  .asciz "Nessun argomento passato\n"






