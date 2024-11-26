.section .data
    _parent: .ascii "parent process\n"
    _ls_path: .ascii "/usr/bin/ls\0"

.section .text
.globl _start

# this function writes a message on stderr
# Arguments:
#   %rsi: address to the buffer containing the message
#   %rdx: size of the buffer in bytes
_print:
    movq $1, %rax # write syscall number is 1
    movq $2, %rdi # stdout fd is 1
    syscall
    retq

# Executes ls process by invoking execve syscall
_exec_ls:
    movq $0x3b, %rax # execve syscall number
    movq $_ls_path, %rdi # path to ls
    movq $0, %rsi # argv is NULL
    movq $0, %rdx # envp is NULL
    syscall
    retq

_start:
    movq $0x39, %rax # fork syscall number
    syscall
    cmpq $0, %rax # check the return value
    jz _handle_child
    movq $_parent, %rsi # buffer address
    movq $15, %rdx # length of buffer
    callq _print
    jmp _exit # exit

    _handle_child:
        callq _exec_ls
    
    _exit:
        movq $60,%rax # exit syscall number is 60
        xorq %rdi, %rdi # exit with 0
        syscall


