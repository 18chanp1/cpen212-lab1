section .text

global binsearch

;1. lo-rdi, 2. hi-rsi, 3.search key - rdx;
binsearch:
cmp rsi, rdi
jb notfound

;Calculate mid;
push rsi
pop rax
sub rax, rdi
shr rax, 4
sal rax, 3
add rax, rdi



cmp [rax],  rdx
jne checkSmall
ret

checkSmall:
jbe isLarge
sub eax, 8
push rax
pop rsi
call binsearch
ret

isLarge:
add eax, 8
push rax
pop rdi
call binsearch
ret

notfound:
xor rax, rax
ret
