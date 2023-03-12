	.arch armv8-a
	.file	"SimpleSection.c"
	.text
	.global	global_init_var
	.data
	.align	2
	.type	global_init_var, %object
	.size	global_init_var, 4
global_init_var:
	.word	84
	.global	global_uninit_var
	.bss
	.align	2
	.type	global_uninit_var, %object
	.size	global_uninit_var, 4
global_uninit_var:
	.zero	4
	.section	.rodata
	.align	3
.LC0:
	.string	"%d\n"
	.text
	.align	2
	.global	func1
	.type	func1, %function
func1:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w1, [sp, 28]
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	func1, .-func1
	.align	2
	.global	main
	.type	main, %function
main:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	mov	w0, 1
	str	w0, [sp, 28]
	adrp	x0, static_var.1
	add	x0, x0, :lo12:static_var.1
	ldr	w1, [x0]
	adrp	x0, static_var2.0
	add	x0, x0, :lo12:static_var2.0
	ldr	w0, [x0]
	add	w1, w1, w0
	ldr	w0, [sp, 28]
	add	w1, w1, w0
	ldr	w0, [sp, 24]
	add	w0, w1, w0
	bl	func1
	ldr	w0, [sp, 28]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.data
	.align	2
	.type	static_var.1, %object
	.size	static_var.1, 4
static_var.1:
	.word	85
	.local	static_var2.0
	.comm	static_var2.0,4,4
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
