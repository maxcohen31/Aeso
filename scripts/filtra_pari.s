.text
.global main
.extern printf

main:
    push {r4, r5, r6, r7, r8, lr}
    ldr r0,=array         @ r0 = &array
    ldr r1,=n
    ldr r8, [r1]          @ r8 = n (valore), uso r8 per NON perderlo
    mov r2, #0            @ i = 0
    mov r12, #0           @ valore da scrivere se pari
    mov r4, r0            @ salvo base dell'array
    ldr r7,=str1          @ formato stampa

_loop:
    cmp r2, r8            @ i >= n?
    bge print_array
    ldr r3, [r4, r2, lsl #2] @ array[i]
    and r5, r3, #1        @ controlla se pari/dispari
    bne _skip             @ salta se dispari (bit LSB = 1)
    str r12, [r4, r2, lsl #2] @ array[i] = 0 se pari
_skip:
    add r2, r2, #1
    b _loop

print_array:
    mov r2, #0            @ reset indice per stampa

print_loop:
    cmp r2, r8            @ i >= n?
    bge _end
    ldr r0,=str1            @ formato "%d -> "
    ldr r1, [r4, r2, lsl #2] @ array[i]
    bl printf
    add r2, r2, #1        @ incrementa indice
    b print_loop

_end:
    pop {r4, r5, r6, r7, r8, lr}
    bx lr

.data
array:  .word 1, 2, 3, 4, 5, 6
n:      .word 6
str1:   .asciz "%d -> "

