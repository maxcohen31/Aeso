.text
.global match
.type match, %function

match:
    push {r4-r7, lr}
    cmp r0, #0 @ se stringa nulla, esci
    beq return_zero
    mov r1, #0 @ i = 0
    mov r2, #0 @ contatore match
loop:
    ldrb r3, [r0, r1]   @ carica s[i]
    cmp r3, #0 @ fine stringa?
    beq done
    cmp r3, #97 @ s[i] == 'a' ?
    bne next_char
    add r4, r1, #1 @ r4 = i+1
    ldrb r5, [r0, r4] @ s[i+1]
    cmp r5, #98
    bne next_char @ deve esserci almeno una 'b'
check_b:
    ldrb r5, [r0, r4]
    cmp r5, #97
    bne check_final_a
    add r4, r4, #1
    b check_b
check_final_a:
    ldrb r5, [r0, r4]
    cmp r5, #98
    bne next_char @ pattern non valido
    add r2, r2, #1 @ pattern valido trovato
next_char:
    add r1, r1, #1 @ i++
    b loop
done:
    mov r0, r2 @ restituisci numero di match trovati
    pop {r4-r7, lr}
    bx lr
return_zero:
    mov r0, #0
    pop {r4-r7, lr}
    bx lr

