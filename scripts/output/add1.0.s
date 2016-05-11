.global test
test:


#CONSTTERM
movq $7, %rdi # %rdi := (const) 7

#CONSTTERM
movq $9, %rsi # %rsi := (const) 9

#TERM2EXPR %rax = %rsi
movq %rsi, %rax

#PLUSEXPR %rax = %rdi + %rax
addq %rdi, %rax

ret #RETURN expr -> do nothing as expr results are always in rax

