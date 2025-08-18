    .text 
    .global swapTree
    .type swapTree, %function 

@ r0 -> root address

swapTree:
    cmp     r0, #0          @ check if root == NULL
    beq     _end

    ldr     r1, [r0, #4]    @ load root->sx
    ldr     r2, [r0, #8]    @ load root->dx

    str     r2, [r0, #4]    @ root->sx = r2
    str     r1, [r0, #8]    @ root->dx = r1

    push    {r2, lr}        @ save r2 and lr on the stack
    mov     r0, r1          @ r0 = left child
    bl      swapTree        @ recursive call on left subtree
    pop     {r2, lr}        @ restore r2 and lr

    push    {r1, lr}        @ not necessary to save r1, only lr is needed
    mov     r0, r2          @ r0 = right child
    bl      swapTree        @ recursive call on right subtree
    pop     {r1, lr}        @ restore r1 and lr (r1 unused)

    bx      lr              @ return
    
_end:
    bx      lr              @ return if root == NULL
