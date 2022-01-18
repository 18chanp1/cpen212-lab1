STDOUT    equ 1
SYS_write equ 1
SYS_exit  equ 60

extern binsearch

section .text
global _start
_start:
    mov  rdi, lo
    mov  rsi, hi
    mov  rdx, 13
    call binsearch
    cmp  rax, lo + 8*5
    jne  failed
    mov  rdi, lo
    mov  rsi, hi
    mov  rdx, 5
    call binsearch
    cmp  rax, lo + 8*2
    jne  failed
    mov  rdx, plen
    mov  rsi, pmsg
    jmp  end
failed:
    mov  rdx, flen
    mov  rsi, fmsg
    jmp  end
end:
    mov  rax, SYS_write
    mov  rdi, STDOUT
    syscall
    mov  rax, SYS_exit
    mov  rdi, 0
    syscall

lo   dq 2, 4, 5, 6, 9, 13, 16, 17, 19
hi   dq 20
pmsg db "smoketest passed", 10
plen equ $ - pmsg
fmsg db "smoketest failed", 10
flen equ $ - fmsg