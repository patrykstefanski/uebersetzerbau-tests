.global test
test:


#MINUSEXPR
 #%r8 := %rdi
movq %rdi, %r8

 neg %r8

#PLUSEXPR %r9 = %rdx + %r8
#%r9 := %r8
movq %r8, %r9

addq %rdx, %r9 

#READEXPR
movq (%rcx), %r8 # %r8 := *%rcx

#MULTEXPR %r10 = %r9 * %r8
movq %r8, %rax
imulq %r9, %rax 
movq %rax, %r10

#MULTEXPR %r8 = %rsi * %r10
movq %r10, %rax
imulq %rsi, %rax 
movq %rax, %r8

movq %r8, %rax 
ret


