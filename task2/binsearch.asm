section .text

global binsearch

;1. lo-rdi, 2. hi-rsi, 3.search key - rdx;
binsearch:
;Termination condition;
mov r10, rdi
add r10, 8
cmp rsi, r10
jb notfound
mov r10, rsi
sub r10, rdi
shr r10, 4
sal r10, 3
add r10, rdi

cmp [r10],  rdx
jne checkSmall
mov rax, r10
ret

checkSmall:
jbe isLarge
sub r10, 8
mov rsi, r10
call binsearch
ret

isLarge:
add r10, 8
mov rdi, r10
call binsearch
ret

notfound:
mov rax, 0
ret
