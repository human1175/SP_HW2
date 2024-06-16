	.file	"hw2.c"
	.text
	.type	convolution, @function
convolution:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -88(%rbp)
	movl	%esi, -92(%rbp)
	movl	%edx, -96(%rbp)
	movl	%ecx, -100(%rbp)
	movl	%r8d, -104(%rbp)
	movq	%r9, -112(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -32(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -16(%rbp)
	movl	$3, -52(%rbp)
	movl	-52(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -48(%rbp)
	movl	$0, -64(%rbp)
	movl	-48(%rbp), %eax
	negl	%eax
	movl	%eax, -60(%rbp)
	jmp	.L2
.L6:
	movl	-48(%rbp), %eax
	negl	%eax
	movl	%eax, -56(%rbp)
	jmp	.L3
.L5:
	movl	-92(%rbp), %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -44(%rbp)
	movl	-96(%rbp), %edx
	movl	-60(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -40(%rbp)
	cmpl	$0, -44(%rbp)
	js	.L4
	movl	-44(%rbp), %eax
	cmpl	-100(%rbp), %eax
	jge	.L4
	cmpl	$0, -40(%rbp)
	js	.L4
	movl	-40(%rbp), %eax
	cmpl	-104(%rbp), %eax
	jge	.L4
	movl	-40(%rbp), %eax
	imull	-100(%rbp), %eax
	movl	%eax, %edx
	movl	-44(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movss	%xmm0, -36(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	cvtsi2ssl	%eax, %xmm0
	mulss	-36(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	-32(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movq	-8(%rbp), %rax
	movzbl	1(%rax), %eax
	movzbl	%al, %eax
	cvtsi2ssl	%eax, %xmm0
	mulss	-36(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	-24(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	movq	-8(%rbp), %rax
	movzbl	2(%rax), %eax
	movzbl	%al, %eax
	cvtsi2ssl	%eax, %xmm0
	mulss	-36(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	-16(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
.L4:
	addl	$1, -64(%rbp)
	addl	$1, -56(%rbp)
.L3:
	movl	-56(%rbp), %eax
	cmpl	-48(%rbp), %eax
	jle	.L5
	addl	$1, -60(%rbp)
.L2:
	movl	-60(%rbp), %eax
	cmpl	-48(%rbp), %eax
	jle	.L6
	pxor	%xmm0, %xmm0
	comisd	-32(%rbp), %xmm0
	jbe	.L32
	movl	$0, %eax
	jmp	.L9
.L32:
	movsd	-32(%rbp), %xmm0
	comisd	.LC1(%rip), %xmm0
	jbe	.L33
	movl	$-1, %eax
	jmp	.L9
.L33:
	cvttsd2sil	-32(%rbp), %eax
.L9:
	movb	%al, -70(%rbp)
	pxor	%xmm0, %xmm0
	comisd	-24(%rbp), %xmm0
	jbe	.L34
	movl	$0, %eax
	jmp	.L15
.L34:
	movsd	-24(%rbp), %xmm0
	comisd	.LC1(%rip), %xmm0
	jbe	.L35
	movl	$-1, %eax
	jmp	.L15
.L35:
	cvttsd2sil	-24(%rbp), %eax
.L15:
	movb	%al, -69(%rbp)
	pxor	%xmm0, %xmm0
	comisd	-16(%rbp), %xmm0
	jbe	.L36
	movl	$0, %eax
	jmp	.L21
.L36:
	movsd	-16(%rbp), %xmm0
	comisd	.LC1(%rip), %xmm0
	jbe	.L37
	movl	$-1, %eax
	jmp	.L21
.L37:
	cvttsd2sil	-16(%rbp), %eax
.L21:
	movb	%al, -68(%rbp)
	movzwl	-70(%rbp), %eax
	movw	%ax, -67(%rbp)
	movzbl	-68(%rbp), %eax
	movb	%al, -65(%rbp)
	movl	$0, %eax
	movzwl	-67(%rbp), %edx
	movzwl	%dx, %edx
	movw	$0, %ax
	orq	%rdx, %rax
	movzbl	-65(%rbp), %edx
	movzbl	%dl, %edx
	salq	$16, %rdx
	andq	$-16711681, %rax
	orq	%rdx, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	convolution, .-convolution
	.globl	filter_optimized
	.type	filter_optimized, @function
filter_optimized:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %eax
	movl	%eax, -40(%rbp)
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movl	(%rax), %eax
	movl	%eax, -36(%rbp)
	movq	-64(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-64(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-64(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -16(%rbp)
	movl	$0, -48(%rbp)
	jmp	.L39
.L42:
	movl	$0, -44(%rbp)
	jmp	.L40
.L41:
	movl	-36(%rbp), %edi
	movl	-40(%rbp), %ecx
	movl	-48(%rbp), %eax
	imull	-40(%rbp), %eax
	movl	%eax, %edx
	movl	-44(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	-16(%rbp), %r8
	movl	-48(%rbp), %edx
	movl	-44(%rbp), %esi
	movq	-32(%rbp), %rax
	movq	%r8, %r9
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	convolution
	cltq
	movb	%al, (%rbx)
	movzbl	%ah, %edx
	movb	%dl, 1(%rbx)
	shrq	$16, %rax
	andb	$-1, %ah
	movb	%al, 2(%rbx)
	addl	$1, -44(%rbp)
.L40:
	movl	-44(%rbp), %eax
	cmpl	%eax, -40(%rbp)
	ja	.L41
	addl	$1, -48(%rbp)
.L39:
	movl	-48(%rbp), %eax
	cmpl	%eax, -36(%rbp)
	ja	.L42
	nop
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	filter_optimized, .-filter_optimized
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1081073664
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
