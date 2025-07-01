.text
.global somma
.type somma, %function
somma:
    cmp r0, #0
    beq _base_case
    
    ldr r1, [r0]           @ r1 = root->val
    mov r4, r0             @ save root address in r4
    
    push {r1, r4, lr}      @ save val, root and lr
    ldr r0, [r4, #4]       @ r0 = root->left
    bl somma
    pop {r1, r4, lr}       @ restore val, root and lr
    mov r2, r0             @ save result in r2 
    
    push {r1, r2, lr}      @ save val, left_sum and lr
    ldr r0, [r4, #8]       @ r0 = root->right
    bl somma
    pop {r1, r2, lr}       @ restore val, left_sum and lr
    mov r3, r0             @ save result of root->right in r3
    
    add r0, r1, r2         @ r0 = root->val + left_sum
    add r0, r0, r3         @ r0 += right_sum
    bx lr

_base_case:
    mov r0, #0
    bx lr
