.section .data
  message: .string "Hello World!\n"

.section .text
  .globl _start

_start:
  .type _start, @function
  leaq message, %rax
  call print_message
  call exit
  ret

print_message:
  .type print_message, @function
  pushq %rax
  call len
  movq %rax, %rdx                             #message length
  popq %rax
  movq %rax, %rcx                             #message to write
  movq $1, %rbx                              #file descriptor (stdout)
  movq $4, %rax                           #system call number (sys_write)
  int $0x80
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
