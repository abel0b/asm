.section .data
  term: .quad 8

.section .text
  .globl _start

_start:
  .type _start, @function
  xorq %rax, %rax
  movq term, %rax
  call fibonacci
  call exit
  ret

fibonacci:
  .type fibonacci, @function
  movq %rax, %r8
  movq $0, %rax
  movq $1, %rbx
  movq $1, %rcx
  call fibonacci_aux
  movq %rbx, %rax
  ret

fibonacci_aux:
  .type fibonacci_aux, @function
  xorq %rdx, %rdx
  movq %rbx, %rdx
  addq %rax, %rbx
  movq %rdx, %rax

  incq %rcx
  cmpq %rcx, %r8
  jne fibonacci_aux
  ret

exit:
  .type exit, @function
  movq %rax, %rbx
  movq $1, %rax
  int $0x80
