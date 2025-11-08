    .text
    .global concat
    .type concat, %function

@ r0: string1
@ r1: string2
@ r2: result

concat:
    push {r4, r5, r6, r7, lr}
    mov r3, #0 @ i = 0
    cmp r0, #0 @ string1 null
    beq _copia_string2
    cmp r1, #0 @ string2 null
    beq _copia_string1
    
    mov r4, r0 @ save r0
    mov r5, r1 @ save r1

_loop1:
    ldrb r6, [r0, r3] @ carica string1[i]
    strb r6, [r2, r3] @ result[i] = string1[i]
    cmp r6, #0 @ è carattetere nullo?
    beq _start_loop2
    add r3, r3, #1 @ i++
    b _loop1
_start_loop2:
    mov r12, #0 @ j = 0 per string2
_loop2:
    ldrb r7, [r1, r12] @ carica string2[j]
    strb r7, [r2, r3] @ result[i] = string2[j] - r3 è uguale alla lunghezza di string1
    cmp r7, #0 @ è carattere nullo?
    beq _done
    add r12, r12, #1 @ j++
    add r3, r3, #1
    b _loop2
_done:
    pop {r4, r5, r6, r7, lr}
    mov pc, lr

_copia_string1:
    ldrb r12, [r0, r3] @ carica string1[i]
    strb r12, [r2, r3] @ result[i] = string1[i]
    cmp r12, #0 @ è '\0'?
    add r3, r3, #1
    bne _copia_string1
    pop {r4, r5, r6, r7, lr}

_copia_string2:
    ldrb r12, [r1, r3] @ carica string2[i]
    strb r12, [r2, r3] @ result[i] = string2[i]
    cmp r12, #0 @ è '\0'?
    add r3, r3, #1
    bne _copia_string2
    pop {r4, r5, r6, r7, lr}
    
