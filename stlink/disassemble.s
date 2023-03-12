
blink.elf：     文件格式 elf32-littlearm


Disassembly of section .text:

08000000 <vector_table>:
 8000000:	00 00 02 20 55 02 00 08 53 02 00 08 51 02 00 08     ... U...S...Q...
 8000010:	51 02 00 08 51 02 00 08 51 02 00 08 00 00 00 00     Q...Q...Q.......
	...
 800002c:	53 02 00 08 53 02 00 08 00 00 00 00 53 02 00 08     S...S.......S...
 800003c:	53 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     S...Q...Q...Q...
 800004c:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...
 800005c:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...
 800006c:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...
 800007c:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...
 800008c:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...
 800009c:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...
 80000ac:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...
 80000bc:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...
 80000cc:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...
 80000dc:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...
 80000ec:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...
 80000fc:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...
 800010c:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...
 800011c:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...
 800012c:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...
 800013c:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...
 800014c:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...
 800015c:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...
 800016c:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...
 800017c:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...
 800018c:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...
 800019c:	51 02 00 08 51 02 00 08 51 02 00 08 51 02 00 08     Q...Q...Q...Q...

080001ac <main>:
	/* Using API functions: */
	gpio_mode_setup(GPIOA, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO8);
}

int main(void)
{
 80001ac:	b510      	push	{r4, lr}
	rcc_periph_clock_enable(RCC_GPIOA);
 80001ae:	f44f 60c0 	mov.w	r0, #1536	; 0x600
 80001b2:	f000 f840 	bl	8000236 <rcc_periph_clock_enable>
	gpio_mode_setup(GPIOA, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO8);
 80001b6:	f44f 7380 	mov.w	r3, #256	; 0x100
 80001ba:	2200      	movs	r2, #0
 80001bc:	2101      	movs	r1, #1
 80001be:	4806      	ldr	r0, [pc, #24]	; (80001d8 <main+0x2c>)
		/* gpio_clear(GPIOA, GPIO5); */	/* LED on */
		/* for (i = 0; i < 1000000; i++) */	/* Wait a bit. */
		/*	__asm__("nop"); */

		/* Using API function gpio_toggle(): */
		gpio_toggle(GPIOA, GPIO8);	/* LED on/off */
 80001c0:	4c05      	ldr	r4, [pc, #20]	; (80001d8 <main+0x2c>)
	gpio_mode_setup(GPIOA, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO8);
 80001c2:	f000 f816 	bl	80001f2 <gpio_mode_setup>
		gpio_toggle(GPIOA, GPIO8);	/* LED on/off */
 80001c6:	f44f 7180 	mov.w	r1, #256	; 0x100
 80001ca:	4620      	mov	r0, r4
 80001cc:	f000 f808 	bl	80001e0 <gpio_toggle>
 80001d0:	4b02      	ldr	r3, [pc, #8]	; (80001dc <main+0x30>)
		for (i = 0; i < 1000000; i++) {	/* Wait a bit. */
 80001d2:	3b01      	subs	r3, #1
 80001d4:	d1fd      	bne.n	80001d2 <main+0x26>
 80001d6:	e7f6      	b.n	80001c6 <main+0x1a>
 80001d8:	40020000 	.word	0x40020000
 80001dc:	000f4240 	.word	0x000f4240

080001e0 <gpio_toggle>:
	     If multiple pins are to be changed, use bitwise OR '|' to separate
	     them.
*/
void gpio_toggle(uint32_t gpioport, uint16_t gpios)
{
	uint32_t port = GPIO_ODR(gpioport);
 80001e0:	6943      	ldr	r3, [r0, #20]
	GPIO_BSRR(gpioport) = ((port & gpios) << 16) | (~port & gpios);
 80001e2:	ea01 0203 	and.w	r2, r1, r3
 80001e6:	ea21 0103 	bic.w	r1, r1, r3
 80001ea:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
 80001ee:	6181      	str	r1, [r0, #24]
}
 80001f0:	4770      	bx	lr

080001f2 <gpio_mode_setup>:
	     If multiple pins are to be set, use bitwise OR '|' to separate
	     them.
*/
void gpio_mode_setup(uint32_t gpioport, uint8_t mode, uint8_t pull_up_down,
		     uint16_t gpios)
{
 80001f2:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}

	/*
	 * We want to set the config only for the pins mentioned in gpios,
	 * but keeping the others, so read out the actual config first.
	 */
	moder = GPIO_MODER(gpioport);
 80001f6:	6805      	ldr	r5, [r0, #0]
	pupd = GPIO_PUPDR(gpioport);
 80001f8:	68c4      	ldr	r4, [r0, #12]
 80001fa:	2600      	movs	r6, #0
	for (i = 0; i < 16; i++) {
		if (!((1 << i) & gpios)) {
			continue;
		}

		moder &= ~GPIO_MODE_MASK(i);
 80001fc:	f04f 0e03 	mov.w	lr, #3
		if (!((1 << i) & gpios)) {
 8000200:	fa43 f706 	asr.w	r7, r3, r6
 8000204:	07ff      	lsls	r7, r7, #31
 8000206:	d50f      	bpl.n	8000228 <gpio_mode_setup+0x36>
		moder &= ~GPIO_MODE_MASK(i);
 8000208:	0077      	lsls	r7, r6, #1
 800020a:	fa0e fc07 	lsl.w	ip, lr, r7
 800020e:	ea6f 0c0c 	mvn.w	ip, ip
		moder |= GPIO_MODE(i, mode);
 8000212:	fa01 f807 	lsl.w	r8, r1, r7
		moder &= ~GPIO_MODE_MASK(i);
 8000216:	ea0c 0505 	and.w	r5, ip, r5
		pupd &= ~GPIO_PUPD_MASK(i);
 800021a:	ea0c 0404 	and.w	r4, ip, r4
		pupd |= GPIO_PUPD(i, pull_up_down);
 800021e:	fa02 f707 	lsl.w	r7, r2, r7
		moder |= GPIO_MODE(i, mode);
 8000222:	ea48 0505 	orr.w	r5, r8, r5
		pupd |= GPIO_PUPD(i, pull_up_down);
 8000226:	433c      	orrs	r4, r7
 8000228:	3601      	adds	r6, #1
	for (i = 0; i < 16; i++) {
 800022a:	2e10      	cmp	r6, #16
 800022c:	d1e8      	bne.n	8000200 <gpio_mode_setup+0xe>
	}

	/* Set mode and pull up/down control registers. */
	GPIO_MODER(gpioport) = moder;
 800022e:	6005      	str	r5, [r0, #0]
	GPIO_PUPDR(gpioport) = pupd;
 8000230:	60c4      	str	r4, [r0, #12]
}
 8000232:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

08000236 <rcc_periph_clock_enable>:
 * For available constants, see #rcc_periph_clken (RCC_UART1 for example)
 */

void rcc_periph_clock_enable(enum rcc_periph_clken clken)
{
	_RCC_REG(clken) |= _RCC_BIT(clken);
 8000236:	0943      	lsrs	r3, r0, #5
 8000238:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
 800023c:	f503 330e 	add.w	r3, r3, #145408	; 0x23800
 8000240:	f000 021f 	and.w	r2, r0, #31
 8000244:	6819      	ldr	r1, [r3, #0]
 8000246:	2001      	movs	r0, #1
 8000248:	4090      	lsls	r0, r2
 800024a:	4308      	orrs	r0, r1
 800024c:	6018      	str	r0, [r3, #0]
}
 800024e:	4770      	bx	lr

08000250 <blocking_handler>:

}

void blocking_handler(void)
{
	while (1);
 8000250:	e7fe      	b.n	8000250 <blocking_handler>

08000252 <null_handler>:
}

void null_handler(void)
{
	/* Do nothing. */
}
 8000252:	4770      	bx	lr

08000254 <reset_handler>:
{
 8000254:	b538      	push	{r3, r4, r5, lr}
	for (src = &_data_loadaddr, dest = &_data;
 8000256:	4a1a      	ldr	r2, [pc, #104]	; (80002c0 <reset_handler+0x6c>)
 8000258:	4b1a      	ldr	r3, [pc, #104]	; (80002c4 <reset_handler+0x70>)
 800025a:	491b      	ldr	r1, [pc, #108]	; (80002c8 <reset_handler+0x74>)
 800025c:	428b      	cmp	r3, r1
 800025e:	d31b      	bcc.n	8000298 <reset_handler+0x44>
	while (dest < &_ebss) {
 8000260:	4a1a      	ldr	r2, [pc, #104]	; (80002cc <reset_handler+0x78>)
		*dest++ = 0;
 8000262:	2100      	movs	r1, #0
	while (dest < &_ebss) {
 8000264:	4293      	cmp	r3, r2
 8000266:	d31c      	bcc.n	80002a2 <reset_handler+0x4e>
	SCB_CCR |= SCB_CCR_STKALIGN;
 8000268:	4a19      	ldr	r2, [pc, #100]	; (80002d0 <reset_handler+0x7c>)
	for (fp = &__preinit_array_start; fp < &__preinit_array_end; fp++) {
 800026a:	4c1a      	ldr	r4, [pc, #104]	; (80002d4 <reset_handler+0x80>)
	SCB_CCR |= SCB_CCR_STKALIGN;
 800026c:	6813      	ldr	r3, [r2, #0]
	for (fp = &__preinit_array_start; fp < &__preinit_array_end; fp++) {
 800026e:	4d1a      	ldr	r5, [pc, #104]	; (80002d8 <reset_handler+0x84>)
	SCB_CCR |= SCB_CCR_STKALIGN;
 8000270:	f443 7300 	orr.w	r3, r3, #512	; 0x200
 8000274:	6013      	str	r3, [r2, #0]
#include <libopencm3/cm3/scb.h>

static void pre_main(void)
{
	/* Enable access to Floating-Point coprocessor. */
	SCB_CPACR |= SCB_CPACR_FULL * (SCB_CPACR_CP10 | SCB_CPACR_CP11);
 8000276:	6f53      	ldr	r3, [r2, #116]	; 0x74
 8000278:	f443 0370 	orr.w	r3, r3, #15728640	; 0xf00000
 800027c:	6753      	str	r3, [r2, #116]	; 0x74
	for (fp = &__preinit_array_start; fp < &__preinit_array_end; fp++) {
 800027e:	42ac      	cmp	r4, r5
 8000280:	d312      	bcc.n	80002a8 <reset_handler+0x54>
	for (fp = &__init_array_start; fp < &__init_array_end; fp++) {
 8000282:	4c16      	ldr	r4, [pc, #88]	; (80002dc <reset_handler+0x88>)
 8000284:	4d16      	ldr	r5, [pc, #88]	; (80002e0 <reset_handler+0x8c>)
 8000286:	42ac      	cmp	r4, r5
 8000288:	d312      	bcc.n	80002b0 <reset_handler+0x5c>
	(void)main();
 800028a:	f7ff ff8f 	bl	80001ac <main>
	for (fp = &__fini_array_start; fp < &__fini_array_end; fp++) {
 800028e:	4c15      	ldr	r4, [pc, #84]	; (80002e4 <reset_handler+0x90>)
 8000290:	4d15      	ldr	r5, [pc, #84]	; (80002e8 <reset_handler+0x94>)
 8000292:	42ac      	cmp	r4, r5
 8000294:	d310      	bcc.n	80002b8 <reset_handler+0x64>
}
 8000296:	bd38      	pop	{r3, r4, r5, pc}
		*dest = *src;
 8000298:	f852 0b04 	ldr.w	r0, [r2], #4
 800029c:	f843 0b04 	str.w	r0, [r3], #4
 80002a0:	e7dc      	b.n	800025c <reset_handler+0x8>
		*dest++ = 0;
 80002a2:	f843 1b04 	str.w	r1, [r3], #4
 80002a6:	e7dd      	b.n	8000264 <reset_handler+0x10>
		(*fp)();
 80002a8:	f854 3b04 	ldr.w	r3, [r4], #4
 80002ac:	4798      	blx	r3
 80002ae:	e7e6      	b.n	800027e <reset_handler+0x2a>
		(*fp)();
 80002b0:	f854 3b04 	ldr.w	r3, [r4], #4
 80002b4:	4798      	blx	r3
 80002b6:	e7e6      	b.n	8000286 <reset_handler+0x32>
		(*fp)();
 80002b8:	f854 3b04 	ldr.w	r3, [r4], #4
 80002bc:	4798      	blx	r3
 80002be:	e7e8      	b.n	8000292 <reset_handler+0x3e>
 80002c0:	080002ec 	.word	0x080002ec
 80002c4:	20000000 	.word	0x20000000
 80002c8:	20000000 	.word	0x20000000
 80002cc:	20000000 	.word	0x20000000
 80002d0:	e000ed14 	.word	0xe000ed14
 80002d4:	080002ec 	.word	0x080002ec
 80002d8:	080002ec 	.word	0x080002ec
 80002dc:	080002ec 	.word	0x080002ec
 80002e0:	080002ec 	.word	0x080002ec
 80002e4:	080002ec 	.word	0x080002ec
 80002e8:	080002ec 	.word	0x080002ec
