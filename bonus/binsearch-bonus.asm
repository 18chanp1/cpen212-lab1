section .text

global binsearch

;1. lo-rdi, 2. hi-rsi, 3.search key - rdx;
binsearch:
push rsi
pop rax
sub rax, rdi
jb notfound

;Calculate mid;
shr rax, 4
lea rax, [rdi + rax * 8]

cmp [rax],  rdx
je returning

checkSmall:
jbe isLarge
lea rsi, [rax-8]
jmp callBin

isLarge:
lea rdi, [rax+8]

callBin:
call binsearch
returning:
ret

notfound:
xor eax, eax
ret
