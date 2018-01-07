.section .text
  .globl _start

_start:
  movq $1, %rax   # sys_exit
  movq $42, %rbx  # param 1 : return value
  int $0x80       # system call
