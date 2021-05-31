	      .intel_syntax noprefix
              .global my_memcmp

              .section .text

my_memcmp:
              cmp   rdx, 0
              jg    label
              mov   rax, 0
              ret
label:
              mov   al, [rsi]
              cmp   [rdi], al
              jne   label2
              dec   rdx
              cmp   rdx, 0
              je    my_memcmp
              add   rdi, 1
              add   rsi, 1
              jmp   label
label2:
              mov   al, [rsi]
              sub   al, [rdi]
              neg   al
              movsx rax, al
              ret
