	global _start

	section .text
_start:
	xor r8, r8
	push r8w	;push null-termination byte onto stack

	xor r9, r9
	;; these blocks below are where things get a little weird
	;; we're building 0x400000 into a register via muls so we can address the memory later
	mov al, 0x5
	add r10w, 0xa3d7
	mul r10d
	mov r10, rax
	xor rax, rax
	mov al, 0x4
	mul r10d
	mov r10, rax
	inc r10d
	xor rax, rax
	mov al, 0x5
	mul r10d
	mov r10, rax

	;; grab the F-byte of ELF or thereabouts, et cetra
	mov r8w, [r10+2]
	push r8w
	mov r8w, [r10]
	push r8w

	;; get ready to print our string that's ELF\0 from the stack into the terminal
	xor rax, rax
	inc rax
	mov rdi, rax

	mov rsi, rsp
	xor rdx, rdx
	add rdx, 3
	syscall

	;; finish the program, exit syscall
	xor rax, rax
	add rax, 60
	xor rdi, rdi
	syscall
