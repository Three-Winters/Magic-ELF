	global _start

	section .text
_start:
	xor r8, r8
	push r8w

	xor r9, r9
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
	
	mov r8w, [r10+2]
	push r8w
	mov r8w, [r10]
	push r8w
	
	xor rax, rax
	inc rax
	mov rdi, rax

	mov rsi, rsp
	xor rdx, rdx
	add rdx, 3
	syscall

	xor rax, rax
	add rax, 60
	xor rdi, rdi
	syscall
