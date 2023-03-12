	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"SimpleSection.c"
	.text
	.global	global_init_var
	.data
	.align	2
	.type	global_init_var, %object
	.size	global_init_var, 4
global_init_var:
	.word	84
	.comm	global_uninit_var,4,4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d\012\000"
	.text
	.align	2
	.global	func1
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	func1, %function
func1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r1, [fp, #-8]
	ldr	r0, .L2
	bl	printf
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LC0
	.size	func1, .-func1
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #1
	str	r3, [fp, #-8]
	ldr	r3, .L6
	ldr	r2, [r3]
	ldr	r3, .L6+4
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	mov	r0, r3
	bl	func1
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	static_var.4197
	.word	static_var2.4198
	.size	main, .-main
	.data
	.align	2
	.type	static_var.4197, %object
	.size	static_var.4197, 4
static_var.4197:
	.word	85
	.bss
	.align	2
static_var2.4198:
	.space	4
	.size	static_var2.4198, 4
	.ident	"GCC: (15:8-2019-q3-1+b1) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"
