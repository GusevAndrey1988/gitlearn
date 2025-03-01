.global _start

.section .data
message: .asciz "Hello, World!\n"
len: .quad 15

.section .text
_start:
    movq $message, %rsi
    movq len, %rdx
    movq $1, %rdi
    movq $0x1, %rax
    syscall

    movq $0x3c, %rax
    syscall
