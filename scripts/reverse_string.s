/* function for reversing a given string */
    .data
str1: .string "Danke"
str2: .string "%s"
err: .string "null string"

    
    .text
    .global main 

main:
    push {r4, r5, lr}
    ldr r0,=str1 @ load address of str1
    push {r0}
    bl strlen
    mov r2, r0 @ j = len(str)
    pop {r0}
    mov r1, #0 @ i = 0
    mov r3, r2 @ j stored in r3
    sub r3, r3, #1 @ j - 1
_for:
    cmp r1, r3 @ i > j
    bgt _return
    ldrb r4, [r0, r1] @ load str[i]
    ldrb r5, [r0, r3] @ load str[j]
    strb r4, [r0, r3] @ str[i] = str[j- 1]
    strb r5, [r0, r1] @ str[j - 1] = str[i]
    add r1, r1, #1 @ i++
    sub r3, r3, #1 @ j--
    b _for
_return:
    ldr r0,=str2
    ldr r1,=str1
    bl printf
    pop {r4, r5, lr}
    bx lr
