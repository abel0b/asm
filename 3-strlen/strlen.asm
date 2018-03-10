.section .data
  message: .string "Hello"

.section .text
  .globl _start

_start:
  .type _start, @function
  leaq message, %rax
  call len
  call exit
  ret

len:
  .type len, @function
  movq %rax, %rsi
  movq $0, %rax
  call len_aux
  ret

len_aux:
  .type len_aux, @function
  cmpb $0, (%rsi, %rax)
  je end_len_aux
  incq %rax
  jne len_aux

end_len_aux:
  ret

exit:
  movq %rax, %rbx
  movq $1, %rax
  int $0x80
