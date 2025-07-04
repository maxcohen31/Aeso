    .text
    .global bernstein
    .type bernstein, %function
    .extern printf


/* r0: read/write instr1 */
/* r1: read/write instr2 */

bernstein:
    cmp r0, #0 @ null instr1
    beq _end
    cmp r1, #0 @ null instr2
    beq _end
    push {r4, r5, r6, r7, r8, r9, lr}

    lsr r2, r0, #16 @ get the most significant bits - read instr1
    ldr r6,=0xFFFF @ we could have used lsl for saving the least significant bits
    and r3, r0, r6 @ get the least significant bits - write instr1
    lsr r4, r1, #16 @ get the most significant bits - read instr2
    ldr r7,=0xFFFF
    and r5, r1, r7 @ get the least significant bits - write instr2

    /* testing the conditions */
    /* write1 & read2 == 0 */
    and r6, r3, r4 
    cmp r6, #0
    bne _not_satisfied

    /* write2 & read1 == 0 */
    and r7, r5, r2
    cmp r7, #0
    bne _not_satisfied

    /* write1 & write2 == 0 */
    and r12, r3, r5
    cmp r12, #0
    bne _not_satisfied

    pop {r4-r9, lr}
    mov r0, #1
    mov pc, lr

_not_satisfied:
    pop {r4-r9, lr}
    mov r0, #0
    mov pc, lr
_end:
    ldr r0,=msg
    bl printf 
    mov pc, lr

    .data
msg: .asciz "Null instructions"


