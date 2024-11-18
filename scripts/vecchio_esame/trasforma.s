    .text
    .global trasforma
    .type trasforma , %function

@ trasforma(char *s , char * from , char * to, int N)
@               r0        r1             r2      r3

trasforma:
    push {r4, r5, r6, r7, lr}
    cmp r0, #0 @; stringa nulla? 
    beq fine
    mov r4, #0 @; i = 0
    mov r5, r0
loop:
    cmp r4, r3 @; i == N
    beq end
    ldrb r6, [r5, r4] @; legge il primo carattere di s
    ldrb r7, [r1, r4] @; legge primo carattere di from
    cmp r5, r6
    bl cambia
    add r4, r4, #1
    b loop
end:
    pop {r4, r5, r6, r7, lr}
    mov pc, lr
