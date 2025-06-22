    .text
    .global cerca
    .type   cerca, %function

cerca:
    push {lr}           @ save link register    
    cmp r0, #0          @ root null
    beq _end
    
    ldr r2, [r0]        @ load root->data
    cmp r2, r1
    beq _found
    
    /* recursive calls */
    push {r0, r1} @ save address and x and r2
    ldr r0, [r0, #4] @ r0 = root->left
    bl cerca
    cmp r0, #1 @ compare r0 and 1
    beq _found_cleanup

    pop {r0, r1} @ restore parameters
    ldr r0, [r0, #8] @ root = root->right
    bl cerca
    cmp r0, #1 @ compare r0 and 1
    beq _found
    b _end

_found_cleanup:
    pop {r0, r1} @ clean stack before returning
_found:
    mov r0, #1
    pop {lr}
    bx lr  
_end:
    mov r0, #0
    pop {lr}
    bx lr
