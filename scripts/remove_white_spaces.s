    .text
    .global removeSpace
    .type removeSpace, %function

@ r0 = base address of string

removeSpace:
    cmp r0, #0
    beq _end

    mov r1, #0          @ i = 0 (read index)
    mov r2, #0          @ j = 0 (write index)

_loop:
    ldrb r3, [r0, r1]    @ r3 = string[i]
    cmp r3, #0           @ end of string?
    beq _done

    cmp r3, #32          @ is space?
    beq _skip

    strb r3, [r0, r2]    @ string[j] = string[i]
    add r2, r2, #1       @ j++

_skip:
    add r1, r1, #1       @ i++
    b _loop

_done:
    mov r3, #0
    strb r3, [r0, r2]    @ terminate string
    mov pc, lr

_end:
    mov pc, lr

