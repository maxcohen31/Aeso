.text
.global star_string
.type star_string, %function

star_string:
    // if (n == 0) return "*"
    cmp r0, #0
    beq _base_case

    // return concat(start_string(n-1), star_string(n-1))    
    push {r0, lr}  // save r0
    sub r0, r0, #1 // n - 1
    bl star_string
    mov r1, r0     // save result in r1
    mov r2, r0     // since the callings are the same i avoid calling the function twice
    pop {r0, lr}   // restore n

    // calling concat(star_string(n-1), star_string(n-1))
    push {lr} // preserving the caller return address
    mov r0, r1
    mov r1, r2
    bl _concat
    pop {lr}
    mov pc, lr

/* Takes in two strings and perform concatenation */
_concat:
    push {r4-r8, lr}
    mov r4, r0 // save the address of the first string
    mov r5, r1 // save the address of the second string
    
    bl strlen 
    mov r6, r0 // len of first string
    mov r0, r5
    bl strlen // len of second string
    mov r7, r0 

    // calling malloc
    add r0, r6, r7
    add r0, r0, #1
    bl malloc // malloc(len1 + len2 + 1)

    mov r8, r0 // save pointer to res string

    mov r0, r8
    mov r1, r4
    mov r2, r6
    bl memcpy

    add r0, r8, r6
    mov r1, r5
    add r2, r7, #1
    bl memcpy

    mov r0, r8
    pop {r4-r8, lr}
    mov pc, lr
 
_base_case:
    ldr r0,=_star
    mov pc, lr

.data
_star:
    .asciz "*"
