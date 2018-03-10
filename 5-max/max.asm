.section .data
  list: .long 15,12,3,54,212,45,78,12,0

.section .text
  .globl _start

_start:
  .type _start, @function
  leaq list, %rax
  pushq %rax
  call max
  call exit
  ret

max:
  # @function max
  # param:1 list address
  pushq %rbp
  movq %rsp, %rbp

  # 0(%rbp)  : saved value
  # 8(%rbp)  : return address
  # 16(%rbp) : first parameter

  movq 16(%rbp), %rax
  pushq %rax           # push max_aux parameter 2 : list address to stack

  xorq %rbx, %rbx
  movl (%rax), %ebx
  pushq (%rbx)         # push max_aux parameter 1 : current maximum
  call max_aux
  movq %rbp, %rsp
  popq %rbp
  ret

max_aux:
  pushq %rbp
  movq %rsp, %rbp

  movq 24(%rbp), %rax  # next elem address
  cmpl (%rax), $0
  je max_aux_end

  cmpl (%rax), 16(%rbp)

  # max_aux parameter 2
  movq 24(%rbp), %rbx
  addq $4, %rbx
  pushq %rbx

  jng not_greater

greater:
  # max aux parameter 1
  pushq (%rax)
  jmp max_aux_end

not_greater:
  # max aux parameter 1
  pushq 16(%rbp)

max_aux_end:
  movq 16(%rbp), %rax
  movq %rbp, %rsp
  popq %rbp
  ret


exit:
  movq %rax, %rbx
  movq $1, %rax
  int $0x80
