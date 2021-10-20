
.//Obj/W806.elf:     file format elf32-csky-little


Disassembly of section .text:

08010400 <__Vectors>:
 8010400:	00 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010410:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010420:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010430:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010440:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010450:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010460:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010470:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010480:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010490:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104a0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104b0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104c0:	d0 05 01 08 bc 20 01 08 d0 05 01 08 d0 05 01 08     ..... ..........
 80104d0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104e0:	d0 05 01 08 88 20 01 08 d0 05 01 08 d0 05 01 08     ..... ..........
 80104f0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................

08010500 <Reset_Handler>:
    .align  2
    .globl  Reset_Handler
    .type   Reset_Handler, %function
Reset_Handler:
#ifdef CONFIG_KERNEL_NONE
    lrw     r0, 0xe0000200
 8010500:	1019      	lrw      	r0, 0xe0000200	// 8010564 <__exit+0x4>
#else
    lrw     r0, 0x80000200
    mtcr    r0, psr
#endif
    mtcr    r0, psr
 8010502:	c0006420 	mtcr      	r0, cr<0, 0>

    lrw     r0, g_top_irqstack
 8010506:	1019      	lrw      	r0, 0x20001160	// 8010568 <__exit+0x8>
    mov     sp, r0
 8010508:	6f83      	mov      	r14, r0

/*
 *	move __Vectors to irq_vectors
 */
    lrw     r1, __Vectors
 801050a:	1039      	lrw      	r1, 0x8010400	// 801056c <__exit+0xc>
    lrw     r2, __vdata_start__
 801050c:	1059      	lrw      	r2, 0x20000000	// 8010570 <__exit+0x10>
    lrw     r3, __vdata_end__
 801050e:	107a      	lrw      	r3, 0x20000100	// 8010574 <__exit+0x14>

    subu    r3, r2
 8010510:	60ca      	subu      	r3, r2
    cmpnei  r3, 0
 8010512:	3b40      	cmpnei      	r3, 0
    bf      .L_loopv0_done
 8010514:	0c08      	bf      	0x8010524	// 8010524 <Reset_Handler+0x24>

.L_loopv0:
    ldw     r0, (r1, 0)
 8010516:	9100      	ld.w      	r0, (r1, 0x0)
    stw     r0, (r2, 0)
 8010518:	b200      	st.w      	r0, (r2, 0x0)
    addi    r1, 4
 801051a:	2103      	addi      	r1, 4
    addi    r2, 4
 801051c:	2203      	addi      	r2, 4
    subi    r3, 4
 801051e:	2b03      	subi      	r3, 4
    cmpnei  r3, 0
 8010520:	3b40      	cmpnei      	r3, 0
    bt      .L_loopv0
 8010522:	0bfa      	bt      	0x8010516	// 8010516 <Reset_Handler+0x16>
 *    __data_start__: VMA of start of the section to copy to
 *    __data_end__: VMA of end of the section to copy to
 *
 *  All addresses must be aligned to 4 bytes boundary.
 */
    lrw     r1, __erodata
 8010524:	1035      	lrw      	r1, 0x8013e84	// 8010578 <__exit+0x18>
    lrw     r2, __data_start__
 8010526:	1056      	lrw      	r2, 0x20000100	// 801057c <__exit+0x1c>
    lrw     r3, __data_end__
 8010528:	1076      	lrw      	r3, 0x20000160	// 8010580 <__exit+0x20>

    subu    r3, r2
 801052a:	60ca      	subu      	r3, r2
    cmpnei  r3, 0
 801052c:	3b40      	cmpnei      	r3, 0
    bf      .L_loop0_done
 801052e:	0c08      	bf      	0x801053e	// 801053e <Reset_Handler+0x3e>

.L_loop0:
    ldw     r0, (r1, 0)
 8010530:	9100      	ld.w      	r0, (r1, 0x0)
    stw     r0, (r2, 0)
 8010532:	b200      	st.w      	r0, (r2, 0x0)
    addi    r1, 4
 8010534:	2103      	addi      	r1, 4
    addi    r2, 4
 8010536:	2203      	addi      	r2, 4
    subi    r3, 4
 8010538:	2b03      	subi      	r3, 4
    cmpnei  r3, 0
 801053a:	3b40      	cmpnei      	r3, 0
    bt      .L_loop0
 801053c:	0bfa      	bt      	0x8010530	// 8010530 <Reset_Handler+0x30>
 *    __bss_end__: end of the BSS section.
 *
 *  Both addresses must be aligned to 4 bytes boundary.
 */
 #if 1
    lrw     r1, __bss_start__
 801053e:	1032      	lrw      	r1, 0x20000160	// 8010584 <__exit+0x24>
    lrw     r2, __bss_end__
 8010540:	1052      	lrw      	r2, 0x20001bdc	// 8010588 <__exit+0x28>

    movi    r0, 0
 8010542:	3000      	movi      	r0, 0

    subu    r2, r1
 8010544:	6086      	subu      	r2, r1
    cmpnei  r2, 0
 8010546:	3a40      	cmpnei      	r2, 0
    bf      .L_loop1_done
 8010548:	0c06      	bf      	0x8010554	// 8010554 <Reset_Handler+0x54>

.L_loop1:
    stw     r0, (r1, 0)
 801054a:	b100      	st.w      	r0, (r1, 0x0)
    addi    r1, 4
 801054c:	2103      	addi      	r1, 4
    subi    r2, 4
 801054e:	2a03      	subi      	r2, 4
    cmpnei  r2, 0
 8010550:	3a40      	cmpnei      	r2, 0
    bt      .L_loop1
 8010552:	0bfc      	bt      	0x801054a	// 801054a <Reset_Handler+0x4a>
.L_loop1_done:
#endif

#ifndef __NO_SYSTEM_INIT
    jbsr    SystemInit
 8010554:	e0000e36 	bsr      	0x80121c0	// 80121c0 <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jbsr    board_init
 8010558:	e0000e8a 	bsr      	0x801226c	// 801226c <board_init>
#endif

    jbsr    main
 801055c:	e0000cde 	bsr      	0x8011f18	// 8011f18 <main>

08010560 <__exit>:
    .size   Reset_Handler, . - Reset_Handler

__exit:
    br      __exit
 8010560:	0400      	br      	0x8010560	// 8010560 <__exit>
 8010562:	0000      	.short	0x0000
 8010564:	e0000200 	.long	0xe0000200
 8010568:	20001160 	.long	0x20001160
 801056c:	08010400 	.long	0x08010400
 8010570:	20000000 	.long	0x20000000
 8010574:	20000100 	.long	0x20000100
 8010578:	08013e84 	.long	0x08013e84
 801057c:	20000100 	.long	0x20000100
 8010580:	20000160 	.long	0x20000160
 8010584:	20000160 	.long	0x20000160
 8010588:	20001bdc 	.long	0x20001bdc

0801058c <trap>:
 * default exception handler
 ******************************************************************************/
    .global trap
    .type   trap, %function
trap:
    psrset  ee
 801058c:	c1007420 	psrset      	ee

    subi    sp, 4
 8010590:	1421      	subi      	r14, r14, 4
    stw     r13, (sp)
 8010592:	ddae2000 	st.w      	r13, (r14, 0x0)
    addi    sp, 4
 8010596:	1401      	addi      	r14, r14, 4

    lrw     r13, g_trap_sp
 8010598:	ea8d000f 	lrw      	r13, 0x20001360	// 80105d4 <ADC_IRQHandler+0x4>
    stw     sp, (r13)
 801059c:	ddcd2000 	st.w      	r14, (r13, 0x0)

    lrw     sp, g_top_trapstack
 80105a0:	ea8e000e 	lrw      	r14, 0x20001360	// 80105d8 <ADC_IRQHandler+0x8>

    subi    sp, 72
 80105a4:	1432      	subi      	r14, r14, 72
    stm     r0-r12, (sp)
 80105a6:	d40e1c2c 	stm      	r0-r12, (r14)

    lrw     r0, g_trap_sp
 80105aa:	100b      	lrw      	r0, 0x20001360	// 80105d4 <ADC_IRQHandler+0x4>
    ldw     r0, (r0)
 80105ac:	9000      	ld.w      	r0, (r0, 0x0)

    stw     r0, (sp, 56) /* save r14 */
 80105ae:	b80e      	st.w      	r0, (r14, 0x38)

    subi    r0, 4
 80105b0:	2803      	subi      	r0, 4
    ldw     r13, (r0)
 80105b2:	d9a02000 	ld.w      	r13, (r0, 0x0)
    stw     r13, (sp, 52)
 80105b6:	ddae200d 	st.w      	r13, (r14, 0x34)

    stw     r15, (sp, 60)
 80105ba:	ddee200f 	st.w      	r15, (r14, 0x3c)
    mfcr    r0, epsr
 80105be:	c0026020 	mfcr      	r0, cr<2, 0>
    stw     r0, (sp, 64)
 80105c2:	b810      	st.w      	r0, (r14, 0x40)
    mfcr    r0, epc
 80105c4:	c0046020 	mfcr      	r0, cr<4, 0>
    stw     r0, (sp, 68)
 80105c8:	b811      	st.w      	r0, (r14, 0x44)

    mov     r0, sp
 80105ca:	6c3b      	mov      	r0, r14

    jbsr    trap_c
 80105cc:	e0000e12 	bsr      	0x80121f0	// 80121f0 <trap_c>

080105d0 <ADC_IRQHandler>:

    .align  2
    .weak   Default_Handler
    .type   Default_Handler, %function
Default_Handler:
    br      trap
 80105d0:	07de      	br      	0x801058c	// 801058c <trap>
 80105d2:	0000      	.short	0x0000
 80105d4:	20001360 	.long	0x20001360
 80105d8:	20001360 	.long	0x20001360

080105dc <__fixunsdfsi>:
 80105dc:	14d2      	push      	r4-r5, r15
 80105de:	3200      	movi      	r2, 0
 80105e0:	ea2341e0 	movih      	r3, 16864
 80105e4:	6d03      	mov      	r4, r0
 80105e6:	6d47      	mov      	r5, r1
 80105e8:	e00006a2 	bsr      	0x801132c	// 801132c <__gedf2>
 80105ec:	e9a00007 	bhsz      	r0, 0x80105fa	// 80105fa <__fixunsdfsi+0x1e>
 80105f0:	6c13      	mov      	r0, r4
 80105f2:	6c57      	mov      	r1, r5
 80105f4:	e000070c 	bsr      	0x801140c	// 801140c <__fixdfsi>
 80105f8:	1492      	pop      	r4-r5, r15
 80105fa:	3200      	movi      	r2, 0
 80105fc:	ea2341e0 	movih      	r3, 16864
 8010600:	6c13      	mov      	r0, r4
 8010602:	6c57      	mov      	r1, r5
 8010604:	e00004ae 	bsr      	0x8010f60	// 8010f60 <__subdf3>
 8010608:	e0000702 	bsr      	0x801140c	// 801140c <__fixdfsi>
 801060c:	ea238000 	movih      	r3, 32768
 8010610:	600c      	addu      	r0, r3
 8010612:	1492      	pop      	r4-r5, r15

08010614 <__udivdi3>:
 8010614:	14c5      	push      	r4-r8
 8010616:	6f4b      	mov      	r13, r2
 8010618:	6d4f      	mov      	r5, r3
 801061a:	6d03      	mov      	r4, r0
 801061c:	6f07      	mov      	r12, r1
 801061e:	e9230054 	bnez      	r3, 0x80106c6	// 80106c6 <__udivdi3+0xb2>
 8010622:	6484      	cmphs      	r1, r2
 8010624:	0870      	bt      	0x8010704	// 8010704 <__udivdi3+0xf0>
 8010626:	eb02ffff 	cmphsi      	r2, 65536
 801062a:	0cc4      	bf      	0x80107b2	// 80107b2 <__udivdi3+0x19e>
 801062c:	c6e05023 	bmaski      	r3, 24
 8010630:	648c      	cmphs      	r3, r2
 8010632:	3518      	movi      	r5, 24
 8010634:	3310      	movi      	r3, 16
 8010636:	c4a30c40 	inct      	r5, r3, 0
 801063a:	01dc      	lrw      	r6, 0x8013ae4	// 8010944 <__udivdi3+0x330>
 801063c:	c4a24043 	lsr      	r3, r2, r5
 8010640:	d0660023 	ldr.b      	r3, (r6, r3 << 0)
 8010644:	614c      	addu      	r5, r3
 8010646:	3320      	movi      	r3, 32
 8010648:	60d6      	subu      	r3, r5
 801064a:	e903000c 	bez      	r3, 0x8010662	// 8010662 <__udivdi3+0x4e>
 801064e:	c462402d 	lsl      	r13, r2, r3
 8010652:	c4a04045 	lsr      	r5, r0, r5
 8010656:	c4614022 	lsl      	r2, r1, r3
 801065a:	c445242c 	or      	r12, r5, r2
 801065e:	c4604024 	lsl      	r4, r0, r3
 8010662:	c60d4841 	lsri      	r1, r13, 16
 8010666:	c42c8022 	divu      	r2, r12, r1
 801066a:	c4228423 	mult      	r3, r2, r1
 801066e:	630e      	subu      	r12, r3
 8010670:	c60c4823 	lsli      	r3, r12, 16
 8010674:	c40d55e5 	zext      	r5, r13, 15, 0
 8010678:	c604484c 	lsri      	r12, r4, 16
 801067c:	c4458420 	mult      	r0, r5, r2
 8010680:	6f0c      	or      	r12, r3
 8010682:	6430      	cmphs      	r12, r0
 8010684:	0808      	bt      	0x8010694	// 8010694 <__udivdi3+0x80>
 8010686:	6334      	addu      	r12, r13
 8010688:	6770      	cmphs      	r12, r13
 801068a:	5a63      	subi      	r3, r2, 1
 801068c:	0c03      	bf      	0x8010692	// 8010692 <__udivdi3+0x7e>
 801068e:	6430      	cmphs      	r12, r0
 8010690:	0d56      	bf      	0x801093c	// 801093c <__udivdi3+0x328>
 8010692:	6c8f      	mov      	r2, r3
 8010694:	6302      	subu      	r12, r0
 8010696:	c42c8020 	divu      	r0, r12, r1
 801069a:	7c40      	mult      	r1, r0
 801069c:	6306      	subu      	r12, r1
 801069e:	c60c482c 	lsli      	r12, r12, 16
 80106a2:	c40455e4 	zext      	r4, r4, 15, 0
 80106a6:	7d40      	mult      	r5, r0
 80106a8:	6d30      	or      	r4, r12
 80106aa:	6550      	cmphs      	r4, r5
 80106ac:	6c43      	mov      	r1, r0
 80106ae:	0808      	bt      	0x80106be	// 80106be <__udivdi3+0xaa>
 80106b0:	6134      	addu      	r4, r13
 80106b2:	6750      	cmphs      	r4, r13
 80106b4:	5863      	subi      	r3, r0, 1
 80106b6:	0d21      	bf      	0x80108f8	// 80108f8 <__udivdi3+0x2e4>
 80106b8:	6550      	cmphs      	r4, r5
 80106ba:	091f      	bt      	0x80108f8	// 80108f8 <__udivdi3+0x2e4>
 80106bc:	2901      	subi      	r1, 2
 80106be:	4210      	lsli      	r0, r2, 16
 80106c0:	6c04      	or      	r0, r1
 80106c2:	3100      	movi      	r1, 0
 80106c4:	1485      	pop      	r4-r8
 80106c6:	64c4      	cmphs      	r1, r3
 80106c8:	0c6b      	bf      	0x801079e	// 801079e <__udivdi3+0x18a>
 80106ca:	eb03ffff 	cmphsi      	r3, 65536
 80106ce:	0c6b      	bf      	0x80107a4	// 80107a4 <__udivdi3+0x190>
 80106d0:	c6e0502c 	bmaski      	r12, 24
 80106d4:	64f0      	cmphs      	r12, r3
 80106d6:	ea0d0018 	movi      	r13, 24
 80106da:	ea0c0010 	movi      	r12, 16
 80106de:	c58d0c20 	incf      	r12, r13, 0
 80106e2:	0386      	lrw      	r4, 0x8013ae4	// 8010944 <__udivdi3+0x330>
 80106e4:	c583404d 	lsr      	r13, r3, r12
 80106e8:	d1a4002d 	ldr.b      	r13, (r4, r13 << 0)
 80106ec:	6370      	addu      	r13, r12
 80106ee:	3520      	movi      	r5, 32
 80106f0:	6176      	subu      	r5, r13
 80106f2:	e925006c 	bnez      	r5, 0x80107ca	// 80107ca <__udivdi3+0x1b6>
 80106f6:	644c      	cmphs      	r3, r1
 80106f8:	0d0d      	bf      	0x8010912	// 8010912 <__udivdi3+0x2fe>
 80106fa:	6480      	cmphs      	r0, r2
 80106fc:	c4000500 	mvc      	r0
 8010700:	6c57      	mov      	r1, r5
 8010702:	1485      	pop      	r4-r8
 8010704:	e9220006 	bnez      	r2, 0x8010710	// 8010710 <__udivdi3+0xfc>
 8010708:	ea0d0001 	movi      	r13, 1
 801070c:	c44d802d 	divu      	r13, r13, r2
 8010710:	eb0dffff 	cmphsi      	r13, 65536
 8010714:	0c55      	bf      	0x80107be	// 80107be <__udivdi3+0x1aa>
 8010716:	c6e05023 	bmaski      	r3, 24
 801071a:	674c      	cmphs      	r3, r13
 801071c:	3518      	movi      	r5, 24
 801071e:	3310      	movi      	r3, 16
 8010720:	c4a30c40 	inct      	r5, r3, 0
 8010724:	0357      	lrw      	r2, 0x8013ae4	// 8010944 <__udivdi3+0x330>
 8010726:	c4ad4043 	lsr      	r3, r13, r5
 801072a:	d0620023 	ldr.b      	r3, (r2, r3 << 0)
 801072e:	614c      	addu      	r5, r3
 8010730:	3620      	movi      	r6, 32
 8010732:	6196      	subu      	r6, r5
 8010734:	e926009f 	bnez      	r6, 0x8010872	// 8010872 <__udivdi3+0x25e>
 8010738:	c5a10082 	subu      	r2, r1, r13
 801073c:	c60d4846 	lsri      	r6, r13, 16
 8010740:	c40d55e5 	zext      	r5, r13, 15, 0
 8010744:	3101      	movi      	r1, 1
 8010746:	c4c2802c 	divu      	r12, r2, r6
 801074a:	c4cc8423 	mult      	r3, r12, r6
 801074e:	608e      	subu      	r2, r3
 8010750:	4250      	lsli      	r2, r2, 16
 8010752:	4c70      	lsri      	r3, r4, 16
 8010754:	c4ac8420 	mult      	r0, r12, r5
 8010758:	6cc8      	or      	r3, r2
 801075a:	640c      	cmphs      	r3, r0
 801075c:	0809      	bt      	0x801076e	// 801076e <__udivdi3+0x15a>
 801075e:	60f4      	addu      	r3, r13
 8010760:	674c      	cmphs      	r3, r13
 8010762:	e44c1000 	subi      	r2, r12, 1
 8010766:	0c03      	bf      	0x801076c	// 801076c <__udivdi3+0x158>
 8010768:	640c      	cmphs      	r3, r0
 801076a:	0ce5      	bf      	0x8010934	// 8010934 <__udivdi3+0x320>
 801076c:	6f0b      	mov      	r12, r2
 801076e:	60c2      	subu      	r3, r0
 8010770:	c4c38020 	divu      	r0, r3, r6
 8010774:	7d80      	mult      	r6, r0
 8010776:	60da      	subu      	r3, r6
 8010778:	4370      	lsli      	r3, r3, 16
 801077a:	c40455e4 	zext      	r4, r4, 15, 0
 801077e:	7d40      	mult      	r5, r0
 8010780:	6cd0      	or      	r3, r4
 8010782:	654c      	cmphs      	r3, r5
 8010784:	6c83      	mov      	r2, r0
 8010786:	0808      	bt      	0x8010796	// 8010796 <__udivdi3+0x182>
 8010788:	60f4      	addu      	r3, r13
 801078a:	674c      	cmphs      	r3, r13
 801078c:	2800      	subi      	r0, 1
 801078e:	0cb3      	bf      	0x80108f4	// 80108f4 <__udivdi3+0x2e0>
 8010790:	654c      	cmphs      	r3, r5
 8010792:	08b1      	bt      	0x80108f4	// 80108f4 <__udivdi3+0x2e0>
 8010794:	2a01      	subi      	r2, 2
 8010796:	c60c4820 	lsli      	r0, r12, 16
 801079a:	6c08      	or      	r0, r2
 801079c:	1485      	pop      	r4-r8
 801079e:	3100      	movi      	r1, 0
 80107a0:	6c07      	mov      	r0, r1
 80107a2:	1485      	pop      	r4-r8
 80107a4:	eb0300ff 	cmphsi      	r3, 256
 80107a8:	c400050d 	mvc      	r13
 80107ac:	c46d482c 	lsli      	r12, r13, 3
 80107b0:	0799      	br      	0x80106e2	// 80106e2 <__udivdi3+0xce>
 80107b2:	eb0200ff 	cmphsi      	r2, 256
 80107b6:	3308      	movi      	r3, 8
 80107b8:	c4a30c40 	inct      	r5, r3, 0
 80107bc:	073f      	br      	0x801063a	// 801063a <__udivdi3+0x26>
 80107be:	eb0d00ff 	cmphsi      	r13, 256
 80107c2:	3308      	movi      	r3, 8
 80107c4:	c4a30c40 	inct      	r5, r3, 0
 80107c8:	07ae      	br      	0x8010724	// 8010724 <__udivdi3+0x110>
 80107ca:	c5a24046 	lsr      	r6, r2, r13
 80107ce:	70d4      	lsl      	r3, r5
 80107d0:	6d8c      	or      	r6, r3
 80107d2:	c5a14044 	lsr      	r4, r1, r13
 80107d6:	4ef0      	lsri      	r7, r6, 16
 80107d8:	c4e48023 	divu      	r3, r4, r7
 80107dc:	c4a1402c 	lsl      	r12, r1, r5
 80107e0:	c5a04041 	lsr      	r1, r0, r13
 80107e4:	c4e3842d 	mult      	r13, r3, r7
 80107e8:	6c70      	or      	r1, r12
 80107ea:	6136      	subu      	r4, r13
 80107ec:	c40655ec 	zext      	r12, r6, 15, 0
 80107f0:	4490      	lsli      	r4, r4, 16
 80107f2:	c601484d 	lsri      	r13, r1, 16
 80107f6:	c46c8428 	mult      	r8, r12, r3
 80107fa:	6f50      	or      	r13, r4
 80107fc:	6634      	cmphs      	r13, r8
 80107fe:	7094      	lsl      	r2, r5
 8010800:	0806      	bt      	0x801080c	// 801080c <__udivdi3+0x1f8>
 8010802:	6358      	addu      	r13, r6
 8010804:	65b4      	cmphs      	r13, r6
 8010806:	5b83      	subi      	r4, r3, 1
 8010808:	088d      	bt      	0x8010922	// 8010922 <__udivdi3+0x30e>
 801080a:	6cd3      	mov      	r3, r4
 801080c:	6362      	subu      	r13, r8
 801080e:	c4ed8024 	divu      	r4, r13, r7
 8010812:	7dd0      	mult      	r7, r4
 8010814:	635e      	subu      	r13, r7
 8010816:	c60d482d 	lsli      	r13, r13, 16
 801081a:	c48c8427 	mult      	r7, r12, r4
 801081e:	c40155ec 	zext      	r12, r1, 15, 0
 8010822:	6f34      	or      	r12, r13
 8010824:	65f0      	cmphs      	r12, r7
 8010826:	0806      	bt      	0x8010832	// 8010832 <__udivdi3+0x21e>
 8010828:	6318      	addu      	r12, r6
 801082a:	65b0      	cmphs      	r12, r6
 801082c:	5c23      	subi      	r1, r4, 1
 801082e:	0875      	bt      	0x8010918	// 8010918 <__udivdi3+0x304>
 8010830:	6d07      	mov      	r4, r1
 8010832:	4370      	lsli      	r3, r3, 16
 8010834:	6cd0      	or      	r3, r4
 8010836:	c40355e1 	zext      	r1, r3, 15, 0
 801083a:	c40255e4 	zext      	r4, r2, 15, 0
 801083e:	c603484d 	lsri      	r13, r3, 16
 8010842:	4a50      	lsri      	r2, r2, 16
 8010844:	c4818426 	mult      	r6, r1, r4
 8010848:	7d34      	mult      	r4, r13
 801084a:	7c48      	mult      	r1, r2
 801084c:	7f48      	mult      	r13, r2
 801084e:	6050      	addu      	r1, r4
 8010850:	4e50      	lsri      	r2, r6, 16
 8010852:	6084      	addu      	r2, r1
 8010854:	6508      	cmphs      	r2, r4
 8010856:	631e      	subu      	r12, r7
 8010858:	0804      	bt      	0x8010860	// 8010860 <__udivdi3+0x24c>
 801085a:	ea210001 	movih      	r1, 1
 801085e:	6344      	addu      	r13, r1
 8010860:	4a30      	lsri      	r1, r2, 16
 8010862:	6344      	addu      	r13, r1
 8010864:	6770      	cmphs      	r12, r13
 8010866:	0c53      	bf      	0x801090c	// 801090c <__udivdi3+0x2f8>
 8010868:	6772      	cmpne      	r12, r13
 801086a:	0c49      	bf      	0x80108fc	// 80108fc <__udivdi3+0x2e8>
 801086c:	6c0f      	mov      	r0, r3
 801086e:	3100      	movi      	r1, 0
 8010870:	1485      	pop      	r4-r8
 8010872:	7358      	lsl      	r13, r6
 8010874:	c4a1404c 	lsr      	r12, r1, r5
 8010878:	c4c14022 	lsl      	r2, r1, r6
 801087c:	c4c04024 	lsl      	r4, r0, r6
 8010880:	c60d4846 	lsri      	r6, r13, 16
 8010884:	c4a04045 	lsr      	r5, r0, r5
 8010888:	c4cc8020 	divu      	r0, r12, r6
 801088c:	c4c08421 	mult      	r1, r0, r6
 8010890:	c4452423 	or      	r3, r5, r2
 8010894:	6306      	subu      	r12, r1
 8010896:	c40d55e5 	zext      	r5, r13, 15, 0
 801089a:	c60c482c 	lsli      	r12, r12, 16
 801089e:	4b30      	lsri      	r1, r3, 16
 80108a0:	c4058422 	mult      	r2, r5, r0
 80108a4:	6c70      	or      	r1, r12
 80108a6:	6484      	cmphs      	r1, r2
 80108a8:	080a      	bt      	0x80108bc	// 80108bc <__udivdi3+0x2a8>
 80108aa:	6074      	addu      	r1, r13
 80108ac:	6744      	cmphs      	r1, r13
 80108ae:	e5801000 	subi      	r12, r0, 1
 80108b2:	0c3f      	bf      	0x8010930	// 8010930 <__udivdi3+0x31c>
 80108b4:	6484      	cmphs      	r1, r2
 80108b6:	083d      	bt      	0x8010930	// 8010930 <__udivdi3+0x31c>
 80108b8:	2801      	subi      	r0, 2
 80108ba:	6074      	addu      	r1, r13
 80108bc:	604a      	subu      	r1, r2
 80108be:	c4c1802c 	divu      	r12, r1, r6
 80108c2:	c4cc8422 	mult      	r2, r12, r6
 80108c6:	5949      	subu      	r2, r1, r2
 80108c8:	4250      	lsli      	r2, r2, 16
 80108ca:	c40355e3 	zext      	r3, r3, 15, 0
 80108ce:	c5858421 	mult      	r1, r5, r12
 80108d2:	6c8c      	or      	r2, r3
 80108d4:	6448      	cmphs      	r2, r1
 80108d6:	080b      	bt      	0x80108ec	// 80108ec <__udivdi3+0x2d8>
 80108d8:	60b4      	addu      	r2, r13
 80108da:	6748      	cmphs      	r2, r13
 80108dc:	e46c1000 	subi      	r3, r12, 1
 80108e0:	0c26      	bf      	0x801092c	// 801092c <__udivdi3+0x318>
 80108e2:	6448      	cmphs      	r2, r1
 80108e4:	0824      	bt      	0x801092c	// 801092c <__udivdi3+0x318>
 80108e6:	e58c1001 	subi      	r12, r12, 2
 80108ea:	60b4      	addu      	r2, r13
 80108ec:	6086      	subu      	r2, r1
 80108ee:	4030      	lsli      	r1, r0, 16
 80108f0:	6c70      	or      	r1, r12
 80108f2:	072a      	br      	0x8010746	// 8010746 <__udivdi3+0x132>
 80108f4:	6c83      	mov      	r2, r0
 80108f6:	0750      	br      	0x8010796	// 8010796 <__udivdi3+0x182>
 80108f8:	6c4f      	mov      	r1, r3
 80108fa:	06e2      	br      	0x80106be	// 80106be <__udivdi3+0xaa>
 80108fc:	4250      	lsli      	r2, r2, 16
 80108fe:	c40655e6 	zext      	r6, r6, 15, 0
 8010902:	c4a04021 	lsl      	r1, r0, r5
 8010906:	6098      	addu      	r2, r6
 8010908:	6484      	cmphs      	r1, r2
 801090a:	0bb1      	bt      	0x801086c	// 801086c <__udivdi3+0x258>
 801090c:	5b03      	subi      	r0, r3, 1
 801090e:	3100      	movi      	r1, 0
 8010910:	1485      	pop      	r4-r8
 8010912:	6c57      	mov      	r1, r5
 8010914:	3001      	movi      	r0, 1
 8010916:	1485      	pop      	r4-r8
 8010918:	65f0      	cmphs      	r12, r7
 801091a:	0b8b      	bt      	0x8010830	// 8010830 <__udivdi3+0x21c>
 801091c:	2c01      	subi      	r4, 2
 801091e:	6318      	addu      	r12, r6
 8010920:	0789      	br      	0x8010832	// 8010832 <__udivdi3+0x21e>
 8010922:	6634      	cmphs      	r13, r8
 8010924:	0b73      	bt      	0x801080a	// 801080a <__udivdi3+0x1f6>
 8010926:	2b01      	subi      	r3, 2
 8010928:	6358      	addu      	r13, r6
 801092a:	0771      	br      	0x801080c	// 801080c <__udivdi3+0x1f8>
 801092c:	6f0f      	mov      	r12, r3
 801092e:	07df      	br      	0x80108ec	// 80108ec <__udivdi3+0x2d8>
 8010930:	6c33      	mov      	r0, r12
 8010932:	07c5      	br      	0x80108bc	// 80108bc <__udivdi3+0x2a8>
 8010934:	e58c1001 	subi      	r12, r12, 2
 8010938:	60f4      	addu      	r3, r13
 801093a:	071a      	br      	0x801076e	// 801076e <__udivdi3+0x15a>
 801093c:	2a01      	subi      	r2, 2
 801093e:	6334      	addu      	r12, r13
 8010940:	06aa      	br      	0x8010694	// 8010694 <__udivdi3+0x80>
 8010942:	0000      	.short	0x0000
 8010944:	08013ae4 	.long	0x08013ae4

08010948 <__umoddi3>:
 8010948:	14c6      	push      	r4-r9
 801094a:	6d4b      	mov      	r5, r2
 801094c:	6f4f      	mov      	r13, r3
 801094e:	6d83      	mov      	r6, r0
 8010950:	6f07      	mov      	r12, r1
 8010952:	e923004a 	bnez      	r3, 0x80109e6	// 80109e6 <__umoddi3+0x9e>
 8010956:	6484      	cmphs      	r1, r2
 8010958:	086b      	bt      	0x8010a2e	// 8010a2e <__umoddi3+0xe6>
 801095a:	eb02ffff 	cmphsi      	r2, 65536
 801095e:	0cc0      	bf      	0x8010ade	// 8010ade <__umoddi3+0x196>
 8010960:	c6e05023 	bmaski      	r3, 24
 8010964:	648c      	cmphs      	r3, r2
 8010966:	ea0d0018 	movi      	r13, 24
 801096a:	3310      	movi      	r3, 16
 801096c:	c5a30c40 	inct      	r13, r3, 0
 8010970:	0281      	lrw      	r4, 0x8013ae4	// 8010c68 <__umoddi3+0x320>
 8010972:	c5a24043 	lsr      	r3, r2, r13
 8010976:	d0640023 	ldr.b      	r3, (r4, r3 << 0)
 801097a:	634c      	addu      	r13, r3
 801097c:	3420      	movi      	r4, 32
 801097e:	6136      	subu      	r4, r13
 8010980:	e904000b 	bez      	r4, 0x8010996	// 8010996 <__umoddi3+0x4e>
 8010984:	7050      	lsl      	r1, r4
 8010986:	c5a0404d 	lsr      	r13, r0, r13
 801098a:	c4824025 	lsl      	r5, r2, r4
 801098e:	c42d242c 	or      	r12, r13, r1
 8010992:	c4804026 	lsl      	r6, r0, r4
 8010996:	c605484d 	lsri      	r13, r5, 16
 801099a:	c5ac8021 	divu      	r1, r12, r13
 801099e:	c5a18422 	mult      	r2, r1, r13
 80109a2:	c40555e0 	zext      	r0, r5, 15, 0
 80109a6:	c44c0082 	subu      	r2, r12, r2
 80109aa:	c4208423 	mult      	r3, r0, r1
 80109ae:	4250      	lsli      	r2, r2, 16
 80109b0:	4e30      	lsri      	r1, r6, 16
 80109b2:	6c48      	or      	r1, r2
 80109b4:	64c4      	cmphs      	r1, r3
 80109b6:	0808      	bt      	0x80109c6	// 80109c6 <__umoddi3+0x7e>
 80109b8:	6054      	addu      	r1, r5
 80109ba:	6544      	cmphs      	r1, r5
 80109bc:	0c05      	bf      	0x80109c6	// 80109c6 <__umoddi3+0x7e>
 80109be:	5954      	addu      	r2, r1, r5
 80109c0:	64c4      	cmphs      	r1, r3
 80109c2:	c4220c20 	incf      	r1, r2, 0
 80109c6:	604e      	subu      	r1, r3
 80109c8:	c5a18023 	divu      	r3, r1, r13
 80109cc:	7f4c      	mult      	r13, r3
 80109ce:	6076      	subu      	r1, r13
 80109d0:	7c0c      	mult      	r0, r3
 80109d2:	4130      	lsli      	r1, r1, 16
 80109d4:	c40655e3 	zext      	r3, r6, 15, 0
 80109d8:	6cc4      	or      	r3, r1
 80109da:	640c      	cmphs      	r3, r0
 80109dc:	0c69      	bf      	0x8010aae	// 8010aae <__umoddi3+0x166>
 80109de:	5b01      	subu      	r0, r3, r0
 80109e0:	7011      	lsr      	r0, r4
 80109e2:	3100      	movi      	r1, 0
 80109e4:	1486      	pop      	r4-r9
 80109e6:	64c4      	cmphs      	r1, r3
 80109e8:	0ffe      	bf      	0x80109e4	// 80109e4 <__umoddi3+0x9c>
 80109ea:	eb03ffff 	cmphsi      	r3, 65536
 80109ee:	0c6b      	bf      	0x8010ac4	// 8010ac4 <__umoddi3+0x17c>
 80109f0:	c6e0502d 	bmaski      	r13, 24
 80109f4:	64f4      	cmphs      	r13, r3
 80109f6:	3518      	movi      	r5, 24
 80109f8:	ea0d0010 	movi      	r13, 16
 80109fc:	c5a50c20 	incf      	r13, r5, 0
 8010a00:	03a5      	lrw      	r5, 0x8013ae4	// 8010c68 <__umoddi3+0x320>
 8010a02:	c5a34044 	lsr      	r4, r3, r13
 8010a06:	d0850025 	ldr.b      	r5, (r5, r4 << 0)
 8010a0a:	6174      	addu      	r5, r13
 8010a0c:	3420      	movi      	r4, 32
 8010a0e:	6116      	subu      	r4, r5
 8010a10:	e924006d 	bnez      	r4, 0x8010aea	// 8010aea <__umoddi3+0x1a2>
 8010a14:	644c      	cmphs      	r3, r1
 8010a16:	0c03      	bf      	0x8010a1c	// 8010a1c <__umoddi3+0xd4>
 8010a18:	6480      	cmphs      	r0, r2
 8010a1a:	0d20      	bf      	0x8010c5a	// 8010c5a <__umoddi3+0x312>
 8010a1c:	5889      	subu      	r4, r0, r2
 8010a1e:	6500      	cmphs      	r0, r4
 8010a20:	c461008c 	subu      	r12, r1, r3
 8010a24:	6443      	mvcv      	r1
 8010a26:	6306      	subu      	r12, r1
 8010a28:	6c13      	mov      	r0, r4
 8010a2a:	6c73      	mov      	r1, r12
 8010a2c:	1486      	pop      	r4-r9
 8010a2e:	e9220005 	bnez      	r2, 0x8010a38	// 8010a38 <__umoddi3+0xf0>
 8010a32:	3501      	movi      	r5, 1
 8010a34:	c4458025 	divu      	r5, r5, r2
 8010a38:	eb05ffff 	cmphsi      	r5, 65536
 8010a3c:	0c4b      	bf      	0x8010ad2	// 8010ad2 <__umoddi3+0x18a>
 8010a3e:	c6e05023 	bmaski      	r3, 24
 8010a42:	654c      	cmphs      	r3, r5
 8010a44:	ea0d0018 	movi      	r13, 24
 8010a48:	3310      	movi      	r3, 16
 8010a4a:	c5a30c40 	inct      	r13, r3, 0
 8010a4e:	0358      	lrw      	r2, 0x8013ae4	// 8010c68 <__umoddi3+0x320>
 8010a50:	c5a54043 	lsr      	r3, r5, r13
 8010a54:	d0620023 	ldr.b      	r3, (r2, r3 << 0)
 8010a58:	634c      	addu      	r13, r3
 8010a5a:	3420      	movi      	r4, 32
 8010a5c:	6136      	subu      	r4, r13
 8010a5e:	e92400af 	bnez      	r4, 0x8010bbc	// 8010bbc <__umoddi3+0x274>
 8010a62:	c4a1008c 	subu      	r12, r1, r5
 8010a66:	4df0      	lsri      	r7, r5, 16
 8010a68:	c40555e2 	zext      	r2, r5, 15, 0
 8010a6c:	c4ec8021 	divu      	r1, r12, r7
 8010a70:	c4e18423 	mult      	r3, r1, r7
 8010a74:	630e      	subu      	r12, r3
 8010a76:	c60c482c 	lsli      	r12, r12, 16
 8010a7a:	c4418423 	mult      	r3, r1, r2
 8010a7e:	4e30      	lsri      	r1, r6, 16
 8010a80:	6c70      	or      	r1, r12
 8010a82:	64c4      	cmphs      	r1, r3
 8010a84:	0808      	bt      	0x8010a94	// 8010a94 <__umoddi3+0x14c>
 8010a86:	6054      	addu      	r1, r5
 8010a88:	6544      	cmphs      	r1, r5
 8010a8a:	0c05      	bf      	0x8010a94	// 8010a94 <__umoddi3+0x14c>
 8010a8c:	5914      	addu      	r0, r1, r5
 8010a8e:	64c4      	cmphs      	r1, r3
 8010a90:	c4200c20 	incf      	r1, r0, 0
 8010a94:	604e      	subu      	r1, r3
 8010a96:	c4e18020 	divu      	r0, r1, r7
 8010a9a:	7dc0      	mult      	r7, r0
 8010a9c:	605e      	subu      	r1, r7
 8010a9e:	4130      	lsli      	r1, r1, 16
 8010aa0:	c40655e6 	zext      	r6, r6, 15, 0
 8010aa4:	7c08      	mult      	r0, r2
 8010aa6:	c4c12423 	or      	r3, r1, r6
 8010aaa:	640c      	cmphs      	r3, r0
 8010aac:	0808      	bt      	0x8010abc	// 8010abc <__umoddi3+0x174>
 8010aae:	60d4      	addu      	r3, r5
 8010ab0:	654c      	cmphs      	r3, r5
 8010ab2:	0c05      	bf      	0x8010abc	// 8010abc <__umoddi3+0x174>
 8010ab4:	614c      	addu      	r5, r3
 8010ab6:	640c      	cmphs      	r3, r0
 8010ab8:	c4650c20 	incf      	r3, r5, 0
 8010abc:	5b01      	subu      	r0, r3, r0
 8010abe:	7011      	lsr      	r0, r4
 8010ac0:	3100      	movi      	r1, 0
 8010ac2:	1486      	pop      	r4-r9
 8010ac4:	eb0300ff 	cmphsi      	r3, 256
 8010ac8:	c4000505 	mvc      	r5
 8010acc:	c465482d 	lsli      	r13, r5, 3
 8010ad0:	0798      	br      	0x8010a00	// 8010a00 <__umoddi3+0xb8>
 8010ad2:	eb0500ff 	cmphsi      	r5, 256
 8010ad6:	3308      	movi      	r3, 8
 8010ad8:	c5a30c40 	inct      	r13, r3, 0
 8010adc:	07b9      	br      	0x8010a4e	// 8010a4e <__umoddi3+0x106>
 8010ade:	eb0200ff 	cmphsi      	r2, 256
 8010ae2:	3308      	movi      	r3, 8
 8010ae4:	c5a30c40 	inct      	r13, r3, 0
 8010ae8:	0744      	br      	0x8010970	// 8010970 <__umoddi3+0x28>
 8010aea:	70d0      	lsl      	r3, r4
 8010aec:	c4a24047 	lsr      	r7, r2, r5
 8010af0:	6dcc      	or      	r7, r3
 8010af2:	c4a14046 	lsr      	r6, r1, r5
 8010af6:	c481402c 	lsl      	r12, r1, r4
 8010afa:	c4a04041 	lsr      	r1, r0, r5
 8010afe:	6c70      	or      	r1, r12
 8010b00:	c607484c 	lsri      	r12, r7, 16
 8010b04:	c5868028 	divu      	r8, r6, r12
 8010b08:	c4824023 	lsl      	r3, r2, r4
 8010b0c:	c5888422 	mult      	r2, r8, r12
 8010b10:	618a      	subu      	r6, r2
 8010b12:	c40755ed 	zext      	r13, r7, 15, 0
 8010b16:	46d0      	lsli      	r6, r6, 16
 8010b18:	4950      	lsri      	r2, r1, 16
 8010b1a:	c50d8429 	mult      	r9, r13, r8
 8010b1e:	6c98      	or      	r2, r6
 8010b20:	6648      	cmphs      	r2, r9
 8010b22:	7010      	lsl      	r0, r4
 8010b24:	0807      	bt      	0x8010b32	// 8010b32 <__umoddi3+0x1ea>
 8010b26:	609c      	addu      	r2, r7
 8010b28:	65c8      	cmphs      	r2, r7
 8010b2a:	e4c81000 	subi      	r6, r8, 1
 8010b2e:	088a      	bt      	0x8010c42	// 8010c42 <__umoddi3+0x2fa>
 8010b30:	6e1b      	mov      	r8, r6
 8010b32:	60a6      	subu      	r2, r9
 8010b34:	c5828026 	divu      	r6, r2, r12
 8010b38:	7f18      	mult      	r12, r6
 8010b3a:	60b2      	subu      	r2, r12
 8010b3c:	4250      	lsli      	r2, r2, 16
 8010b3e:	c40155e1 	zext      	r1, r1, 15, 0
 8010b42:	7f58      	mult      	r13, r6
 8010b44:	6c48      	or      	r1, r2
 8010b46:	6744      	cmphs      	r1, r13
 8010b48:	0806      	bt      	0x8010b54	// 8010b54 <__umoddi3+0x20c>
 8010b4a:	605c      	addu      	r1, r7
 8010b4c:	65c4      	cmphs      	r1, r7
 8010b4e:	5e43      	subi      	r2, r6, 1
 8010b50:	0874      	bt      	0x8010c38	// 8010c38 <__umoddi3+0x2f0>
 8010b52:	6d8b      	mov      	r6, r2
 8010b54:	c6084822 	lsli      	r2, r8, 16
 8010b58:	6c98      	or      	r2, r6
 8010b5a:	c40255e8 	zext      	r8, r2, 15, 0
 8010b5e:	c603484c 	lsri      	r12, r3, 16
 8010b62:	4a50      	lsri      	r2, r2, 16
 8010b64:	c5a1008d 	subu      	r13, r1, r13
 8010b68:	c40355e1 	zext      	r1, r3, 15, 0
 8010b6c:	c4288426 	mult      	r6, r8, r1
 8010b70:	7c48      	mult      	r1, r2
 8010b72:	7e30      	mult      	r8, r12
 8010b74:	7cb0      	mult      	r2, r12
 8010b76:	6204      	addu      	r8, r1
 8010b78:	c606484c 	lsri      	r12, r6, 16
 8010b7c:	6320      	addu      	r12, r8
 8010b7e:	6470      	cmphs      	r12, r1
 8010b80:	0804      	bt      	0x8010b88	// 8010b88 <__umoddi3+0x240>
 8010b82:	ea210001 	movih      	r1, 1
 8010b86:	6084      	addu      	r2, r1
 8010b88:	c60c4841 	lsri      	r1, r12, 16
 8010b8c:	6048      	addu      	r1, r2
 8010b8e:	6474      	cmphs      	r13, r1
 8010b90:	c60c482c 	lsli      	r12, r12, 16
 8010b94:	c40655e6 	zext      	r6, r6, 15, 0
 8010b98:	6318      	addu      	r12, r6
 8010b9a:	0c46      	bf      	0x8010c26	// 8010c26 <__umoddi3+0x2de>
 8010b9c:	6476      	cmpne      	r13, r1
 8010b9e:	0c60      	bf      	0x8010c5e	// 8010c5e <__umoddi3+0x316>
 8010ba0:	c42d0081 	subu      	r1, r13, r1
 8010ba4:	6cf3      	mov      	r3, r12
 8010ba6:	586d      	subu      	r3, r0, r3
 8010ba8:	64c0      	cmphs      	r0, r3
 8010baa:	6743      	mvcv      	r13
 8010bac:	6076      	subu      	r1, r13
 8010bae:	c4a14025 	lsl      	r5, r1, r5
 8010bb2:	c4834040 	lsr      	r0, r3, r4
 8010bb6:	6c14      	or      	r0, r5
 8010bb8:	7051      	lsr      	r1, r4
 8010bba:	1486      	pop      	r4-r9
 8010bbc:	7150      	lsl      	r5, r4
 8010bbe:	c5a14048 	lsr      	r8, r1, r13
 8010bc2:	4df0      	lsri      	r7, r5, 16
 8010bc4:	c5a0404d 	lsr      	r13, r0, r13
 8010bc8:	7050      	lsl      	r1, r4
 8010bca:	6c74      	or      	r1, r13
 8010bcc:	c4e8802d 	divu      	r13, r8, r7
 8010bd0:	c4ed8423 	mult      	r3, r13, r7
 8010bd4:	c40555e2 	zext      	r2, r5, 15, 0
 8010bd8:	620e      	subu      	r8, r3
 8010bda:	c5a2842c 	mult      	r12, r2, r13
 8010bde:	c6084828 	lsli      	r8, r8, 16
 8010be2:	c601484d 	lsri      	r13, r1, 16
 8010be6:	6f60      	or      	r13, r8
 8010be8:	6734      	cmphs      	r13, r12
 8010bea:	c4804026 	lsl      	r6, r0, r4
 8010bee:	0804      	bt      	0x8010bf6	// 8010bf6 <__umoddi3+0x2ae>
 8010bf0:	6354      	addu      	r13, r5
 8010bf2:	6574      	cmphs      	r13, r5
 8010bf4:	082d      	bt      	0x8010c4e	// 8010c4e <__umoddi3+0x306>
 8010bf6:	6372      	subu      	r13, r12
 8010bf8:	c4ed8023 	divu      	r3, r13, r7
 8010bfc:	c4e3842c 	mult      	r12, r3, r7
 8010c00:	6372      	subu      	r13, r12
 8010c02:	c60d482c 	lsli      	r12, r13, 16
 8010c06:	c40155e1 	zext      	r1, r1, 15, 0
 8010c0a:	7cc8      	mult      	r3, r2
 8010c0c:	6f04      	or      	r12, r1
 8010c0e:	64f0      	cmphs      	r12, r3
 8010c10:	0809      	bt      	0x8010c22	// 8010c22 <__umoddi3+0x2da>
 8010c12:	6314      	addu      	r12, r5
 8010c14:	6570      	cmphs      	r12, r5
 8010c16:	0c06      	bf      	0x8010c22	// 8010c22 <__umoddi3+0x2da>
 8010c18:	c4ac0021 	addu      	r1, r12, r5
 8010c1c:	64f0      	cmphs      	r12, r3
 8010c1e:	c5810c20 	incf      	r12, r1, 0
 8010c22:	630e      	subu      	r12, r3
 8010c24:	0724      	br      	0x8010a6c	// 8010a6c <__umoddi3+0x124>
 8010c26:	c46c0083 	subu      	r3, r12, r3
 8010c2a:	64f0      	cmphs      	r12, r3
 8010c2c:	605e      	subu      	r1, r7
 8010c2e:	65c3      	mvcv      	r7
 8010c30:	605e      	subu      	r1, r7
 8010c32:	c42d0081 	subu      	r1, r13, r1
 8010c36:	07b8      	br      	0x8010ba6	// 8010ba6 <__umoddi3+0x25e>
 8010c38:	6744      	cmphs      	r1, r13
 8010c3a:	0b8c      	bt      	0x8010b52	// 8010b52 <__umoddi3+0x20a>
 8010c3c:	2e01      	subi      	r6, 2
 8010c3e:	605c      	addu      	r1, r7
 8010c40:	078a      	br      	0x8010b54	// 8010b54 <__umoddi3+0x20c>
 8010c42:	6648      	cmphs      	r2, r9
 8010c44:	0b76      	bt      	0x8010b30	// 8010b30 <__umoddi3+0x1e8>
 8010c46:	e5081001 	subi      	r8, r8, 2
 8010c4a:	609c      	addu      	r2, r7
 8010c4c:	0773      	br      	0x8010b32	// 8010b32 <__umoddi3+0x1ea>
 8010c4e:	c4ad0023 	addu      	r3, r13, r5
 8010c52:	6734      	cmphs      	r13, r12
 8010c54:	c5a30c20 	incf      	r13, r3, 0
 8010c58:	07cf      	br      	0x8010bf6	// 8010bf6 <__umoddi3+0x2ae>
 8010c5a:	6d03      	mov      	r4, r0
 8010c5c:	06e6      	br      	0x8010a28	// 8010a28 <__umoddi3+0xe0>
 8010c5e:	6700      	cmphs      	r0, r12
 8010c60:	0fe3      	bf      	0x8010c26	// 8010c26 <__umoddi3+0x2de>
 8010c62:	6cf3      	mov      	r3, r12
 8010c64:	3100      	movi      	r1, 0
 8010c66:	07a0      	br      	0x8010ba6	// 8010ba6 <__umoddi3+0x25e>
 8010c68:	08013ae4 	.long	0x08013ae4

08010c6c <_fpadd_parts>:
 8010c6c:	14c8      	push      	r4-r11
 8010c6e:	1423      	subi      	r14, r14, 12
 8010c70:	9060      	ld.w      	r3, (r0, 0x0)
 8010c72:	3501      	movi      	r5, 1
 8010c74:	64d4      	cmphs      	r5, r3
 8010c76:	0871      	bt      	0x8010d58	// 8010d58 <_fpadd_parts+0xec>
 8010c78:	d9812000 	ld.w      	r12, (r1, 0x0)
 8010c7c:	6714      	cmphs      	r5, r12
 8010c7e:	086f      	bt      	0x8010d5c	// 8010d5c <_fpadd_parts+0xf0>
 8010c80:	3b44      	cmpnei      	r3, 4
 8010c82:	0cef      	bf      	0x8010e60	// 8010e60 <_fpadd_parts+0x1f4>
 8010c84:	eb4c0004 	cmpnei      	r12, 4
 8010c88:	0c6a      	bf      	0x8010d5c	// 8010d5c <_fpadd_parts+0xf0>
 8010c8a:	eb4c0002 	cmpnei      	r12, 2
 8010c8e:	0cc7      	bf      	0x8010e1c	// 8010e1c <_fpadd_parts+0x1b0>
 8010c90:	3b42      	cmpnei      	r3, 2
 8010c92:	0c65      	bf      	0x8010d5c	// 8010d5c <_fpadd_parts+0xf0>
 8010c94:	9062      	ld.w      	r3, (r0, 0x8)
 8010c96:	d9812002 	ld.w      	r12, (r1, 0x8)
 8010c9a:	c583008d 	subu      	r13, r3, r12
 8010c9e:	c40d0208 	abs      	r8, r13
 8010ca2:	eb28003f 	cmplti      	r8, 64
 8010ca6:	90c3      	ld.w      	r6, (r0, 0xc)
 8010ca8:	90e4      	ld.w      	r7, (r0, 0x10)
 8010caa:	b8c0      	st.w      	r6, (r14, 0x0)
 8010cac:	b8e1      	st.w      	r7, (r14, 0x4)
 8010cae:	d9412003 	ld.w      	r10, (r1, 0xc)
 8010cb2:	d9612004 	ld.w      	r11, (r1, 0x10)
 8010cb6:	0856      	bt      	0x8010d62	// 8010d62 <_fpadd_parts+0xf6>
 8010cb8:	64f1      	cmplt      	r12, r3
 8010cba:	0cc9      	bf      	0x8010e4c	// 8010e4c <_fpadd_parts+0x1e0>
 8010cbc:	ea0a0000 	movi      	r10, 0
 8010cc0:	ea0b0000 	movi      	r11, 0
 8010cc4:	9001      	ld.w      	r0, (r0, 0x4)
 8010cc6:	9121      	ld.w      	r1, (r1, 0x4)
 8010cc8:	6442      	cmpne      	r0, r1
 8010cca:	0c82      	bf      	0x8010dce	// 8010dce <_fpadd_parts+0x162>
 8010ccc:	d98e2000 	ld.w      	r12, (r14, 0x0)
 8010cd0:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010cd4:	e90000b8 	bez      	r0, 0x8010e44	// 8010e44 <_fpadd_parts+0x1d8>
 8010cd8:	6730      	cmphs      	r12, r12
 8010cda:	c58a010c 	subc      	r12, r10, r12
 8010cde:	c5ab010d 	subc      	r13, r11, r13
 8010ce2:	e98d00c9 	blz      	r13, 0x8010e74	// 8010e74 <_fpadd_parts+0x208>
 8010ce6:	3100      	movi      	r1, 0
 8010ce8:	b221      	st.w      	r1, (r2, 0x4)
 8010cea:	b262      	st.w      	r3, (r2, 0x8)
 8010cec:	dd822003 	st.w      	r12, (r2, 0xc)
 8010cf0:	dda22004 	st.w      	r13, (r2, 0x10)
 8010cf4:	6c33      	mov      	r0, r12
 8010cf6:	6c77      	mov      	r1, r13
 8010cf8:	3840      	cmpnei      	r0, 0
 8010cfa:	c4210c81 	decf      	r1, r1, 1
 8010cfe:	2800      	subi      	r0, 1
 8010d00:	c7605023 	bmaski      	r3, 28
 8010d04:	644c      	cmphs      	r3, r1
 8010d06:	0c71      	bf      	0x8010de8	// 8010de8 <_fpadd_parts+0x17c>
 8010d08:	64c6      	cmpne      	r1, r3
 8010d0a:	0d0d      	bf      	0x8010f24	// 8010f24 <_fpadd_parts+0x2b8>
 8010d0c:	9262      	ld.w      	r3, (r2, 0x8)
 8010d0e:	3600      	movi      	r6, 0
 8010d10:	3700      	movi      	r7, 0
 8010d12:	ea0a0000 	movi      	r10, 0
 8010d16:	2b00      	subi      	r3, 1
 8010d18:	2e00      	subi      	r6, 1
 8010d1a:	2f00      	subi      	r7, 1
 8010d1c:	c7605028 	bmaski      	r8, 28
 8010d20:	e54a1001 	subi      	r10, r10, 2
 8010d24:	0403      	br      	0x8010d2a	// 8010d2a <_fpadd_parts+0xbe>
 8010d26:	6606      	cmpne      	r1, r8
 8010d28:	0c8b      	bf      	0x8010e3e	// 8010e3e <_fpadd_parts+0x1d2>
 8010d2a:	6511      	cmplt      	r4, r4
 8010d2c:	c58c0044 	addc      	r4, r12, r12
 8010d30:	c5ad0045 	addc      	r5, r13, r13
 8010d34:	6401      	cmplt      	r0, r0
 8010d36:	c4c40040 	addc      	r0, r4, r6
 8010d3a:	c4e50041 	addc      	r1, r5, r7
 8010d3e:	6460      	cmphs      	r8, r1
 8010d40:	6e4f      	mov      	r9, r3
 8010d42:	6f13      	mov      	r12, r4
 8010d44:	6f57      	mov      	r13, r5
 8010d46:	2b00      	subi      	r3, 1
 8010d48:	0bef      	bt      	0x8010d26	// 8010d26 <_fpadd_parts+0xba>
 8010d4a:	3303      	movi      	r3, 3
 8010d4c:	b283      	st.w      	r4, (r2, 0xc)
 8010d4e:	b2a4      	st.w      	r5, (r2, 0x10)
 8010d50:	dd222002 	st.w      	r9, (r2, 0x8)
 8010d54:	b260      	st.w      	r3, (r2, 0x0)
 8010d56:	6c0b      	mov      	r0, r2
 8010d58:	1403      	addi      	r14, r14, 12
 8010d5a:	1488      	pop      	r4-r11
 8010d5c:	6c07      	mov      	r0, r1
 8010d5e:	1403      	addi      	r14, r14, 12
 8010d60:	1488      	pop      	r4-r11
 8010d62:	e96d009a 	blsz      	r13, 0x8010e96	// 8010e96 <_fpadd_parts+0x22a>
 8010d66:	ea0d001f 	movi      	r13, 31
 8010d6a:	c42b4826 	lsli      	r6, r11, 1
 8010d6e:	6362      	subu      	r13, r8
 8010d70:	e588101f 	subi      	r12, r8, 32
 8010d74:	c5a6402d 	lsl      	r13, r6, r13
 8010d78:	c50a4046 	lsr      	r6, r10, r8
 8010d7c:	c7ec2880 	btsti      	r12, 31
 8010d80:	c58b4049 	lsr      	r9, r11, r12
 8010d84:	3400      	movi      	r4, 0
 8010d86:	6db4      	or      	r6, r13
 8010d88:	c4c90c20 	incf      	r6, r9, 0
 8010d8c:	6f53      	mov      	r13, r4
 8010d8e:	c5854029 	lsl      	r9, r5, r12
 8010d92:	c505402c 	lsl      	r12, r5, r8
 8010d96:	c50b4047 	lsr      	r7, r11, r8
 8010d9a:	c5a90c20 	incf      	r13, r9, 0
 8010d9e:	c5840c20 	incf      	r12, r4, 0
 8010da2:	c4e40c20 	incf      	r7, r4, 0
 8010da6:	eb4c0000 	cmpnei      	r12, 0
 8010daa:	c5ad0c81 	decf      	r13, r13, 1
 8010dae:	e58c1000 	subi      	r12, r12, 1
 8010db2:	6b28      	and      	r12, r10
 8010db4:	6b6c      	and      	r13, r11
 8010db6:	6f34      	or      	r12, r13
 8010db8:	eb4c0000 	cmpnei      	r12, 0
 8010dbc:	9001      	ld.w      	r0, (r0, 0x4)
 8010dbe:	9121      	ld.w      	r1, (r1, 0x4)
 8010dc0:	c400050a 	mvc      	r10
 8010dc4:	6442      	cmpne      	r0, r1
 8010dc6:	6ed3      	mov      	r11, r4
 8010dc8:	6e98      	or      	r10, r6
 8010dca:	6edc      	or      	r11, r7
 8010dcc:	0b80      	bt      	0x8010ccc	// 8010ccc <_fpadd_parts+0x60>
 8010dce:	d98e2000 	ld.w      	r12, (r14, 0x0)
 8010dd2:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010dd6:	6731      	cmplt      	r12, r12
 8010dd8:	6329      	addc      	r12, r10
 8010dda:	636d      	addc      	r13, r11
 8010ddc:	b201      	st.w      	r0, (r2, 0x4)
 8010dde:	b262      	st.w      	r3, (r2, 0x8)
 8010de0:	dd822003 	st.w      	r12, (r2, 0xc)
 8010de4:	dda22004 	st.w      	r13, (r2, 0x10)
 8010de8:	3303      	movi      	r3, 3
 8010dea:	b260      	st.w      	r3, (r2, 0x0)
 8010dec:	c7805023 	bmaski      	r3, 29
 8010df0:	674c      	cmphs      	r3, r13
 8010df2:	0812      	bt      	0x8010e16	// 8010e16 <_fpadd_parts+0x1aa>
 8010df4:	c7ed4823 	lsli      	r3, r13, 31
 8010df8:	c42c4840 	lsri      	r0, r12, 1
 8010dfc:	6c0c      	or      	r0, r3
 8010dfe:	c42d4841 	lsri      	r1, r13, 1
 8010e02:	9262      	ld.w      	r3, (r2, 0x8)
 8010e04:	e48c2001 	andi      	r4, r12, 1
 8010e08:	3500      	movi      	r5, 0
 8010e0a:	6c10      	or      	r0, r4
 8010e0c:	6c54      	or      	r1, r5
 8010e0e:	2300      	addi      	r3, 1
 8010e10:	b203      	st.w      	r0, (r2, 0xc)
 8010e12:	b224      	st.w      	r1, (r2, 0x10)
 8010e14:	b262      	st.w      	r3, (r2, 0x8)
 8010e16:	6c0b      	mov      	r0, r2
 8010e18:	1403      	addi      	r14, r14, 12
 8010e1a:	1488      	pop      	r4-r11
 8010e1c:	3b42      	cmpnei      	r3, 2
 8010e1e:	0b9d      	bt      	0x8010d58	// 8010d58 <_fpadd_parts+0xec>
 8010e20:	b260      	st.w      	r3, (r2, 0x0)
 8010e22:	9061      	ld.w      	r3, (r0, 0x4)
 8010e24:	b261      	st.w      	r3, (r2, 0x4)
 8010e26:	9062      	ld.w      	r3, (r0, 0x8)
 8010e28:	b262      	st.w      	r3, (r2, 0x8)
 8010e2a:	9063      	ld.w      	r3, (r0, 0xc)
 8010e2c:	b263      	st.w      	r3, (r2, 0xc)
 8010e2e:	9064      	ld.w      	r3, (r0, 0x10)
 8010e30:	9121      	ld.w      	r1, (r1, 0x4)
 8010e32:	b264      	st.w      	r3, (r2, 0x10)
 8010e34:	9061      	ld.w      	r3, (r0, 0x4)
 8010e36:	68c4      	and      	r3, r1
 8010e38:	b261      	st.w      	r3, (r2, 0x4)
 8010e3a:	6c0b      	mov      	r0, r2
 8010e3c:	078e      	br      	0x8010d58	// 8010d58 <_fpadd_parts+0xec>
 8010e3e:	6428      	cmphs      	r10, r0
 8010e40:	0b75      	bt      	0x8010d2a	// 8010d2a <_fpadd_parts+0xbe>
 8010e42:	0784      	br      	0x8010d4a	// 8010d4a <_fpadd_parts+0xde>
 8010e44:	6730      	cmphs      	r12, r12
 8010e46:	632b      	subc      	r12, r10
 8010e48:	636f      	subc      	r13, r11
 8010e4a:	074c      	br      	0x8010ce2	// 8010ce2 <_fpadd_parts+0x76>
 8010e4c:	6cf3      	mov      	r3, r12
 8010e4e:	ea0d0000 	movi      	r13, 0
 8010e52:	ea0c0000 	movi      	r12, 0
 8010e56:	dd8e2000 	st.w      	r12, (r14, 0x0)
 8010e5a:	ddae2001 	st.w      	r13, (r14, 0x4)
 8010e5e:	0733      	br      	0x8010cc4	// 8010cc4 <_fpadd_parts+0x58>
 8010e60:	eb4c0004 	cmpnei      	r12, 4
 8010e64:	0b7a      	bt      	0x8010d58	// 8010d58 <_fpadd_parts+0xec>
 8010e66:	9041      	ld.w      	r2, (r0, 0x4)
 8010e68:	9161      	ld.w      	r3, (r1, 0x4)
 8010e6a:	64ca      	cmpne      	r2, r3
 8010e6c:	124b      	lrw      	r2, 0x8013ad0	// 8010f98 <__subdf3+0x38>
 8010e6e:	c4020c40 	inct      	r0, r2, 0
 8010e72:	0773      	br      	0x8010d58	// 8010d58 <_fpadd_parts+0xec>
 8010e74:	ea0a0000 	movi      	r10, 0
 8010e78:	ea0b0000 	movi      	r11, 0
 8010e7c:	3101      	movi      	r1, 1
 8010e7e:	6730      	cmphs      	r12, r12
 8010e80:	c58a010c 	subc      	r12, r10, r12
 8010e84:	c5ab010d 	subc      	r13, r11, r13
 8010e88:	b221      	st.w      	r1, (r2, 0x4)
 8010e8a:	b262      	st.w      	r3, (r2, 0x8)
 8010e8c:	dd822003 	st.w      	r12, (r2, 0xc)
 8010e90:	dda22004 	st.w      	r13, (r2, 0x10)
 8010e94:	0730      	br      	0x8010cf4	// 8010cf4 <_fpadd_parts+0x88>
 8010e96:	e90dff17 	bez      	r13, 0x8010cc4	// 8010cc4 <_fpadd_parts+0x58>
 8010e9a:	98c0      	ld.w      	r6, (r14, 0x0)
 8010e9c:	98e1      	ld.w      	r7, (r14, 0x4)
 8010e9e:	ea0d001f 	movi      	r13, 31
 8010ea2:	47c1      	lsli      	r6, r7, 1
 8010ea4:	6362      	subu      	r13, r8
 8010ea6:	c5a6402d 	lsl      	r13, r6, r13
 8010eaa:	ddae2002 	st.w      	r13, (r14, 0x8)
 8010eae:	d9ae2000 	ld.w      	r13, (r14, 0x0)
 8010eb2:	e588101f 	subi      	r12, r8, 32
 8010eb6:	c50d4046 	lsr      	r6, r13, r8
 8010eba:	d9ae2002 	ld.w      	r13, (r14, 0x8)
 8010ebe:	c7ec2880 	btsti      	r12, 31
 8010ec2:	3400      	movi      	r4, 0
 8010ec4:	c5874049 	lsr      	r9, r7, r12
 8010ec8:	6db4      	or      	r6, r13
 8010eca:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010ece:	c4c90c20 	incf      	r6, r9, 0
 8010ed2:	c50d4047 	lsr      	r7, r13, r8
 8010ed6:	c5854029 	lsl      	r9, r5, r12
 8010eda:	6f53      	mov      	r13, r4
 8010edc:	c505402c 	lsl      	r12, r5, r8
 8010ee0:	c5a90c20 	incf      	r13, r9, 0
 8010ee4:	c5840c20 	incf      	r12, r4, 0
 8010ee8:	c4e40c20 	incf      	r7, r4, 0
 8010eec:	60e0      	addu      	r3, r8
 8010eee:	eb4c0000 	cmpnei      	r12, 0
 8010ef2:	c5ad0c81 	decf      	r13, r13, 1
 8010ef6:	e58c1000 	subi      	r12, r12, 1
 8010efa:	d90e2000 	ld.w      	r8, (r14, 0x0)
 8010efe:	d92e2001 	ld.w      	r9, (r14, 0x4)
 8010f02:	6a30      	and      	r8, r12
 8010f04:	6a74      	and      	r9, r13
 8010f06:	6f23      	mov      	r12, r8
 8010f08:	6f67      	mov      	r13, r9
 8010f0a:	6f34      	or      	r12, r13
 8010f0c:	eb4c0000 	cmpnei      	r12, 0
 8010f10:	c400050c 	mvc      	r12
 8010f14:	6f53      	mov      	r13, r4
 8010f16:	c5862424 	or      	r4, r6, r12
 8010f1a:	c5a72425 	or      	r5, r7, r13
 8010f1e:	b880      	st.w      	r4, (r14, 0x0)
 8010f20:	b8a1      	st.w      	r5, (r14, 0x4)
 8010f22:	06d1      	br      	0x8010cc4	// 8010cc4 <_fpadd_parts+0x58>
 8010f24:	3300      	movi      	r3, 0
 8010f26:	2b01      	subi      	r3, 2
 8010f28:	640c      	cmphs      	r3, r0
 8010f2a:	0af1      	bt      	0x8010d0c	// 8010d0c <_fpadd_parts+0xa0>
 8010f2c:	075e      	br      	0x8010de8	// 8010de8 <_fpadd_parts+0x17c>
	...

08010f30 <__adddf3>:
 8010f30:	14d2      	push      	r4-r5, r15
 8010f32:	1433      	subi      	r14, r14, 76
 8010f34:	b800      	st.w      	r0, (r14, 0x0)
 8010f36:	b821      	st.w      	r1, (r14, 0x4)
 8010f38:	6c3b      	mov      	r0, r14
 8010f3a:	6d47      	mov      	r5, r1
 8010f3c:	1904      	addi      	r1, r14, 16
 8010f3e:	b863      	st.w      	r3, (r14, 0xc)
 8010f40:	b842      	st.w      	r2, (r14, 0x8)
 8010f42:	e00003b7 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 8010f46:	1909      	addi      	r1, r14, 36
 8010f48:	1802      	addi      	r0, r14, 8
 8010f4a:	e00003b3 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 8010f4e:	1a0e      	addi      	r2, r14, 56
 8010f50:	1909      	addi      	r1, r14, 36
 8010f52:	1804      	addi      	r0, r14, 16
 8010f54:	e3fffe8c 	bsr      	0x8010c6c	// 8010c6c <_fpadd_parts>
 8010f58:	e00002e4 	bsr      	0x8011520	// 8011520 <__pack_d>
 8010f5c:	1413      	addi      	r14, r14, 76
 8010f5e:	1492      	pop      	r4-r5, r15

08010f60 <__subdf3>:
 8010f60:	14d2      	push      	r4-r5, r15
 8010f62:	1433      	subi      	r14, r14, 76
 8010f64:	b800      	st.w      	r0, (r14, 0x0)
 8010f66:	b821      	st.w      	r1, (r14, 0x4)
 8010f68:	6c3b      	mov      	r0, r14
 8010f6a:	6d47      	mov      	r5, r1
 8010f6c:	1904      	addi      	r1, r14, 16
 8010f6e:	b842      	st.w      	r2, (r14, 0x8)
 8010f70:	b863      	st.w      	r3, (r14, 0xc)
 8010f72:	e000039f 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 8010f76:	1909      	addi      	r1, r14, 36
 8010f78:	1802      	addi      	r0, r14, 8
 8010f7a:	e000039b 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 8010f7e:	986a      	ld.w      	r3, (r14, 0x28)
 8010f80:	e4634001 	xori      	r3, r3, 1
 8010f84:	1a0e      	addi      	r2, r14, 56
 8010f86:	1909      	addi      	r1, r14, 36
 8010f88:	1804      	addi      	r0, r14, 16
 8010f8a:	b86a      	st.w      	r3, (r14, 0x28)
 8010f8c:	e3fffe70 	bsr      	0x8010c6c	// 8010c6c <_fpadd_parts>
 8010f90:	e00002c8 	bsr      	0x8011520	// 8011520 <__pack_d>
 8010f94:	1413      	addi      	r14, r14, 76
 8010f96:	1492      	pop      	r4-r5, r15
 8010f98:	08013ad0 	.long	0x08013ad0

08010f9c <__muldf3>:
 8010f9c:	14d8      	push      	r4-r11, r15
 8010f9e:	1436      	subi      	r14, r14, 88
 8010fa0:	b803      	st.w      	r0, (r14, 0xc)
 8010fa2:	b824      	st.w      	r1, (r14, 0x10)
 8010fa4:	1803      	addi      	r0, r14, 12
 8010fa6:	1907      	addi      	r1, r14, 28
 8010fa8:	b866      	st.w      	r3, (r14, 0x18)
 8010faa:	b845      	st.w      	r2, (r14, 0x14)
 8010fac:	e0000382 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 8010fb0:	190c      	addi      	r1, r14, 48
 8010fb2:	1805      	addi      	r0, r14, 20
 8010fb4:	e000037e 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 8010fb8:	9867      	ld.w      	r3, (r14, 0x1c)
 8010fba:	3b01      	cmphsi      	r3, 2
 8010fbc:	0ca4      	bf      	0x8011104	// 8011104 <__muldf3+0x168>
 8010fbe:	984c      	ld.w      	r2, (r14, 0x30)
 8010fc0:	3a01      	cmphsi      	r2, 2
 8010fc2:	0c94      	bf      	0x80110ea	// 80110ea <__muldf3+0x14e>
 8010fc4:	3b44      	cmpnei      	r3, 4
 8010fc6:	0c9d      	bf      	0x8011100	// 8011100 <__muldf3+0x164>
 8010fc8:	3a44      	cmpnei      	r2, 4
 8010fca:	0c8e      	bf      	0x80110e6	// 80110e6 <__muldf3+0x14a>
 8010fcc:	3b42      	cmpnei      	r3, 2
 8010fce:	0c9b      	bf      	0x8011104	// 8011104 <__muldf3+0x168>
 8010fd0:	3a42      	cmpnei      	r2, 2
 8010fd2:	0c8c      	bf      	0x80110ea	// 80110ea <__muldf3+0x14e>
 8010fd4:	d98e200f 	ld.w      	r12, (r14, 0x3c)
 8010fd8:	d90e200a 	ld.w      	r8, (r14, 0x28)
 8010fdc:	3300      	movi      	r3, 0
 8010fde:	6c33      	mov      	r0, r12
 8010fe0:	6ca3      	mov      	r2, r8
 8010fe2:	6c4f      	mov      	r1, r3
 8010fe4:	dd8e2002 	st.w      	r12, (r14, 0x8)
 8010fe8:	d96e2010 	ld.w      	r11, (r14, 0x40)
 8010fec:	e0000274 	bsr      	0x80114d4	// 80114d4 <__muldi3>
 8010ff0:	3300      	movi      	r3, 0
 8010ff2:	6ca3      	mov      	r2, r8
 8010ff4:	6d83      	mov      	r6, r0
 8010ff6:	6dc7      	mov      	r7, r1
 8010ff8:	6c4f      	mov      	r1, r3
 8010ffa:	6c2f      	mov      	r0, r11
 8010ffc:	e000026c 	bsr      	0x80114d4	// 80114d4 <__muldi3>
 8011000:	d94e200b 	ld.w      	r10, (r14, 0x2c)
 8011004:	3300      	movi      	r3, 0
 8011006:	6e03      	mov      	r8, r0
 8011008:	6e47      	mov      	r9, r1
 801100a:	6caf      	mov      	r2, r11
 801100c:	6c4f      	mov      	r1, r3
 801100e:	6c2b      	mov      	r0, r10
 8011010:	e0000262 	bsr      	0x80114d4	// 80114d4 <__muldi3>
 8011014:	d98e2002 	ld.w      	r12, (r14, 0x8)
 8011018:	3300      	movi      	r3, 0
 801101a:	b800      	st.w      	r0, (r14, 0x0)
 801101c:	b821      	st.w      	r1, (r14, 0x4)
 801101e:	6cb3      	mov      	r2, r12
 8011020:	6c2b      	mov      	r0, r10
 8011022:	6c4f      	mov      	r1, r3
 8011024:	e0000258 	bsr      	0x80114d4	// 80114d4 <__muldi3>
 8011028:	6401      	cmplt      	r0, r0
 801102a:	6021      	addc      	r0, r8
 801102c:	6065      	addc      	r1, r9
 801102e:	6644      	cmphs      	r1, r9
 8011030:	0c80      	bf      	0x8011130	// 8011130 <__muldf3+0x194>
 8011032:	6466      	cmpne      	r9, r1
 8011034:	0c7c      	bf      	0x801112c	// 801112c <__muldf3+0x190>
 8011036:	ea080000 	movi      	r8, 0
 801103a:	ea090000 	movi      	r9, 0
 801103e:	3200      	movi      	r2, 0
 8011040:	6cc3      	mov      	r3, r0
 8011042:	6489      	cmplt      	r2, r2
 8011044:	6099      	addc      	r2, r6
 8011046:	60dd      	addc      	r3, r7
 8011048:	65cc      	cmphs      	r3, r7
 801104a:	0c6a      	bf      	0x801111e	// 801111e <__muldf3+0x182>
 801104c:	64de      	cmpne      	r7, r3
 801104e:	0c66      	bf      	0x801111a	// 801111a <__muldf3+0x17e>
 8011050:	6f07      	mov      	r12, r1
 8011052:	ea0d0000 	movi      	r13, 0
 8011056:	9800      	ld.w      	r0, (r14, 0x0)
 8011058:	9821      	ld.w      	r1, (r14, 0x4)
 801105a:	6401      	cmplt      	r0, r0
 801105c:	6031      	addc      	r0, r12
 801105e:	6075      	addc      	r1, r13
 8011060:	6621      	cmplt      	r8, r8
 8011062:	6201      	addc      	r8, r0
 8011064:	6245      	addc      	r9, r1
 8011066:	980e      	ld.w      	r0, (r14, 0x38)
 8011068:	9829      	ld.w      	r1, (r14, 0x24)
 801106a:	6040      	addu      	r1, r0
 801106c:	590e      	addi      	r0, r1, 4
 801106e:	b813      	st.w      	r0, (r14, 0x4c)
 8011070:	d98e2008 	ld.w      	r12, (r14, 0x20)
 8011074:	980d      	ld.w      	r0, (r14, 0x34)
 8011076:	6432      	cmpne      	r12, r0
 8011078:	c780502a 	bmaski      	r10, 29
 801107c:	c4000500 	mvc      	r0
 8011080:	6668      	cmphs      	r10, r9
 8011082:	b812      	st.w      	r0, (r14, 0x48)
 8011084:	086f      	bt      	0x8011162	// 8011162 <__muldf3+0x1c6>
 8011086:	2104      	addi      	r1, 5
 8011088:	ea0c0000 	movi      	r12, 0
 801108c:	ea2d8000 	movih      	r13, 32768
 8011090:	e4082001 	andi      	r0, r8, 1
 8011094:	6ec7      	mov      	r11, r1
 8011096:	e900000a 	bez      	r0, 0x80110aa	// 80110aa <__muldf3+0x10e>
 801109a:	431f      	lsli      	r0, r3, 31
 801109c:	4a81      	lsri      	r4, r2, 1
 801109e:	6d00      	or      	r4, r0
 80110a0:	4ba1      	lsri      	r5, r3, 1
 80110a2:	c5842422 	or      	r2, r4, r12
 80110a6:	c5a52423 	or      	r3, r5, r13
 80110aa:	c4294840 	lsri      	r0, r9, 1
 80110ae:	6428      	cmphs      	r10, r0
 80110b0:	c7e94827 	lsli      	r7, r9, 31
 80110b4:	c4284846 	lsri      	r6, r8, 1
 80110b8:	c4c72428 	or      	r8, r7, r6
 80110bc:	6e43      	mov      	r9, r0
 80110be:	2100      	addi      	r1, 1
 80110c0:	0fe8      	bf      	0x8011090	// 8011090 <__muldf3+0xf4>
 80110c2:	dd6e2013 	st.w      	r11, (r14, 0x4c)
 80110c6:	e42820ff 	andi      	r1, r8, 255
 80110ca:	eb410080 	cmpnei      	r1, 128
 80110ce:	0c36      	bf      	0x801113a	// 801113a <__muldf3+0x19e>
 80110d0:	3303      	movi      	r3, 3
 80110d2:	dd0e2014 	st.w      	r8, (r14, 0x50)
 80110d6:	dd2e2015 	st.w      	r9, (r14, 0x54)
 80110da:	b871      	st.w      	r3, (r14, 0x44)
 80110dc:	1811      	addi      	r0, r14, 68
 80110de:	e0000221 	bsr      	0x8011520	// 8011520 <__pack_d>
 80110e2:	1416      	addi      	r14, r14, 88
 80110e4:	1498      	pop      	r4-r11, r15
 80110e6:	3b42      	cmpnei      	r3, 2
 80110e8:	0c3b      	bf      	0x801115e	// 801115e <__muldf3+0x1c2>
 80110ea:	986d      	ld.w      	r3, (r14, 0x34)
 80110ec:	9848      	ld.w      	r2, (r14, 0x20)
 80110ee:	64ca      	cmpne      	r2, r3
 80110f0:	c4000503 	mvc      	r3
 80110f4:	180c      	addi      	r0, r14, 48
 80110f6:	b86d      	st.w      	r3, (r14, 0x34)
 80110f8:	e0000214 	bsr      	0x8011520	// 8011520 <__pack_d>
 80110fc:	1416      	addi      	r14, r14, 88
 80110fe:	1498      	pop      	r4-r11, r15
 8011100:	3a42      	cmpnei      	r2, 2
 8011102:	0c2e      	bf      	0x801115e	// 801115e <__muldf3+0x1c2>
 8011104:	9848      	ld.w      	r2, (r14, 0x20)
 8011106:	986d      	ld.w      	r3, (r14, 0x34)
 8011108:	64ca      	cmpne      	r2, r3
 801110a:	c4000503 	mvc      	r3
 801110e:	1807      	addi      	r0, r14, 28
 8011110:	b868      	st.w      	r3, (r14, 0x20)
 8011112:	e0000207 	bsr      	0x8011520	// 8011520 <__pack_d>
 8011116:	1416      	addi      	r14, r14, 88
 8011118:	1498      	pop      	r4-r11, r15
 801111a:	6588      	cmphs      	r2, r6
 801111c:	0b9a      	bt      	0x8011050	// 8011050 <__muldf3+0xb4>
 801111e:	e5080000 	addi      	r8, r8, 1
 8011122:	eb480000 	cmpnei      	r8, 0
 8011126:	c5290c21 	incf      	r9, r9, 1
 801112a:	0793      	br      	0x8011050	// 8011050 <__muldf3+0xb4>
 801112c:	6600      	cmphs      	r0, r8
 801112e:	0b84      	bt      	0x8011036	// 8011036 <__muldf3+0x9a>
 8011130:	ea080000 	movi      	r8, 0
 8011134:	ea090001 	movi      	r9, 1
 8011138:	0783      	br      	0x801103e	// 801103e <__muldf3+0xa2>
 801113a:	e4282100 	andi      	r1, r8, 256
 801113e:	e921ffc9 	bnez      	r1, 0x80110d0	// 80110d0 <__muldf3+0x134>
 8011142:	6c8c      	or      	r2, r3
 8011144:	e902ffc6 	bez      	r2, 0x80110d0	// 80110d0 <__muldf3+0x134>
 8011148:	3280      	movi      	r2, 128
 801114a:	3300      	movi      	r3, 0
 801114c:	3100      	movi      	r1, 0
 801114e:	6489      	cmplt      	r2, r2
 8011150:	60a1      	addc      	r2, r8
 8011152:	60e5      	addc      	r3, r9
 8011154:	29ff      	subi      	r1, 256
 8011156:	c4222028 	and      	r8, r2, r1
 801115a:	6e4f      	mov      	r9, r3
 801115c:	07ba      	br      	0x80110d0	// 80110d0 <__muldf3+0x134>
 801115e:	100f      	lrw      	r0, 0x8013ad0	// 8011198 <__muldf3+0x1fc>
 8011160:	07bf      	br      	0x80110de	// 80110de <__muldf3+0x142>
 8011162:	c760502c 	bmaski      	r12, 28
 8011166:	6670      	cmphs      	r12, r9
 8011168:	0faf      	bf      	0x80110c6	// 80110c6 <__muldf3+0x12a>
 801116a:	2102      	addi      	r1, 3
 801116c:	3401      	movi      	r4, 1
 801116e:	3500      	movi      	r5, 0
 8011170:	6da3      	mov      	r6, r8
 8011172:	6de7      	mov      	r7, r9
 8011174:	6c07      	mov      	r0, r1
 8011176:	6621      	cmplt      	r8, r8
 8011178:	6219      	addc      	r8, r6
 801117a:	625d      	addc      	r9, r7
 801117c:	e9a30004 	bhsz      	r3, 0x8011184	// 8011184 <__muldf3+0x1e8>
 8011180:	6e10      	or      	r8, r4
 8011182:	6e54      	or      	r9, r5
 8011184:	6d8b      	mov      	r6, r2
 8011186:	6dcf      	mov      	r7, r3
 8011188:	6489      	cmplt      	r2, r2
 801118a:	6099      	addc      	r2, r6
 801118c:	60dd      	addc      	r3, r7
 801118e:	6670      	cmphs      	r12, r9
 8011190:	2900      	subi      	r1, 1
 8011192:	0bef      	bt      	0x8011170	// 8011170 <__muldf3+0x1d4>
 8011194:	b813      	st.w      	r0, (r14, 0x4c)
 8011196:	0798      	br      	0x80110c6	// 80110c6 <__muldf3+0x12a>
 8011198:	08013ad0 	.long	0x08013ad0

0801119c <__divdf3>:
 801119c:	14d6      	push      	r4-r9, r15
 801119e:	142e      	subi      	r14, r14, 56
 80111a0:	b800      	st.w      	r0, (r14, 0x0)
 80111a2:	b821      	st.w      	r1, (r14, 0x4)
 80111a4:	6c3b      	mov      	r0, r14
 80111a6:	1904      	addi      	r1, r14, 16
 80111a8:	b863      	st.w      	r3, (r14, 0xc)
 80111aa:	b842      	st.w      	r2, (r14, 0x8)
 80111ac:	e0000282 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 80111b0:	1909      	addi      	r1, r14, 36
 80111b2:	1802      	addi      	r0, r14, 8
 80111b4:	e000027e 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 80111b8:	9864      	ld.w      	r3, (r14, 0x10)
 80111ba:	3b01      	cmphsi      	r3, 2
 80111bc:	0c51      	bf      	0x801125e	// 801125e <__divdf3+0xc2>
 80111be:	9829      	ld.w      	r1, (r14, 0x24)
 80111c0:	3201      	movi      	r2, 1
 80111c2:	6448      	cmphs      	r2, r1
 80111c4:	0873      	bt      	0x80112aa	// 80112aa <__divdf3+0x10e>
 80111c6:	9845      	ld.w      	r2, (r14, 0x14)
 80111c8:	980a      	ld.w      	r0, (r14, 0x28)
 80111ca:	3b44      	cmpnei      	r3, 4
 80111cc:	6c81      	xor      	r2, r0
 80111ce:	b845      	st.w      	r2, (r14, 0x14)
 80111d0:	0c4c      	bf      	0x8011268	// 8011268 <__divdf3+0xcc>
 80111d2:	3b42      	cmpnei      	r3, 2
 80111d4:	0c4a      	bf      	0x8011268	// 8011268 <__divdf3+0xcc>
 80111d6:	3944      	cmpnei      	r1, 4
 80111d8:	0c4c      	bf      	0x8011270	// 8011270 <__divdf3+0xd4>
 80111da:	3942      	cmpnei      	r1, 2
 80111dc:	0c63      	bf      	0x80112a2	// 80112a2 <__divdf3+0x106>
 80111de:	9807      	ld.w      	r0, (r14, 0x1c)
 80111e0:	9828      	ld.w      	r1, (r14, 0x20)
 80111e2:	98cc      	ld.w      	r6, (r14, 0x30)
 80111e4:	98ed      	ld.w      	r7, (r14, 0x34)
 80111e6:	9866      	ld.w      	r3, (r14, 0x18)
 80111e8:	984b      	ld.w      	r2, (r14, 0x2c)
 80111ea:	65c4      	cmphs      	r1, r7
 80111ec:	60ca      	subu      	r3, r2
 80111ee:	b866      	st.w      	r3, (r14, 0x18)
 80111f0:	0c05      	bf      	0x80111fa	// 80111fa <__divdf3+0x5e>
 80111f2:	645e      	cmpne      	r7, r1
 80111f4:	080a      	bt      	0x8011208	// 8011208 <__divdf3+0x6c>
 80111f6:	6580      	cmphs      	r0, r6
 80111f8:	0808      	bt      	0x8011208	// 8011208 <__divdf3+0x6c>
 80111fa:	6f03      	mov      	r12, r0
 80111fc:	6f47      	mov      	r13, r1
 80111fe:	2b00      	subi      	r3, 1
 8011200:	6401      	cmplt      	r0, r0
 8011202:	6031      	addc      	r0, r12
 8011204:	6075      	addc      	r1, r13
 8011206:	b866      	st.w      	r3, (r14, 0x18)
 8011208:	ea0c003d 	movi      	r12, 61
 801120c:	3400      	movi      	r4, 0
 801120e:	3500      	movi      	r5, 0
 8011210:	3200      	movi      	r2, 0
 8011212:	ea231000 	movih      	r3, 4096
 8011216:	65c4      	cmphs      	r1, r7
 8011218:	0c0a      	bf      	0x801122c	// 801122c <__divdf3+0x90>
 801121a:	645e      	cmpne      	r7, r1
 801121c:	0803      	bt      	0x8011222	// 8011222 <__divdf3+0x86>
 801121e:	6580      	cmphs      	r0, r6
 8011220:	0c06      	bf      	0x801122c	// 801122c <__divdf3+0x90>
 8011222:	6d08      	or      	r4, r2
 8011224:	6d4c      	or      	r5, r3
 8011226:	6400      	cmphs      	r0, r0
 8011228:	601b      	subc      	r0, r6
 801122a:	605f      	subc      	r1, r7
 801122c:	c7e34829 	lsli      	r9, r3, 31
 8011230:	c4224848 	lsri      	r8, r2, 1
 8011234:	c423484d 	lsri      	r13, r3, 1
 8011238:	c5092422 	or      	r2, r9, r8
 801123c:	e58c1000 	subi      	r12, r12, 1
 8011240:	6e03      	mov      	r8, r0
 8011242:	6e47      	mov      	r9, r1
 8011244:	6cf7      	mov      	r3, r13
 8011246:	6401      	cmplt      	r0, r0
 8011248:	6021      	addc      	r0, r8
 801124a:	6065      	addc      	r1, r9
 801124c:	e92cffe5 	bnez      	r12, 0x8011216	// 8011216 <__divdf3+0x7a>
 8011250:	e46420ff 	andi      	r3, r4, 255
 8011254:	eb430080 	cmpnei      	r3, 128
 8011258:	0c13      	bf      	0x801127e	// 801127e <__divdf3+0xe2>
 801125a:	b887      	st.w      	r4, (r14, 0x1c)
 801125c:	b8a8      	st.w      	r5, (r14, 0x20)
 801125e:	1804      	addi      	r0, r14, 16
 8011260:	e0000160 	bsr      	0x8011520	// 8011520 <__pack_d>
 8011264:	140e      	addi      	r14, r14, 56
 8011266:	1496      	pop      	r4-r9, r15
 8011268:	644e      	cmpne      	r3, r1
 801126a:	0bfa      	bt      	0x801125e	// 801125e <__divdf3+0xc2>
 801126c:	1011      	lrw      	r0, 0x8013ad0	// 80112b0 <__divdf3+0x114>
 801126e:	07f9      	br      	0x8011260	// 8011260 <__divdf3+0xc4>
 8011270:	3300      	movi      	r3, 0
 8011272:	3400      	movi      	r4, 0
 8011274:	b867      	st.w      	r3, (r14, 0x1c)
 8011276:	b888      	st.w      	r4, (r14, 0x20)
 8011278:	b866      	st.w      	r3, (r14, 0x18)
 801127a:	1804      	addi      	r0, r14, 16
 801127c:	07f2      	br      	0x8011260	// 8011260 <__divdf3+0xc4>
 801127e:	e4642100 	andi      	r3, r4, 256
 8011282:	e923ffec 	bnez      	r3, 0x801125a	// 801125a <__divdf3+0xbe>
 8011286:	6c04      	or      	r0, r1
 8011288:	e900ffe9 	bez      	r0, 0x801125a	// 801125a <__divdf3+0xbe>
 801128c:	3280      	movi      	r2, 128
 801128e:	3300      	movi      	r3, 0
 8011290:	3100      	movi      	r1, 0
 8011292:	6489      	cmplt      	r2, r2
 8011294:	6091      	addc      	r2, r4
 8011296:	60d5      	addc      	r3, r5
 8011298:	29ff      	subi      	r1, 256
 801129a:	c4222024 	and      	r4, r2, r1
 801129e:	6d4f      	mov      	r5, r3
 80112a0:	07dd      	br      	0x801125a	// 801125a <__divdf3+0xbe>
 80112a2:	3304      	movi      	r3, 4
 80112a4:	b864      	st.w      	r3, (r14, 0x10)
 80112a6:	1804      	addi      	r0, r14, 16
 80112a8:	07dc      	br      	0x8011260	// 8011260 <__divdf3+0xc4>
 80112aa:	1809      	addi      	r0, r14, 36
 80112ac:	07da      	br      	0x8011260	// 8011260 <__divdf3+0xc4>
 80112ae:	0000      	.short	0x0000
 80112b0:	08013ad0 	.long	0x08013ad0

080112b4 <__nedf2>:
 80112b4:	14d2      	push      	r4-r5, r15
 80112b6:	142e      	subi      	r14, r14, 56
 80112b8:	b800      	st.w      	r0, (r14, 0x0)
 80112ba:	b821      	st.w      	r1, (r14, 0x4)
 80112bc:	6c3b      	mov      	r0, r14
 80112be:	6d47      	mov      	r5, r1
 80112c0:	1904      	addi      	r1, r14, 16
 80112c2:	b863      	st.w      	r3, (r14, 0xc)
 80112c4:	b842      	st.w      	r2, (r14, 0x8)
 80112c6:	e00001f5 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 80112ca:	1802      	addi      	r0, r14, 8
 80112cc:	1909      	addi      	r1, r14, 36
 80112ce:	e00001f1 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 80112d2:	9864      	ld.w      	r3, (r14, 0x10)
 80112d4:	3001      	movi      	r0, 1
 80112d6:	64c0      	cmphs      	r0, r3
 80112d8:	0808      	bt      	0x80112e8	// 80112e8 <__nedf2+0x34>
 80112da:	9869      	ld.w      	r3, (r14, 0x24)
 80112dc:	64c0      	cmphs      	r0, r3
 80112de:	0805      	bt      	0x80112e8	// 80112e8 <__nedf2+0x34>
 80112e0:	1909      	addi      	r1, r14, 36
 80112e2:	1804      	addi      	r0, r14, 16
 80112e4:	e0000258 	bsr      	0x8011794	// 8011794 <__fpcmp_parts_d>
 80112e8:	140e      	addi      	r14, r14, 56
 80112ea:	1492      	pop      	r4-r5, r15

080112ec <__gtdf2>:
 80112ec:	14d2      	push      	r4-r5, r15
 80112ee:	142e      	subi      	r14, r14, 56
 80112f0:	b800      	st.w      	r0, (r14, 0x0)
 80112f2:	b821      	st.w      	r1, (r14, 0x4)
 80112f4:	6c3b      	mov      	r0, r14
 80112f6:	6d47      	mov      	r5, r1
 80112f8:	1904      	addi      	r1, r14, 16
 80112fa:	b842      	st.w      	r2, (r14, 0x8)
 80112fc:	b863      	st.w      	r3, (r14, 0xc)
 80112fe:	e00001d9 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 8011302:	1909      	addi      	r1, r14, 36
 8011304:	1802      	addi      	r0, r14, 8
 8011306:	e00001d5 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 801130a:	9844      	ld.w      	r2, (r14, 0x10)
 801130c:	3301      	movi      	r3, 1
 801130e:	648c      	cmphs      	r3, r2
 8011310:	080a      	bt      	0x8011324	// 8011324 <__gtdf2+0x38>
 8011312:	9849      	ld.w      	r2, (r14, 0x24)
 8011314:	648c      	cmphs      	r3, r2
 8011316:	0807      	bt      	0x8011324	// 8011324 <__gtdf2+0x38>
 8011318:	1909      	addi      	r1, r14, 36
 801131a:	1804      	addi      	r0, r14, 16
 801131c:	e000023c 	bsr      	0x8011794	// 8011794 <__fpcmp_parts_d>
 8011320:	140e      	addi      	r14, r14, 56
 8011322:	1492      	pop      	r4-r5, r15
 8011324:	3000      	movi      	r0, 0
 8011326:	2800      	subi      	r0, 1
 8011328:	140e      	addi      	r14, r14, 56
 801132a:	1492      	pop      	r4-r5, r15

0801132c <__gedf2>:
 801132c:	14d2      	push      	r4-r5, r15
 801132e:	142e      	subi      	r14, r14, 56
 8011330:	b800      	st.w      	r0, (r14, 0x0)
 8011332:	b821      	st.w      	r1, (r14, 0x4)
 8011334:	6c3b      	mov      	r0, r14
 8011336:	6d47      	mov      	r5, r1
 8011338:	1904      	addi      	r1, r14, 16
 801133a:	b842      	st.w      	r2, (r14, 0x8)
 801133c:	b863      	st.w      	r3, (r14, 0xc)
 801133e:	e00001b9 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 8011342:	1909      	addi      	r1, r14, 36
 8011344:	1802      	addi      	r0, r14, 8
 8011346:	e00001b5 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 801134a:	9844      	ld.w      	r2, (r14, 0x10)
 801134c:	3301      	movi      	r3, 1
 801134e:	648c      	cmphs      	r3, r2
 8011350:	080a      	bt      	0x8011364	// 8011364 <__gedf2+0x38>
 8011352:	9849      	ld.w      	r2, (r14, 0x24)
 8011354:	648c      	cmphs      	r3, r2
 8011356:	0807      	bt      	0x8011364	// 8011364 <__gedf2+0x38>
 8011358:	1909      	addi      	r1, r14, 36
 801135a:	1804      	addi      	r0, r14, 16
 801135c:	e000021c 	bsr      	0x8011794	// 8011794 <__fpcmp_parts_d>
 8011360:	140e      	addi      	r14, r14, 56
 8011362:	1492      	pop      	r4-r5, r15
 8011364:	3000      	movi      	r0, 0
 8011366:	2800      	subi      	r0, 1
 8011368:	140e      	addi      	r14, r14, 56
 801136a:	1492      	pop      	r4-r5, r15

0801136c <__ltdf2>:
 801136c:	14d2      	push      	r4-r5, r15
 801136e:	142e      	subi      	r14, r14, 56
 8011370:	b800      	st.w      	r0, (r14, 0x0)
 8011372:	b821      	st.w      	r1, (r14, 0x4)
 8011374:	6c3b      	mov      	r0, r14
 8011376:	6d47      	mov      	r5, r1
 8011378:	1904      	addi      	r1, r14, 16
 801137a:	b863      	st.w      	r3, (r14, 0xc)
 801137c:	b842      	st.w      	r2, (r14, 0x8)
 801137e:	e0000199 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 8011382:	1802      	addi      	r0, r14, 8
 8011384:	1909      	addi      	r1, r14, 36
 8011386:	e0000195 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 801138a:	9864      	ld.w      	r3, (r14, 0x10)
 801138c:	3001      	movi      	r0, 1
 801138e:	64c0      	cmphs      	r0, r3
 8011390:	0808      	bt      	0x80113a0	// 80113a0 <__ltdf2+0x34>
 8011392:	9869      	ld.w      	r3, (r14, 0x24)
 8011394:	64c0      	cmphs      	r0, r3
 8011396:	0805      	bt      	0x80113a0	// 80113a0 <__ltdf2+0x34>
 8011398:	1909      	addi      	r1, r14, 36
 801139a:	1804      	addi      	r0, r14, 16
 801139c:	e00001fc 	bsr      	0x8011794	// 8011794 <__fpcmp_parts_d>
 80113a0:	140e      	addi      	r14, r14, 56
 80113a2:	1492      	pop      	r4-r5, r15

080113a4 <__floatsidf>:
 80113a4:	14d0      	push      	r15
 80113a6:	1425      	subi      	r14, r14, 20
 80113a8:	3303      	movi      	r3, 3
 80113aa:	b860      	st.w      	r3, (r14, 0x0)
 80113ac:	487f      	lsri      	r3, r0, 31
 80113ae:	b861      	st.w      	r3, (r14, 0x4)
 80113b0:	e9200009 	bnez      	r0, 0x80113c2	// 80113c2 <__floatsidf+0x1e>
 80113b4:	3302      	movi      	r3, 2
 80113b6:	b860      	st.w      	r3, (r14, 0x0)
 80113b8:	6c3b      	mov      	r0, r14
 80113ba:	e00000b3 	bsr      	0x8011520	// 8011520 <__pack_d>
 80113be:	1405      	addi      	r14, r14, 20
 80113c0:	1490      	pop      	r15
 80113c2:	e9a00008 	bhsz      	r0, 0x80113d2	// 80113d2 <__floatsidf+0x2e>
 80113c6:	ea238000 	movih      	r3, 32768
 80113ca:	64c2      	cmpne      	r0, r3
 80113cc:	0c1c      	bf      	0x8011404	// 8011404 <__floatsidf+0x60>
 80113ce:	3300      	movi      	r3, 0
 80113d0:	5b01      	subu      	r0, r3, r0
 80113d2:	c4007c42 	ff1      	r2, r0
 80113d6:	e422001c 	addi      	r1, r2, 29
 80113da:	ea0c001f 	movi      	r12, 31
 80113de:	2a02      	subi      	r2, 3
 80113e0:	4861      	lsri      	r3, r0, 1
 80113e2:	6306      	subu      	r12, r1
 80113e4:	c440402d 	lsl      	r13, r0, r2
 80113e8:	3adf      	btsti      	r2, 31
 80113ea:	70f1      	lsr      	r3, r12
 80113ec:	c46d0c20 	incf      	r3, r13, 0
 80113f0:	7004      	lsl      	r0, r1
 80113f2:	b864      	st.w      	r3, (r14, 0x10)
 80113f4:	3300      	movi      	r3, 0
 80113f6:	c4030c20 	incf      	r0, r3, 0
 80113fa:	333c      	movi      	r3, 60
 80113fc:	60c6      	subu      	r3, r1
 80113fe:	b803      	st.w      	r0, (r14, 0xc)
 8011400:	b862      	st.w      	r3, (r14, 0x8)
 8011402:	07db      	br      	0x80113b8	// 80113b8 <__floatsidf+0x14>
 8011404:	3000      	movi      	r0, 0
 8011406:	ea21c1e0 	movih      	r1, 49632
 801140a:	07da      	br      	0x80113be	// 80113be <__floatsidf+0x1a>

0801140c <__fixdfsi>:
 801140c:	14d0      	push      	r15
 801140e:	1427      	subi      	r14, r14, 28
 8011410:	b800      	st.w      	r0, (r14, 0x0)
 8011412:	b821      	st.w      	r1, (r14, 0x4)
 8011414:	6c3b      	mov      	r0, r14
 8011416:	1902      	addi      	r1, r14, 8
 8011418:	e000014c 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 801141c:	9862      	ld.w      	r3, (r14, 0x8)
 801141e:	3202      	movi      	r2, 2
 8011420:	64c8      	cmphs      	r2, r3
 8011422:	082a      	bt      	0x8011476	// 8011476 <__fixdfsi+0x6a>
 8011424:	3b44      	cmpnei      	r3, 4
 8011426:	0c06      	bf      	0x8011432	// 8011432 <__fixdfsi+0x26>
 8011428:	9804      	ld.w      	r0, (r14, 0x10)
 801142a:	e9800026 	blz      	r0, 0x8011476	// 8011476 <__fixdfsi+0x6a>
 801142e:	383e      	cmplti      	r0, 31
 8011430:	080a      	bt      	0x8011444	// 8011444 <__fixdfsi+0x38>
 8011432:	9863      	ld.w      	r3, (r14, 0xc)
 8011434:	3b40      	cmpnei      	r3, 0
 8011436:	c4000500 	mvc      	r0
 801143a:	c7c05023 	bmaski      	r3, 31
 801143e:	600c      	addu      	r0, r3
 8011440:	1407      	addi      	r14, r14, 28
 8011442:	1490      	pop      	r15
 8011444:	323c      	movi      	r2, 60
 8011446:	5a21      	subu      	r1, r2, r0
 8011448:	e581101f 	subi      	r12, r1, 32
 801144c:	9866      	ld.w      	r3, (r14, 0x18)
 801144e:	321f      	movi      	r2, 31
 8011450:	c5834040 	lsr      	r0, r3, r12
 8011454:	6086      	subu      	r2, r1
 8011456:	4361      	lsli      	r3, r3, 1
 8011458:	70c8      	lsl      	r3, r2
 801145a:	9845      	ld.w      	r2, (r14, 0x14)
 801145c:	7085      	lsr      	r2, r1
 801145e:	6c8c      	or      	r2, r3
 8011460:	9863      	ld.w      	r3, (r14, 0xc)
 8011462:	c7ec2880 	btsti      	r12, 31
 8011466:	c4020c40 	inct      	r0, r2, 0
 801146a:	e903ffeb 	bez      	r3, 0x8011440	// 8011440 <__fixdfsi+0x34>
 801146e:	3300      	movi      	r3, 0
 8011470:	5b01      	subu      	r0, r3, r0
 8011472:	1407      	addi      	r14, r14, 28
 8011474:	1490      	pop      	r15
 8011476:	3000      	movi      	r0, 0
 8011478:	1407      	addi      	r14, r14, 28
 801147a:	1490      	pop      	r15

0801147c <__floatunsidf>:
 801147c:	14d1      	push      	r4, r15
 801147e:	1425      	subi      	r14, r14, 20
 8011480:	3100      	movi      	r1, 0
 8011482:	b821      	st.w      	r1, (r14, 0x4)
 8011484:	e9000020 	bez      	r0, 0x80114c4	// 80114c4 <__floatunsidf+0x48>
 8011488:	c4007c42 	ff1      	r2, r0
 801148c:	e582001c 	addi      	r12, r2, 29
 8011490:	3303      	movi      	r3, 3
 8011492:	ea0d001f 	movi      	r13, 31
 8011496:	2a02      	subi      	r2, 3
 8011498:	b860      	st.w      	r3, (r14, 0x0)
 801149a:	6372      	subu      	r13, r12
 801149c:	4861      	lsri      	r3, r0, 1
 801149e:	c4404024 	lsl      	r4, r0, r2
 80114a2:	3adf      	btsti      	r2, 31
 80114a4:	70f5      	lsr      	r3, r13
 80114a6:	c4640c20 	incf      	r3, r4, 0
 80114aa:	7030      	lsl      	r0, r12
 80114ac:	c4010c20 	incf      	r0, r1, 0
 80114b0:	b864      	st.w      	r3, (r14, 0x10)
 80114b2:	333c      	movi      	r3, 60
 80114b4:	b803      	st.w      	r0, (r14, 0xc)
 80114b6:	60f2      	subu      	r3, r12
 80114b8:	6c3b      	mov      	r0, r14
 80114ba:	b862      	st.w      	r3, (r14, 0x8)
 80114bc:	e0000032 	bsr      	0x8011520	// 8011520 <__pack_d>
 80114c0:	1405      	addi      	r14, r14, 20
 80114c2:	1491      	pop      	r4, r15
 80114c4:	3302      	movi      	r3, 2
 80114c6:	6c3b      	mov      	r0, r14
 80114c8:	b860      	st.w      	r3, (r14, 0x0)
 80114ca:	e000002b 	bsr      	0x8011520	// 8011520 <__pack_d>
 80114ce:	1405      	addi      	r14, r14, 20
 80114d0:	1491      	pop      	r4, r15
	...

080114d4 <__muldi3>:
 80114d4:	14c3      	push      	r4-r6
 80114d6:	c602484d 	lsri      	r13, r2, 16
 80114da:	c40055ec 	zext      	r12, r0, 15, 0
 80114de:	4890      	lsri      	r4, r0, 16
 80114e0:	c40255e5 	zext      	r5, r2, 15, 0
 80114e4:	c4ac8426 	mult      	r6, r12, r5
 80114e8:	7d50      	mult      	r5, r4
 80114ea:	7f34      	mult      	r12, r13
 80114ec:	7d34      	mult      	r4, r13
 80114ee:	c4ac002d 	addu      	r13, r12, r5
 80114f2:	c606484c 	lsri      	r12, r6, 16
 80114f6:	6334      	addu      	r12, r13
 80114f8:	6570      	cmphs      	r12, r5
 80114fa:	0804      	bt      	0x8011502	// 8011502 <__muldi3+0x2e>
 80114fc:	ea2d0001 	movih      	r13, 1
 8011500:	6134      	addu      	r4, r13
 8011502:	c60c484d 	lsri      	r13, r12, 16
 8011506:	7cc0      	mult      	r3, r0
 8011508:	7c48      	mult      	r1, r2
 801150a:	6134      	addu      	r4, r13
 801150c:	c60c482c 	lsli      	r12, r12, 16
 8011510:	c40655e6 	zext      	r6, r6, 15, 0
 8011514:	604c      	addu      	r1, r3
 8011516:	c4cc0020 	addu      	r0, r12, r6
 801151a:	6050      	addu      	r1, r4
 801151c:	1483      	pop      	r4-r6
	...

08011520 <__pack_d>:
 8011520:	14c5      	push      	r4-r8
 8011522:	9020      	ld.w      	r1, (r0, 0x0)
 8011524:	3901      	cmphsi      	r1, 2
 8011526:	9043      	ld.w      	r2, (r0, 0xc)
 8011528:	9064      	ld.w      	r3, (r0, 0x10)
 801152a:	d9a02001 	ld.w      	r13, (r0, 0x4)
 801152e:	0c47      	bf      	0x80115bc	// 80115bc <__pack_d+0x9c>
 8011530:	3944      	cmpnei      	r1, 4
 8011532:	0c40      	bf      	0x80115b2	// 80115b2 <__pack_d+0x92>
 8011534:	3942      	cmpnei      	r1, 2
 8011536:	0c28      	bf      	0x8011586	// 8011586 <__pack_d+0x66>
 8011538:	c4622421 	or      	r1, r2, r3
 801153c:	e9010025 	bez      	r1, 0x8011586	// 8011586 <__pack_d+0x66>
 8011540:	9022      	ld.w      	r1, (r0, 0x8)
 8011542:	ea0003fd 	movi      	r0, 1021
 8011546:	6c02      	nor      	r0, r0
 8011548:	6405      	cmplt      	r1, r0
 801154a:	0855      	bt      	0x80115f4	// 80115f4 <__pack_d+0xd4>
 801154c:	eb2103ff 	cmplti      	r1, 1024
 8011550:	0c31      	bf      	0x80115b2	// 80115b2 <__pack_d+0x92>
 8011552:	e40220ff 	andi      	r0, r2, 255
 8011556:	eb400080 	cmpnei      	r0, 128
 801155a:	0c43      	bf      	0x80115e0	// 80115e0 <__pack_d+0xc0>
 801155c:	347f      	movi      	r4, 127
 801155e:	3500      	movi      	r5, 0
 8011560:	6489      	cmplt      	r2, r2
 8011562:	6091      	addc      	r2, r4
 8011564:	60d5      	addc      	r3, r5
 8011566:	c7805020 	bmaski      	r0, 29
 801156a:	64c0      	cmphs      	r0, r3
 801156c:	0c19      	bf      	0x801159e	// 801159e <__pack_d+0x7e>
 801156e:	e58103fe 	addi      	r12, r1, 1023
 8011572:	4b28      	lsri      	r1, r3, 8
 8011574:	4398      	lsli      	r4, r3, 24
 8011576:	4a08      	lsri      	r0, r2, 8
 8011578:	c4015663 	zext      	r3, r1, 19, 0
 801157c:	6c4f      	mov      	r1, r3
 801157e:	6c10      	or      	r0, r4
 8011580:	e46c27ff 	andi      	r3, r12, 2047
 8011584:	0404      	br      	0x801158c	// 801158c <__pack_d+0x6c>
 8011586:	3300      	movi      	r3, 0
 8011588:	3000      	movi      	r0, 0
 801158a:	3100      	movi      	r1, 0
 801158c:	3200      	movi      	r2, 0
 801158e:	c4415e60 	ins      	r2, r1, 19, 0
 8011592:	c4435d54 	ins      	r2, r3, 30, 20
 8011596:	c44d5c1f 	ins      	r2, r13, 31, 31
 801159a:	6c4b      	mov      	r1, r2
 801159c:	1485      	pop      	r4-r8
 801159e:	439f      	lsli      	r4, r3, 31
 80115a0:	c422484c 	lsri      	r12, r2, 1
 80115a4:	4b01      	lsri      	r0, r3, 1
 80115a6:	c5842422 	or      	r2, r4, r12
 80115aa:	6cc3      	mov      	r3, r0
 80115ac:	e58103ff 	addi      	r12, r1, 1024
 80115b0:	07e1      	br      	0x8011572	// 8011572 <__pack_d+0x52>
 80115b2:	ea0307ff 	movi      	r3, 2047
 80115b6:	3000      	movi      	r0, 0
 80115b8:	3100      	movi      	r1, 0
 80115ba:	07e9      	br      	0x801158c	// 801158c <__pack_d+0x6c>
 80115bc:	c703482c 	lsli      	r12, r3, 24
 80115c0:	4a48      	lsri      	r2, r2, 8
 80115c2:	c44c2420 	or      	r0, r12, r2
 80115c6:	c5035741 	zext      	r1, r3, 26, 8
 80115ca:	3200      	movi      	r2, 0
 80115cc:	ea230008 	movih      	r3, 8
 80115d0:	6c08      	or      	r0, r2
 80115d2:	6c4c      	or      	r1, r3
 80115d4:	c4015663 	zext      	r3, r1, 19, 0
 80115d8:	6c4f      	mov      	r1, r3
 80115da:	ea0307ff 	movi      	r3, 2047
 80115de:	07d7      	br      	0x801158c	// 801158c <__pack_d+0x6c>
 80115e0:	e4022100 	andi      	r0, r2, 256
 80115e4:	e900ffc1 	bez      	r0, 0x8011566	// 8011566 <__pack_d+0x46>
 80115e8:	3480      	movi      	r4, 128
 80115ea:	3500      	movi      	r5, 0
 80115ec:	6489      	cmplt      	r2, r2
 80115ee:	6091      	addc      	r2, r4
 80115f0:	60d5      	addc      	r3, r5
 80115f2:	07ba      	br      	0x8011566	// 8011566 <__pack_d+0x46>
 80115f4:	5825      	subu      	r1, r0, r1
 80115f6:	eb210038 	cmplti      	r1, 57
 80115fa:	0fc6      	bf      	0x8011586	// 8011586 <__pack_d+0x66>
 80115fc:	341f      	movi      	r4, 31
 80115fe:	c423482c 	lsli      	r12, r3, 1
 8011602:	6106      	subu      	r4, r1
 8011604:	e401101f 	subi      	r0, r1, 32
 8011608:	7310      	lsl      	r12, r4
 801160a:	c4224046 	lsr      	r6, r2, r1
 801160e:	38df      	btsti      	r0, 31
 8011610:	c4034045 	lsr      	r5, r3, r0
 8011614:	ea080000 	movi      	r8, 0
 8011618:	6db0      	or      	r6, r12
 801161a:	ea0c0001 	movi      	r12, 1
 801161e:	c4c50c20 	incf      	r6, r5, 0
 8011622:	c40c4020 	lsl      	r0, r12, r0
 8011626:	6d63      	mov      	r5, r8
 8011628:	c42c4024 	lsl      	r4, r12, r1
 801162c:	c4234047 	lsr      	r7, r3, r1
 8011630:	c4a00c20 	incf      	r5, r0, 0
 8011634:	c4880c20 	incf      	r4, r8, 0
 8011638:	c4e80c20 	incf      	r7, r8, 0
 801163c:	3c40      	cmpnei      	r4, 0
 801163e:	c4a50c81 	decf      	r5, r5, 1
 8011642:	2c00      	subi      	r4, 1
 8011644:	6890      	and      	r2, r4
 8011646:	68d4      	and      	r3, r5
 8011648:	6c8c      	or      	r2, r3
 801164a:	3a40      	cmpnei      	r2, 0
 801164c:	c4000502 	mvc      	r2
 8011650:	6ce3      	mov      	r3, r8
 8011652:	6d88      	or      	r6, r2
 8011654:	6dcc      	or      	r7, r3
 8011656:	e46620ff 	andi      	r3, r6, 255
 801165a:	eb430080 	cmpnei      	r3, 128
 801165e:	0814      	bt      	0x8011686	// 8011686 <__pack_d+0x166>
 8011660:	e4662100 	andi      	r3, r6, 256
 8011664:	e9230023 	bnez      	r3, 0x80116aa	// 80116aa <__pack_d+0x18a>
 8011668:	4758      	lsli      	r2, r7, 24
 801166a:	4f28      	lsri      	r1, r7, 8
 801166c:	4e08      	lsri      	r0, r6, 8
 801166e:	6c08      	or      	r0, r2
 8011670:	c4015662 	zext      	r2, r1, 19, 0
 8011674:	6c4b      	mov      	r1, r2
 8011676:	c7605022 	bmaski      	r2, 28
 801167a:	65c8      	cmphs      	r2, r7
 801167c:	0c02      	bf      	0x8011680	// 8011680 <__pack_d+0x160>
 801167e:	6f0f      	mov      	r12, r3
 8011680:	e46c2001 	andi      	r3, r12, 1
 8011684:	0784      	br      	0x801158c	// 801158c <__pack_d+0x6c>
 8011686:	327f      	movi      	r2, 127
 8011688:	3300      	movi      	r3, 0
 801168a:	6599      	cmplt      	r6, r6
 801168c:	6189      	addc      	r6, r2
 801168e:	61cd      	addc      	r7, r3
 8011690:	4778      	lsli      	r3, r7, 24
 8011692:	4f28      	lsri      	r1, r7, 8
 8011694:	4e08      	lsri      	r0, r6, 8
 8011696:	6c0c      	or      	r0, r3
 8011698:	c4015663 	zext      	r3, r1, 19, 0
 801169c:	6c4f      	mov      	r1, r3
 801169e:	c7605023 	bmaski      	r3, 28
 80116a2:	65cc      	cmphs      	r3, r7
 80116a4:	0fee      	bf      	0x8011680	// 8011680 <__pack_d+0x160>
 80116a6:	6f23      	mov      	r12, r8
 80116a8:	07ec      	br      	0x8011680	// 8011680 <__pack_d+0x160>
 80116aa:	3280      	movi      	r2, 128
 80116ac:	07ee      	br      	0x8011688	// 8011688 <__pack_d+0x168>
	...

080116b0 <__unpack_d>:
 80116b0:	1421      	subi      	r14, r14, 4
 80116b2:	dd6e2000 	st.w      	r11, (r14, 0x0)
 80116b6:	8863      	ld.h      	r3, (r0, 0x6)
 80116b8:	8047      	ld.b      	r2, (r0, 0x7)
 80116ba:	c48355c3 	zext      	r3, r3, 14, 4
 80116be:	d9802001 	ld.w      	r12, (r0, 0x4)
 80116c2:	4a47      	lsri      	r2, r2, 7
 80116c4:	d9a02000 	ld.w      	r13, (r0, 0x0)
 80116c8:	c40c566c 	zext      	r12, r12, 19, 0
 80116cc:	b141      	st.w      	r2, (r1, 0x4)
 80116ce:	e9230025 	bnez      	r3, 0x8011718	// 8011718 <__unpack_d+0x68>
 80116d2:	c58d2423 	or      	r3, r13, r12
 80116d6:	e903003c 	bez      	r3, 0x801174e	// 801174e <__unpack_d+0x9e>
 80116da:	c70d4840 	lsri      	r0, r13, 24
 80116de:	c50c4823 	lsli      	r3, r12, 8
 80116e2:	6cc0      	or      	r3, r0
 80116e4:	3003      	movi      	r0, 3
 80116e6:	c50d4822 	lsli      	r2, r13, 8
 80116ea:	b100      	st.w      	r0, (r1, 0x0)
 80116ec:	c760502d 	bmaski      	r13, 28
 80116f0:	ea0003fe 	movi      	r0, 1022
 80116f4:	6c02      	nor      	r0, r0
 80116f6:	6ecb      	mov      	r11, r2
 80116f8:	6f0f      	mov      	r12, r3
 80116fa:	6489      	cmplt      	r2, r2
 80116fc:	60ad      	addc      	r2, r11
 80116fe:	60f1      	addc      	r3, r12
 8011700:	64f4      	cmphs      	r13, r3
 8011702:	6f03      	mov      	r12, r0
 8011704:	2800      	subi      	r0, 1
 8011706:	0bf8      	bt      	0x80116f6	// 80116f6 <__unpack_d+0x46>
 8011708:	dd812002 	st.w      	r12, (r1, 0x8)
 801170c:	b143      	st.w      	r2, (r1, 0xc)
 801170e:	b164      	st.w      	r3, (r1, 0x10)
 8011710:	d96e2000 	ld.w      	r11, (r14, 0x0)
 8011714:	1401      	addi      	r14, r14, 4
 8011716:	783c      	jmp      	r15
 8011718:	eb4307ff 	cmpnei      	r3, 2047
 801171c:	0c1f      	bf      	0x801175a	// 801175a <__unpack_d+0xaa>
 801171e:	e46313fe 	subi      	r3, r3, 1023
 8011722:	b162      	st.w      	r3, (r1, 0x8)
 8011724:	3303      	movi      	r3, 3
 8011726:	c70d4840 	lsri      	r0, r13, 24
 801172a:	b160      	st.w      	r3, (r1, 0x0)
 801172c:	c50c4823 	lsli      	r3, r12, 8
 8011730:	c50d4822 	lsli      	r2, r13, 8
 8011734:	6cc0      	or      	r3, r0
 8011736:	ea0c0000 	movi      	r12, 0
 801173a:	ea2d1000 	movih      	r13, 4096
 801173e:	6cb0      	or      	r2, r12
 8011740:	6cf4      	or      	r3, r13
 8011742:	b143      	st.w      	r2, (r1, 0xc)
 8011744:	b164      	st.w      	r3, (r1, 0x10)
 8011746:	d96e2000 	ld.w      	r11, (r14, 0x0)
 801174a:	1401      	addi      	r14, r14, 4
 801174c:	783c      	jmp      	r15
 801174e:	3302      	movi      	r3, 2
 8011750:	b160      	st.w      	r3, (r1, 0x0)
 8011752:	d96e2000 	ld.w      	r11, (r14, 0x0)
 8011756:	1401      	addi      	r14, r14, 4
 8011758:	783c      	jmp      	r15
 801175a:	c58d2423 	or      	r3, r13, r12
 801175e:	e9030018 	bez      	r3, 0x801178e	// 801178e <__unpack_d+0xde>
 8011762:	ea230008 	movih      	r3, 8
 8011766:	68f0      	and      	r3, r12
 8011768:	3b40      	cmpnei      	r3, 0
 801176a:	3201      	movi      	r2, 1
 801176c:	c4620c40 	inct      	r3, r2, 0
 8011770:	b160      	st.w      	r3, (r1, 0x0)
 8011772:	c50c482c 	lsli      	r12, r12, 8
 8011776:	c70d4843 	lsri      	r3, r13, 24
 801177a:	6f0c      	or      	r12, r3
 801177c:	c50d482d 	lsli      	r13, r13, 8
 8011780:	c76c282c 	bclri      	r12, r12, 27
 8011784:	dda12003 	st.w      	r13, (r1, 0xc)
 8011788:	dd812004 	st.w      	r12, (r1, 0x10)
 801178c:	07dd      	br      	0x8011746	// 8011746 <__unpack_d+0x96>
 801178e:	3304      	movi      	r3, 4
 8011790:	b160      	st.w      	r3, (r1, 0x0)
 8011792:	07da      	br      	0x8011746	// 8011746 <__unpack_d+0x96>

08011794 <__fpcmp_parts_d>:
 8011794:	9040      	ld.w      	r2, (r0, 0x0)
 8011796:	3301      	movi      	r3, 1
 8011798:	648c      	cmphs      	r3, r2
 801179a:	0830      	bt      	0x80117fa	// 80117fa <__fpcmp_parts_d+0x66>
 801179c:	d9812000 	ld.w      	r12, (r1, 0x0)
 80117a0:	670c      	cmphs      	r3, r12
 80117a2:	082c      	bt      	0x80117fa	// 80117fa <__fpcmp_parts_d+0x66>
 80117a4:	3a44      	cmpnei      	r2, 4
 80117a6:	0c1f      	bf      	0x80117e4	// 80117e4 <__fpcmp_parts_d+0x50>
 80117a8:	eb4c0004 	cmpnei      	r12, 4
 80117ac:	0c14      	bf      	0x80117d4	// 80117d4 <__fpcmp_parts_d+0x40>
 80117ae:	3a42      	cmpnei      	r2, 2
 80117b0:	0c0f      	bf      	0x80117ce	// 80117ce <__fpcmp_parts_d+0x3a>
 80117b2:	eb4c0002 	cmpnei      	r12, 2
 80117b6:	0c1a      	bf      	0x80117ea	// 80117ea <__fpcmp_parts_d+0x56>
 80117b8:	9041      	ld.w      	r2, (r0, 0x4)
 80117ba:	d9812001 	ld.w      	r12, (r1, 0x4)
 80117be:	670a      	cmpne      	r2, r12
 80117c0:	0c1f      	bf      	0x80117fe	// 80117fe <__fpcmp_parts_d+0x6a>
 80117c2:	3000      	movi      	r0, 0
 80117c4:	2800      	subi      	r0, 1
 80117c6:	3a40      	cmpnei      	r2, 0
 80117c8:	c4030c20 	incf      	r0, r3, 0
 80117cc:	783c      	jmp      	r15
 80117ce:	eb4c0002 	cmpnei      	r12, 2
 80117d2:	0c2a      	bf      	0x8011826	// 8011826 <__fpcmp_parts_d+0x92>
 80117d4:	9141      	ld.w      	r2, (r1, 0x4)
 80117d6:	3300      	movi      	r3, 0
 80117d8:	2b00      	subi      	r3, 1
 80117da:	3a40      	cmpnei      	r2, 0
 80117dc:	3001      	movi      	r0, 1
 80117de:	c4030c20 	incf      	r0, r3, 0
 80117e2:	783c      	jmp      	r15
 80117e4:	eb4c0004 	cmpnei      	r12, 4
 80117e8:	0c21      	bf      	0x801182a	// 801182a <__fpcmp_parts_d+0x96>
 80117ea:	9061      	ld.w      	r3, (r0, 0x4)
 80117ec:	3000      	movi      	r0, 0
 80117ee:	3b40      	cmpnei      	r3, 0
 80117f0:	2800      	subi      	r0, 1
 80117f2:	3301      	movi      	r3, 1
 80117f4:	c4030c20 	incf      	r0, r3, 0
 80117f8:	783c      	jmp      	r15
 80117fa:	6c0f      	mov      	r0, r3
 80117fc:	783c      	jmp      	r15
 80117fe:	d9a02002 	ld.w      	r13, (r0, 0x8)
 8011802:	d9812002 	ld.w      	r12, (r1, 0x8)
 8011806:	6771      	cmplt      	r12, r13
 8011808:	0bdd      	bt      	0x80117c2	// 80117c2 <__fpcmp_parts_d+0x2e>
 801180a:	6735      	cmplt      	r13, r12
 801180c:	0c13      	bf      	0x8011832	// 8011832 <__fpcmp_parts_d+0x9e>
 801180e:	3000      	movi      	r0, 0
 8011810:	2800      	subi      	r0, 1
 8011812:	3a40      	cmpnei      	r2, 0
 8011814:	c4030c40 	inct      	r0, r3, 0
 8011818:	07da      	br      	0x80117cc	// 80117cc <__fpcmp_parts_d+0x38>
 801181a:	644c      	cmphs      	r3, r1
 801181c:	0fdd      	bf      	0x80117d6	// 80117d6 <__fpcmp_parts_d+0x42>
 801181e:	64c6      	cmpne      	r1, r3
 8011820:	0803      	bt      	0x8011826	// 8011826 <__fpcmp_parts_d+0x92>
 8011822:	6430      	cmphs      	r12, r0
 8011824:	0fd9      	bf      	0x80117d6	// 80117d6 <__fpcmp_parts_d+0x42>
 8011826:	3000      	movi      	r0, 0
 8011828:	07d2      	br      	0x80117cc	// 80117cc <__fpcmp_parts_d+0x38>
 801182a:	9161      	ld.w      	r3, (r1, 0x4)
 801182c:	9001      	ld.w      	r0, (r0, 0x4)
 801182e:	5b01      	subu      	r0, r3, r0
 8011830:	07ce      	br      	0x80117cc	// 80117cc <__fpcmp_parts_d+0x38>
 8011832:	9064      	ld.w      	r3, (r0, 0x10)
 8011834:	d9802003 	ld.w      	r12, (r0, 0xc)
 8011838:	9103      	ld.w      	r0, (r1, 0xc)
 801183a:	9124      	ld.w      	r1, (r1, 0x10)
 801183c:	64c4      	cmphs      	r1, r3
 801183e:	0c05      	bf      	0x8011848	// 8011848 <__fpcmp_parts_d+0xb4>
 8011840:	644e      	cmpne      	r3, r1
 8011842:	0bec      	bt      	0x801181a	// 801181a <__fpcmp_parts_d+0x86>
 8011844:	6700      	cmphs      	r0, r12
 8011846:	0bea      	bt      	0x801181a	// 801181a <__fpcmp_parts_d+0x86>
 8011848:	3000      	movi      	r0, 0
 801184a:	2800      	subi      	r0, 1
 801184c:	3a40      	cmpnei      	r2, 0
 801184e:	3301      	movi      	r3, 1
 8011850:	c4030c20 	incf      	r0, r3, 0
 8011854:	07bc      	br      	0x80117cc	// 80117cc <__fpcmp_parts_d+0x38>
	...

08011858 <__GI_putchar>:
 8011858:	14d0      	push      	r15
 801185a:	1063      	lrw      	r3, 0x20000120	// 8011864 <__GI_putchar+0xc>
 801185c:	9320      	ld.w      	r1, (r3, 0x0)
 801185e:	e00000cf 	bsr      	0x80119fc	// 80119fc <__GI_putc>
 8011862:	1490      	pop      	r15
 8011864:	20000120 	.long	0x20000120

08011868 <__GI_puts>:
 8011868:	14d1      	push      	r4, r15
 801186a:	1085      	lrw      	r4, 0x20000120	// 801187c <__GI_puts+0x14>
 801186c:	9420      	ld.w      	r1, (r4, 0x0)
 801186e:	e0000009 	bsr      	0x8011880	// 8011880 <__GI_fputs>
 8011872:	9420      	ld.w      	r1, (r4, 0x0)
 8011874:	300a      	movi      	r0, 10
 8011876:	e0001103 	bsr      	0x8013a7c	// 8013a7c <fputc>
 801187a:	1491      	pop      	r4, r15
 801187c:	20000120 	.long	0x20000120

08011880 <__GI_fputs>:
 8011880:	14d5      	push      	r4-r8, r15
 8011882:	6d03      	mov      	r4, r0
 8011884:	6d87      	mov      	r6, r1
 8011886:	e9010018 	bez      	r1, 0x80118b6	// 80118b6 <__GI_fputs+0x36>
 801188a:	e5010017 	addi      	r8, r1, 24
 801188e:	6c23      	mov      	r0, r8
 8011890:	e00000b0 	bsr      	0x80119f0	// 80119f0 <__GI_os_critical_enter>
 8011894:	8400      	ld.b      	r0, (r4, 0x0)
 8011896:	e9000014 	bez      	r0, 0x80118be	// 80118be <__GI_fputs+0x3e>
 801189a:	3500      	movi      	r5, 0
 801189c:	6dd7      	mov      	r7, r5
 801189e:	2f00      	subi      	r7, 1
 80118a0:	0406      	br      	0x80118ac	// 80118ac <__GI_fputs+0x2c>
 80118a2:	2400      	addi      	r4, 1
 80118a4:	8400      	ld.b      	r0, (r4, 0x0)
 80118a6:	2500      	addi      	r5, 1
 80118a8:	e900000c 	bez      	r0, 0x80118c0	// 80118c0 <__GI_fputs+0x40>
 80118ac:	6c5b      	mov      	r1, r6
 80118ae:	e00010e7 	bsr      	0x8013a7c	// 8013a7c <fputc>
 80118b2:	65c2      	cmpne      	r0, r7
 80118b4:	0bf7      	bt      	0x80118a2	// 80118a2 <__GI_fputs+0x22>
 80118b6:	3500      	movi      	r5, 0
 80118b8:	2d00      	subi      	r5, 1
 80118ba:	6c17      	mov      	r0, r5
 80118bc:	1495      	pop      	r4-r8, r15
 80118be:	6d43      	mov      	r5, r0
 80118c0:	6c23      	mov      	r0, r8
 80118c2:	e0000099 	bsr      	0x80119f4	// 80119f4 <__GI_os_critical_exit>
 80118c6:	6c17      	mov      	r0, r5
 80118c8:	1495      	pop      	r4-r8, r15
	...

080118cc <__memset_fast>:
 80118cc:	7444      	zextb      	r1, r1
 80118ce:	e9020023 	bez      	r2, 0x8011914	// 8011914 <__memset_fast+0x48>
 80118d2:	6f43      	mov      	r13, r0
 80118d4:	e5802003 	andi      	r12, r0, 3
 80118d8:	e90c001f 	bez      	r12, 0x8011916	// 8011916 <__memset_fast+0x4a>
 80118dc:	dc2d0000 	st.b      	r1, (r13, 0x0)
 80118e0:	2a00      	subi      	r2, 1
 80118e2:	e9020019 	bez      	r2, 0x8011914	// 8011914 <__memset_fast+0x48>
 80118e6:	e5ad0000 	addi      	r13, r13, 1
 80118ea:	e58d2003 	andi      	r12, r13, 3
 80118ee:	e90c0014 	bez      	r12, 0x8011916	// 8011916 <__memset_fast+0x4a>
 80118f2:	dc2d0000 	st.b      	r1, (r13, 0x0)
 80118f6:	2a00      	subi      	r2, 1
 80118f8:	e902000e 	bez      	r2, 0x8011914	// 8011914 <__memset_fast+0x48>
 80118fc:	e5ad0000 	addi      	r13, r13, 1
 8011900:	e58d2003 	andi      	r12, r13, 3
 8011904:	e90c0009 	bez      	r12, 0x8011916	// 8011916 <__memset_fast+0x4a>
 8011908:	dc2d0000 	st.b      	r1, (r13, 0x0)
 801190c:	2a00      	subi      	r2, 1
 801190e:	e5ad0000 	addi      	r13, r13, 1
 8011912:	0402      	br      	0x8011916	// 8011916 <__memset_fast+0x4a>
 8011914:	783c      	jmp      	r15
 8011916:	4168      	lsli      	r3, r1, 8
 8011918:	6c4c      	or      	r1, r3
 801191a:	4170      	lsli      	r3, r1, 16
 801191c:	6c4c      	or      	r1, r3
 801191e:	3a2f      	cmplti      	r2, 16
 8011920:	080e      	bt      	0x801193c	// 801193c <__memset_fast+0x70>
 8011922:	dc2d2000 	st.w      	r1, (r13, 0x0)
 8011926:	dc2d2001 	st.w      	r1, (r13, 0x4)
 801192a:	dc2d2002 	st.w      	r1, (r13, 0x8)
 801192e:	dc2d2003 	st.w      	r1, (r13, 0xc)
 8011932:	2a0f      	subi      	r2, 16
 8011934:	e5ad000f 	addi      	r13, r13, 16
 8011938:	3a2f      	cmplti      	r2, 16
 801193a:	0ff4      	bf      	0x8011922	// 8011922 <__memset_fast+0x56>
 801193c:	3a23      	cmplti      	r2, 4
 801193e:	0808      	bt      	0x801194e	// 801194e <__memset_fast+0x82>
 8011940:	2a03      	subi      	r2, 4
 8011942:	dc2d2000 	st.w      	r1, (r13, 0x0)
 8011946:	e5ad0003 	addi      	r13, r13, 4
 801194a:	3a23      	cmplti      	r2, 4
 801194c:	0ffa      	bf      	0x8011940	// 8011940 <__memset_fast+0x74>
 801194e:	e902ffe3 	bez      	r2, 0x8011914	// 8011914 <__memset_fast+0x48>
 8011952:	2a00      	subi      	r2, 1
 8011954:	dc2d0000 	st.b      	r1, (r13, 0x0)
 8011958:	e902ffde 	bez      	r2, 0x8011914	// 8011914 <__memset_fast+0x48>
 801195c:	2a00      	subi      	r2, 1
 801195e:	dc2d0001 	st.b      	r1, (r13, 0x1)
 8011962:	e902ffd9 	bez      	r2, 0x8011914	// 8011914 <__memset_fast+0x48>
 8011966:	dc2d0002 	st.b      	r1, (r13, 0x2)
 801196a:	783c      	jmp      	r15

0801196c <__memcpy_fast>:
 801196c:	14c1      	push      	r4
 801196e:	6f03      	mov      	r12, r0
 8011970:	c401242d 	or      	r13, r1, r0
 8011974:	e48d2003 	andi      	r4, r13, 3
 8011978:	e904000e 	bez      	r4, 0x8011994	// 8011994 <__memcpy_fast+0x28>
 801197c:	e902000b 	bez      	r2, 0x8011992	// 8011992 <__memcpy_fast+0x26>
 8011980:	8160      	ld.b      	r3, (r1, 0x0)
 8011982:	2100      	addi      	r1, 1
 8011984:	2a00      	subi      	r2, 1
 8011986:	dc6c0000 	st.b      	r3, (r12, 0x0)
 801198a:	e58c0000 	addi      	r12, r12, 1
 801198e:	e922fff9 	bnez      	r2, 0x8011980	// 8011980 <__memcpy_fast+0x14>
 8011992:	1481      	pop      	r4
 8011994:	3a2f      	cmplti      	r2, 16
 8011996:	0815      	bt      	0x80119c0	// 80119c0 <__memcpy_fast+0x54>
 8011998:	d9a12000 	ld.w      	r13, (r1, 0x0)
 801199c:	9161      	ld.w      	r3, (r1, 0x4)
 801199e:	9182      	ld.w      	r4, (r1, 0x8)
 80119a0:	ddac2000 	st.w      	r13, (r12, 0x0)
 80119a4:	d9a12003 	ld.w      	r13, (r1, 0xc)
 80119a8:	dc6c2001 	st.w      	r3, (r12, 0x4)
 80119ac:	dc8c2002 	st.w      	r4, (r12, 0x8)
 80119b0:	ddac2003 	st.w      	r13, (r12, 0xc)
 80119b4:	2a0f      	subi      	r2, 16
 80119b6:	210f      	addi      	r1, 16
 80119b8:	e58c000f 	addi      	r12, r12, 16
 80119bc:	3a2f      	cmplti      	r2, 16
 80119be:	0fed      	bf      	0x8011998	// 8011998 <__memcpy_fast+0x2c>
 80119c0:	3a23      	cmplti      	r2, 4
 80119c2:	080a      	bt      	0x80119d6	// 80119d6 <__memcpy_fast+0x6a>
 80119c4:	9160      	ld.w      	r3, (r1, 0x0)
 80119c6:	2a03      	subi      	r2, 4
 80119c8:	2103      	addi      	r1, 4
 80119ca:	dc6c2000 	st.w      	r3, (r12, 0x0)
 80119ce:	e58c0003 	addi      	r12, r12, 4
 80119d2:	3a23      	cmplti      	r2, 4
 80119d4:	0ff8      	bf      	0x80119c4	// 80119c4 <__memcpy_fast+0x58>
 80119d6:	e902ffde 	bez      	r2, 0x8011992	// 8011992 <__memcpy_fast+0x26>
 80119da:	8160      	ld.b      	r3, (r1, 0x0)
 80119dc:	2100      	addi      	r1, 1
 80119de:	2a00      	subi      	r2, 1
 80119e0:	dc6c0000 	st.b      	r3, (r12, 0x0)
 80119e4:	e58c0000 	addi      	r12, r12, 1
 80119e8:	07f7      	br      	0x80119d6	// 80119d6 <__memcpy_fast+0x6a>
	...

080119ec <__GI_os_critical_open>:
 80119ec:	3000      	movi      	r0, 0
 80119ee:	783c      	jmp      	r15

080119f0 <__GI_os_critical_enter>:
 80119f0:	3000      	movi      	r0, 0
 80119f2:	783c      	jmp      	r15

080119f4 <__GI_os_critical_exit>:
 80119f4:	3000      	movi      	r0, 0
 80119f6:	783c      	jmp      	r15

080119f8 <__GI_os_critical_close>:
 80119f8:	3000      	movi      	r0, 0
 80119fa:	783c      	jmp      	r15

080119fc <__GI_putc>:
 80119fc:	14d0      	push      	r15
 80119fe:	e000103f 	bsr      	0x8013a7c	// 8013a7c <fputc>
 8011a02:	1490      	pop      	r15

08011a04 <HAL_GPIO_TogglePin>:
{
	uint32_t data_en, position = 0x00, iocurrent;
	
	assert_param(IS_GPIO_PIN(GPIO_Pin));
	
	data_en = READ_REG(GPIOx->DATA_B_EN);
 8011a04:	da402001 	ld.w      	r18, (r0, 0x4)
	SET_BIT(GPIOx->DATA_B_EN, GPIO_Pin);
 8011a08:	9061      	ld.w      	r3, (r0, 0x4)
 8011a0a:	6cc4      	or      	r3, r1
 8011a0c:	b061      	st.w      	r3, (r0, 0x4)
	while ((GPIO_Pin >> position) != 0)
 8011a0e:	e9010023 	bez      	r1, 0x8011a54	// 8011a54 <HAL_GPIO_TogglePin+0x50>
 8011a12:	3200      	movi      	r2, 0
	{
		iocurrent = (GPIO_Pin) & (1uL << position);
 8011a14:	ea0d0001 	movi      	r13, 1
 8011a18:	040b      	br      	0x8011a2e	// 8011a2e <HAL_GPIO_TogglePin+0x2a>
		
		if (iocurrent)
		{
			if ((GPIOx->DATA & iocurrent) != GPIO_PIN_RESET)
			{
				CLEAR_BIT(GPIOx->DATA, iocurrent);
 8011a1a:	d9802000 	ld.w      	r12, (r0, 0x0)
 8011a1e:	c46c2043 	andn      	r3, r12, r3
 8011a22:	b060      	st.w      	r3, (r0, 0x0)
			{
				SET_BIT(GPIOx->DATA, iocurrent);
			}
		}
		
		position++;
 8011a24:	2200      	addi      	r2, 1
	while ((GPIO_Pin >> position) != 0)
 8011a26:	c4414043 	lsr      	r3, r1, r2
 8011a2a:	e9030015 	bez      	r3, 0x8011a54	// 8011a54 <HAL_GPIO_TogglePin+0x50>
		iocurrent = (GPIO_Pin) & (1uL << position);
 8011a2e:	c44d4023 	lsl      	r3, r13, r2
 8011a32:	68c4      	and      	r3, r1
		if (iocurrent)
 8011a34:	e903fff8 	bez      	r3, 0x8011a24	// 8011a24 <HAL_GPIO_TogglePin+0x20>
			if ((GPIOx->DATA & iocurrent) != GPIO_PIN_RESET)
 8011a38:	d9802000 	ld.w      	r12, (r0, 0x0)
 8011a3c:	6b0c      	and      	r12, r3
 8011a3e:	e92cffee 	bnez      	r12, 0x8011a1a	// 8011a1a <HAL_GPIO_TogglePin+0x16>
				SET_BIT(GPIOx->DATA, iocurrent);
 8011a42:	d9802000 	ld.w      	r12, (r0, 0x0)
 8011a46:	6cf0      	or      	r3, r12
		position++;
 8011a48:	2200      	addi      	r2, 1
				SET_BIT(GPIOx->DATA, iocurrent);
 8011a4a:	b060      	st.w      	r3, (r0, 0x0)
	while ((GPIO_Pin >> position) != 0)
 8011a4c:	c4414043 	lsr      	r3, r1, r2
 8011a50:	e923ffef 	bnez      	r3, 0x8011a2e	// 8011a2e <HAL_GPIO_TogglePin+0x2a>
	}
	WRITE_REG(GPIOx->DATA_B_EN, data_en);
 8011a54:	de402001 	st.w      	r18, (r0, 0x4)
}
 8011a58:	783c      	jmp      	r15
	...

08011a5c <HAL_UART_Init>:
static HAL_StatusTypeDef UART_Receive_IT(UART_HandleTypeDef *huart);
static HAL_StatusTypeDef UART_WaitOnFlagUntilTimeout(UART_HandleTypeDef *huart, uint32_t Flag, uint8_t Status, uint32_t Tickstart, uint32_t Timeout);
static void UART_SetConfig(UART_HandleTypeDef *huart);

HAL_StatusTypeDef HAL_UART_Init(UART_HandleTypeDef *huart)
{
 8011a5c:	14d1      	push      	r4, r15
 8011a5e:	1423      	subi      	r14, r14, 12
 8011a60:	6d03      	mov      	r4, r0
	if (huart == NULL)
 8011a62:	e900005b 	bez      	r0, 0x8011b18	// 8011b18 <HAL_UART_Init+0xbc>
		return HAL_ERROR;
	}
	
	assert_param(IS_UART_INSTANCE(huart->Instance));
	
	if (huart->gState == HAL_UART_STATE_RESET)
 8011a66:	906d      	ld.w      	r3, (r0, 0x34)
 8011a68:	e9030050 	bez      	r3, 0x8011b08	// 8011b08 <HAL_UART_Init+0xac>
		huart->Lock = HAL_UNLOCKED;

		HAL_UART_MspInit(huart);
	}

	huart->gState = HAL_UART_STATE_BUSY;
 8011a6c:	3324      	movi      	r3, 36
 8011a6e:	b46d      	st.w      	r3, (r4, 0x34)

	__HAL_UART_DISABLE(huart);
 8011a70:	9460      	ld.w      	r3, (r4, 0x0)
	assert_param(IS_UART_WORD_LENGTH(huart->Init.WordLength));
	assert_param(IS_UART_MODE(huart->Init.Mode));
	assert_param(IS_UART_HARDWARE_FLOW_CONTROL(huart->Init.HwFlowCtl));
  
  
	MODIFY_REG(huart->Instance->LC,
 8011a72:	9404      	ld.w      	r0, (r4, 0x10)
	__HAL_UART_DISABLE(huart);
 8011a74:	9340      	ld.w      	r2, (r3, 0x0)
 8011a76:	3a86      	bclri      	r2, 6
 8011a78:	3a87      	bclri      	r2, 7
 8011a7a:	b340      	st.w      	r2, (r3, 0x0)
	MODIFY_REG(huart->Instance->LC,
 8011a7c:	9442      	ld.w      	r2, (r4, 0x8)
 8011a7e:	6c80      	or      	r2, r0
 8011a80:	9405      	ld.w      	r0, (r4, 0x14)
 8011a82:	6c80      	or      	r2, r0
 8011a84:	9403      	ld.w      	r0, (r4, 0xc)
 8011a86:	6c80      	or      	r2, r0
 8011a88:	3000      	movi      	r0, 0
 8011a8a:	9320      	ld.w      	r1, (r3, 0x0)
 8011a8c:	28df      	subi      	r0, 224
 8011a8e:	6840      	and      	r1, r0
 8011a90:	6c84      	or      	r2, r1
 8011a92:	b340      	st.w      	r2, (r3, 0x0)
             (uint32_t)(UART_LC_RE | UART_LC_TE | UART_LC_PS | UART_LC_PCE | UART_LC_STOP | UART_LC_DATAL),
             (uint32_t)(huart->Init.WordLength | huart->Init.Parity | huart->Init.Mode | huart->Init.StopBits));
	if (huart->Instance == UART2)
 8011a94:	1143      	lrw      	r2, 0x40010a00	// 8011b20 <HAL_UART_Init+0xc4>
 8011a96:	648e      	cmpne      	r3, r2
 8011a98:	0c3c      	bf      	0x8011b10	// 8011b10 <HAL_UART_Init+0xb4>
	{
		CLEAR_BIT(huart->Instance->LC, (1 << 24));
	}
			 
	MODIFY_REG(huart->Instance->FC, (uint32_t)(UART_FC_RTSL | UART_FC_AFCE), (uint32_t)(UART_FC_RTSL_24 | huart->Init.HwFlowCtl));
 8011a9a:	3000      	movi      	r0, 0
 8011a9c:	9321      	ld.w      	r1, (r3, 0x4)
 8011a9e:	9446      	ld.w      	r2, (r4, 0x18)
 8011aa0:	281d      	subi      	r0, 30
 8011aa2:	6840      	and      	r1, r0
 8011aa4:	ec420014 	ori      	r2, r2, 20
 8011aa8:	6c84      	or      	r2, r1
 8011aaa:	b341      	st.w      	r2, (r3, 0x4)
	
	MODIFY_REG(huart->Instance->DMAC, (uint32_t)(UART_DMAC_RTO | UART_DMAC_RTOE), (uint32_t)((4 << 3) | UART_DMAC_RTOE));
 8011aac:	3100      	movi      	r1, 0
 8011aae:	9342      	ld.w      	r2, (r3, 0x8)
 8011ab0:	29fc      	subi      	r1, 253
 8011ab2:	6884      	and      	r2, r1
 8011ab4:	ec420024 	ori      	r2, r2, 36
 8011ab8:	b342      	st.w      	r2, (r3, 0x8)
	
	MODIFY_REG(huart->Instance->FIFOC, 
 8011aba:	9343      	ld.w      	r2, (r3, 0xc)
 8011abc:	ec42003f 	ori      	r2, r2, 63
 8011ac0:	b343      	st.w      	r2, (r3, 0xc)
			(uint32_t)(UART_FIFOC_RFL | UART_FIFOC_TFL | UART_FIFOC_RFRST | UART_FIFOC_TFRST), 
			(uint32_t)(UART_FIFOC_RFL_16 | UART_FIFOC_TFL_16 | UART_FIFOC_RFRST | UART_FIFOC_TFRST));
	
	SystemClock_Get(&sysclk);
 8011ac2:	6c3b      	mov      	r0, r14
 8011ac4:	e0000168 	bsr      	0x8011d94	// 8011d94 <SystemClock_Get>
	apbclk = sysclk.apbclk * 1000000;
 8011ac8:	9860      	ld.w      	r3, (r14, 0x0)
 8011aca:	ea02f424 	movi      	r2, 62500
 8011ace:	c4824902 	rotli      	r2, r2, 4
 8011ad2:	7cc8      	mult      	r3, r2
    value = (apbclk / (16 * (huart->Init.BaudRate)) - 1) |
 8011ad4:	9441      	ld.w      	r2, (r4, 0x4)
 8011ad6:	4244      	lsli      	r2, r2, 4
            (((apbclk % ((huart->Init.BaudRate) * 16)) * 16 / ((huart->Init.BaudRate) * 16)) << 16);
 8011ad8:	c4438021 	divu      	r1, r3, r2
 8011adc:	c4418420 	mult      	r0, r1, r2
 8011ae0:	60c2      	subu      	r3, r0
 8011ae2:	4364      	lsli      	r3, r3, 4
 8011ae4:	c4438023 	divu      	r3, r3, r2
    value = (apbclk / (16 * (huart->Init.BaudRate)) - 1) |
 8011ae8:	2900      	subi      	r1, 1
			
	huart->Instance->BAUDR = value;
 8011aea:	9440      	ld.w      	r2, (r4, 0x0)
            (((apbclk % ((huart->Init.BaudRate) * 16)) * 16 / ((huart->Init.BaudRate) * 16)) << 16);
 8011aec:	4370      	lsli      	r3, r3, 16
    value = (apbclk / (16 * (huart->Init.BaudRate)) - 1) |
 8011aee:	6cc4      	or      	r3, r1
	huart->Instance->BAUDR = value;
 8011af0:	b264      	st.w      	r3, (r2, 0x10)
	__HAL_UART_ENABLE(huart);
 8011af2:	9260      	ld.w      	r3, (r2, 0x0)
 8011af4:	ec6300c0 	ori      	r3, r3, 192
 8011af8:	b260      	st.w      	r3, (r2, 0x0)
	huart->ErrorCode = HAL_UART_ERROR_NONE;
 8011afa:	3000      	movi      	r0, 0
	huart->gState = HAL_UART_STATE_READY;
 8011afc:	3320      	movi      	r3, 32
	huart->ErrorCode = HAL_UART_ERROR_NONE;
 8011afe:	b40f      	st.w      	r0, (r4, 0x3c)
	huart->gState = HAL_UART_STATE_READY;
 8011b00:	b46d      	st.w      	r3, (r4, 0x34)
	huart->RxState = HAL_UART_STATE_READY;
 8011b02:	b46e      	st.w      	r3, (r4, 0x38)
}
 8011b04:	1403      	addi      	r14, r14, 12
 8011b06:	1491      	pop      	r4, r15
		huart->Lock = HAL_UNLOCKED;
 8011b08:	b06c      	st.w      	r3, (r0, 0x30)
		HAL_UART_MspInit(huart);
 8011b0a:	e0000289 	bsr      	0x801201c	// 801201c <HAL_UART_MspInit>
 8011b0e:	07af      	br      	0x8011a6c	// 8011a6c <HAL_UART_Init+0x10>
		CLEAR_BIT(huart->Instance->LC, (1 << 24));
 8011b10:	9340      	ld.w      	r2, (r3, 0x0)
 8011b12:	3a98      	bclri      	r2, 24
 8011b14:	b340      	st.w      	r2, (r3, 0x0)
 8011b16:	07c2      	br      	0x8011a9a	// 8011a9a <HAL_UART_Init+0x3e>
		return HAL_ERROR;
 8011b18:	3001      	movi      	r0, 1
}
 8011b1a:	1403      	addi      	r14, r14, 12
 8011b1c:	1491      	pop      	r4, r15
 8011b1e:	0000      	.short	0x0000
 8011b20:	40010a00 	.long	0x40010a00

08011b24 <HAL_UART_Transmit>:
{
 8011b24:	1427      	subi      	r14, r14, 28
 8011b26:	b880      	st.w      	r4, (r14, 0x0)
 8011b28:	b8a1      	st.w      	r5, (r14, 0x4)
 8011b2a:	b8c2      	st.w      	r6, (r14, 0x8)
 8011b2c:	b8e3      	st.w      	r7, (r14, 0xc)
 8011b2e:	dd2e2004 	st.w      	r9, (r14, 0x10)
 8011b32:	dd4e2005 	st.w      	r10, (r14, 0x14)
 8011b36:	ddee2006 	st.w      	r15, (r14, 0x18)
 8011b3a:	6d83      	mov      	r6, r0
	if (huart->gState == HAL_UART_STATE_READY)
 8011b3c:	900d      	ld.w      	r0, (r0, 0x34)
 8011b3e:	eb400020 	cmpnei      	r0, 32
 8011b42:	0c0e      	bf      	0x8011b5e	// 8011b5e <HAL_UART_Transmit+0x3a>
		return HAL_BUSY;
 8011b44:	3002      	movi      	r0, 2
}
 8011b46:	d9ee2006 	ld.w      	r15, (r14, 0x18)
 8011b4a:	d94e2005 	ld.w      	r10, (r14, 0x14)
 8011b4e:	d92e2004 	ld.w      	r9, (r14, 0x10)
 8011b52:	98e3      	ld.w      	r7, (r14, 0xc)
 8011b54:	98c2      	ld.w      	r6, (r14, 0x8)
 8011b56:	98a1      	ld.w      	r5, (r14, 0x4)
 8011b58:	9880      	ld.w      	r4, (r14, 0x0)
 8011b5a:	1407      	addi      	r14, r14, 28
 8011b5c:	783c      	jmp      	r15
		if ((pData == NULL) || (Size == 0))
 8011b5e:	e9010043 	bez      	r1, 0x8011be4	// 8011be4 <HAL_UART_Transmit+0xc0>
 8011b62:	e9020041 	bez      	r2, 0x8011be4	// 8011be4 <HAL_UART_Transmit+0xc0>
		__HAL_LOCK(huart);
 8011b66:	960c      	ld.w      	r0, (r6, 0x30)
 8011b68:	3841      	cmpnei      	r0, 1
 8011b6a:	0fed      	bf      	0x8011b44	// 8011b44 <HAL_UART_Transmit+0x20>
 8011b6c:	6e8f      	mov      	r10, r3
 8011b6e:	3301      	movi      	r3, 1
 8011b70:	b66c      	st.w      	r3, (r6, 0x30)
		huart->ErrorCode = HAL_UART_ERROR_NONE;
 8011b72:	3400      	movi      	r4, 0
		huart->gState = HAL_UART_STATE_BUSY_TX;
 8011b74:	3321      	movi      	r3, 33
 8011b76:	6e4b      	mov      	r9, r2
		huart->ErrorCode = HAL_UART_ERROR_NONE;
 8011b78:	b68f      	st.w      	r4, (r6, 0x3c)
		huart->gState = HAL_UART_STATE_BUSY_TX;
 8011b7a:	b66d      	st.w      	r3, (r6, 0x34)
 8011b7c:	6d47      	mov      	r5, r1
		tickstart = HAL_GetTick();
 8011b7e:	e0000191 	bsr      	0x8011ea0	// 8011ea0 <HAL_GetTick>
		huart->TxXferCount = Size;
 8011b82:	dd261013 	st.h      	r9, (r6, 0x26)
		while (huart->TxXferCount > 0)
 8011b86:	8e53      	ld.h      	r2, (r6, 0x26)
 8011b88:	7489      	zexth      	r2, r2
		tickstart = HAL_GetTick();
 8011b8a:	6dc3      	mov      	r7, r0
		huart->TxXferSize = Size;
 8011b8c:	dd261012 	st.h      	r9, (r6, 0x24)
		__HAL_UNLOCK(huart);
 8011b90:	b68c      	st.w      	r4, (r6, 0x30)
		while (huart->TxXferCount > 0)
 8011b92:	6c57      	mov      	r1, r5
 8011b94:	6ceb      	mov      	r3, r10
 8011b96:	e9020048 	bez      	r2, 0x8011c26	// 8011c26 <HAL_UART_Transmit+0x102>
		if (Timeout != HAL_MAX_DELAY)
 8011b9a:	3500      	movi      	r5, 0
 8011b9c:	9600      	ld.w      	r0, (r6, 0x0)
			if ((huart->Instance->FIFOS & Flag) < UART_FIFO_FULL)
 8011b9e:	341f      	movi      	r4, 31
		if (Timeout != HAL_MAX_DELAY)
 8011ba0:	2d00      	subi      	r5, 1
 8011ba2:	0403      	br      	0x8011ba8	// 8011ba8 <HAL_UART_Transmit+0x84>
 8011ba4:	654e      	cmpne      	r3, r5
 8011ba6:	0821      	bt      	0x8011be8	// 8011be8 <HAL_UART_Transmit+0xc4>
			if ((huart->Instance->FIFOS & Flag) < UART_FIFO_FULL)
 8011ba8:	9047      	ld.w      	r2, (r0, 0x1c)
 8011baa:	e442203f 	andi      	r2, r2, 63
 8011bae:	6490      	cmphs      	r4, r2
 8011bb0:	0ffa      	bf      	0x8011ba4	// 8011ba4 <HAL_UART_Transmit+0x80>
			huart->Instance->TDW = *pdata8bits;
 8011bb2:	d0018002 	ldbi.b      	r2, (r1)
 8011bb6:	b048      	st.w      	r2, (r0, 0x20)
			huart->TxXferCount--;
 8011bb8:	8e53      	ld.h      	r2, (r6, 0x26)
 8011bba:	2a00      	subi      	r2, 1
 8011bbc:	7489      	zexth      	r2, r2
 8011bbe:	ae53      	st.h      	r2, (r6, 0x26)
		while (huart->TxXferCount > 0)
 8011bc0:	8e53      	ld.h      	r2, (r6, 0x26)
 8011bc2:	7489      	zexth      	r2, r2
 8011bc4:	e922fff2 	bnez      	r2, 0x8011ba8	// 8011ba8 <HAL_UART_Transmit+0x84>
		if (Timeout != HAL_MAX_DELAY)
 8011bc8:	3400      	movi      	r4, 0
 8011bca:	2c00      	subi      	r4, 1
 8011bcc:	0403      	br      	0x8011bd2	// 8011bd2 <HAL_UART_Transmit+0xae>
 8011bce:	650e      	cmpne      	r3, r4
 8011bd0:	0819      	bt      	0x8011c02	// 8011c02 <HAL_UART_Transmit+0xde>
			if ((huart->Instance->FIFOS & Flag) == 0)
 8011bd2:	9047      	ld.w      	r2, (r0, 0x1c)
 8011bd4:	e442203f 	andi      	r2, r2, 63
 8011bd8:	e922fffb 	bnez      	r2, 0x8011bce	// 8011bce <HAL_UART_Transmit+0xaa>
		huart->gState = HAL_UART_STATE_READY;
 8011bdc:	3320      	movi      	r3, 32
 8011bde:	b66d      	st.w      	r3, (r6, 0x34)
		return HAL_OK;
 8011be0:	6c0b      	mov      	r0, r2
 8011be2:	07b2      	br      	0x8011b46	// 8011b46 <HAL_UART_Transmit+0x22>
			return  HAL_ERROR;
 8011be4:	3001      	movi      	r0, 1
 8011be6:	07b0      	br      	0x8011b46	// 8011b46 <HAL_UART_Transmit+0x22>
			if ((Timeout == 0U) || ((HAL_GetTick() - Tickstart) > Timeout))
 8011be8:	e9030018 	bez      	r3, 0x8011c18	// 8011c18 <HAL_UART_Transmit+0xf4>
 8011bec:	6e8f      	mov      	r10, r3
 8011bee:	6e47      	mov      	r9, r1
 8011bf0:	e0000158 	bsr      	0x8011ea0	// 8011ea0 <HAL_GetTick>
 8011bf4:	601e      	subu      	r0, r7
 8011bf6:	6428      	cmphs      	r10, r0
 8011bf8:	6ceb      	mov      	r3, r10
 8011bfa:	6c67      	mov      	r1, r9
 8011bfc:	0c0e      	bf      	0x8011c18	// 8011c18 <HAL_UART_Transmit+0xf4>
 8011bfe:	9600      	ld.w      	r0, (r6, 0x0)
 8011c00:	07d4      	br      	0x8011ba8	// 8011ba8 <HAL_UART_Transmit+0x84>
 8011c02:	e903000b 	bez      	r3, 0x8011c18	// 8011c18 <HAL_UART_Transmit+0xf4>
 8011c06:	6d4f      	mov      	r5, r3
 8011c08:	e000014c 	bsr      	0x8011ea0	// 8011ea0 <HAL_GetTick>
 8011c0c:	601e      	subu      	r0, r7
 8011c0e:	6414      	cmphs      	r5, r0
 8011c10:	6cd7      	mov      	r3, r5
 8011c12:	0c03      	bf      	0x8011c18	// 8011c18 <HAL_UART_Transmit+0xf4>
 8011c14:	9600      	ld.w      	r0, (r6, 0x0)
 8011c16:	07de      	br      	0x8011bd2	// 8011bd2 <HAL_UART_Transmit+0xae>
				huart->gState  = HAL_UART_STATE_READY;
 8011c18:	3320      	movi      	r3, 32
 8011c1a:	b66d      	st.w      	r3, (r6, 0x34)
				huart->RxState = HAL_UART_STATE_READY;
 8011c1c:	b66e      	st.w      	r3, (r6, 0x38)
				__HAL_UNLOCK(huart);
 8011c1e:	3300      	movi      	r3, 0
 8011c20:	b66c      	st.w      	r3, (r6, 0x30)
			return HAL_TIMEOUT;
 8011c22:	3003      	movi      	r0, 3
 8011c24:	0791      	br      	0x8011b46	// 8011b46 <HAL_UART_Transmit+0x22>
 8011c26:	9600      	ld.w      	r0, (r6, 0x0)
 8011c28:	07d0      	br      	0x8011bc8	// 8011bc8 <HAL_UART_Transmit+0xa4>
	...

08011c2c <HAL_UART_Receive_IT>:
	if (huart->RxState == HAL_UART_STATE_READY)
 8011c2c:	906e      	ld.w      	r3, (r0, 0x38)
 8011c2e:	eb430020 	cmpnei      	r3, 32
 8011c32:	0c03      	bf      	0x8011c38	// 8011c38 <HAL_UART_Receive_IT+0xc>
		return HAL_BUSY;
 8011c34:	3002      	movi      	r0, 2
}
 8011c36:	783c      	jmp      	r15
		if (pData == NULL)
 8011c38:	e901001b 	bez      	r1, 0x8011c6e	// 8011c6e <HAL_UART_Receive_IT+0x42>
		__HAL_LOCK(huart);
 8011c3c:	906c      	ld.w      	r3, (r0, 0x30)
 8011c3e:	3b41      	cmpnei      	r3, 1
 8011c40:	0ffa      	bf      	0x8011c34	// 8011c34 <HAL_UART_Receive_IT+0x8>
		huart->RxXferCount = 0;
 8011c42:	3300      	movi      	r3, 0
 8011c44:	a877      	st.h      	r3, (r0, 0x2e)
		huart->RxXferSize = Size;
 8011c46:	a856      	st.h      	r2, (r0, 0x2c)
		huart->ErrorCode = HAL_UART_ERROR_NONE;
 8011c48:	3300      	movi      	r3, 0
		huart->RxState = HAL_UART_STATE_BUSY_RX;
 8011c4a:	3222      	movi      	r2, 34
		huart->ErrorCode = HAL_UART_ERROR_NONE;
 8011c4c:	b06f      	st.w      	r3, (r0, 0x3c)
		huart->RxState = HAL_UART_STATE_BUSY_RX;
 8011c4e:	b04e      	st.w      	r2, (r0, 0x38)
		__HAL_UART_CLEAR_FLAG(huart, UART_RX_INT_FLAG);
 8011c50:	9040      	ld.w      	r2, (r0, 0x0)
		huart->pRxBuffPtr = pData;
 8011c52:	b02a      	st.w      	r1, (r0, 0x28)
		__HAL_UART_CLEAR_FLAG(huart, UART_RX_INT_FLAG);
 8011c54:	9226      	ld.w      	r1, (r2, 0x18)
 8011c56:	ec2101ec 	ori      	r1, r1, 492
		__HAL_UNLOCK(huart);
 8011c5a:	b06c      	st.w      	r3, (r0, 0x30)
		__HAL_UART_CLEAR_FLAG(huart, UART_RX_INT_FLAG);
 8011c5c:	b226      	st.w      	r1, (r2, 0x18)
		__HAL_UART_ENABLE_IT(huart, UART_RX_INT_FLAG);
 8011c5e:	9225      	ld.w      	r1, (r2, 0x14)
 8011c60:	ea0001ec 	movi      	r0, 492
 8011c64:	6c02      	nor      	r0, r0
 8011c66:	6840      	and      	r1, r0
 8011c68:	b225      	st.w      	r1, (r2, 0x14)
		return HAL_OK;
 8011c6a:	6c0f      	mov      	r0, r3
 8011c6c:	07e5      	br      	0x8011c36	// 8011c36 <HAL_UART_Receive_IT+0xa>
			return HAL_ERROR;
 8011c6e:	3001      	movi      	r0, 1
 8011c70:	07e3      	br      	0x8011c36	// 8011c36 <HAL_UART_Receive_IT+0xa>
	...

08011c74 <HAL_UART_TxCpltCallback>:
 8011c74:	783c      	jmp      	r15
	...

08011c78 <HAL_UART_IRQHandler>:
{
 8011c78:	14d5      	push      	r4-r8, r15
	uint32_t isrflags   = READ_REG(huart->Instance->INTS);
 8011c7a:	9060      	ld.w      	r3, (r0, 0x0)
{
 8011c7c:	6d03      	mov      	r4, r0
	uint32_t isrflags   = READ_REG(huart->Instance->INTS);
 8011c7e:	93a6      	ld.w      	r5, (r3, 0x18)
	uint32_t isrmasks   = READ_REG(huart->Instance->INTM);
 8011c80:	93e5      	ld.w      	r7, (r3, 0x14)
	__HAL_UART_CLEAR_FLAG(huart, isrflags);
 8011c82:	9346      	ld.w      	r2, (r3, 0x18)
 8011c84:	6c94      	or      	r2, r5
 8011c86:	b346      	st.w      	r2, (r3, 0x18)
	if (((isrflags & UART_RX_INT_FLAG) != RESET) && ((isrmasks & UART_RX_INT_FLAG) == RESET))
 8011c88:	e44521ec 	andi      	r2, r5, 492
 8011c8c:	e9020006 	bez      	r2, 0x8011c98	// 8011c98 <HAL_UART_IRQHandler+0x20>
 8011c90:	e44721ec 	andi      	r2, r7, 492
 8011c94:	e902003b 	bez      	r2, 0x8011d0a	// 8011d0a <HAL_UART_IRQHandler+0x92>
	if (((isrflags & UART_INTS_TL) != RESET) && ((isrmasks & UART_INTM_RL) == RESET))
 8011c98:	e4652002 	andi      	r3, r5, 2
 8011c9c:	e9030006 	bez      	r3, 0x8011ca8	// 8011ca8 <HAL_UART_IRQHandler+0x30>
 8011ca0:	e4672004 	andi      	r3, r7, 4
 8011ca4:	e903000f 	bez      	r3, 0x8011cc2	// 8011cc2 <HAL_UART_IRQHandler+0x4a>
	if (((isrflags & UART_INTS_TEMPT) != RESET) && ((isrmasks & UART_INTM_TEMPT) == RESET))
 8011ca8:	e4a52001 	andi      	r5, r5, 1
 8011cac:	e905000a 	bez      	r5, 0x8011cc0	// 8011cc0 <HAL_UART_IRQHandler+0x48>
 8011cb0:	e4672001 	andi      	r3, r7, 1
 8011cb4:	e9230006 	bnez      	r3, 0x8011cc0	// 8011cc0 <HAL_UART_IRQHandler+0x48>
	if (huart->TxXferCount == 0)
 8011cb8:	8c73      	ld.h      	r3, (r4, 0x26)
 8011cba:	74cd      	zexth      	r3, r3
 8011cbc:	e9030056 	bez      	r3, 0x8011d68	// 8011d68 <HAL_UART_IRQHandler+0xf0>
}
 8011cc0:	1495      	pop      	r4-r8, r15
	if (huart->gState == HAL_UART_STATE_BUSY_TX)
 8011cc2:	946d      	ld.w      	r3, (r4, 0x34)
 8011cc4:	eb430021 	cmpnei      	r3, 33
 8011cc8:	0bf0      	bt      	0x8011ca8	// 8011ca8 <HAL_UART_IRQHandler+0x30>
		while (huart->TxXferCount > 0)
 8011cca:	8c73      	ld.h      	r3, (r4, 0x26)
 8011ccc:	74cd      	zexth      	r3, r3
 8011cce:	e903ffed 	bez      	r3, 0x8011ca8	// 8011ca8 <HAL_UART_IRQHandler+0x30>
			if ((huart->Instance->FIFOS & UART_FIFOS_TFC) == UART_FIFO_FULL)
 8011cd2:	9400      	ld.w      	r0, (r4, 0x0)
 8011cd4:	9067      	ld.w      	r3, (r0, 0x1c)
 8011cd6:	e463203f 	andi      	r3, r3, 63
 8011cda:	eb430020 	cmpnei      	r3, 32
 8011cde:	0fe5      	bf      	0x8011ca8	// 8011ca8 <HAL_UART_IRQHandler+0x30>
 8011ce0:	9428      	ld.w      	r1, (r4, 0x20)
 8011ce2:	0407      	br      	0x8011cf0	// 8011cf0 <HAL_UART_IRQHandler+0x78>
 8011ce4:	9047      	ld.w      	r2, (r0, 0x1c)
 8011ce6:	e442203f 	andi      	r2, r2, 63
 8011cea:	eb420020 	cmpnei      	r2, 32
 8011cee:	0fdd      	bf      	0x8011ca8	// 8011ca8 <HAL_UART_IRQHandler+0x30>
			huart->Instance->TDW = *(huart->pTxBuffPtr);
 8011cf0:	d0018003 	ldbi.b      	r3, (r1)
 8011cf4:	b068      	st.w      	r3, (r0, 0x20)
			huart->TxXferCount--;
 8011cf6:	8c73      	ld.h      	r3, (r4, 0x26)
 8011cf8:	2b00      	subi      	r3, 1
 8011cfa:	74cd      	zexth      	r3, r3
 8011cfc:	ac73      	st.h      	r3, (r4, 0x26)
		while (huart->TxXferCount > 0)
 8011cfe:	8c53      	ld.h      	r2, (r4, 0x26)
 8011d00:	7489      	zexth      	r2, r2
			huart->pTxBuffPtr++;
 8011d02:	b428      	st.w      	r1, (r4, 0x20)
		while (huart->TxXferCount > 0)
 8011d04:	e922fff0 	bnez      	r2, 0x8011ce4	// 8011ce4 <HAL_UART_IRQHandler+0x6c>
 8011d08:	07d0      	br      	0x8011ca8	// 8011ca8 <HAL_UART_IRQHandler+0x30>
		if ((isrflags & UART_RX_ERR_INT_FLAG) != RESET)
 8011d0a:	e44520e0 	andi      	r2, r5, 224
			huart->ErrorCode = isrflags & UART_RX_ERR_INT_FLAG;
 8011d0e:	b04f      	st.w      	r2, (r0, 0x3c)
	if (huart->RxState == HAL_UART_STATE_BUSY_RX)
 8011d10:	904e      	ld.w      	r2, (r0, 0x38)
 8011d12:	eb420022 	cmpnei      	r2, 34
 8011d16:	0bc1      	bt      	0x8011c98	// 8011c98 <HAL_UART_IRQHandler+0x20>
		count = ((READ_REG(huart->Instance->FIFOS) & UART_FIFOS_RFC) >> UART_FIFOS_RFC_Pos);
 8011d18:	93c7      	ld.w      	r6, (r3, 0x1c)
 8011d1a:	c4c65566 	zext      	r6, r6, 11, 6
		while (count-- > 0)
 8011d1e:	2e00      	subi      	r6, 1
 8011d20:	7598      	zextb      	r6, r6
 8011d22:	eb4600ff 	cmpnei      	r6, 255
 8011d26:	0fb9      	bf      	0x8011c98	// 8011c98 <HAL_UART_IRQHandler+0x20>
			ch = (uint8_t)(huart->Instance->RDW);
 8011d28:	9460      	ld.w      	r3, (r4, 0x0)
 8011d2a:	936c      	ld.w      	r3, (r3, 0x30)
			if ((huart->ErrorCode & UART_RX_ERR_INT_FLAG) != RESET)
 8011d2c:	d904200f 	ld.w      	r8, (r4, 0x3c)
 8011d30:	e50820e0 	andi      	r8, r8, 224
 8011d34:	e928fff5 	bnez      	r8, 0x8011d1e	// 8011d1e <HAL_UART_IRQHandler+0xa6>
			*(huart->pRxBuffPtr) = ch;
 8011d38:	944a      	ld.w      	r2, (r4, 0x28)
			ch = (uint8_t)(huart->Instance->RDW);
 8011d3a:	a260      	st.b      	r3, (r2, 0x0)
			huart->RxXferCount++;
 8011d3c:	8c77      	ld.h      	r3, (r4, 0x2e)
 8011d3e:	2300      	addi      	r3, 1
 8011d40:	74cd      	zexth      	r3, r3
			huart->pRxBuffPtr++;
 8011d42:	944a      	ld.w      	r2, (r4, 0x28)
			huart->RxXferCount++;
 8011d44:	ac77      	st.h      	r3, (r4, 0x2e)
			if (huart->RxXferSize > 0)
 8011d46:	8c76      	ld.h      	r3, (r4, 0x2c)
			huart->pRxBuffPtr++;
 8011d48:	2200      	addi      	r2, 1
 8011d4a:	b44a      	st.w      	r2, (r4, 0x28)
			if (huart->RxXferSize > 0)
 8011d4c:	e9030019 	bez      	r3, 0x8011d7e	// 8011d7e <HAL_UART_IRQHandler+0x106>
				if (huart->RxXferCount == huart->RxXferSize)
 8011d50:	8c37      	ld.h      	r1, (r4, 0x2e)
 8011d52:	7445      	zexth      	r1, r1
 8011d54:	644e      	cmpne      	r3, r1
 8011d56:	0be4      	bt      	0x8011d1e	// 8011d1e <HAL_UART_IRQHandler+0xa6>
					huart->pRxBuffPtr -= huart->RxXferSize;
 8011d58:	608e      	subu      	r2, r3
 8011d5a:	b44a      	st.w      	r2, (r4, 0x28)
					HAL_UART_RxCpltCallback(huart);
 8011d5c:	6c13      	mov      	r0, r4
 8011d5e:	e000014b 	bsr      	0x8011ff4	// 8011ff4 <HAL_UART_RxCpltCallback>
					huart->RxXferCount = 0;
 8011d62:	dd041017 	st.h      	r8, (r4, 0x2e)
 8011d66:	07dc      	br      	0x8011d1e	// 8011d1e <HAL_UART_IRQHandler+0xa6>
		__HAL_UART_DISABLE_IT(huart, UART_INTM_TL | UART_INTM_TEMPT);
 8011d68:	9440      	ld.w      	r2, (r4, 0x0)
		HAL_UART_TxCpltCallback(huart);
 8011d6a:	6c13      	mov      	r0, r4
		__HAL_UART_DISABLE_IT(huart, UART_INTM_TL | UART_INTM_TEMPT);
 8011d6c:	9265      	ld.w      	r3, (r2, 0x14)
 8011d6e:	ec630003 	ori      	r3, r3, 3
 8011d72:	b265      	st.w      	r3, (r2, 0x14)
		huart->gState = HAL_UART_STATE_READY;
 8011d74:	3320      	movi      	r3, 32
 8011d76:	b46d      	st.w      	r3, (r4, 0x34)
		HAL_UART_TxCpltCallback(huart);
 8011d78:	e3ffff7e 	bsr      	0x8011c74	// 8011c74 <HAL_UART_TxCpltCallback>
}
 8011d7c:	1495      	pop      	r4-r8, r15
				if (count == 0)
 8011d7e:	e926ffd0 	bnez      	r6, 0x8011d1e	// 8011d1e <HAL_UART_IRQHandler+0xa6>
					huart->pRxBuffPtr -= huart->RxXferCount;
 8011d82:	8c77      	ld.h      	r3, (r4, 0x2e)
 8011d84:	74cd      	zexth      	r3, r3
 8011d86:	608e      	subu      	r2, r3
 8011d88:	b44a      	st.w      	r2, (r4, 0x28)
					HAL_UART_RxCpltCallback(huart);
 8011d8a:	6c13      	mov      	r0, r4
 8011d8c:	e0000134 	bsr      	0x8011ff4	// 8011ff4 <HAL_UART_RxCpltCallback>
					huart->RxXferCount = 0;
 8011d90:	acd7      	st.h      	r6, (r4, 0x2e)
 8011d92:	0783      	br      	0x8011c98	// 8011c98 <HAL_UART_IRQHandler+0x20>

08011d94 <SystemClock_Get>:
 */
void SystemClock_Get(wm_sys_clk *sysclk)
{
	clk_div_reg clk_div;

	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011d94:	ea234000 	movih      	r3, 16384
 8011d98:	e4630dff 	addi      	r3, r3, 3584
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011d9c:	ea0101e0 	movi      	r1, 480
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011da0:	9344      	ld.w      	r2, (r3, 0x10)
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011da2:	74c8      	zextb      	r3, r2
 8011da4:	c4618043 	divs      	r3, r1, r3
	sysclk->wlanclk = W805_PLL_CLK_MHZ/(clk_div.b.WLAN);
 8011da8:	c50255ec 	zext      	r12, r2, 15, 8
	sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
 8011dac:	c60256e2 	zext      	r2, r2, 23, 16
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011db0:	b061      	st.w      	r3, (r0, 0x4)
	sysclk->wlanclk = W805_PLL_CLK_MHZ/(clk_div.b.WLAN);
 8011db2:	c5818041 	divs      	r1, r1, r12
	sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
 8011db6:	c4438023 	divu      	r3, r3, r2
	sysclk->wlanclk = W805_PLL_CLK_MHZ/(clk_div.b.WLAN);
 8011dba:	b022      	st.w      	r1, (r0, 0x8)
	sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
 8011dbc:	b060      	st.w      	r3, (r0, 0x0)
}
 8011dbe:	783c      	jmp      	r15

08011dc0 <HAL_InitTick>:
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011dc0:	ea234000 	movih      	r3, 16384
 8011dc4:	e4630dff 	addi      	r3, r3, 3584


__attribute__((weak)) HAL_StatusTypeDef HAL_InitTick(uint32_t TickPriority)
{
 8011dc8:	6f03      	mov      	r12, r0
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011dca:	9364      	ld.w      	r3, (r3, 0x10)
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011dcc:	748c      	zextb      	r2, r3
 8011dce:	ea0301e0 	movi      	r3, 480
 8011dd2:	c4438043 	divs      	r3, r3, r2
	wm_sys_clk sysclk;
	
	SystemClock_Get(&sysclk);
	SysTick_Config(sysclk.cpuclk * UNIT_MHZ / uwTickFreq);
 8011dd6:	ea02f424 	movi      	r2, 62500
 8011dda:	c4824902 	rotli      	r2, r2, 4
 8011dde:	7cc8      	mult      	r3, r2
 8011de0:	ea0203e8 	movi      	r2, 1000
 8011de4:	c4438023 	divu      	r3, r3, r2
{
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
        return (1UL);                                                   /* Reload value impossible */
    }

    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
 8011de8:	104f      	lrw      	r2, 0xe000e010	// 8011e24 <HAL_InitTick+0x64>
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
 8011dea:	2b00      	subi      	r3, 1
    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
 8011dec:	b261      	st.w      	r3, (r2, 0x4)
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011dee:	3000      	movi      	r0, 0
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
 8011df0:	3307      	movi      	r3, 7
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
 8011df2:	b202      	st.w      	r0, (r2, 0x8)
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
 8011df4:	b260      	st.w      	r3, (r2, 0x0)
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011df6:	104d      	lrw      	r2, 0xe000e100	// 8011e28 <HAL_InitTick+0x68>
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011df8:	c5cc4823 	lsli      	r3, r12, 14
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011dfc:	d82220c6 	ld.w      	r1, (r2, 0x318)
 8011e00:	ea0dff00 	movi      	r13, 65280
 8011e04:	6f76      	nor      	r13, r13
 8011e06:	6874      	and      	r1, r13
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011e08:	c40355e3 	zext      	r3, r3, 15, 0
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011e0c:	6cc4      	or      	r3, r1
 8011e0e:	dc6220c6 	st.w      	r3, (r2, 0x318)
    VIC->ISER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011e12:	ea230200 	movih      	r3, 512
 8011e16:	b260      	st.w      	r3, (r2, 0x0)
    VIC->ISSR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011e18:	dc622050 	st.w      	r3, (r2, 0x140)
	HAL_NVIC_SetPriority(SYS_TICK_IRQn, TickPriority);
	HAL_NVIC_EnableIRQ(SYS_TICK_IRQn);
	uwTickPrio = TickPriority;
 8011e1c:	1064      	lrw      	r3, 0x20001b88	// 8011e2c <HAL_InitTick+0x6c>
 8011e1e:	dd832000 	st.w      	r12, (r3, 0x0)
	return HAL_OK;
}
 8011e22:	783c      	jmp      	r15
 8011e24:	e000e010 	.long	0xe000e010
 8011e28:	e000e100 	.long	0xe000e100
 8011e2c:	20001b88 	.long	0x20001b88

08011e30 <SystemClock_Config>:
{
 8011e30:	14d0      	push      	r15
	if ((clk < 2) || (clk > 240))
 8011e32:	5867      	subi      	r3, r0, 2
 8011e34:	eb0300ee 	cmphsi      	r3, 239
 8011e38:	0826      	bt      	0x8011e84	// 8011e84 <SystemClock_Config+0x54>
    RegValue = READ_REG(RCC->CLK_EN);
 8011e3a:	ea224000 	movih      	r2, 16384
 8011e3e:	e4420dff 	addi      	r2, r2, 3584
    RegValue &= ~0x3FFFFF;
 8011e42:	ea21ffc0 	movih      	r1, 65472
    RegValue = READ_REG(RCC->CLK_EN);
 8011e46:	9260      	ld.w      	r3, (r2, 0x0)
    RegValue &= ~0x3FFFFF;
 8011e48:	68c4      	and      	r3, r1
    RegValue |= 0x802;
 8011e4a:	ec630802 	ori      	r3, r3, 2050
    WRITE_REG(RCC->CLK_EN, RegValue);
 8011e4e:	b260      	st.w      	r3, (r2, 0x0)
	WRITE_REG(RCC->BBP_CLK, 0x0F);
 8011e50:	330f      	movi      	r3, 15
 8011e52:	b262      	st.w      	r3, (r2, 0x8)
	RegValue = READ_REG(RCC->CLK_DIV);
 8011e54:	9264      	ld.w      	r3, (r2, 0x10)
	RegValue &= 0xFF000000;
 8011e56:	ea22ff00 	movih      	r2, 65280
 8011e5a:	68c8      	and      	r3, r2
	if(cpuDiv > 12)
 8011e5c:	320c      	movi      	r2, 12
 8011e5e:	6408      	cmphs      	r2, r0
	RegValue |= 0x80000000;
 8011e60:	3bbf      	bseti      	r3, 31
	if(cpuDiv > 12)
 8011e62:	0c12      	bf      	0x8011e86	// 8011e86 <SystemClock_Config+0x56>
		bus2Fac = (wlanDiv*4/cpuDiv)&0xFF;
 8011e64:	c4028022 	divu      	r2, r2, r0
 8011e68:	4250      	lsli      	r2, r2, 16
 8011e6a:	ea010300 	movi      	r1, 768
 8011e6e:	6c0c      	or      	r0, r3
 8011e70:	6c08      	or      	r0, r2
	WRITE_REG(RCC->CLK_DIV, RegValue);
 8011e72:	ea234000 	movih      	r3, 16384
 8011e76:	e4630dff 	addi      	r3, r3, 3584
	RegValue |= (bus2Fac<<16) | (wlanDiv<<8) | cpuDiv;
 8011e7a:	6c04      	or      	r0, r1
	WRITE_REG(RCC->CLK_DIV, RegValue);
 8011e7c:	b304      	st.w      	r0, (r3, 0x10)
	HAL_InitTick(TICK_INT_PRIORITY);
 8011e7e:	3007      	movi      	r0, 7
 8011e80:	e3ffffa0 	bsr      	0x8011dc0	// 8011dc0 <HAL_InitTick>
}
 8011e84:	1490      	pop      	r15
		wlanDiv = cpuDiv/4;
 8011e86:	4822      	lsri      	r1, r0, 2
 8011e88:	4128      	lsli      	r1, r1, 8
 8011e8a:	ea220001 	movih      	r2, 1
 8011e8e:	07f0      	br      	0x8011e6e	// 8011e6e <SystemClock_Config+0x3e>

08011e90 <HAL_IncTick>:

__attribute__((weak)) void HAL_IncTick(void)
{
	uwTick += 1;
 8011e90:	1043      	lrw      	r2, 0x20001b84	// 8011e9c <HAL_IncTick+0xc>
 8011e92:	9260      	ld.w      	r3, (r2, 0x0)
 8011e94:	2300      	addi      	r3, 1
 8011e96:	b260      	st.w      	r3, (r2, 0x0)
}
 8011e98:	783c      	jmp      	r15
 8011e9a:	0000      	.short	0x0000
 8011e9c:	20001b84 	.long	0x20001b84

08011ea0 <HAL_GetTick>:

__attribute__((weak)) uint32_t HAL_GetTick(void)
{
	return uwTick;
 8011ea0:	1062      	lrw      	r3, 0x20001b84	// 8011ea8 <HAL_GetTick+0x8>
 8011ea2:	9300      	ld.w      	r0, (r3, 0x0)
}
 8011ea4:	783c      	jmp      	r15
 8011ea6:	0000      	.short	0x0000
 8011ea8:	20001b84 	.long	0x20001b84

08011eac <HAL_Delay>:

__attribute__((weak)) void HAL_Delay(uint32_t Delay)
{
 8011eac:	14d2      	push      	r4-r5, r15
 8011eae:	6d43      	mov      	r5, r0
	uint32_t tickstart = HAL_GetTick();
 8011eb0:	e3fffff8 	bsr      	0x8011ea0	// 8011ea0 <HAL_GetTick>
 8011eb4:	6d03      	mov      	r4, r0
	uint32_t wait = Delay;

	while ((HAL_GetTick() - tickstart) < wait)
 8011eb6:	e3fffff5 	bsr      	0x8011ea0	// 8011ea0 <HAL_GetTick>
 8011eba:	6012      	subu      	r0, r4
 8011ebc:	6540      	cmphs      	r0, r5
 8011ebe:	0ffc      	bf      	0x8011eb6	// 8011eb6 <HAL_Delay+0xa>
	{
	}
}
 8011ec0:	1492      	pop      	r4-r5, r15
	...

08011ec4 <HAL_NVIC_SetPriority>:

/* Priority: a value between 0 and 15
 * A lower priority value indicates a higher priority */
void HAL_NVIC_SetPriority(IRQn_Type IRQn, uint32_t Priority)
{   
 8011ec4:	c4002822 	bclri      	r2, r0, 0
 8011ec8:	3a81      	bclri      	r2, 1
 8011eca:	106b      	lrw      	r3, 0xe000e100	// 8011ef4 <HAL_NVIC_SetPriority+0x30>
 8011ecc:	608c      	addu      	r2, r3
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011ece:	e4002003 	andi      	r0, r0, 3
 8011ed2:	4003      	lsli      	r0, r0, 3
 8011ed4:	33ff      	movi      	r3, 255
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011ed6:	4126      	lsli      	r1, r1, 6
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011ed8:	d98220c0 	ld.w      	r12, (r2, 0x300)
 8011edc:	70c0      	lsl      	r3, r0
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011ede:	e42120ff 	andi      	r1, r1, 255
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011ee2:	c46c2043 	andn      	r3, r12, r3
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011ee6:	c4014020 	lsl      	r0, r1, r0
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011eea:	6cc0      	or      	r3, r0
 8011eec:	dc6220c0 	st.w      	r3, (r2, 0x300)
	NVIC_SetPriority(IRQn, Priority);
}
 8011ef0:	783c      	jmp      	r15
 8011ef2:	0000      	.short	0x0000
 8011ef4:	e000e100 	.long	0xe000e100

08011ef8 <HAL_NVIC_EnableIRQ>:
    VIC->ISER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011ef8:	e440201f 	andi      	r2, r0, 31
 8011efc:	3301      	movi      	r3, 1
 8011efe:	c4a054c0 	zext      	r0, r0, 6, 5
 8011f02:	70c8      	lsl      	r3, r2
 8011f04:	4002      	lsli      	r0, r0, 2
 8011f06:	1044      	lrw      	r2, 0xe000e100	// 8011f14 <HAL_NVIC_EnableIRQ+0x1c>
 8011f08:	6008      	addu      	r0, r2
 8011f0a:	b060      	st.w      	r3, (r0, 0x0)
    VIC->ISSR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011f0c:	dc602050 	st.w      	r3, (r0, 0x140)
	/* Check the parameters */
	assert_param(IS_NVIC_DEVICE_IRQ(IRQn));

	/* Enable interrupt */
	NVIC_EnableIRQ(IRQn);
}
 8011f10:	783c      	jmp      	r15
 8011f12:	0000      	.short	0x0000
 8011f14:	e000e100 	.long	0xe000e100

08011f18 <main>:

static volatile uint8_t key_flag = 0;
#define LEN 2048
static uint8_t pdata[LEN] = {0};
int main(void)
{
 8011f18:	14d3      	push      	r4-r6, r15
 8011f1a:	143a      	subi      	r14, r14, 104
	volatile int tx_len = 0;
 8011f1c:	3400      	movi      	r4, 0
	uint8_t tx_buf[100] = {0};
 8011f1e:	6c53      	mov      	r1, r4
 8011f20:	3264      	movi      	r2, 100
 8011f22:	1801      	addi      	r0, r14, 4
	volatile int tx_len = 0;
 8011f24:	b880      	st.w      	r4, (r14, 0x0)
	uint8_t tx_buf[100] = {0};
 8011f26:	e3fffcd3 	bsr      	0x80118cc	// 80118cc <__memset_fast>
	
	SystemClock_Config(CPU_CLK_160M);
 8011f2a:	3003      	movi      	r0, 3
    return 0;
}

static void UART1_Init(void)
{
	huart1.Instance = UART1;
 8011f2c:	11ac      	lrw      	r5, 0x20001b8c	// 8011fdc <main+0xc4>
	SystemClock_Config(CPU_CLK_160M);
 8011f2e:	e3ffff81 	bsr      	0x8011e30	// 8011e30 <SystemClock_Config>
	printf("enter main\r\n");
 8011f32:	110c      	lrw      	r0, 0x8013bec	// 8011fe0 <main+0xc8>
 8011f34:	e3fffc9a 	bsr      	0x8011868	// 8011868 <__GI_puts>
	huart1.Instance = UART1;
 8011f38:	ea234001 	movih      	r3, 16385
 8011f3c:	3bab      	bseti      	r3, 11
 8011f3e:	b560      	st.w      	r3, (r5, 0x0)
	huart1.Init.BaudRate = 115200;
 8011f40:	ea03c200 	movi      	r3, 49664
 8011f44:	3bb0      	bseti      	r3, 16
 8011f46:	b561      	st.w      	r3, (r5, 0x4)
	huart1.Init.WordLength = UART_WORDLENGTH_8B;
 8011f48:	3303      	movi      	r3, 3
 8011f4a:	b562      	st.w      	r3, (r5, 0x8)
	huart1.Init.StopBits = UART_STOPBITS_1;
	huart1.Init.Parity = UART_PARITY_NONE;
	huart1.Init.Mode = UART_MODE_TX | UART_MODE_RX;
	huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
	if (HAL_UART_Init(&huart1) != HAL_OK)
 8011f4c:	6c17      	mov      	r0, r5
	huart1.Init.Mode = UART_MODE_TX | UART_MODE_RX;
 8011f4e:	33c0      	movi      	r3, 192
	huart1.Init.StopBits = UART_STOPBITS_1;
 8011f50:	b583      	st.w      	r4, (r5, 0xc)
	huart1.Init.Parity = UART_PARITY_NONE;
 8011f52:	b584      	st.w      	r4, (r5, 0x10)
	huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
 8011f54:	b586      	st.w      	r4, (r5, 0x18)
	huart1.Init.Mode = UART_MODE_TX | UART_MODE_RX;
 8011f56:	b565      	st.w      	r3, (r5, 0x14)
	if (HAL_UART_Init(&huart1) != HAL_OK)
 8011f58:	e3fffd82 	bsr      	0x8011a5c	// 8011a5c <HAL_UART_Init>
 8011f5c:	6d03      	mov      	r4, r0
 8011f5e:	e9000003 	bez      	r0, 0x8011f64	// 8011f64 <main+0x4c>
 8011f62:	0400      	br      	0x8011f62	// 8011f62 <main+0x4a>
	FifoInit(pdata, LEN);
 8011f64:	ea010800 	movi      	r1, 2048
 8011f68:	101f      	lrw      	r0, 0x20001384	// 8011fe4 <main+0xcc>
 8011f6a:	e00000c3 	bsr      	0x80120f0	// 80120f0 <FifoInit>
	HAL_UART_Receive_IT(&huart1, buf, IT_LEN);		// 只需调用一次，接收够设定的长度，进入中断回调，用户需要在中断回调中取走数据，此处设置了
 8011f6e:	6c93      	mov      	r2, r4
 8011f70:	103e      	lrw      	r1, 0x20001364	// 8011fe8 <main+0xd0>
 8011f72:	6c17      	mov      	r0, r5
 8011f74:	e3fffe5c 	bsr      	0x8011c2c	// 8011c2c <HAL_UART_Receive_IT>
			HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_2);
 8011f78:	109d      	lrw      	r4, 0x40011400	// 8011fec <main+0xd4>
			printf("receive\r\n");
 8011f7a:	10de      	lrw      	r6, 0x8013bf8	// 8011ff0 <main+0xd8>
		tx_len = FifoDataLen();
 8011f7c:	e00000cc 	bsr      	0x8012114	// 8012114 <FifoDataLen>
 8011f80:	b800      	st.w      	r0, (r14, 0x0)
		if (tx_len > 0)
 8011f82:	9860      	ld.w      	r3, (r14, 0x0)
 8011f84:	e9630021 	blsz      	r3, 0x8011fc6	// 8011fc6 <main+0xae>
			HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_0 | GPIO_PIN_1);
 8011f88:	3103      	movi      	r1, 3
 8011f8a:	6c13      	mov      	r0, r4
 8011f8c:	e3fffd3c 	bsr      	0x8011a04	// 8011a04 <HAL_GPIO_TogglePin>
			tx_len = (tx_len > 100) ? 100 : tx_len;
 8011f90:	9860      	ld.w      	r3, (r14, 0x0)
 8011f92:	eb230064 	cmplti      	r3, 101
 8011f96:	0c20      	bf      	0x8011fd6	// 8011fd6 <main+0xbe>
 8011f98:	9860      	ld.w      	r3, (r14, 0x0)
 8011f9a:	b860      	st.w      	r3, (r14, 0x0)
			FifoRead(tx_buf, tx_len);
 8011f9c:	9820      	ld.w      	r1, (r14, 0x0)
 8011f9e:	1801      	addi      	r0, r14, 4
 8011fa0:	e00000cc 	bsr      	0x8012138	// 8012138 <FifoRead>
			HAL_UART_Transmit(&huart1, tx_buf, tx_len, 1000);
 8011fa4:	9840      	ld.w      	r2, (r14, 0x0)
 8011fa6:	ea0303e8 	movi      	r3, 1000
 8011faa:	7489      	zexth      	r2, r2
 8011fac:	1901      	addi      	r1, r14, 4
 8011fae:	6c17      	mov      	r0, r5
 8011fb0:	e3fffdba 	bsr      	0x8011b24	// 8011b24 <HAL_UART_Transmit>
			printf("receive\r\n");
 8011fb4:	6c1b      	mov      	r0, r6
 8011fb6:	e3fffc59 	bsr      	0x8011868	// 8011868 <__GI_puts>
		tx_len = FifoDataLen();
 8011fba:	e00000ad 	bsr      	0x8012114	// 8012114 <FifoDataLen>
 8011fbe:	b800      	st.w      	r0, (r14, 0x0)
		if (tx_len > 0)
 8011fc0:	9860      	ld.w      	r3, (r14, 0x0)
 8011fc2:	e943ffe3 	bhz      	r3, 0x8011f88	// 8011f88 <main+0x70>
			HAL_Delay(20);
 8011fc6:	3014      	movi      	r0, 20
 8011fc8:	e3ffff72 	bsr      	0x8011eac	// 8011eac <HAL_Delay>
			HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_2);
 8011fcc:	3104      	movi      	r1, 4
 8011fce:	6c13      	mov      	r0, r4
 8011fd0:	e3fffd1a 	bsr      	0x8011a04	// 8011a04 <HAL_GPIO_TogglePin>
 8011fd4:	07d4      	br      	0x8011f7c	// 8011f7c <main+0x64>
			tx_len = (tx_len > 100) ? 100 : tx_len;
 8011fd6:	3364      	movi      	r3, 100
 8011fd8:	07e1      	br      	0x8011f9a	// 8011f9a <main+0x82>
 8011fda:	0000      	.short	0x0000
 8011fdc:	20001b8c 	.long	0x20001b8c
 8011fe0:	08013bec 	.long	0x08013bec
 8011fe4:	20001384 	.long	0x20001384
 8011fe8:	20001364 	.long	0x20001364
 8011fec:	40011400 	.long	0x40011400
 8011ff0:	08013bf8 	.long	0x08013bf8

08011ff4 <HAL_UART_RxCpltCallback>:
  * 	  Size大于0，则接收够Size长度的数据执行一次HAL_UART_RxCpltCallback(huart);
  * 	  Sized等于0，则接收不定长的数据就执行一次HAL_UART_RxCpltCallback(huart);
  *       两种情况下，数据都存放在huart->pRxBuffPtr或者pData中，数据长度存放在huart->RxXferCount中
  */
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
 8011ff4:	14d1      	push      	r4, r15
 8011ff6:	6d03      	mov      	r4, r0
	if (FifoSpaceLen() >= huart->RxXferCount)
 8011ff8:	e0000096 	bsr      	0x8012124	// 8012124 <FifoSpaceLen>
 8011ffc:	8c77      	ld.h      	r3, (r4, 0x2e)
 8011ffe:	74cd      	zexth      	r3, r3
 8012000:	64c1      	cmplt      	r0, r3
 8012002:	0806      	bt      	0x801200e	// 801200e <HAL_UART_RxCpltCallback+0x1a>
	{
		FifoWrite(huart->pRxBuffPtr, huart->RxXferCount);
 8012004:	8c37      	ld.h      	r1, (r4, 0x2e)
 8012006:	7445      	zexth      	r1, r1
 8012008:	940a      	ld.w      	r0, (r4, 0x28)
 801200a:	e00000b7 	bsr      	0x8012178	// 8012178 <FifoWrite>
	}
				printf("irq\r\n");
 801200e:	1003      	lrw      	r0, 0x8013be4	// 8012018 <HAL_UART_RxCpltCallback+0x24>
 8012010:	e3fffc2c 	bsr      	0x8011868	// 8011868 <__GI_puts>
}
 8012014:	1491      	pop      	r4, r15
 8012016:	0000      	.short	0x0000
 8012018:	08013be4 	.long	0x08013be4

0801201c <HAL_UART_MspInit>:

#include "wm_hal.h"

void HAL_UART_MspInit(UART_HandleTypeDef* huart)
{
 801201c:	14d0      	push      	r15
	if (huart->Instance == UART1)
 801201e:	9040      	ld.w      	r2, (r0, 0x0)
 8012020:	ea234001 	movih      	r3, 16385
 8012024:	3bab      	bseti      	r3, 11
 8012026:	64ca      	cmpne      	r2, r3
 8012028:	0c02      	bf      	0x801202c	// 801202c <HAL_UART_MspInit+0x10>
		__HAL_AFIO_REMAP_UART1_TX(GPIOB, GPIO_PIN_6);
		__HAL_AFIO_REMAP_UART1_RX(GPIOB, GPIO_PIN_7);
		HAL_NVIC_SetPriority(UART1_IRQn, 0);
		HAL_NVIC_EnableIRQ(UART1_IRQn);
	}
}
 801202a:	1490      	pop      	r15
		__HAL_RCC_UART1_CLK_ENABLE();
 801202c:	ea234000 	movih      	r3, 16384
 8012030:	e4630dff 	addi      	r3, r3, 3584
		HAL_NVIC_SetPriority(UART1_IRQn, 0);
 8012034:	3100      	movi      	r1, 0
		__HAL_RCC_UART1_CLK_ENABLE();
 8012036:	9340      	ld.w      	r2, (r3, 0x0)
 8012038:	ec420004 	ori      	r2, r2, 4
 801203c:	b340      	st.w      	r2, (r3, 0x0)
		__HAL_RCC_GPIO_CLK_ENABLE();
 801203e:	9340      	ld.w      	r2, (r3, 0x0)
 8012040:	ec420800 	ori      	r2, r2, 2048
 8012044:	b340      	st.w      	r2, (r3, 0x0)
		__HAL_AFIO_REMAP_UART1_TX(GPIOB, GPIO_PIN_6);
 8012046:	1070      	lrw      	r3, 0x40011400	// 8012084 <HAL_UART_MspInit+0x68>
		HAL_NVIC_SetPriority(UART1_IRQn, 0);
 8012048:	3011      	movi      	r0, 17
		__HAL_AFIO_REMAP_UART1_TX(GPIOB, GPIO_PIN_6);
 801204a:	9344      	ld.w      	r2, (r3, 0x10)
 801204c:	ec420040 	ori      	r2, r2, 64
 8012050:	b344      	st.w      	r2, (r3, 0x10)
 8012052:	9345      	ld.w      	r2, (r3, 0x14)
 8012054:	3a86      	bclri      	r2, 6
 8012056:	b345      	st.w      	r2, (r3, 0x14)
 8012058:	9346      	ld.w      	r2, (r3, 0x18)
 801205a:	3a86      	bclri      	r2, 6
 801205c:	b346      	st.w      	r2, (r3, 0x18)
		__HAL_AFIO_REMAP_UART1_RX(GPIOB, GPIO_PIN_7);
 801205e:	9344      	ld.w      	r2, (r3, 0x10)
 8012060:	ec420080 	ori      	r2, r2, 128
 8012064:	b344      	st.w      	r2, (r3, 0x10)
 8012066:	9345      	ld.w      	r2, (r3, 0x14)
 8012068:	3a87      	bclri      	r2, 7
 801206a:	b345      	st.w      	r2, (r3, 0x14)
 801206c:	9346      	ld.w      	r2, (r3, 0x18)
 801206e:	3a87      	bclri      	r2, 7
 8012070:	b346      	st.w      	r2, (r3, 0x18)
 8012072:	9343      	ld.w      	r2, (r3, 0xc)
 8012074:	3a87      	bclri      	r2, 7
 8012076:	b343      	st.w      	r2, (r3, 0xc)
		HAL_NVIC_SetPriority(UART1_IRQn, 0);
 8012078:	e3ffff26 	bsr      	0x8011ec4	// 8011ec4 <HAL_NVIC_SetPriority>
		HAL_NVIC_EnableIRQ(UART1_IRQn);
 801207c:	3011      	movi      	r0, 17
 801207e:	e3ffff3d 	bsr      	0x8011ef8	// 8011ef8 <HAL_NVIC_EnableIRQ>
}
 8012082:	1490      	pop      	r15
 8012084:	40011400 	.long	0x40011400

08012088 <CORET_IRQHandler>:

#include "wm_hal.h"

__attribute__((isr)) void CORET_IRQHandler(void)
{
 8012088:	1460      	nie
 801208a:	1462      	ipush
 801208c:	142e      	subi      	r14, r14, 56
 801208e:	d64e1c2d 	stm      	r18-r31, (r14)
 8012092:	1428      	subi      	r14, r14, 32
 8012094:	f4ee3400 	fstms      	fr0-fr7, (r14)
 8012098:	14d0      	push      	r15
	uint32_t temp;
	
	temp = (*(volatile unsigned int *) (0xE000E010));
 801209a:	1068      	lrw      	r3, 0xe000e000	// 80120b8 <CORET_IRQHandler+0x30>
 801209c:	9364      	ld.w      	r3, (r3, 0x10)
	HAL_IncTick();
 801209e:	e3fffef9 	bsr      	0x8011e90	// 8011e90 <HAL_IncTick>
}
 80120a2:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 80120a6:	1401      	addi      	r14, r14, 4
 80120a8:	f4ee3000 	fldms      	fr0-fr7, (r14)
 80120ac:	1408      	addi      	r14, r14, 32
 80120ae:	d24e1c2d 	ldm      	r18-r31, (r14)
 80120b2:	140e      	addi      	r14, r14, 56
 80120b4:	1463      	ipop
 80120b6:	1461      	nir
 80120b8:	e000e000 	.long	0xe000e000

080120bc <UART1_IRQHandler>:

extern UART_HandleTypeDef huart1;

__attribute__((isr)) void UART1_IRQHandler(void)
{
 80120bc:	1460      	nie
 80120be:	1462      	ipush
 80120c0:	142e      	subi      	r14, r14, 56
 80120c2:	d64e1c2d 	stm      	r18-r31, (r14)
 80120c6:	1428      	subi      	r14, r14, 32
 80120c8:	f4ee3400 	fstms      	fr0-fr7, (r14)
 80120cc:	14d0      	push      	r15
	HAL_UART_IRQHandler(&huart1);
 80120ce:	1008      	lrw      	r0, 0x20001b8c	// 80120ec <UART1_IRQHandler+0x30>
 80120d0:	e3fffdd4 	bsr      	0x8011c78	// 8011c78 <HAL_UART_IRQHandler>
}
 80120d4:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 80120d8:	1401      	addi      	r14, r14, 4
 80120da:	f4ee3000 	fldms      	fr0-fr7, (r14)
 80120de:	1408      	addi      	r14, r14, 32
 80120e0:	d24e1c2d 	ldm      	r18-r31, (r14)
 80120e4:	140e      	addi      	r14, r14, 56
 80120e6:	1463      	ipop
 80120e8:	1461      	nir
 80120ea:	0000      	.short	0x0000
 80120ec:	20001b8c 	.long	0x20001b8c

080120f0 <FifoInit>:

int FifoInit(uint8_t *fifo_addr, uint32_t fifo_size)
{
	_fifo_str *p = &fifo_str;
	
	if(fifo_addr == NULL || fifo_size == 0)
 80120f0:	e900000c 	bez      	r0, 0x8012108	// 8012108 <FifoInit+0x18>
 80120f4:	e901000a 	bez      	r1, 0x8012108	// 8012108 <FifoInit+0x18>
		return -1;

	memset((char *)p, 0, sizeof(_fifo_str));
 80120f8:	1046      	lrw      	r2, 0x20001bcc	// 8012110 <FifoInit+0x20>
 80120fa:	3300      	movi      	r3, 0
	p->buf = fifo_addr;
 80120fc:	b200      	st.w      	r0, (r2, 0x0)
	memset((char *)p, 0, sizeof(_fifo_str));
 80120fe:	b262      	st.w      	r3, (r2, 0x8)
 8012100:	b263      	st.w      	r3, (r2, 0xc)
    p->in = 0;
    p->out = 0;
    p->size = fifo_size;
 8012102:	b221      	st.w      	r1, (r2, 0x4)
	return 0;
 8012104:	6c0f      	mov      	r0, r3
}
 8012106:	783c      	jmp      	r15
		return -1;
 8012108:	3000      	movi      	r0, 0
 801210a:	2800      	subi      	r0, 1
 801210c:	07fd      	br      	0x8012106	// 8012106 <FifoInit+0x16>
 801210e:	0000      	.short	0x0000
 8012110:	20001bcc 	.long	0x20001bcc

08012114 <FifoDataLen>:

int FifoDataLen(void)
{
	_fifo_str *p = &fifo_str;
	
	return (p->in - p->out);
 8012114:	1063      	lrw      	r3, 0x20001bcc	// 8012120 <FifoDataLen+0xc>
 8012116:	9302      	ld.w      	r0, (r3, 0x8)
 8012118:	9363      	ld.w      	r3, (r3, 0xc)
}
 801211a:	600e      	subu      	r0, r3
 801211c:	783c      	jmp      	r15
 801211e:	0000      	.short	0x0000
 8012120:	20001bcc 	.long	0x20001bcc

08012124 <FifoSpaceLen>:

int FifoSpaceLen(void)
{
	_fifo_str *p = &fifo_str;
	
	return (p->size - (p->in - p->out));
 8012124:	1044      	lrw      	r2, 0x20001bcc	// 8012134 <FifoSpaceLen+0x10>
 8012126:	9203      	ld.w      	r0, (r2, 0xc)
 8012128:	9261      	ld.w      	r3, (r2, 0x4)
 801212a:	60c0      	addu      	r3, r0
 801212c:	9202      	ld.w      	r0, (r2, 0x8)
}
 801212e:	5b01      	subu      	r0, r3, r0
 8012130:	783c      	jmp      	r15
 8012132:	0000      	.short	0x0000
 8012134:	20001bcc 	.long	0x20001bcc

08012138 <FifoRead>:

int FifoRead(uint8_t *buf, uint32_t len)
{
 8012138:	14d3      	push      	r4-r6, r15
	uint32_t i = 0, j = 0;
	_fifo_str *p = &fifo_str;

	j = (p->out % p->size);
 801213a:	10cf      	lrw      	r6, 0x20001bcc	// 8012174 <FifoRead+0x3c>
	len = min(len, p->in - p->out);
 801213c:	96a2      	ld.w      	r5, (r6, 0x8)
	j = (p->out % p->size);
 801213e:	9643      	ld.w      	r2, (r6, 0xc)
 8012140:	9681      	ld.w      	r4, (r6, 0x4)
 8012142:	c4828023 	divu      	r3, r2, r4
 8012146:	7cd0      	mult      	r3, r4
 8012148:	5a6d      	subu      	r3, r2, r3
	len = min(len, p->in - p->out);
 801214a:	614a      	subu      	r5, r2
 801214c:	f825cd25 	min.u32      	r5, r5, r1
	i = min(len, p->size - j);
 8012150:	610e      	subu      	r4, r3
 8012152:	f8a4cd24 	min.u32      	r4, r4, r5
	memcpy(buf, p->buf + j, i);
 8012156:	9620      	ld.w      	r1, (r6, 0x0)
 8012158:	604c      	addu      	r1, r3
 801215a:	6c93      	mov      	r2, r4
 801215c:	e3fffc08 	bsr      	0x801196c	// 801196c <__memcpy_fast>
	memcpy(buf + i, p->buf, len - i);
 8012160:	6010      	addu      	r0, r4
 8012162:	5d51      	subu      	r2, r5, r4
 8012164:	9620      	ld.w      	r1, (r6, 0x0)
 8012166:	e3fffc03 	bsr      	0x801196c	// 801196c <__memcpy_fast>
	p->out += len;
 801216a:	9663      	ld.w      	r3, (r6, 0xc)
 801216c:	60d4      	addu      	r3, r5
	return len;
}
 801216e:	6c17      	mov      	r0, r5
	p->out += len;
 8012170:	b663      	st.w      	r3, (r6, 0xc)
}
 8012172:	1493      	pop      	r4-r6, r15
 8012174:	20001bcc 	.long	0x20001bcc

08012178 <FifoWrite>:

int FifoWrite(uint8_t *buf, uint32_t len)
{
 8012178:	14d4      	push      	r4-r7, r15
	uint32_t i = 0, j = 0;
	_fifo_str *p = &fifo_str;

	j = p->in % p->size;
 801217a:	10d1      	lrw      	r6, 0x20001bcc	// 80121bc <FifoWrite+0x44>
{
 801217c:	6dc3      	mov      	r7, r0
	j = p->in % p->size;
 801217e:	9641      	ld.w      	r2, (r6, 0x4)
 8012180:	9602      	ld.w      	r0, (r6, 0x8)
 8012182:	c4408023 	divu      	r3, r0, r2
	len = min(len, p->size - p->in + p->out);
 8012186:	9683      	ld.w      	r4, (r6, 0xc)
	j = p->in % p->size;
 8012188:	7cc8      	mult      	r3, r2
	len = min(len, p->size - p->in + p->out);
 801218a:	6108      	addu      	r4, r2
	j = p->in % p->size;
 801218c:	586d      	subu      	r3, r0, r3
	len = min(len, p->size - p->in + p->out);
 801218e:	6102      	subu      	r4, r0
 8012190:	f824cd24 	min.u32      	r4, r4, r1
	i = min(len, p->size - j);
 8012194:	608e      	subu      	r2, r3
 8012196:	f882cd25 	min.u32      	r5, r2, r4
	memcpy(p->buf + j, buf, i);
 801219a:	9600      	ld.w      	r0, (r6, 0x0)
 801219c:	6c97      	mov      	r2, r5
 801219e:	6c5f      	mov      	r1, r7
 80121a0:	600c      	addu      	r0, r3
 80121a2:	e3fffbe5 	bsr      	0x801196c	// 801196c <__memcpy_fast>
	memcpy(p->buf, buf + i, len - i);
 80121a6:	5c55      	subu      	r2, r4, r5
 80121a8:	5f34      	addu      	r1, r7, r5
 80121aa:	9600      	ld.w      	r0, (r6, 0x0)
 80121ac:	e3fffbe0 	bsr      	0x801196c	// 801196c <__memcpy_fast>
	p->in += len;
 80121b0:	9662      	ld.w      	r3, (r6, 0x8)
 80121b2:	60d0      	addu      	r3, r4

	return len;
}
 80121b4:	6c13      	mov      	r0, r4
	p->in += len;
 80121b6:	b662      	st.w      	r3, (r6, 0x8)
}
 80121b8:	1494      	pop      	r4-r7, r15
 80121ba:	0000      	.short	0x0000
 80121bc:	20001bcc 	.long	0x20001bcc

080121c0 <SystemInit>:
  \details Writes the given value to the VBR Register.
  \param [in]    vbr  VBR Register value to set
 */
__ALWAYS_STATIC_INLINE void __set_VBR(uint32_t vbr)
{
    __ASM volatile("mtcr %0, vbr" : : "r"(vbr));
 80121c0:	106a      	lrw      	r3, 0x20000000	// 80121e8 <SystemInit+0x28>
 80121c2:	c0036421 	mtcr      	r3, cr<1, 0>
 */
__ALWAYS_STATIC_INLINE uint32_t __get_CHR(void)
{
    uint32_t result;

    __ASM volatile("mfcr %0, cr<31, 0>\n" :"=r"(result));
 80121c6:	c01f6023 	mfcr      	r3, cr<31, 0>
    __set_Int_SP((uint32_t)&g_top_irqstack);
    __set_CHR(__get_CHR() | CHR_ISE_Msk);
    VIC->TSPR = 0xFF;
#endif

    __set_CHR(__get_CHR() | CHR_IAE_Msk);
 80121ca:	ec630010 	ori      	r3, r3, 16
  \details Assigns the given value to the CHR.
  \param [in]    chr  CHR value to set
 */
__ALWAYS_STATIC_INLINE void __set_CHR(uint32_t chr)
{
    __ASM volatile("mtcr %0, cr<31, 0>\n" : : "r"(chr));
 80121ce:	c003643f 	mtcr      	r3, cr<31, 0>

    /* Clear active and pending IRQ */
    VIC->IABR[0] = 0x0;
 80121d2:	1047      	lrw      	r2, 0xe000e100	// 80121ec <SystemInit+0x2c>
 80121d4:	3300      	movi      	r3, 0
 80121d6:	dc622080 	st.w      	r3, (r2, 0x200)
    VIC->ICPR[0] = 0xFFFFFFFF;
 80121da:	2b00      	subi      	r3, 1
 80121dc:	dc622060 	st.w      	r3, (r2, 0x180)
  \details Enables interrupts and exceptions by setting the IE-bit and EE-bit in the PSR.
           Can only be executed in Privileged modes.
 */
__ALWAYS_STATIC_INLINE void __enable_excp_irq(void)
{
    __ASM volatile("psrset ee, ie");
 80121e0:	c1807420 	psrset      	ee, ie

#ifdef CONFIG_KERNEL_NONE
    __enable_excp_irq();
#endif
}
 80121e4:	783c      	jmp      	r15
 80121e6:	0000      	.short	0x0000
 80121e8:	20000000 	.long	0x20000000
 80121ec:	e000e100 	.long	0xe000e100

080121f0 <trap_c>:
#include <stdio.h>
#include <stdlib.h>
#include <csi_config.h>

void trap_c(uint32_t *regs)
{
 80121f0:	14d4      	push      	r4-r7, r15
 80121f2:	6d43      	mov      	r5, r0
    int i;
    uint32_t vec = 0;
    asm volatile(
 80121f4:	c0006021 	mfcr      	r1, cr<0, 0>
 80121f8:	4930      	lsri      	r1, r1, 16
 80121fa:	7446      	sextb      	r1, r1
        "mfcr    %0, psr \n"
        "lsri    %0, 16 \n"
        "sextb   %0 \n"
        :"=r"(vec):);
    //while (1);
    printf("CPU Exception : %u", vec);
 80121fc:	1018      	lrw      	r0, 0x8013c04	// 801225c <trap_c+0x6c>
 80121fe:	e0000c4d 	bsr      	0x8013a98	// 8013a98 <wm_printf>
    printf("\n");
 8012202:	300a      	movi      	r0, 10
 8012204:	e3fffb2a 	bsr      	0x8011858	// 8011858 <__GI_putchar>

    for (i = 0; i < 16; i++) {
        printf("r%d: %08x\t", i, regs[i]);
 8012208:	9540      	ld.w      	r2, (r5, 0x0)
 801220a:	3100      	movi      	r1, 0
 801220c:	1015      	lrw      	r0, 0x8013c18	// 8012260 <trap_c+0x70>
 801220e:	e0000c45 	bsr      	0x8013a98	// 8013a98 <wm_printf>
    for (i = 0; i < 16; i++) {
 8012212:	3400      	movi      	r4, 0
        printf("r%d: %08x\t", i, regs[i]);
 8012214:	10f3      	lrw      	r7, 0x8013c18	// 8012260 <trap_c+0x70>

        if ((i % 5) == 4) {
 8012216:	3605      	movi      	r6, 5
    for (i = 0; i < 16; i++) {
 8012218:	2400      	addi      	r4, 1
 801221a:	3c50      	cmpnei      	r4, 16
 801221c:	0c13      	bf      	0x8012242	// 8012242 <trap_c+0x52>
        printf("r%d: %08x\t", i, regs[i]);
 801221e:	d0850882 	ldr.w      	r2, (r5, r4 << 2)
 8012222:	6c53      	mov      	r1, r4
 8012224:	6c1f      	mov      	r0, r7
 8012226:	e0000c39 	bsr      	0x8013a98	// 8013a98 <wm_printf>
        if ((i % 5) == 4) {
 801222a:	c4c48043 	divs      	r3, r4, r6
 801222e:	7cd8      	mult      	r3, r6
 8012230:	5c6d      	subu      	r3, r4, r3
 8012232:	3b44      	cmpnei      	r3, 4
 8012234:	0bf2      	bt      	0x8012218	// 8012218 <trap_c+0x28>
            printf("\n");
 8012236:	300a      	movi      	r0, 10
    for (i = 0; i < 16; i++) {
 8012238:	2400      	addi      	r4, 1
            printf("\n");
 801223a:	e3fffb0f 	bsr      	0x8011858	// 8011858 <__GI_putchar>
    for (i = 0; i < 16; i++) {
 801223e:	3c50      	cmpnei      	r4, 16
 8012240:	0bef      	bt      	0x801221e	// 801221e <trap_c+0x2e>
        }
    }

    printf("\n");
 8012242:	300a      	movi      	r0, 10
 8012244:	e3fffb0a 	bsr      	0x8011858	// 8011858 <__GI_putchar>
    printf("epsr: %8x\n", regs[16]);
 8012248:	9530      	ld.w      	r1, (r5, 0x40)
 801224a:	1007      	lrw      	r0, 0x8013c24	// 8012264 <trap_c+0x74>
 801224c:	e0000c26 	bsr      	0x8013a98	// 8013a98 <wm_printf>
    printf("epc : %8x\n", regs[17]);
 8012250:	9531      	ld.w      	r1, (r5, 0x44)
 8012252:	1006      	lrw      	r0, 0x8013c30	// 8012268 <trap_c+0x78>
 8012254:	e0000c22 	bsr      	0x8013a98	// 8013a98 <wm_printf>
 8012258:	0400      	br      	0x8012258	// 8012258 <trap_c+0x68>
 801225a:	0000      	.short	0x0000
 801225c:	08013c04 	.long	0x08013c04
 8012260:	08013c18 	.long	0x08013c18
 8012264:	08013c24 	.long	0x08013c24
 8012268:	08013c30 	.long	0x08013c30

0801226c <board_init>:
    VIC->ICER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 801226c:	106a      	lrw      	r3, 0xe000e100	// 8012294 <board_init+0x28>
 801226e:	ea210001 	movih      	r1, 1
 8012272:	dc232020 	st.w      	r1, (r3, 0x80)
    VIC->ICPR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8012276:	dc232060 	st.w      	r1, (r3, 0x180)

	NVIC_DisableIRQ(UART0_IRQn);
	NVIC_ClearPendingIRQ(UART0_IRQn);

	bd = (APB_CLK/(16*bandrate) - 1)|(((APB_CLK%(bandrate*16))*16/(bandrate*16))<<16);
	WRITE_REG(UART0->BAUDR, bd);
 801227a:	1068      	lrw      	r3, 0x40010600	// 8012298 <board_init+0x2c>
 801227c:	ea21000b 	movih      	r1, 11
 8012280:	2113      	addi      	r1, 20
 8012282:	b324      	st.w      	r1, (r3, 0x10)
    VIC->ICER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8012284:	3200      	movi      	r2, 0

	WRITE_REG(UART0->LC, UART_BITSTOP_VAL | UART_TXEN_BIT | UART_RXEN_BIT);
 8012286:	31c3      	movi      	r1, 195
 8012288:	b320      	st.w      	r1, (r3, 0x0)
	WRITE_REG(UART0->FC, 0x00);   			/* Disable afc */
 801228a:	b341      	st.w      	r2, (r3, 0x4)
	WRITE_REG(UART0->DMAC, 0x00);             		/* Disable DMA */
 801228c:	b342      	st.w      	r2, (r3, 0x8)
	WRITE_REG(UART0->FIFOC, 0x00);             		/* one byte TX/RX */
 801228e:	b343      	st.w      	r2, (r3, 0xc)
#else
    uart1_io_init();
    /* use uart1 as log output io */
	uart1Init(115200);
#endif
}
 8012290:	783c      	jmp      	r15
 8012292:	0000      	.short	0x0000
 8012294:	e000e100 	.long	0xe000e100
 8012298:	40010600 	.long	0x40010600

0801229c <_out_uart>:
#include "wm_regs.h"
#include "wm_hal.h"

int sendchar(int ch)
{
    while((READ_REG(UART0->FIFOS) & 0x3F) >= 32);
 801229c:	1044      	lrw      	r2, 0x40010600	// 80122ac <_out_uart+0x10>
 801229e:	9267      	ld.w      	r3, (r2, 0x1c)
 80122a0:	e463203f 	andi      	r3, r3, 63
 80122a4:	3b1f      	cmphsi      	r3, 32
 80122a6:	0bfc      	bt      	0x801229e	// 801229e <_out_uart+0x2>
    WRITE_REG(UART0->TDW, (char)ch);
 80122a8:	b208      	st.w      	r0, (r2, 0x20)
}

static inline void _out_uart(char character, void* buffer, size_t idx, size_t maxlen)
{
  _write_r(NULL, 0, &character, 1);
}
 80122aa:	783c      	jmp      	r15
 80122ac:	40010600 	.long	0x40010600

080122b0 <_out_null>:

// internal null output
static inline void _out_null(char character, void* buffer, size_t idx, size_t maxlen)
{
  (void)character; (void)buffer; (void)idx; (void)maxlen;
}
 80122b0:	783c      	jmp      	r15
	...

080122b4 <_out_rev>:
  return i;
}

// output the specified string in reverse, taking care of any zero-padding
static size_t _out_rev(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
 80122b4:	ebe00058 	push      	r4-r11, r15, r16-r17
 80122b8:	6e4f      	mov      	r9, r3
 80122ba:	da0e200e 	ld.w      	r16, (r14, 0x38)
 80122be:	986b      	ld.w      	r3, (r14, 0x2c)
 80122c0:	c4034831 	lsli      	r17, r3, 0
  const size_t start_idx = idx;

  // pad spaces up to given width
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 80122c4:	e4702003 	andi      	r3, r16, 3
{
 80122c8:	6dc3      	mov      	r7, r0
 80122ca:	6e07      	mov      	r8, r1
 80122cc:	6e8b      	mov      	r10, r2
 80122ce:	98ac      	ld.w      	r5, (r14, 0x30)
 80122d0:	d96e200d 	ld.w      	r11, (r14, 0x34)
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 80122d4:	e9230010 	bnez      	r3, 0x80122f4	// 80122f4 <_out_rev+0x40>
    for (size_t i = len; i < width; i++) {
 80122d8:	66d4      	cmphs      	r5, r11
 80122da:	080d      	bt      	0x80122f4	// 80122f4 <_out_rev+0x40>
 80122dc:	c4ab0086 	subu      	r6, r11, r5
 80122e0:	6188      	addu      	r6, r2
      out(' ', buffer, idx++, maxlen);
 80122e2:	5a82      	addi      	r4, r2, 1
 80122e4:	6ce7      	mov      	r3, r9
 80122e6:	6c63      	mov      	r1, r8
 80122e8:	3020      	movi      	r0, 32
 80122ea:	7bdd      	jsr      	r7
    for (size_t i = len; i < width; i++) {
 80122ec:	6592      	cmpne      	r4, r6
 80122ee:	6c93      	mov      	r2, r4
 80122f0:	0bf9      	bt      	0x80122e2	// 80122e2 <_out_rev+0x2e>
 80122f2:	0402      	br      	0x80122f6	// 80122f6 <_out_rev+0x42>
 80122f4:	6d2b      	mov      	r4, r10
    }
  }

  // reverse string
  while (len) {
 80122f6:	e905002a 	bez      	r5, 0x801234a	// 801234a <_out_rev+0x96>
 80122fa:	5dc3      	subi      	r6, r5, 1
 80122fc:	c4114823 	lsli      	r3, r17, 0
 8012300:	60d8      	addu      	r3, r6
 8012302:	6d8f      	mov      	r6, r3
 8012304:	6150      	addu      	r5, r4
    out(buf[--len], buffer, idx++, maxlen);
 8012306:	e6240000 	addi      	r17, r4, 1
 801230a:	6c93      	mov      	r2, r4
 801230c:	8600      	ld.b      	r0, (r6, 0x0)
 801230e:	6ce7      	mov      	r3, r9
 8012310:	6c63      	mov      	r1, r8
 8012312:	c4114824 	lsli      	r4, r17, 0
 8012316:	7bdd      	jsr      	r7
  while (len) {
 8012318:	6552      	cmpne      	r4, r5
 801231a:	2e00      	subi      	r6, 1
 801231c:	0bf5      	bt      	0x8012306	// 8012306 <_out_rev+0x52>
  }

  // append pad spaces up to given width
  if (flags & FLAGS_LEFT) {
 801231e:	e6102002 	andi      	r16, r16, 2
 8012322:	e9100011 	bez      	r16, 0x8012344	// 8012344 <_out_rev+0x90>
    while (idx - start_idx < width) {
 8012326:	c5450083 	subu      	r3, r5, r10
 801232a:	66cc      	cmphs      	r3, r11
 801232c:	080c      	bt      	0x8012344	// 8012344 <_out_rev+0x90>
 801232e:	6c97      	mov      	r2, r5
      out(' ', buffer, idx++, maxlen);
 8012330:	2500      	addi      	r5, 1
 8012332:	6ce7      	mov      	r3, r9
 8012334:	6c63      	mov      	r1, r8
 8012336:	3020      	movi      	r0, 32
 8012338:	7bdd      	jsr      	r7
    while (idx - start_idx < width) {
 801233a:	c5450083 	subu      	r3, r5, r10
 801233e:	66cc      	cmphs      	r3, r11
      out(' ', buffer, idx++, maxlen);
 8012340:	6c97      	mov      	r2, r5
    while (idx - start_idx < width) {
 8012342:	0ff7      	bf      	0x8012330	// 8012330 <_out_rev+0x7c>
    }
  }

  return idx;
}
 8012344:	6c17      	mov      	r0, r5
 8012346:	ebc00058 	pop      	r4-r11, r15, r16-r17
  while (len) {
 801234a:	6d53      	mov      	r5, r4
 801234c:	07e9      	br      	0x801231e	// 801231e <_out_rev+0x6a>
	...

08012350 <_ntoa_format>:

// internal itoa format
static size_t _ntoa_format(out_fct_type out, char* buffer, size_t idx, size_t maxlen, char* buf, size_t len, bool negative, unsigned int base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8012350:	14d1      	push      	r4, r15
 8012352:	1424      	subi      	r14, r14, 16
 8012354:	d9ae2009 	ld.w      	r13, (r14, 0x24)
 8012358:	da8e200c 	ld.w      	r20, (r14, 0x30)
 801235c:	c40d4839 	lsli      	r25, r13, 0
  // pad leading zeros
  if (!(flags & FLAGS_LEFT)) {
 8012360:	e5b42002 	andi      	r13, r20, 2
{
 8012364:	dace2006 	ld.w      	r22, (r14, 0x18)
 8012368:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 801236c:	da6e200a 	ld.w      	r19, (r14, 0x28)
 8012370:	da4e200b 	ld.w      	r18, (r14, 0x2c)
 8012374:	daee0020 	ld.b      	r23, (r14, 0x20)
  if (!(flags & FLAGS_LEFT)) {
 8012378:	e92d0039 	bnez      	r13, 0x80123ea	// 80123ea <_ntoa_format+0x9a>
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 801237c:	e9320071 	bnez      	r18, 0x801245e	// 801245e <_ntoa_format+0x10e>
      width--;
    }
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8012380:	c66c0420 	cmphs      	r12, r19
 8012384:	0833      	bt      	0x80123ea	// 80123ea <_ntoa_format+0x9a>
 8012386:	eb0c001f 	cmphsi      	r12, 32
 801238a:	e7142001 	andi      	r24, r20, 1
 801238e:	082e      	bt      	0x80123ea	// 80123ea <_ntoa_format+0x9a>
 8012390:	c596002d 	addu      	r13, r22, r12
      buf[len++] = '0';
 8012394:	ea150030 	movi      	r21, 48
 8012398:	0406      	br      	0x80123a4	// 80123a4 <_ntoa_format+0x54>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 801239a:	eb4c0020 	cmpnei      	r12, 32
 801239e:	e5ad0000 	addi      	r13, r13, 1
 80123a2:	0c08      	bf      	0x80123b2	// 80123b2 <_ntoa_format+0x62>
      buf[len++] = '0';
 80123a4:	e58c0000 	addi      	r12, r12, 1
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80123a8:	c66c0420 	cmphs      	r12, r19
      buf[len++] = '0';
 80123ac:	dead0000 	st.b      	r21, (r13, 0x0)
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80123b0:	0ff5      	bf      	0x801239a	// 801239a <_ntoa_format+0x4a>
    }
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80123b2:	e918001c 	bez      	r24, 0x80123ea	// 80123ea <_ntoa_format+0x9a>
 80123b6:	c64c0420 	cmphs      	r12, r18
 80123ba:	0818      	bt      	0x80123ea	// 80123ea <_ntoa_format+0x9a>
 80123bc:	ea0d001f 	movi      	r13, 31
 80123c0:	6734      	cmphs      	r13, r12
 80123c2:	0c62      	bf      	0x8012486	// 8012486 <_ntoa_format+0x136>
 80123c4:	c596002d 	addu      	r13, r22, r12
      buf[len++] = '0';
 80123c8:	ea150030 	movi      	r21, 48
 80123cc:	0406      	br      	0x80123d8	// 80123d8 <_ntoa_format+0x88>
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80123ce:	eb4c0020 	cmpnei      	r12, 32
 80123d2:	e5ad0000 	addi      	r13, r13, 1
 80123d6:	0c58      	bf      	0x8012486	// 8012486 <_ntoa_format+0x136>
      buf[len++] = '0';
 80123d8:	e58c0000 	addi      	r12, r12, 1
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80123dc:	c64c0480 	cmpne      	r12, r18
      buf[len++] = '0';
 80123e0:	dead0000 	st.b      	r21, (r13, 0x0)
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80123e4:	0bf5      	bt      	0x80123ce	// 80123ce <_ntoa_format+0x7e>
      buf[len++] = '0';
 80123e6:	c40c4832 	lsli      	r18, r12, 0
    }
  }

  // handle hash
  if (flags & FLAGS_HASH) {
 80123ea:	e5b42010 	andi      	r13, r20, 16
 80123ee:	e90d0019 	bez      	r13, 0x8012420	// 8012420 <_ntoa_format+0xd0>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 80123f2:	e5b42400 	andi      	r13, r20, 1024
 80123f6:	e92d0004 	bnez      	r13, 0x80123fe	// 80123fe <_ntoa_format+0xae>
 80123fa:	e92c004e 	bnez      	r12, 0x8012496	// 8012496 <_ntoa_format+0x146>
      len--;
      if (len && (base == 16U)) {
        len--;
      }
    }
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80123fe:	c4194824 	lsli      	r4, r25, 0
 8012402:	3c50      	cmpnei      	r4, 16
 8012404:	0c74      	bf      	0x80124ec	// 80124ec <_ntoa_format+0x19c>
      buf[len++] = 'x';
    }
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
      buf[len++] = 'X';
    }
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8012406:	c4194824 	lsli      	r4, r25, 0
 801240a:	3c42      	cmpnei      	r4, 2
 801240c:	0c7e      	bf      	0x8012508	// 8012508 <_ntoa_format+0x1b8>
      buf[len++] = 'b';
    }
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
 801240e:	eb0c001f 	cmphsi      	r12, 32
 8012412:	081a      	bt      	0x8012446	// 8012446 <_ntoa_format+0xf6>
      buf[len++] = '0';
 8012414:	ea0d0030 	movi      	r13, 48
 8012418:	d596002d 	str.b      	r13, (r22, r12 << 0)
 801241c:	e58c0000 	addi      	r12, r12, 1
    }
  }

  if (len < PRINTF_NTOA_BUFFER_SIZE) {
 8012420:	eb0c001f 	cmphsi      	r12, 32
 8012424:	0811      	bt      	0x8012446	// 8012446 <_ntoa_format+0xf6>
    if (negative) {
 8012426:	e9370048 	bnez      	r23, 0x80124b6	// 80124b6 <_ntoa_format+0x166>
      buf[len++] = '-';
    }
    else if (flags & FLAGS_PLUS) {
 801242a:	e5b42004 	andi      	r13, r20, 4
 801242e:	e92d0056 	bnez      	r13, 0x80124da	// 80124da <_ntoa_format+0x18a>
      buf[len++] = '+';  // ignore the space if the '+' exists
    }
    else if (flags & FLAGS_SPACE) {
 8012432:	e5b42008 	andi      	r13, r20, 8
 8012436:	e90d0008 	bez      	r13, 0x8012446	// 8012446 <_ntoa_format+0xf6>
      buf[len++] = ' ';
 801243a:	ea0d0020 	movi      	r13, 32
 801243e:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8012442:	e58c0000 	addi      	r12, r12, 1
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 8012446:	de8e2003 	st.w      	r20, (r14, 0xc)
 801244a:	de4e2002 	st.w      	r18, (r14, 0x8)
 801244e:	dd8e2001 	st.w      	r12, (r14, 0x4)
 8012452:	dece2000 	st.w      	r22, (r14, 0x0)
 8012456:	e3ffff2f 	bsr      	0x80122b4	// 80122b4 <_out_rev>
}
 801245a:	1404      	addi      	r14, r14, 16
 801245c:	1491      	pop      	r4, r15
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 801245e:	e7142001 	andi      	r24, r20, 1
 8012462:	e9180031 	bez      	r24, 0x80124c4	// 80124c4 <_ntoa_format+0x174>
 8012466:	e9370037 	bnez      	r23, 0x80124d4	// 80124d4 <_ntoa_format+0x184>
 801246a:	e5b4200c 	andi      	r13, r20, 12
 801246e:	e92d0033 	bnez      	r13, 0x80124d4	// 80124d4 <_ntoa_format+0x184>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8012472:	c66c0420 	cmphs      	r12, r19
 8012476:	0ba0      	bt      	0x80123b6	// 80123b6 <_ntoa_format+0x66>
 8012478:	ea0d001f 	movi      	r13, 31
 801247c:	6734      	cmphs      	r13, r12
 801247e:	0b89      	bt      	0x8012390	// 8012390 <_ntoa_format+0x40>
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8012480:	c64c0420 	cmphs      	r12, r18
 8012484:	0bb3      	bt      	0x80123ea	// 80123ea <_ntoa_format+0x9a>
  if (flags & FLAGS_HASH) {
 8012486:	e5b42010 	andi      	r13, r20, 16
 801248a:	e90dffde 	bez      	r13, 0x8012446	// 8012446 <_ntoa_format+0xf6>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 801248e:	e5b42400 	andi      	r13, r20, 1024
 8012492:	e92dffb6 	bnez      	r13, 0x80123fe	// 80123fe <_ntoa_format+0xae>
 8012496:	c5930480 	cmpne      	r19, r12
 801249a:	0c04      	bf      	0x80124a2	// 80124a2 <_ntoa_format+0x152>
 801249c:	c64c0480 	cmpne      	r12, r18
 80124a0:	0baf      	bt      	0x80123fe	// 80123fe <_ntoa_format+0xae>
      len--;
 80124a2:	e5ac1000 	subi      	r13, r12, 1
      if (len && (base == 16U)) {
 80124a6:	e90d0046 	bez      	r13, 0x8012532	// 8012532 <_ntoa_format+0x1e2>
 80124aa:	c4194824 	lsli      	r4, r25, 0
 80124ae:	3c50      	cmpnei      	r4, 16
 80124b0:	0c1c      	bf      	0x80124e8	// 80124e8 <_ntoa_format+0x198>
 80124b2:	6f37      	mov      	r12, r13
 80124b4:	07a9      	br      	0x8012406	// 8012406 <_ntoa_format+0xb6>
      buf[len++] = '-';
 80124b6:	ea0d002d 	movi      	r13, 45
 80124ba:	d596002d 	str.b      	r13, (r22, r12 << 0)
 80124be:	e58c0000 	addi      	r12, r12, 1
 80124c2:	07c2      	br      	0x8012446	// 8012446 <_ntoa_format+0xf6>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80124c4:	c66c0420 	cmphs      	r12, r19
 80124c8:	0b91      	bt      	0x80123ea	// 80123ea <_ntoa_format+0x9a>
 80124ca:	ea0d001f 	movi      	r13, 31
 80124ce:	6734      	cmphs      	r13, r12
 80124d0:	0b60      	bt      	0x8012390	// 8012390 <_ntoa_format+0x40>
 80124d2:	078c      	br      	0x80123ea	// 80123ea <_ntoa_format+0x9a>
      width--;
 80124d4:	e6521000 	subi      	r18, r18, 1
 80124d8:	07cd      	br      	0x8012472	// 8012472 <_ntoa_format+0x122>
      buf[len++] = '+';  // ignore the space if the '+' exists
 80124da:	ea0d002b 	movi      	r13, 43
 80124de:	d596002d 	str.b      	r13, (r22, r12 << 0)
 80124e2:	e58c0000 	addi      	r12, r12, 1
 80124e6:	07b0      	br      	0x8012446	// 8012446 <_ntoa_format+0xf6>
        len--;
 80124e8:	e58c1001 	subi      	r12, r12, 2
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80124ec:	e5b42020 	andi      	r13, r20, 32
 80124f0:	e92d0016 	bnez      	r13, 0x801251c	// 801251c <_ntoa_format+0x1cc>
 80124f4:	eb0c001f 	cmphsi      	r12, 32
 80124f8:	0ba7      	bt      	0x8012446	// 8012446 <_ntoa_format+0xf6>
      buf[len++] = 'x';
 80124fa:	ea0d0078 	movi      	r13, 120
 80124fe:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8012502:	e58c0000 	addi      	r12, r12, 1
 8012506:	0784      	br      	0x801240e	// 801240e <_ntoa_format+0xbe>
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8012508:	eb0c001f 	cmphsi      	r12, 32
 801250c:	0b9d      	bt      	0x8012446	// 8012446 <_ntoa_format+0xf6>
      buf[len++] = 'b';
 801250e:	ea0d0062 	movi      	r13, 98
 8012512:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8012516:	e58c0000 	addi      	r12, r12, 1
 801251a:	077a      	br      	0x801240e	// 801240e <_ntoa_format+0xbe>
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 801251c:	ea0d001f 	movi      	r13, 31
 8012520:	6734      	cmphs      	r13, r12
 8012522:	0f92      	bf      	0x8012446	// 8012446 <_ntoa_format+0xf6>
      buf[len++] = 'X';
 8012524:	ea0d0058 	movi      	r13, 88
 8012528:	d596002d 	str.b      	r13, (r22, r12 << 0)
 801252c:	e58c0000 	addi      	r12, r12, 1
 8012530:	076f      	br      	0x801240e	// 801240e <_ntoa_format+0xbe>
 8012532:	6f37      	mov      	r12, r13
 8012534:	0765      	br      	0x80123fe	// 80123fe <_ntoa_format+0xae>
	...

08012538 <_ntoa_long>:


// internal itoa for 'long' type
static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8012538:	14d3      	push      	r4-r6, r15
 801253a:	142f      	subi      	r14, r14, 60
 801253c:	d9ae2016 	ld.w      	r13, (r14, 0x58)
 8012540:	d98e2013 	ld.w      	r12, (r14, 0x4c)
 8012544:	6d77      	mov      	r5, r13
 8012546:	d9ae2017 	ld.w      	r13, (r14, 0x5c)
 801254a:	da8e2015 	ld.w      	r20, (r14, 0x54)
 801254e:	6db7      	mov      	r6, r13
 8012550:	db0e2018 	ld.w      	r24, (r14, 0x60)
 8012554:	d88e0050 	ld.b      	r4, (r14, 0x50)
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;

  // no hash for 0 values
  if (!value) {
 8012558:	e92c000a 	bnez      	r12, 0x801256c	// 801256c <_ntoa_long+0x34>
    flags &= ~FLAGS_HASH;
 801255c:	c498282d 	bclri      	r13, r24, 4
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
 8012560:	e7182400 	andi      	r24, r24, 1024
 8012564:	e9380043 	bnez      	r24, 0x80125ea	// 80125ea <_ntoa_long+0xb2>
    flags &= ~FLAGS_HASH;
 8012568:	c40d4838 	lsli      	r24, r13, 0
    do {
      const char digit = (char)(value % base);
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 801256c:	e5b82020 	andi      	r13, r24, 32
 8012570:	eb4d0000 	cmpnei      	r13, 0
 8012574:	ea170041 	movi      	r23, 65
 8012578:	ea0d0061 	movi      	r13, 97
 801257c:	c6ed0c20 	incf      	r23, r13, 0
 8012580:	e72e001b 	addi      	r25, r14, 28
 8012584:	c4194832 	lsli      	r18, r25, 0
 8012588:	ea150000 	movi      	r21, 0
 801258c:	e6f71009 	subi      	r23, r23, 10
 8012590:	ea130020 	movi      	r19, 32
      const char digit = (char)(value % base);
 8012594:	c68c802d 	divu      	r13, r12, r20
 8012598:	c68d8436 	mult      	r22, r13, r20
 801259c:	c6cc008c 	subu      	r12, r12, r22
 80125a0:	7730      	zextb      	r12, r12
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 80125a2:	eb0c0009 	cmphsi      	r12, 10
 80125a6:	e6b50000 	addi      	r21, r21, 1
 80125aa:	081c      	bt      	0x80125e2	// 80125e2 <_ntoa_long+0xaa>
 80125ac:	e58c002f 	addi      	r12, r12, 48
 80125b0:	7730      	zextb      	r12, r12
 80125b2:	dd920000 	st.b      	r12, (r18, 0x0)
      value /= base;
 80125b6:	6f37      	mov      	r12, r13
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 80125b8:	e90d0006 	bez      	r13, 0x80125c4	// 80125c4 <_ntoa_long+0x8c>
 80125bc:	e6520000 	addi      	r18, r18, 1
 80125c0:	e833ffea 	bnezad      	r19, 0x8012594	// 8012594 <_ntoa_long+0x5c>
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 80125c4:	df0e2006 	st.w      	r24, (r14, 0x18)
 80125c8:	b8c5      	st.w      	r6, (r14, 0x14)
 80125ca:	b8a4      	st.w      	r5, (r14, 0x10)
 80125cc:	de8e2003 	st.w      	r20, (r14, 0xc)
 80125d0:	b882      	st.w      	r4, (r14, 0x8)
 80125d2:	deae2001 	st.w      	r21, (r14, 0x4)
 80125d6:	df2e2000 	st.w      	r25, (r14, 0x0)
 80125da:	e3fffebb 	bsr      	0x8012350	// 8012350 <_ntoa_format>
}
 80125de:	140f      	addi      	r14, r14, 60
 80125e0:	1493      	pop      	r4-r6, r15
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 80125e2:	c6ec002c 	addu      	r12, r12, r23
 80125e6:	7730      	zextb      	r12, r12
 80125e8:	07e5      	br      	0x80125b2	// 80125b2 <_ntoa_long+0x7a>
    flags &= ~FLAGS_HASH;
 80125ea:	c40d4838 	lsli      	r24, r13, 0
  size_t len = 0U;
 80125ee:	c40c4835 	lsli      	r21, r12, 0
 80125f2:	e72e001b 	addi      	r25, r14, 28
 80125f6:	07e7      	br      	0x80125c4	// 80125c4 <_ntoa_long+0x8c>

080125f8 <_ntoa_long_long>:


// internal itoa for 'long long' type
#if defined(PRINTF_SUPPORT_LONG_LONG)
static size_t _ntoa_long_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long long value, bool negative, unsigned long long base, unsigned int prec, unsigned int width, unsigned int flags)
{
 80125f8:	ebe00058 	push      	r4-r11, r15, r16-r17
 80125fc:	1435      	subi      	r14, r14, 84
 80125fe:	c4034831 	lsli      	r17, r3, 0
 8012602:	d96e2020 	ld.w      	r11, (r14, 0x80)
 8012606:	9965      	ld.w      	r3, (r14, 0x94)
 8012608:	da0e2021 	ld.w      	r16, (r14, 0x84)
 801260c:	b86b      	st.w      	r3, (r14, 0x2c)
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;

  // no hash for 0 values
  if (!value) {
 801260e:	c60b2424 	or      	r4, r11, r16
{
 8012612:	9966      	ld.w      	r3, (r14, 0x98)
 8012614:	b86c      	st.w      	r3, (r14, 0x30)
 8012616:	d86e0088 	ld.b      	r3, (r14, 0x88)
 801261a:	b807      	st.w      	r0, (r14, 0x1c)
 801261c:	b828      	st.w      	r1, (r14, 0x20)
 801261e:	b849      	st.w      	r2, (r14, 0x24)
 8012620:	99c3      	ld.w      	r6, (r14, 0x8c)
 8012622:	99e4      	ld.w      	r7, (r14, 0x90)
 8012624:	d94e2027 	ld.w      	r10, (r14, 0x9c)
 8012628:	b86a      	st.w      	r3, (r14, 0x28)
  if (!value) {
 801262a:	e9240009 	bnez      	r4, 0x801263c	// 801263c <_ntoa_long_long+0x44>
    flags &= ~FLAGS_HASH;
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
 801262e:	e44a2400 	andi      	r2, r10, 1024
    flags &= ~FLAGS_HASH;
 8012632:	c48a2823 	bclri      	r3, r10, 4
 8012636:	6e8f      	mov      	r10, r3
  if (!(flags & FLAGS_PRECISION) || value) {
 8012638:	e9220033 	bnez      	r2, 0x801269e	// 801269e <_ntoa_long_long+0xa6>
    do {
      const char digit = (char)(value % base);
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 801263c:	e46a2020 	andi      	r3, r10, 32
 8012640:	3b40      	cmpnei      	r3, 0
 8012642:	ea080041 	movi      	r8, 65
 8012646:	3361      	movi      	r3, 97
 8012648:	c5030c20 	incf      	r8, r3, 0
 801264c:	e52e0033 	addi      	r9, r14, 52
 8012650:	6d67      	mov      	r5, r9
 8012652:	3400      	movi      	r4, 0
 8012654:	e5081009 	subi      	r8, r8, 10
 8012658:	0415      	br      	0x8012682	// 8012682 <_ntoa_long_long+0x8a>
 801265a:	202f      	addi      	r0, 48
 801265c:	7400      	zextb      	r0, r0
 801265e:	a500      	st.b      	r0, (r5, 0x0)
      value /= base;
 8012660:	c4104821 	lsli      	r1, r16, 0
 8012664:	6c2f      	mov      	r0, r11
 8012666:	6c9b      	mov      	r2, r6
 8012668:	6cdf      	mov      	r3, r7
 801266a:	e3ffefd5 	bsr      	0x8010614	// 8010614 <__udivdi3>
 801266e:	c4014830 	lsli      	r16, r1, 0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8012672:	6c40      	or      	r1, r0
      value /= base;
 8012674:	6ec3      	mov      	r11, r0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8012676:	e9010016 	bez      	r1, 0x80126a2	// 80126a2 <_ntoa_long_long+0xaa>
 801267a:	eb440020 	cmpnei      	r4, 32
 801267e:	2500      	addi      	r5, 1
 8012680:	0c11      	bf      	0x80126a2	// 80126a2 <_ntoa_long_long+0xaa>
      const char digit = (char)(value % base);
 8012682:	6c9b      	mov      	r2, r6
 8012684:	6cdf      	mov      	r3, r7
 8012686:	6c2f      	mov      	r0, r11
 8012688:	c4104821 	lsli      	r1, r16, 0
 801268c:	e3fff15e 	bsr      	0x8010948	// 8010948 <__umoddi3>
 8012690:	7400      	zextb      	r0, r0
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8012692:	3809      	cmphsi      	r0, 10
 8012694:	2400      	addi      	r4, 1
 8012696:	0fe2      	bf      	0x801265a	// 801265a <_ntoa_long_long+0x62>
 8012698:	6020      	addu      	r0, r8
 801269a:	7400      	zextb      	r0, r0
 801269c:	07e1      	br      	0x801265e	// 801265e <_ntoa_long_long+0x66>
 801269e:	e52e0033 	addi      	r9, r14, 52
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 80126a2:	986c      	ld.w      	r3, (r14, 0x30)
 80126a4:	b865      	st.w      	r3, (r14, 0x14)
 80126a6:	986b      	ld.w      	r3, (r14, 0x2c)
 80126a8:	b864      	st.w      	r3, (r14, 0x10)
 80126aa:	986a      	ld.w      	r3, (r14, 0x28)
 80126ac:	b862      	st.w      	r3, (r14, 0x8)
 80126ae:	dd4e2006 	st.w      	r10, (r14, 0x18)
 80126b2:	b8c3      	st.w      	r6, (r14, 0xc)
 80126b4:	b881      	st.w      	r4, (r14, 0x4)
 80126b6:	dd2e2000 	st.w      	r9, (r14, 0x0)
 80126ba:	c4114823 	lsli      	r3, r17, 0
 80126be:	9849      	ld.w      	r2, (r14, 0x24)
 80126c0:	9828      	ld.w      	r1, (r14, 0x20)
 80126c2:	9807      	ld.w      	r0, (r14, 0x1c)
 80126c4:	e3fffe46 	bsr      	0x8012350	// 8012350 <_ntoa_format>
}
 80126c8:	1415      	addi      	r14, r14, 84
 80126ca:	ebc00058 	pop      	r4-r11, r15, r16-r17
	...

080126d0 <_ftoa>:
#endif


// internal ftoa for fixed decimal floating point
static size_t _ftoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
 80126d0:	ebe00058 	push      	r4-r11, r15, r16-r17
 80126d4:	1435      	subi      	r14, r14, 84
 80126d6:	6ecf      	mov      	r11, r3
 80126d8:	9962      	ld.w      	r3, (r14, 0x88)
 80126da:	6e4f      	mov      	r9, r3
 80126dc:	9963      	ld.w      	r3, (r14, 0x8c)
 80126de:	9980      	ld.w      	r4, (r14, 0x80)
 80126e0:	99a1      	ld.w      	r5, (r14, 0x84)
 80126e2:	b865      	st.w      	r3, (r14, 0x14)
 80126e4:	9964      	ld.w      	r3, (r14, 0x90)
 80126e6:	6d83      	mov      	r6, r0
 80126e8:	6dc7      	mov      	r7, r1
 80126ea:	6e8b      	mov      	r10, r2
 80126ec:	b866      	st.w      	r3, (r14, 0x18)

  // powers of 10
  static const double pow10[] = { 1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000 };

  // test for special values
  if (value != value)
 80126ee:	6c93      	mov      	r2, r4
 80126f0:	6cd7      	mov      	r3, r5
 80126f2:	6c13      	mov      	r0, r4
 80126f4:	6c57      	mov      	r1, r5
 80126f6:	e3fff5df 	bsr      	0x80112b4	// 80112b4 <__nedf2>
 80126fa:	e920010c 	bnez      	r0, 0x8012912	// 8012912 <_ftoa+0x242>
    return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
  if (value < -DBL_MAX)
 80126fe:	3200      	movi      	r2, 0
 8012700:	ea23fff0 	movih      	r3, 65520
 8012704:	2a00      	subi      	r2, 1
 8012706:	2b00      	subi      	r3, 1
 8012708:	6c13      	mov      	r0, r4
 801270a:	9921      	ld.w      	r1, (r14, 0x84)
 801270c:	e3fff630 	bsr      	0x801136c	// 801136c <__ltdf2>
 8012710:	e980011b 	blz      	r0, 0x8012946	// 8012946 <_ftoa+0x276>
    return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
  if (value > DBL_MAX)
 8012714:	3200      	movi      	r2, 0
 8012716:	ea237ff0 	movih      	r3, 32752
 801271a:	2a00      	subi      	r2, 1
 801271c:	2b00      	subi      	r3, 1
 801271e:	6c13      	mov      	r0, r4
 8012720:	9921      	ld.w      	r1, (r14, 0x84)
 8012722:	e3fff5e5 	bsr      	0x80112ec	// 80112ec <__gtdf2>
 8012726:	e960001d 	blsz      	r0, 0x8012760	// 8012760 <_ftoa+0x90>
    return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
 801272a:	9806      	ld.w      	r0, (r14, 0x18)
 801272c:	e4402004 	andi      	r2, r0, 4
 8012730:	3a40      	cmpnei      	r2, 0
 8012732:	0137      	lrw      	r1, 0x8013e24	// 8012a50 <_ftoa+0x380>
 8012734:	0177      	lrw      	r3, 0x8013e1c	// 8012a54 <_ftoa+0x384>
 8012736:	c4610c20 	incf      	r3, r1, 0
 801273a:	3a40      	cmpnei      	r2, 0
 801273c:	3103      	movi      	r1, 3
 801273e:	3204      	movi      	r2, 4
 8012740:	c4410c20 	incf      	r2, r1, 0
 8012744:	9825      	ld.w      	r1, (r14, 0x14)
 8012746:	b803      	st.w      	r0, (r14, 0xc)
 8012748:	b822      	st.w      	r1, (r14, 0x8)
 801274a:	b841      	st.w      	r2, (r14, 0x4)
 801274c:	b860      	st.w      	r3, (r14, 0x0)
    else if (flags & FLAGS_SPACE) {
      buf[len++] = ' ';
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 801274e:	6cef      	mov      	r3, r11
 8012750:	6cab      	mov      	r2, r10
 8012752:	6c5f      	mov      	r1, r7
 8012754:	6c1b      	mov      	r0, r6
 8012756:	e3fffdaf 	bsr      	0x80122b4	// 80122b4 <_out_rev>
}
 801275a:	1415      	addi      	r14, r14, 84
 801275c:	ebc00058 	pop      	r4-r11, r15, r16-r17
  if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
 8012760:	3200      	movi      	r2, 0
 8012762:	0261      	lrw      	r3, 0x41cdcd65	// 8012a58 <_ftoa+0x388>
 8012764:	6c13      	mov      	r0, r4
 8012766:	9921      	ld.w      	r1, (r14, 0x84)
 8012768:	e3fff5c2 	bsr      	0x80112ec	// 80112ec <__gtdf2>
 801276c:	e94000dc 	bhz      	r0, 0x8012924	// 8012924 <_ftoa+0x254>
 8012770:	3200      	movi      	r2, 0
 8012772:	0264      	lrw      	r3, 0xc1cdcd65	// 8012a5c <_ftoa+0x38c>
 8012774:	6c13      	mov      	r0, r4
 8012776:	9921      	ld.w      	r1, (r14, 0x84)
 8012778:	e3fff5fa 	bsr      	0x801136c	// 801136c <__ltdf2>
 801277c:	e98000d4 	blz      	r0, 0x8012924	// 8012924 <_ftoa+0x254>
  if (value < 0) {
 8012780:	3200      	movi      	r2, 0
 8012782:	6ccb      	mov      	r3, r2
 8012784:	6c13      	mov      	r0, r4
 8012786:	9921      	ld.w      	r1, (r14, 0x84)
 8012788:	e3fff5f2 	bsr      	0x801136c	// 801136c <__ltdf2>
 801278c:	e98001b0 	blz      	r0, 0x8012aec	// 8012aec <_ftoa+0x41c>
  bool negative = false;
 8012790:	3300      	movi      	r3, 0
 8012792:	b86c      	st.w      	r3, (r14, 0x30)
  if (!(flags & FLAGS_PRECISION)) {
 8012794:	9866      	ld.w      	r3, (r14, 0x18)
 8012796:	e5a32400 	andi      	r13, r3, 1024
 801279a:	e92d0136 	bnez      	r13, 0x8012a06	// 8012a06 <_ftoa+0x336>
 801279e:	026e      	lrw      	r3, 0x412e8480	// 8012a60 <_ftoa+0x390>
 80127a0:	ddae2007 	st.w      	r13, (r14, 0x1c)
 80127a4:	b868      	st.w      	r3, (r14, 0x20)
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 80127a6:	ea080006 	movi      	r8, 6
 80127aa:	e68e0033 	addi      	r20, r14, 52
  int whole = (int)value;
 80127ae:	6c57      	mov      	r1, r5
 80127b0:	6c13      	mov      	r0, r4
 80127b2:	de8e200b 	st.w      	r20, (r14, 0x2c)
 80127b6:	ddae200a 	st.w      	r13, (r14, 0x28)
 80127ba:	e3fff629 	bsr      	0x801140c	// 801140c <__fixdfsi>
 80127be:	6e43      	mov      	r9, r0
  double tmp = (value - whole) * pow10[prec];
 80127c0:	e3fff5f2 	bsr      	0x80113a4	// 80113a4 <__floatsidf>
 80127c4:	6c83      	mov      	r2, r0
 80127c6:	6cc7      	mov      	r3, r1
 80127c8:	6c13      	mov      	r0, r4
 80127ca:	6c57      	mov      	r1, r5
 80127cc:	e3fff3ca 	bsr      	0x8010f60	// 8010f60 <__subdf3>
 80127d0:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 80127d4:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 80127d8:	6cb3      	mov      	r2, r12
 80127da:	9868      	ld.w      	r3, (r14, 0x20)
 80127dc:	e3fff3e0 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
 80127e0:	c4014831 	lsli      	r17, r1, 0
 80127e4:	c4004830 	lsli      	r16, r0, 0
  unsigned long frac = (unsigned long)tmp;
 80127e8:	e3ffeefa 	bsr      	0x80105dc	// 80105dc <__fixunsdfsi>
 80127ec:	b809      	st.w      	r0, (r14, 0x24)
  diff = tmp - frac;
 80127ee:	e3fff647 	bsr      	0x801147c	// 801147c <__floatunsidf>
 80127f2:	6c83      	mov      	r2, r0
 80127f4:	6cc7      	mov      	r3, r1
 80127f6:	c4104820 	lsli      	r0, r16, 0
 80127fa:	c4114821 	lsli      	r1, r17, 0
 80127fe:	e3fff3b1 	bsr      	0x8010f60	// 8010f60 <__subdf3>
  if (diff > 0.5) {
 8012802:	3200      	movi      	r2, 0
 8012804:	ea233fe0 	movih      	r3, 16352
  diff = tmp - frac;
 8012808:	c4004830 	lsli      	r16, r0, 0
 801280c:	c4014831 	lsli      	r17, r1, 0
  if (diff > 0.5) {
 8012810:	e3fff56e 	bsr      	0x80112ec	// 80112ec <__gtdf2>
 8012814:	da4e2009 	ld.w      	r18, (r14, 0x24)
 8012818:	d9ae200a 	ld.w      	r13, (r14, 0x28)
 801281c:	da8e200b 	ld.w      	r20, (r14, 0x2c)
 8012820:	e96000d3 	blsz      	r0, 0x80129c6	// 80129c6 <_ftoa+0x2f6>
    ++frac;
 8012824:	e6520000 	addi      	r18, r18, 1
    if (frac >= pow10[prec]) {
 8012828:	c4124820 	lsli      	r0, r18, 0
 801282c:	de8e2009 	st.w      	r20, (r14, 0x24)
 8012830:	c40d4831 	lsli      	r17, r13, 0
 8012834:	c4124830 	lsli      	r16, r18, 0
 8012838:	e3fff622 	bsr      	0x801147c	// 801147c <__floatunsidf>
 801283c:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 8012840:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 8012844:	6cf7      	mov      	r3, r13
 8012846:	6cb3      	mov      	r2, r12
 8012848:	e3fff572 	bsr      	0x801132c	// 801132c <__gedf2>
 801284c:	c4104832 	lsli      	r18, r16, 0
 8012850:	c411482d 	lsli      	r13, r17, 0
 8012854:	da8e2009 	ld.w      	r20, (r14, 0x24)
 8012858:	e9a0011f 	bhsz      	r0, 0x8012a96	// 8012a96 <_ftoa+0x3c6>
  if (prec == 0U) {
 801285c:	e928007e 	bnez      	r8, 0x8012958	// 8012958 <_ftoa+0x288>
    diff = value - (double)whole;
 8012860:	6c27      	mov      	r0, r9
 8012862:	c4144831 	lsli      	r17, r20, 0
 8012866:	c40d4830 	lsli      	r16, r13, 0
 801286a:	e3fff59d 	bsr      	0x80113a4	// 80113a4 <__floatsidf>
 801286e:	6c83      	mov      	r2, r0
 8012870:	6cc7      	mov      	r3, r1
 8012872:	6c13      	mov      	r0, r4
 8012874:	6c57      	mov      	r1, r5
 8012876:	e3fff375 	bsr      	0x8010f60	// 8010f60 <__subdf3>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 801287a:	6ca3      	mov      	r2, r8
 801287c:	ea233fe0 	movih      	r3, 16352
    diff = value - (double)whole;
 8012880:	6d03      	mov      	r4, r0
 8012882:	6d47      	mov      	r5, r1
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 8012884:	e3fff574 	bsr      	0x801136c	// 801136c <__ltdf2>
 8012888:	c410482d 	lsli      	r13, r16, 0
 801288c:	c4114834 	lsli      	r20, r17, 0
 8012890:	e98000f5 	blz      	r0, 0x8012a7a	// 8012a7a <_ftoa+0x3aa>
 8012894:	e4692001 	andi      	r3, r9, 1
      ++whole;
 8012898:	3b40      	cmpnei      	r3, 0
 801289a:	c4690c20 	incf      	r3, r9, 0
 801289e:	c4690c41 	inct      	r3, r9, 1
 80128a2:	6e4f      	mov      	r9, r3
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 80128a4:	eb4d0020 	cmpnei      	r13, 32
 80128a8:	0c81      	bf      	0x80129aa	// 80129aa <_ftoa+0x2da>
    buf[len++] = (char)(48 + (whole % 10));
 80128aa:	300a      	movi      	r0, 10
 80128ac:	c4098043 	divs      	r3, r9, r0
 80128b0:	6d27      	mov      	r4, r9
 80128b2:	c4038421 	mult      	r1, r3, r0
 80128b6:	5c25      	subu      	r1, r4, r1
 80128b8:	212f      	addi      	r1, 48
 80128ba:	e44d0000 	addi      	r2, r13, 1
 80128be:	d5b40021 	str.b      	r1, (r20, r13 << 0)
    if (!(whole /= 10)) {
 80128c2:	e9030013 	bez      	r3, 0x80128e8	// 80128e8 <_ftoa+0x218>
 80128c6:	c454002c 	addu      	r12, r20, r2
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 80128ca:	eb420020 	cmpnei      	r2, 32
 80128ce:	0c6e      	bf      	0x80129aa	// 80129aa <_ftoa+0x2da>
    buf[len++] = (char)(48 + (whole % 10));
 80128d0:	c4038041 	divs      	r1, r3, r0
 80128d4:	c401842d 	mult      	r13, r1, r0
 80128d8:	60f6      	subu      	r3, r13
 80128da:	232f      	addi      	r3, 48
 80128dc:	d40c8003 	stbi.b      	r3, (r12)
 80128e0:	2200      	addi      	r2, 1
    if (!(whole /= 10)) {
 80128e2:	6cc7      	mov      	r3, r1
 80128e4:	e921fff3 	bnez      	r1, 0x80128ca	// 80128ca <_ftoa+0x1fa>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 80128e8:	9866      	ld.w      	r3, (r14, 0x18)
 80128ea:	e4632003 	andi      	r3, r3, 3
 80128ee:	3b41      	cmpnei      	r3, 1
 80128f0:	0cda      	bf      	0x8012aa4	// 8012aa4 <_ftoa+0x3d4>
  if (len < PRINTF_FTOA_BUFFER_SIZE) {
 80128f2:	eb420020 	cmpnei      	r2, 32
 80128f6:	0d27      	bf      	0x8012b44	// 8012b44 <_ftoa+0x474>
    if (negative) {
 80128f8:	986c      	ld.w      	r3, (r14, 0x30)
 80128fa:	e92300bb 	bnez      	r3, 0x8012a70	// 8012a70 <_ftoa+0x3a0>
    else if (flags & FLAGS_PLUS) {
 80128fe:	9866      	ld.w      	r3, (r14, 0x18)
 8012900:	e4632004 	andi      	r3, r3, 4
 8012904:	e9030116 	bez      	r3, 0x8012b30	// 8012b30 <_ftoa+0x460>
      buf[len++] = '+';  // ignore the space if the '+' exists
 8012908:	312b      	movi      	r1, 43
 801290a:	5a62      	addi      	r3, r2, 1
 801290c:	d4540021 	str.b      	r1, (r20, r2 << 0)
 8012910:	0453      	br      	0x80129b6	// 80129b6 <_ftoa+0x2e6>
    return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
 8012912:	9866      	ld.w      	r3, (r14, 0x18)
 8012914:	b863      	st.w      	r3, (r14, 0xc)
 8012916:	9865      	ld.w      	r3, (r14, 0x14)
 8012918:	b862      	st.w      	r3, (r14, 0x8)
 801291a:	3303      	movi      	r3, 3
 801291c:	b861      	st.w      	r3, (r14, 0x4)
 801291e:	1272      	lrw      	r3, 0x8013e28	// 8012a64 <_ftoa+0x394>
 8012920:	b860      	st.w      	r3, (r14, 0x0)
 8012922:	0716      	br      	0x801274e	// 801274e <_ftoa+0x7e>
    return _etoa(out, buffer, idx, maxlen, value, prec, width, flags);
 8012924:	9866      	ld.w      	r3, (r14, 0x18)
 8012926:	b864      	st.w      	r3, (r14, 0x10)
 8012928:	9865      	ld.w      	r3, (r14, 0x14)
 801292a:	b863      	st.w      	r3, (r14, 0xc)
 801292c:	dd2e2002 	st.w      	r9, (r14, 0x8)
 8012930:	b880      	st.w      	r4, (r14, 0x0)
 8012932:	b8a1      	st.w      	r5, (r14, 0x4)
 8012934:	6cef      	mov      	r3, r11
 8012936:	6cab      	mov      	r2, r10
 8012938:	6c5f      	mov      	r1, r7
 801293a:	6c1b      	mov      	r0, r6
 801293c:	e0000116 	bsr      	0x8012b68	// 8012b68 <_etoa>
}
 8012940:	1415      	addi      	r14, r14, 84
 8012942:	ebc00058 	pop      	r4-r11, r15, r16-r17
    return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
 8012946:	9866      	ld.w      	r3, (r14, 0x18)
 8012948:	b863      	st.w      	r3, (r14, 0xc)
 801294a:	9865      	ld.w      	r3, (r14, 0x14)
 801294c:	b862      	st.w      	r3, (r14, 0x8)
 801294e:	3304      	movi      	r3, 4
 8012950:	b861      	st.w      	r3, (r14, 0x4)
 8012952:	1266      	lrw      	r3, 0x8013e2c	// 8012a68 <_ftoa+0x398>
 8012954:	b860      	st.w      	r3, (r14, 0x0)
 8012956:	06fc      	br      	0x801274e	// 801274e <_ftoa+0x7e>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8012958:	eb4d0020 	cmpnei      	r13, 32
 801295c:	0c27      	bf      	0x80129aa	// 80129aa <_ftoa+0x2da>
      buf[len++] = (char)(48U + (frac % 10U));
 801295e:	300a      	movi      	r0, 10
 8012960:	c4128023 	divu      	r3, r18, r0
 8012964:	c4038421 	mult      	r1, r3, r0
 8012968:	c4320092 	subu      	r18, r18, r1
 801296c:	e652002f 	addi      	r18, r18, 48
      --count;
 8012970:	e5881000 	subi      	r12, r8, 1
      buf[len++] = (char)(48U + (frac % 10U));
 8012974:	e44d0000 	addi      	r2, r13, 1
 8012978:	d5b40032 	str.b      	r18, (r20, r13 << 0)
      if (!(frac /= 10U)) {
 801297c:	e90300c3 	bez      	r3, 0x8012b02	// 8012b02 <_ftoa+0x432>
 8012980:	c454002d 	addu      	r13, r20, r2
 8012984:	0410      	br      	0x80129a4	// 80129a4 <_ftoa+0x2d4>
      buf[len++] = (char)(48U + (frac % 10U));
 8012986:	c4038021 	divu      	r1, r3, r0
 801298a:	c4018432 	mult      	r18, r1, r0
 801298e:	c6430083 	subu      	r3, r3, r18
 8012992:	232f      	addi      	r3, 48
 8012994:	d40d8003 	stbi.b      	r3, (r13)
      --count;
 8012998:	e58c1000 	subi      	r12, r12, 1
      buf[len++] = (char)(48U + (frac % 10U));
 801299c:	2200      	addi      	r2, 1
      if (!(frac /= 10U)) {
 801299e:	6cc7      	mov      	r3, r1
 80129a0:	e90100b1 	bez      	r1, 0x8012b02	// 8012b02 <_ftoa+0x432>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 80129a4:	eb420020 	cmpnei      	r2, 32
 80129a8:	0bef      	bt      	0x8012986	// 8012986 <_ftoa+0x2b6>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 80129aa:	9866      	ld.w      	r3, (r14, 0x18)
 80129ac:	e4632003 	andi      	r3, r3, 3
 80129b0:	3b41      	cmpnei      	r3, 1
 80129b2:	0c78      	bf      	0x8012aa2	// 8012aa2 <_ftoa+0x3d2>
 80129b4:	3320      	movi      	r3, 32
  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 80129b6:	9846      	ld.w      	r2, (r14, 0x18)
 80129b8:	b843      	st.w      	r2, (r14, 0xc)
 80129ba:	9845      	ld.w      	r2, (r14, 0x14)
 80129bc:	b842      	st.w      	r2, (r14, 0x8)
 80129be:	b861      	st.w      	r3, (r14, 0x4)
 80129c0:	de8e2000 	st.w      	r20, (r14, 0x0)
 80129c4:	06c5      	br      	0x801274e	// 801274e <_ftoa+0x7e>
  else if (diff < 0.5) {
 80129c6:	3200      	movi      	r2, 0
 80129c8:	ea233fe0 	movih      	r3, 16352
 80129cc:	c4104820 	lsli      	r0, r16, 0
 80129d0:	c4114821 	lsli      	r1, r17, 0
 80129d4:	de8e200a 	st.w      	r20, (r14, 0x28)
 80129d8:	de4e2009 	st.w      	r18, (r14, 0x24)
 80129dc:	ddae2007 	st.w      	r13, (r14, 0x1c)
 80129e0:	e3fff4c6 	bsr      	0x801136c	// 801136c <__ltdf2>
 80129e4:	d9ae2007 	ld.w      	r13, (r14, 0x1c)
 80129e8:	da4e2009 	ld.w      	r18, (r14, 0x24)
 80129ec:	da8e200a 	ld.w      	r20, (r14, 0x28)
 80129f0:	e980ff36 	blz      	r0, 0x801285c	// 801285c <_ftoa+0x18c>
  else if ((frac == 0U) || (frac & 1U)) {
 80129f4:	e9120006 	bez      	r18, 0x8012a00	// 8012a00 <_ftoa+0x330>
 80129f8:	e4722001 	andi      	r3, r18, 1
 80129fc:	e903ff30 	bez      	r3, 0x801285c	// 801285c <_ftoa+0x18c>
    ++frac;
 8012a00:	e6520000 	addi      	r18, r18, 1
 8012a04:	072c      	br      	0x801285c	// 801285c <_ftoa+0x18c>
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8012a06:	6ce7      	mov      	r3, r9
 8012a08:	3b09      	cmphsi      	r3, 10
 8012a0a:	0c9f      	bf      	0x8012b48	// 8012b48 <_ftoa+0x478>
    buf[len++] = '0';
 8012a0c:	e68e0033 	addi      	r20, r14, 52
 8012a10:	3030      	movi      	r0, 48
 8012a12:	dc140000 	st.b      	r0, (r20, 0x0)
    prec--;
 8012a16:	e5091000 	subi      	r8, r9, 1
 8012a1a:	e44e0034 	addi      	r2, r14, 53
 8012a1e:	e4291008 	subi      	r1, r9, 9
 8012a22:	ea0d0001 	movi      	r13, 1
    buf[len++] = '0';
 8012a26:	331f      	movi      	r3, 31
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8012a28:	6476      	cmpne      	r13, r1
 8012a2a:	0c09      	bf      	0x8012a3c	// 8012a3c <_ftoa+0x36c>
    buf[len++] = '0';
 8012a2c:	e5ad0000 	addi      	r13, r13, 1
 8012a30:	d4028000 	stbi.b      	r0, (r2)
    prec--;
 8012a34:	e5081000 	subi      	r8, r8, 1
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8012a38:	e823fff8 	bnezad      	r3, 0x8012a28	// 8012a28 <_ftoa+0x358>
 8012a3c:	104c      	lrw      	r2, 0x8013e34	// 8012a6c <_ftoa+0x39c>
 8012a3e:	c4684823 	lsli      	r3, r8, 3
 8012a42:	60c8      	addu      	r3, r2
 8012a44:	9340      	ld.w      	r2, (r3, 0x0)
 8012a46:	9361      	ld.w      	r3, (r3, 0x4)
 8012a48:	b847      	st.w      	r2, (r14, 0x1c)
 8012a4a:	b868      	st.w      	r3, (r14, 0x20)
 8012a4c:	06b1      	br      	0x80127ae	// 80127ae <_ftoa+0xde>
 8012a4e:	0000      	.short	0x0000
 8012a50:	08013e24 	.long	0x08013e24
 8012a54:	08013e1c 	.long	0x08013e1c
 8012a58:	41cdcd65 	.long	0x41cdcd65
 8012a5c:	c1cdcd65 	.long	0xc1cdcd65
 8012a60:	412e8480 	.long	0x412e8480
 8012a64:	08013e28 	.long	0x08013e28
 8012a68:	08013e2c 	.long	0x08013e2c
 8012a6c:	08013e34 	.long	0x08013e34
      buf[len++] = '-';
 8012a70:	312d      	movi      	r1, 45
 8012a72:	5a62      	addi      	r3, r2, 1
 8012a74:	d4540021 	str.b      	r1, (r20, r2 << 0)
 8012a78:	079f      	br      	0x80129b6	// 80129b6 <_ftoa+0x2e6>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 8012a7a:	6ca3      	mov      	r2, r8
 8012a7c:	ea233fe0 	movih      	r3, 16352
 8012a80:	6c13      	mov      	r0, r4
 8012a82:	6c57      	mov      	r1, r5
 8012a84:	e3fff434 	bsr      	0x80112ec	// 80112ec <__gtdf2>
 8012a88:	c410482d 	lsli      	r13, r16, 0
 8012a8c:	c4114834 	lsli      	r20, r17, 0
 8012a90:	e960ff0a 	blsz      	r0, 0x80128a4	// 80128a4 <_ftoa+0x1d4>
 8012a94:	0700      	br      	0x8012894	// 8012894 <_ftoa+0x1c4>
      ++whole;
 8012a96:	6ce7      	mov      	r3, r9
 8012a98:	2300      	addi      	r3, 1
 8012a9a:	6e4f      	mov      	r9, r3
      frac = 0;
 8012a9c:	ea120000 	movi      	r18, 0
 8012aa0:	06de      	br      	0x801285c	// 801285c <_ftoa+0x18c>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 8012aa2:	3220      	movi      	r2, 32
    if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8012aa4:	9865      	ld.w      	r3, (r14, 0x14)
 8012aa6:	e903ff26 	bez      	r3, 0x80128f2	// 80128f2 <_ftoa+0x222>
 8012aaa:	986c      	ld.w      	r3, (r14, 0x30)
 8012aac:	e9230007 	bnez      	r3, 0x8012aba	// 8012aba <_ftoa+0x3ea>
 8012ab0:	9866      	ld.w      	r3, (r14, 0x18)
 8012ab2:	e463200c 	andi      	r3, r3, 12
 8012ab6:	e9030005 	bez      	r3, 0x8012ac0	// 8012ac0 <_ftoa+0x3f0>
      width--;
 8012aba:	9865      	ld.w      	r3, (r14, 0x14)
 8012abc:	2b00      	subi      	r3, 1
 8012abe:	b865      	st.w      	r3, (r14, 0x14)
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 8012ac0:	9865      	ld.w      	r3, (r14, 0x14)
 8012ac2:	64c8      	cmphs      	r2, r3
 8012ac4:	0b17      	bt      	0x80128f2	// 80128f2 <_ftoa+0x222>
 8012ac6:	eb420020 	cmpnei      	r2, 32
 8012aca:	0c3d      	bf      	0x8012b44	// 8012b44 <_ftoa+0x474>
 8012acc:	c4540021 	addu      	r1, r20, r2
 8012ad0:	6ccb      	mov      	r3, r2
      buf[len++] = '0';
 8012ad2:	3230      	movi      	r2, 48
 8012ad4:	0405      	br      	0x8012ade	// 8012ade <_ftoa+0x40e>
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 8012ad6:	eb430020 	cmpnei      	r3, 32
 8012ada:	2100      	addi      	r1, 1
 8012adc:	0f6d      	bf      	0x80129b6	// 80129b6 <_ftoa+0x2e6>
      buf[len++] = '0';
 8012ade:	2300      	addi      	r3, 1
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 8012ae0:	9805      	ld.w      	r0, (r14, 0x14)
 8012ae2:	640e      	cmpne      	r3, r0
      buf[len++] = '0';
 8012ae4:	a140      	st.b      	r2, (r1, 0x0)
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 8012ae6:	0bf8      	bt      	0x8012ad6	// 8012ad6 <_ftoa+0x406>
      buf[len++] = '0';
 8012ae8:	9845      	ld.w      	r2, (r14, 0x14)
 8012aea:	0704      	br      	0x80128f2	// 80128f2 <_ftoa+0x222>
    value = 0 - value;
 8012aec:	6c93      	mov      	r2, r4
 8012aee:	9961      	ld.w      	r3, (r14, 0x84)
 8012af0:	3000      	movi      	r0, 0
 8012af2:	3100      	movi      	r1, 0
 8012af4:	e3fff236 	bsr      	0x8010f60	// 8010f60 <__subdf3>
    negative = true;
 8012af8:	3301      	movi      	r3, 1
    value = 0 - value;
 8012afa:	6d03      	mov      	r4, r0
 8012afc:	6d47      	mov      	r5, r1
    negative = true;
 8012afe:	b86c      	st.w      	r3, (r14, 0x30)
 8012b00:	064a      	br      	0x8012794	// 8012794 <_ftoa+0xc4>
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 8012b02:	eb420020 	cmpnei      	r2, 32
 8012b06:	0f52      	bf      	0x80129aa	// 80129aa <_ftoa+0x2da>
 8012b08:	e90c000e 	bez      	r12, 0x8012b24	// 8012b24 <_ftoa+0x454>
 8012b0c:	c4540023 	addu      	r3, r20, r2
 8012b10:	6308      	addu      	r12, r2
      buf[len++] = '0';
 8012b12:	3130      	movi      	r1, 48
 8012b14:	2200      	addi      	r2, 1
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 8012b16:	eb420020 	cmpnei      	r2, 32
      buf[len++] = '0';
 8012b1a:	a320      	st.b      	r1, (r3, 0x0)
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 8012b1c:	0f47      	bf      	0x80129aa	// 80129aa <_ftoa+0x2da>
 8012b1e:	670a      	cmpne      	r2, r12
 8012b20:	2300      	addi      	r3, 1
 8012b22:	0bf9      	bt      	0x8012b14	// 8012b14 <_ftoa+0x444>
      buf[len++] = '.';
 8012b24:	332e      	movi      	r3, 46
 8012b26:	e5a20000 	addi      	r13, r2, 1
 8012b2a:	d4540023 	str.b      	r3, (r20, r2 << 0)
 8012b2e:	06bb      	br      	0x80128a4	// 80128a4 <_ftoa+0x1d4>
    else if (flags & FLAGS_SPACE) {
 8012b30:	9866      	ld.w      	r3, (r14, 0x18)
 8012b32:	e4632008 	andi      	r3, r3, 8
 8012b36:	e9030007 	bez      	r3, 0x8012b44	// 8012b44 <_ftoa+0x474>
      buf[len++] = ' ';
 8012b3a:	3120      	movi      	r1, 32
 8012b3c:	5a62      	addi      	r3, r2, 1
 8012b3e:	d4540021 	str.b      	r1, (r20, r2 << 0)
 8012b42:	073a      	br      	0x80129b6	// 80129b6 <_ftoa+0x2e6>
    else if (flags & FLAGS_SPACE) {
 8012b44:	6ccb      	mov      	r3, r2
 8012b46:	0738      	br      	0x80129b6	// 80129b6 <_ftoa+0x2e6>
 8012b48:	1047      	lrw      	r2, 0x8013e34	// 8012b64 <_ftoa+0x494>
 8012b4a:	4363      	lsli      	r3, r3, 3
 8012b4c:	60c8      	addu      	r3, r2
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8012b4e:	6e27      	mov      	r8, r9
 8012b50:	9340      	ld.w      	r2, (r3, 0x0)
 8012b52:	9361      	ld.w      	r3, (r3, 0x4)
 8012b54:	b847      	st.w      	r2, (r14, 0x1c)
 8012b56:	b868      	st.w      	r3, (r14, 0x20)
 8012b58:	ea0d0000 	movi      	r13, 0
 8012b5c:	e68e0033 	addi      	r20, r14, 52
 8012b60:	0627      	br      	0x80127ae	// 80127ae <_ftoa+0xde>
 8012b62:	0000      	.short	0x0000
 8012b64:	08013e34 	.long	0x08013e34

08012b68 <_etoa>:


#if defined(PRINTF_SUPPORT_EXPONENTIAL)
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
 8012b68:	ebe00058 	push      	r4-r11, r15, r16-r17
 8012b6c:	1434      	subi      	r14, r14, 80
 8012b6e:	6e0f      	mov      	r8, r3
 8012b70:	9961      	ld.w      	r3, (r14, 0x84)
 8012b72:	b867      	st.w      	r3, (r14, 0x1c)
 8012b74:	9962      	ld.w      	r3, (r14, 0x88)
 8012b76:	98bf      	ld.w      	r5, (r14, 0x7c)
 8012b78:	9980      	ld.w      	r4, (r14, 0x80)
 8012b7a:	b868      	st.w      	r3, (r14, 0x20)
 8012b7c:	9963      	ld.w      	r3, (r14, 0x8c)
 8012b7e:	b866      	st.w      	r3, (r14, 0x18)
 8012b80:	6d83      	mov      	r6, r0
 8012b82:	6dc7      	mov      	r7, r1
 8012b84:	6ecb      	mov      	r11, r2
  // check for NaN and special values
  if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
 8012b86:	6cd3      	mov      	r3, r4
 8012b88:	6c97      	mov      	r2, r5
 8012b8a:	6c17      	mov      	r0, r5
 8012b8c:	6c53      	mov      	r1, r4
 8012b8e:	e3fff393 	bsr      	0x80112b4	// 80112b4 <__nedf2>
 8012b92:	6e43      	mov      	r9, r0
 8012b94:	e92001d7 	bnez      	r0, 0x8012f42	// 8012f42 <_etoa+0x3da>
 8012b98:	3200      	movi      	r2, 0
 8012b9a:	ea237ff0 	movih      	r3, 32752
 8012b9e:	2a00      	subi      	r2, 1
 8012ba0:	2b00      	subi      	r3, 1
 8012ba2:	6c17      	mov      	r0, r5
 8012ba4:	6c53      	mov      	r1, r4
 8012ba6:	e3fff3a3 	bsr      	0x80112ec	// 80112ec <__gtdf2>
 8012baa:	e94001cc 	bhz      	r0, 0x8012f42	// 8012f42 <_etoa+0x3da>
 8012bae:	3200      	movi      	r2, 0
 8012bb0:	ea23fff0 	movih      	r3, 65520
 8012bb4:	2a00      	subi      	r2, 1
 8012bb6:	2b00      	subi      	r3, 1
 8012bb8:	6c17      	mov      	r0, r5
 8012bba:	6c53      	mov      	r1, r4
 8012bbc:	e3fff3d8 	bsr      	0x801136c	// 801136c <__ltdf2>
 8012bc0:	e98001c1 	blz      	r0, 0x8012f42	// 8012f42 <_etoa+0x3da>
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
  }

  // determine the sign
  const bool negative = value < 0;
  if (negative) {
 8012bc4:	6ca7      	mov      	r2, r9
 8012bc6:	6ce7      	mov      	r3, r9
 8012bc8:	6c17      	mov      	r0, r5
 8012bca:	6c53      	mov      	r1, r4
 8012bcc:	e3fff3d0 	bsr      	0x801136c	// 801136c <__ltdf2>
    value = -value;
 8012bd0:	6e97      	mov      	r10, r5
  if (negative) {
 8012bd2:	e9800208 	blz      	r0, 0x8012fe2	// 8012fe2 <_etoa+0x47a>
 8012bd6:	6e53      	mov      	r9, r4
  }

  // default precision
  if (!(flags & FLAGS_PRECISION)) {
 8012bd8:	9866      	ld.w      	r3, (r14, 0x18)
 8012bda:	e4632400 	andi      	r3, r3, 1024
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8012bde:	3b40      	cmpnei      	r3, 0
 8012be0:	9847      	ld.w      	r2, (r14, 0x1c)
  if (!(flags & FLAGS_PRECISION)) {
 8012be2:	b873      	st.w      	r3, (r14, 0x4c)
    uint64_t U;
    double   F;
  } conv;

  conv.F = value;
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 8012be4:	c68957c0 	zext      	r0, r9, 30, 20
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8012be8:	3306      	movi      	r3, 6
 8012bea:	c4430c20 	incf      	r2, r3, 0
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
  // now approximate log10 from the log2 integer part and an expansion of ln around 1.5
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8012bee:	e40013fe 	subi      	r0, r0, 1023
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8012bf2:	b847      	st.w      	r2, (r14, 0x1c)
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 8012bf4:	dd4e200a 	st.w      	r10, (r14, 0x28)
 8012bf8:	dd2e2009 	st.w      	r9, (r14, 0x24)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8012bfc:	e3fff3d4 	bsr      	0x80113a4	// 80113a4 <__floatsidf>
 8012c00:	0145      	lrw      	r2, 0x509f79fb	// 8012f68 <_etoa+0x400>
 8012c02:	0164      	lrw      	r3, 0x3fd34413	// 8012f6c <_etoa+0x404>
 8012c04:	e3fff1cc 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
 8012c08:	0145      	lrw      	r2, 0x8b60c8b3	// 8012f70 <_etoa+0x408>
 8012c0a:	0164      	lrw      	r3, 0x3fc68a28	// 8012f74 <_etoa+0x40c>
 8012c0c:	e3fff192 	bsr      	0x8010f30	// 8010f30 <__adddf3>
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 8012c10:	d98e200a 	ld.w      	r12, (r14, 0x28)
 8012c14:	da6e2009 	ld.w      	r19, (r14, 0x24)
 8012c18:	c40c4836 	lsli      	r22, r12, 0
 8012c1c:	c4135677 	zext      	r23, r19, 19, 0
 8012c20:	ea140000 	movi      	r20, 0
 8012c24:	ea353ff0 	movih      	r21, 16368
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8012c28:	c4004831 	lsli      	r17, r0, 0
 8012c2c:	c4014830 	lsli      	r16, r1, 0
 8012c30:	3200      	movi      	r2, 0
 8012c32:	c6962420 	or      	r0, r22, r20
 8012c36:	c6b72421 	or      	r1, r23, r21
 8012c3a:	ea233ff8 	movih      	r3, 16376
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 8012c3e:	dd8e2012 	st.w      	r12, (r14, 0x48)
 8012c42:	de6e2011 	st.w      	r19, (r14, 0x44)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8012c46:	de8e200f 	st.w      	r20, (r14, 0x3c)
 8012c4a:	deae2010 	st.w      	r21, (r14, 0x40)
 8012c4e:	e3fff189 	bsr      	0x8010f60	// 8010f60 <__subdf3>
 8012c52:	0155      	lrw      	r2, 0x636f4361	// 8012f78 <_etoa+0x410>
 8012c54:	0175      	lrw      	r3, 0x3fd287a7	// 8012f7c <_etoa+0x414>
 8012c56:	e3fff1a3 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
 8012c5a:	6c83      	mov      	r2, r0
 8012c5c:	6cc7      	mov      	r3, r1
 8012c5e:	c4114820 	lsli      	r0, r17, 0
 8012c62:	c4104821 	lsli      	r1, r16, 0
 8012c66:	e3fff165 	bsr      	0x8010f30	// 8010f30 <__adddf3>
 8012c6a:	e3fff3d1 	bsr      	0x801140c	// 801140c <__fixdfsi>
 8012c6e:	b809      	st.w      	r0, (r14, 0x24)
  // now we want to compute 10^expval but we want to be sure it won't overflow
  exp2 = (int)(expval * 3.321928094887362 + 0.5);
 8012c70:	e3fff39a 	bsr      	0x80113a4	// 80113a4 <__floatsidf>
 8012c74:	015c      	lrw      	r2, 0x979a371	// 8012f80 <_etoa+0x418>
 8012c76:	017b      	lrw      	r3, 0x400a934f	// 8012f84 <_etoa+0x41c>
 8012c78:	c4004831 	lsli      	r17, r0, 0
 8012c7c:	c4014830 	lsli      	r16, r1, 0
 8012c80:	e3fff18e 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
 8012c84:	3200      	movi      	r2, 0
 8012c86:	ea233fe0 	movih      	r3, 16352
 8012c8a:	e3fff153 	bsr      	0x8010f30	// 8010f30 <__adddf3>
 8012c8e:	e3fff3bf 	bsr      	0x801140c	// 801140c <__fixdfsi>
 8012c92:	b80a      	st.w      	r0, (r14, 0x28)
  const double z  = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
 8012c94:	0242      	lrw      	r2, 0xbbb55516	// 8012f88 <_etoa+0x420>
 8012c96:	0261      	lrw      	r3, 0x40026bb1	// 8012f8c <_etoa+0x424>
 8012c98:	c4114820 	lsli      	r0, r17, 0
 8012c9c:	c4104821 	lsli      	r1, r16, 0
 8012ca0:	e3fff17e 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
 8012ca4:	c4004831 	lsli      	r17, r0, 0
 8012ca8:	980a      	ld.w      	r0, (r14, 0x28)
 8012caa:	c4014830 	lsli      	r16, r1, 0
 8012cae:	e3fff37b 	bsr      	0x80113a4	// 80113a4 <__floatsidf>
 8012cb2:	0247      	lrw      	r2, 0xfefa39ef	// 8012f90 <_etoa+0x428>
 8012cb4:	0267      	lrw      	r3, 0x3fe62e42	// 8012f94 <_etoa+0x42c>
 8012cb6:	e3fff173 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
 8012cba:	6c83      	mov      	r2, r0
 8012cbc:	6cc7      	mov      	r3, r1
 8012cbe:	c4114820 	lsli      	r0, r17, 0
 8012cc2:	c4104821 	lsli      	r1, r16, 0
 8012cc6:	e3fff14d 	bsr      	0x8010f60	// 8010f60 <__subdf3>
  const double z2 = z * z;
 8012cca:	6c83      	mov      	r2, r0
 8012ccc:	6cc7      	mov      	r3, r1
 8012cce:	b80c      	st.w      	r0, (r14, 0x30)
 8012cd0:	b82b      	st.w      	r1, (r14, 0x2c)
 8012cd2:	e3fff165 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
  // compute exp(z) using continued fractions, see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8012cd6:	da4e200c 	ld.w      	r18, (r14, 0x30)
 8012cda:	d9ae200b 	ld.w      	r13, (r14, 0x2c)
 8012cde:	c4124822 	lsli      	r2, r18, 0
 8012ce2:	6cf7      	mov      	r3, r13
  const double z2 = z * z;
 8012ce4:	c4004831 	lsli      	r17, r0, 0
 8012ce8:	c4014830 	lsli      	r16, r1, 0
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8012cec:	c4124820 	lsli      	r0, r18, 0
 8012cf0:	6c77      	mov      	r1, r13
 8012cf2:	de4e200e 	st.w      	r18, (r14, 0x38)
 8012cf6:	ddae200d 	st.w      	r13, (r14, 0x34)
 8012cfa:	e3fff11b 	bsr      	0x8010f30	// 8010f30 <__adddf3>
 8012cfe:	b80c      	st.w      	r0, (r14, 0x30)
 8012d00:	b82b      	st.w      	r1, (r14, 0x2c)
 8012d02:	3200      	movi      	r2, 0
 8012d04:	ea23402c 	movih      	r3, 16428
 8012d08:	c4114820 	lsli      	r0, r17, 0
 8012d0c:	c4104821 	lsli      	r1, r16, 0
 8012d10:	e3fff246 	bsr      	0x801119c	// 801119c <__divdf3>
 8012d14:	3200      	movi      	r2, 0
 8012d16:	ea234024 	movih      	r3, 16420
 8012d1a:	e3fff10b 	bsr      	0x8010f30	// 8010f30 <__adddf3>
 8012d1e:	6c83      	mov      	r2, r0
 8012d20:	6cc7      	mov      	r3, r1
 8012d22:	c4114820 	lsli      	r0, r17, 0
 8012d26:	c4104821 	lsli      	r1, r16, 0
 8012d2a:	e3fff239 	bsr      	0x801119c	// 801119c <__divdf3>
 8012d2e:	3200      	movi      	r2, 0
 8012d30:	ea234018 	movih      	r3, 16408
 8012d34:	e3fff0fe 	bsr      	0x8010f30	// 8010f30 <__adddf3>
 8012d38:	6c83      	mov      	r2, r0
 8012d3a:	6cc7      	mov      	r3, r1
 8012d3c:	c4114820 	lsli      	r0, r17, 0
 8012d40:	c4104821 	lsli      	r1, r16, 0
 8012d44:	e3fff22c 	bsr      	0x801119c	// 801119c <__divdf3>
 8012d48:	da4e200e 	ld.w      	r18, (r14, 0x38)
 8012d4c:	d9ae200d 	ld.w      	r13, (r14, 0x34)
 8012d50:	c4124822 	lsli      	r2, r18, 0
 8012d54:	6cf7      	mov      	r3, r13
 8012d56:	c4004831 	lsli      	r17, r0, 0
 8012d5a:	c4014830 	lsli      	r16, r1, 0
 8012d5e:	3000      	movi      	r0, 0
 8012d60:	ea214000 	movih      	r1, 16384
 8012d64:	e3fff0fe 	bsr      	0x8010f60	// 8010f60 <__subdf3>
 8012d68:	6c83      	mov      	r2, r0
 8012d6a:	6cc7      	mov      	r3, r1
 8012d6c:	c4114820 	lsli      	r0, r17, 0
 8012d70:	c4104821 	lsli      	r1, r16, 0
 8012d74:	e3fff0de 	bsr      	0x8010f30	// 8010f30 <__adddf3>
 8012d78:	daee200c 	ld.w      	r23, (r14, 0x30)
 8012d7c:	dace200b 	ld.w      	r22, (r14, 0x2c)
 8012d80:	6c83      	mov      	r2, r0
 8012d82:	6cc7      	mov      	r3, r1
 8012d84:	c4174820 	lsli      	r0, r23, 0
 8012d88:	c4164821 	lsli      	r1, r22, 0
 8012d8c:	e3fff208 	bsr      	0x801119c	// 801119c <__divdf3>
 8012d90:	da8e200f 	ld.w      	r20, (r14, 0x3c)
 8012d94:	daae2010 	ld.w      	r21, (r14, 0x40)
 8012d98:	c4144822 	lsli      	r2, r20, 0
 8012d9c:	c4154823 	lsli      	r3, r21, 0
 8012da0:	e3fff0c8 	bsr      	0x8010f30	// 8010f30 <__adddf3>
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
 8012da4:	984a      	ld.w      	r2, (r14, 0x28)
 8012da6:	e46203fe 	addi      	r3, r2, 1023
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8012daa:	4374      	lsli      	r3, r3, 20
 8012dac:	3200      	movi      	r2, 0
 8012dae:	e3fff0f7 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
  // correct for rounding errors
  if (value < conv.F) {
 8012db2:	d98e2012 	ld.w      	r12, (r14, 0x48)
 8012db6:	da6e2011 	ld.w      	r19, (r14, 0x44)
 8012dba:	6c83      	mov      	r2, r0
 8012dbc:	c4004830 	lsli      	r16, r0, 0
 8012dc0:	6cc7      	mov      	r3, r1
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8012dc2:	c4014831 	lsli      	r17, r1, 0
  if (value < conv.F) {
 8012dc6:	6c33      	mov      	r0, r12
 8012dc8:	c4134821 	lsli      	r1, r19, 0
 8012dcc:	e3fff2d0 	bsr      	0x801136c	// 801136c <__ltdf2>
 8012dd0:	c4104832 	lsli      	r18, r16, 0
 8012dd4:	e9a00012 	bhsz      	r0, 0x8012df8	// 8012df8 <_etoa+0x290>
    expval--;
 8012dd8:	9869      	ld.w      	r3, (r14, 0x24)
 8012dda:	2b00      	subi      	r3, 1
 8012ddc:	b869      	st.w      	r3, (r14, 0x24)
    conv.F /= 10;
 8012dde:	c4114821 	lsli      	r1, r17, 0
 8012de2:	3200      	movi      	r2, 0
 8012de4:	ea234024 	movih      	r3, 16420
 8012de8:	c4104820 	lsli      	r0, r16, 0
 8012dec:	e3fff1d8 	bsr      	0x801119c	// 801119c <__divdf3>
 8012df0:	c4004832 	lsli      	r18, r0, 0
 8012df4:	c4014831 	lsli      	r17, r1, 0
  }

  // the exponent format is "%+03d" and largest value is "307", so set aside 4-5 characters
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 8012df8:	9849      	ld.w      	r2, (r14, 0x24)
 8012dfa:	e4620062 	addi      	r3, r2, 99
 8012dfe:	eb0300c6 	cmphsi      	r3, 199

  // in "%g" mode, "prec" is the number of *significant figures* not decimals
  if (flags & FLAGS_ADAPT_EXP) {
 8012e02:	9866      	ld.w      	r3, (r14, 0x18)
 8012e04:	e4632800 	andi      	r3, r3, 2048
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 8012e08:	c4000510 	mvc      	r16
 8012e0c:	e6100003 	addi      	r16, r16, 4
  if (flags & FLAGS_ADAPT_EXP) {
 8012e10:	e9030027 	bez      	r3, 0x8012e5e	// 8012e5e <_etoa+0x2f6>
    // do we want to fall-back to "%f" mode?
    if ((value >= 1e-4) && (value < 1e6)) {
 8012e14:	1341      	lrw      	r2, 0xeb1c432d	// 8012f98 <_etoa+0x430>
 8012e16:	1362      	lrw      	r3, 0x3f1a36e2	// 8012f9c <_etoa+0x434>
 8012e18:	6c2b      	mov      	r0, r10
 8012e1a:	6c67      	mov      	r1, r9
 8012e1c:	de4e200a 	st.w      	r18, (r14, 0x28)
 8012e20:	e3fff286 	bsr      	0x801132c	// 801132c <__gedf2>
 8012e24:	da4e200a 	ld.w      	r18, (r14, 0x28)
 8012e28:	e98000cd 	blz      	r0, 0x8012fc2	// 8012fc2 <_etoa+0x45a>
 8012e2c:	3200      	movi      	r2, 0
 8012e2e:	127d      	lrw      	r3, 0x412e8480	// 8012fa0 <_etoa+0x438>
 8012e30:	6c2b      	mov      	r0, r10
 8012e32:	6c67      	mov      	r1, r9
 8012e34:	e3fff29c 	bsr      	0x801136c	// 801136c <__ltdf2>
 8012e38:	da4e200a 	ld.w      	r18, (r14, 0x28)
 8012e3c:	e9a000c3 	bhsz      	r0, 0x8012fc2	// 8012fc2 <_etoa+0x45a>
      if ((int)prec > expval) {
 8012e40:	9849      	ld.w      	r2, (r14, 0x24)
 8012e42:	9867      	ld.w      	r3, (r14, 0x1c)
 8012e44:	64c9      	cmplt      	r2, r3
 8012e46:	0cd4      	bf      	0x8012fee	// 8012fee <_etoa+0x486>
        prec = (unsigned)((int)prec - expval - 1);
 8012e48:	60ca      	subu      	r3, r2
 8012e4a:	2b00      	subi      	r3, 1
 8012e4c:	b867      	st.w      	r3, (r14, 0x1c)
      }
      else {
        prec = 0;
      }
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
 8012e4e:	9866      	ld.w      	r3, (r14, 0x18)
 8012e50:	ec630400 	ori      	r3, r3, 1024
      // no characters in exponent
      minwidth = 0U;
 8012e54:	ea100000 	movi      	r16, 0
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
 8012e58:	b866      	st.w      	r3, (r14, 0x18)
      expval   = 0;
 8012e5a:	de0e2009 	st.w      	r16, (r14, 0x24)

  // will everything fit?
  unsigned int fwidth = width;
  if (width > minwidth) {
    // we didn't fall-back so subtract the characters required for the exponent
    fwidth -= minwidth;
 8012e5e:	9848      	ld.w      	r2, (r14, 0x20)
 8012e60:	c602008c 	subu      	r12, r2, r16
 8012e64:	c4500420 	cmphs      	r16, r2
  } else {
    // not enough characters, so go back to default sizing
    fwidth = 0U;
  }
  if ((flags & FLAGS_LEFT) && minwidth) {
 8012e68:	9846      	ld.w      	r2, (r14, 0x18)
 8012e6a:	e4422002 	andi      	r2, r2, 2
    fwidth -= minwidth;
 8012e6e:	3300      	movi      	r3, 0
 8012e70:	c5830c40 	inct      	r12, r3, 0
  if ((flags & FLAGS_LEFT) && minwidth) {
 8012e74:	b84a      	st.w      	r2, (r14, 0x28)
 8012e76:	e9020006 	bez      	r2, 0x8012e82	// 8012e82 <_etoa+0x31a>
    // if we're padding on the right, DON'T pad the floating part
    fwidth = 0U;
 8012e7a:	eb500000 	cmpnei      	r16, 0
 8012e7e:	c5830c40 	inct      	r12, r3, 0
  }

  // rescale the float value
  if (expval) {
 8012e82:	9869      	ld.w      	r3, (r14, 0x24)
 8012e84:	e9230090 	bnez      	r3, 0x8012fa4	// 8012fa4 <_etoa+0x43c>
    value /= conv.F;
  }

  // output the floating part
  const size_t start_idx = idx;
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 8012e88:	3200      	movi      	r2, 0
 8012e8a:	6ccb      	mov      	r3, r2
 8012e8c:	6c17      	mov      	r0, r5
 8012e8e:	6c53      	mov      	r1, r4
 8012e90:	c40c4831 	lsli      	r17, r12, 0
 8012e94:	e3fff26c 	bsr      	0x801136c	// 801136c <__ltdf2>
 8012e98:	c411482c 	lsli      	r12, r17, 0
 8012e9c:	e980009e 	blz      	r0, 0x8012fd8	// 8012fd8 <_etoa+0x470>
 8012ea0:	da2e2006 	ld.w      	r17, (r14, 0x18)
 8012ea4:	98a7      	ld.w      	r5, (r14, 0x1c)
 8012ea6:	c5712823 	bclri      	r3, r17, 11
 8012eaa:	b864      	st.w      	r3, (r14, 0x10)
 8012eac:	dd2e2001 	st.w      	r9, (r14, 0x4)
 8012eb0:	dd8e2003 	st.w      	r12, (r14, 0xc)
 8012eb4:	b8a2      	st.w      	r5, (r14, 0x8)
 8012eb6:	dd4e2000 	st.w      	r10, (r14, 0x0)
 8012eba:	6ce3      	mov      	r3, r8
 8012ebc:	6caf      	mov      	r2, r11
 8012ebe:	6c5f      	mov      	r1, r7
 8012ec0:	6c1b      	mov      	r0, r6
 8012ec2:	e3fffc07 	bsr      	0x80126d0	// 80126d0 <_ftoa>
 8012ec6:	6d03      	mov      	r4, r0

  // output the exponent part
  if (!prec && minwidth) {
 8012ec8:	6e57      	mov      	r9, r5
 8012eca:	e925004b 	bnez      	r5, 0x8012f60	// 8012f60 <_etoa+0x3f8>
 8012ece:	e9100049 	bez      	r16, 0x8012f60	// 8012f60 <_etoa+0x3f8>
    // output the exponential symbol
    out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
 8012ed2:	e4712020 	andi      	r3, r17, 32
 8012ed6:	3b40      	cmpnei      	r3, 0
 8012ed8:	6c83      	mov      	r2, r0
 8012eda:	ea0c0065 	movi      	r12, 101
 8012ede:	58a2      	addi      	r5, r0, 1
 8012ee0:	3045      	movi      	r0, 69
 8012ee2:	c40c0c20 	incf      	r0, r12, 0
 8012ee6:	6ce3      	mov      	r3, r8
 8012ee8:	6c5f      	mov      	r1, r7
 8012eea:	7bd9      	jsr      	r6
    // output the exponent value
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
 8012eec:	3305      	movi      	r3, 5
 8012eee:	9849      	ld.w      	r2, (r14, 0x24)
 8012ef0:	b865      	st.w      	r3, (r14, 0x14)
 8012ef2:	330a      	movi      	r3, 10
 8012ef4:	b862      	st.w      	r3, (r14, 0x8)
 8012ef6:	4a7f      	lsri      	r3, r2, 31
 8012ef8:	b861      	st.w      	r3, (r14, 0x4)
 8012efa:	e6101000 	subi      	r16, r16, 1
 8012efe:	c4020203 	abs      	r3, r2
 8012f02:	b860      	st.w      	r3, (r14, 0x0)
 8012f04:	de0e2004 	st.w      	r16, (r14, 0x10)
 8012f08:	6ce3      	mov      	r3, r8
 8012f0a:	dd2e2003 	st.w      	r9, (r14, 0xc)
 8012f0e:	6c97      	mov      	r2, r5
 8012f10:	6c5f      	mov      	r1, r7
 8012f12:	6c1b      	mov      	r0, r6
 8012f14:	e3fffb12 	bsr      	0x8012538	// 8012538 <_ntoa_long>
    // might need to right-pad spaces
    if (flags & FLAGS_LEFT) {
 8012f18:	986a      	ld.w      	r3, (r14, 0x28)
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
 8012f1a:	6d03      	mov      	r4, r0
    if (flags & FLAGS_LEFT) {
 8012f1c:	e9030022 	bez      	r3, 0x8012f60	// 8012f60 <_etoa+0x3f8>
      while (idx - start_idx < width) out(' ', buffer, idx++, maxlen);
 8012f20:	c5600083 	subu      	r3, r0, r11
 8012f24:	98a8      	ld.w      	r5, (r14, 0x20)
 8012f26:	654c      	cmphs      	r3, r5
 8012f28:	081c      	bt      	0x8012f60	// 8012f60 <_etoa+0x3f8>
 8012f2a:	6c83      	mov      	r2, r0
 8012f2c:	2400      	addi      	r4, 1
 8012f2e:	6ce3      	mov      	r3, r8
 8012f30:	6c5f      	mov      	r1, r7
 8012f32:	3020      	movi      	r0, 32
 8012f34:	7bd9      	jsr      	r6
 8012f36:	c5640083 	subu      	r3, r4, r11
 8012f3a:	654c      	cmphs      	r3, r5
 8012f3c:	6c93      	mov      	r2, r4
 8012f3e:	0ff7      	bf      	0x8012f2c	// 8012f2c <_etoa+0x3c4>
 8012f40:	0410      	br      	0x8012f60	// 8012f60 <_etoa+0x3f8>
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
 8012f42:	9866      	ld.w      	r3, (r14, 0x18)
 8012f44:	b864      	st.w      	r3, (r14, 0x10)
 8012f46:	9868      	ld.w      	r3, (r14, 0x20)
 8012f48:	b863      	st.w      	r3, (r14, 0xc)
 8012f4a:	9867      	ld.w      	r3, (r14, 0x1c)
 8012f4c:	b862      	st.w      	r3, (r14, 0x8)
 8012f4e:	b881      	st.w      	r4, (r14, 0x4)
 8012f50:	b8a0      	st.w      	r5, (r14, 0x0)
 8012f52:	6ce3      	mov      	r3, r8
 8012f54:	6caf      	mov      	r2, r11
 8012f56:	6c5f      	mov      	r1, r7
 8012f58:	6c1b      	mov      	r0, r6
 8012f5a:	e3fffbbb 	bsr      	0x80126d0	// 80126d0 <_ftoa>
 8012f5e:	6d03      	mov      	r4, r0
    }
  }
  return idx;
}
 8012f60:	6c13      	mov      	r0, r4
 8012f62:	1414      	addi      	r14, r14, 80
 8012f64:	ebc00058 	pop      	r4-r11, r15, r16-r17
 8012f68:	509f79fb 	.long	0x509f79fb
 8012f6c:	3fd34413 	.long	0x3fd34413
 8012f70:	8b60c8b3 	.long	0x8b60c8b3
 8012f74:	3fc68a28 	.long	0x3fc68a28
 8012f78:	636f4361 	.long	0x636f4361
 8012f7c:	3fd287a7 	.long	0x3fd287a7
 8012f80:	0979a371 	.long	0x0979a371
 8012f84:	400a934f 	.long	0x400a934f
 8012f88:	bbb55516 	.long	0xbbb55516
 8012f8c:	40026bb1 	.long	0x40026bb1
 8012f90:	fefa39ef 	.long	0xfefa39ef
 8012f94:	3fe62e42 	.long	0x3fe62e42
 8012f98:	eb1c432d 	.long	0xeb1c432d
 8012f9c:	3f1a36e2 	.long	0x3f1a36e2
 8012fa0:	412e8480 	.long	0x412e8480
    value /= conv.F;
 8012fa4:	6c2b      	mov      	r0, r10
 8012fa6:	6c67      	mov      	r1, r9
 8012fa8:	c4124822 	lsli      	r2, r18, 0
 8012fac:	c4114823 	lsli      	r3, r17, 0
 8012fb0:	dd8e200b 	st.w      	r12, (r14, 0x2c)
 8012fb4:	e3fff0f4 	bsr      	0x801119c	// 801119c <__divdf3>
 8012fb8:	6e83      	mov      	r10, r0
 8012fba:	6e47      	mov      	r9, r1
 8012fbc:	d98e200b 	ld.w      	r12, (r14, 0x2c)
 8012fc0:	0764      	br      	0x8012e88	// 8012e88 <_etoa+0x320>
      if ((prec > 0) && (flags & FLAGS_PRECISION)) {
 8012fc2:	9847      	ld.w      	r2, (r14, 0x1c)
 8012fc4:	e902ff4d 	bez      	r2, 0x8012e5e	// 8012e5e <_etoa+0x2f6>
        --prec;
 8012fc8:	9873      	ld.w      	r3, (r14, 0x4c)
 8012fca:	3b40      	cmpnei      	r3, 0
 8012fcc:	c4620c20 	incf      	r3, r2, 0
 8012fd0:	c4620d01 	dect      	r3, r2, 1
 8012fd4:	b867      	st.w      	r3, (r14, 0x1c)
 8012fd6:	0744      	br      	0x8012e5e	// 8012e5e <_etoa+0x2f6>
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 8012fd8:	ea238000 	movih      	r3, 32768
 8012fdc:	60e4      	addu      	r3, r9
 8012fde:	6e4f      	mov      	r9, r3
 8012fe0:	0760      	br      	0x8012ea0	// 8012ea0 <_etoa+0x338>
    value = -value;
 8012fe2:	ea238000 	movih      	r3, 32768
 8012fe6:	c4640029 	addu      	r9, r4, r3
 8012fea:	e800fdf7 	br      	0x8012bd8	// 8012bd8 <_etoa+0x70>
      if ((int)prec > expval) {
 8012fee:	3300      	movi      	r3, 0
 8012ff0:	072e      	br      	0x8012e4c	// 8012e4c <_etoa+0x2e4>
	...

08012ff4 <_vsnprintf>:
#endif  // PRINTF_SUPPORT_FLOAT


// internal vsnprintf
static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
 8012ff4:	ebe00058 	push      	r4-r11, r15, r16-r17
 8012ff8:	1436      	subi      	r14, r14, 88
  unsigned int flags, width, precision, n;
  size_t idx = 0U;

  if (!buffer) {
    // use null output function
    out = _out_null;
 8012ffa:	3940      	cmpnei      	r1, 0
 8012ffc:	10cf      	lrw      	r6, 0x80122b0	// 8013038 <_vsnprintf+0x44>
{
 8012ffe:	6e07      	mov      	r8, r1
 8013000:	6dcb      	mov      	r7, r2
 8013002:	6d4f      	mov      	r5, r3
 8013004:	9981      	ld.w      	r4, (r14, 0x84)
    out = _out_null;
 8013006:	c4c00c40 	inct      	r6, r0, 0
        format++;
        break;
      }

      case '%' :
        out('%', buffer, idx++, maxlen);
 801300a:	ea0b0000 	movi      	r11, 0
      switch (*format) {
 801300e:	ea89000c 	lrw      	r9, 0x8013c3c	// 801303c <_vsnprintf+0x48>
  while (*format)
 8013012:	8500      	ld.b      	r0, (r5, 0x0)
 8013014:	e900006f 	bez      	r0, 0x80130f2	// 80130f2 <_vsnprintf+0xfe>
    if (*format != '%') {
 8013018:	eb400025 	cmpnei      	r0, 37
 801301c:	0860      	bt      	0x80130dc	// 80130dc <_vsnprintf+0xe8>
      format++;
 801301e:	5d42      	addi      	r2, r5, 1
    flags = 0U;
 8013020:	3100      	movi      	r1, 0
      switch (*format) {
 8013022:	8200      	ld.b      	r0, (r2, 0x0)
 8013024:	e460101f 	subi      	r3, r0, 32
 8013028:	74cc      	zextb      	r3, r3
 801302a:	3b10      	cmphsi      	r3, 17
 801302c:	6d4b      	mov      	r5, r2
 801302e:	081d      	bt      	0x8013068	// 8013068 <_vsnprintf+0x74>
 8013030:	d0690883 	ldr.w      	r3, (r9, r3 << 2)
 8013034:	780c      	jmp      	r3
 8013036:	0000      	.short	0x0000
 8013038:	080122b0 	.long	0x080122b0
 801303c:	08013c3c 	.long	0x08013c3c
        case '0': flags |= FLAGS_ZEROPAD; format++; n = 1U; break;
 8013040:	ec210001 	ori      	r1, r1, 1
 8013044:	2200      	addi      	r2, 1
 8013046:	07ee      	br      	0x8013022	// 8013022 <_vsnprintf+0x2e>
        case ' ': flags |= FLAGS_SPACE;   format++; n = 1U; break;
 8013048:	ec210008 	ori      	r1, r1, 8
 801304c:	2200      	addi      	r2, 1
 801304e:	07ea      	br      	0x8013022	// 8013022 <_vsnprintf+0x2e>
        case '#': flags |= FLAGS_HASH;    format++; n = 1U; break;
 8013050:	ec210010 	ori      	r1, r1, 16
 8013054:	2200      	addi      	r2, 1
 8013056:	07e6      	br      	0x8013022	// 8013022 <_vsnprintf+0x2e>
        case '+': flags |= FLAGS_PLUS;    format++; n = 1U; break;
 8013058:	ec210004 	ori      	r1, r1, 4
 801305c:	2200      	addi      	r2, 1
 801305e:	07e2      	br      	0x8013022	// 8013022 <_vsnprintf+0x2e>
        case '-': flags |= FLAGS_LEFT;    format++; n = 1U; break;
 8013060:	ec210002 	ori      	r1, r1, 2
 8013064:	2200      	addi      	r2, 1
 8013066:	07de      	br      	0x8013022	// 8013022 <_vsnprintf+0x2e>
  return (ch >= '0') && (ch <= '9');
 8013068:	e460102f 	subi      	r3, r0, 48
    if (_is_digit(*format)) {
 801306c:	74cc      	zextb      	r3, r3
 801306e:	3b09      	cmphsi      	r3, 10
 8013070:	0c5b      	bf      	0x8013126	// 8013126 <_vsnprintf+0x132>
    else if (*format == '*') {
 8013072:	eb40002a 	cmpnei      	r0, 42
 8013076:	e84003c3 	bf      	0x80137fc	// 80137fc <_vsnprintf+0x808>
    width = 0U;
 801307a:	ea110000 	movi      	r17, 0
    if (*format == '.') {
 801307e:	eb40002e 	cmpnei      	r0, 46
 8013082:	0c65      	bf      	0x801314c	// 801314c <_vsnprintf+0x158>
    precision = 0U;
 8013084:	ea0a0000 	movi      	r10, 0
    switch (*format) {
 8013088:	e4601067 	subi      	r3, r0, 104
 801308c:	74cc      	zextb      	r3, r3
 801308e:	3b12      	cmphsi      	r3, 19
 8013090:	080c      	bt      	0x80130a8	// 80130a8 <_vsnprintf+0xb4>
 8013092:	1043      	lrw      	r2, 0x8013c80	// 801309c <_vsnprintf+0xa8>
 8013094:	d0620883 	ldr.w      	r3, (r2, r3 << 2)
 8013098:	780c      	jmp      	r3
 801309a:	0000      	.short	0x0000
 801309c:	08013c80 	.long	0x08013c80
 80130a0:	8501      	ld.b      	r0, (r5, 0x1)
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 80130a2:	ec210100 	ori      	r1, r1, 256
        format++;
 80130a6:	2500      	addi      	r5, 1
    switch (*format) {
 80130a8:	e4601024 	subi      	r3, r0, 37
 80130ac:	74cc      	zextb      	r3, r3
 80130ae:	eb030053 	cmphsi      	r3, 84
 80130b2:	0815      	bt      	0x80130dc	// 80130dc <_vsnprintf+0xe8>
 80130b4:	1042      	lrw      	r2, 0x8013ccc	// 80130bc <_vsnprintf+0xc8>
 80130b6:	d0620883 	ldr.w      	r3, (r2, r3 << 2)
 80130ba:	780c      	jmp      	r3
 80130bc:	08013ccc 	.long	0x08013ccc
        if (*format == 'l') {
 80130c0:	8501      	ld.b      	r0, (r5, 0x1)
 80130c2:	eb40006c 	cmpnei      	r0, 108
 80130c6:	e84003ac 	bf      	0x801381e	// 801381e <_vsnprintf+0x82a>
    switch (*format) {
 80130ca:	e4601024 	subi      	r3, r0, 37
 80130ce:	74cc      	zextb      	r3, r3
 80130d0:	eb030053 	cmphsi      	r3, 84
        flags |= FLAGS_LONG;
 80130d4:	ec210100 	ori      	r1, r1, 256
        format++;
 80130d8:	2500      	addi      	r5, 1
    switch (*format) {
 80130da:	0fed      	bf      	0x80130b4	// 80130b4 <_vsnprintf+0xc0>
        format++;
        break;

      default :
        out(*format, buffer, idx++, maxlen);
        format++;
 80130dc:	2500      	addi      	r5, 1
        out(*format, buffer, idx++, maxlen);
 80130de:	6caf      	mov      	r2, r11
 80130e0:	6cdf      	mov      	r3, r7
 80130e2:	6c63      	mov      	r1, r8
 80130e4:	7bd9      	jsr      	r6
  while (*format)
 80130e6:	8500      	ld.b      	r0, (r5, 0x0)
        out(*format, buffer, idx++, maxlen);
 80130e8:	e54b0000 	addi      	r10, r11, 1
 80130ec:	6eeb      	mov      	r11, r10
  while (*format)
 80130ee:	e920ff95 	bnez      	r0, 0x8013018	// 8013018 <_vsnprintf+0x24>
        break;
    }
  }

  // termination
  out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
 80130f2:	65ec      	cmphs      	r11, r7
 80130f4:	e8400381 	bf      	0x80137f6	// 80137f6 <_vsnprintf+0x802>
 80130f8:	5f43      	subi      	r2, r7, 1
 80130fa:	6cdf      	mov      	r3, r7
 80130fc:	6c63      	mov      	r1, r8
 80130fe:	3000      	movi      	r0, 0
 8013100:	7bd9      	jsr      	r6

  // return written chars without terminating \0
  return (int)idx;
}
 8013102:	6c2f      	mov      	r0, r11
 8013104:	1416      	addi      	r14, r14, 88
 8013106:	ebc00058 	pop      	r4-r11, r15, r16-r17
        if (*format == 'h') {
 801310a:	8501      	ld.b      	r0, (r5, 0x1)
 801310c:	eb400068 	cmpnei      	r0, 104
 8013110:	e8400381 	bf      	0x8013812	// 8013812 <_vsnprintf+0x81e>
        flags |= FLAGS_SHORT;
 8013114:	ec210080 	ori      	r1, r1, 128
        format++;
 8013118:	2500      	addi      	r5, 1
 801311a:	07c7      	br      	0x80130a8	// 80130a8 <_vsnprintf+0xb4>
 801311c:	8501      	ld.b      	r0, (r5, 0x1)
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 801311e:	ec210200 	ori      	r1, r1, 512
        format++;
 8013122:	2500      	addi      	r5, 1
        break;
 8013124:	07c2      	br      	0x80130a8	// 80130a8 <_vsnprintf+0xb4>
 8013126:	ea110000 	movi      	r17, 0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 801312a:	ea0d000a 	movi      	r13, 10
  while (_is_digit(**str)) {
 801312e:	3209      	movi      	r2, 9
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8013130:	2500      	addi      	r5, 1
 8013132:	f9b18440 	mula.32.l      	r0, r17, r13
 8013136:	e620102f 	subi      	r17, r0, 48
  while (_is_digit(**str)) {
 801313a:	8500      	ld.b      	r0, (r5, 0x0)
  return (ch >= '0') && (ch <= '9');
 801313c:	e460102f 	subi      	r3, r0, 48
  while (_is_digit(**str)) {
 8013140:	74cc      	zextb      	r3, r3
 8013142:	64c8      	cmphs      	r2, r3
 8013144:	0bf6      	bt      	0x8013130	// 8013130 <_vsnprintf+0x13c>
    if (*format == '.') {
 8013146:	eb40002e 	cmpnei      	r0, 46
 801314a:	0b9d      	bt      	0x8013084	// 8013084 <_vsnprintf+0x90>
      if (_is_digit(*format)) {
 801314c:	8501      	ld.b      	r0, (r5, 0x1)
  return (ch >= '0') && (ch <= '9');
 801314e:	e460102f 	subi      	r3, r0, 48
      if (_is_digit(*format)) {
 8013152:	74cc      	zextb      	r3, r3
 8013154:	3b09      	cmphsi      	r3, 10
      flags |= FLAGS_PRECISION;
 8013156:	ec210400 	ori      	r1, r1, 1024
      format++;
 801315a:	5d42      	addi      	r2, r5, 1
      if (_is_digit(*format)) {
 801315c:	0813      	bt      	0x8013182	// 8013182 <_vsnprintf+0x18e>
 801315e:	6d4b      	mov      	r5, r2
 8013160:	ea0a0000 	movi      	r10, 0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8013164:	ea12000a 	movi      	r18, 10
  while (_is_digit(**str)) {
 8013168:	3209      	movi      	r2, 9
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 801316a:	2500      	addi      	r5, 1
 801316c:	fa4a8440 	mula.32.l      	r0, r10, r18
 8013170:	e540102f 	subi      	r10, r0, 48
  while (_is_digit(**str)) {
 8013174:	8500      	ld.b      	r0, (r5, 0x0)
  return (ch >= '0') && (ch <= '9');
 8013176:	e460102f 	subi      	r3, r0, 48
  while (_is_digit(**str)) {
 801317a:	74cc      	zextb      	r3, r3
 801317c:	64c8      	cmphs      	r2, r3
 801317e:	0bf6      	bt      	0x801316a	// 801316a <_vsnprintf+0x176>
 8013180:	0784      	br      	0x8013088	// 8013088 <_vsnprintf+0x94>
      else if (*format == '*') {
 8013182:	eb40002a 	cmpnei      	r0, 42
 8013186:	e84003e2 	bf      	0x801394a	// 801394a <_vsnprintf+0x956>
      format++;
 801318a:	6d4b      	mov      	r5, r2
 801318c:	077c      	br      	0x8013084	// 8013084 <_vsnprintf+0x90>
        uint32_t ipv4 = va_arg(va, uint32_t);
 801318e:	5c6e      	addi      	r3, r4, 4
 8013190:	3000      	movi      	r0, 0
 8013192:	dac42000 	ld.w      	r22, (r4, 0x0)
 8013196:	b869      	st.w      	r3, (r14, 0x24)
 8013198:	6d03      	mov      	r4, r0
            h = bit / 100;
 801319a:	ea140064 	movi      	r20, 100
            m = (bit % 100) / 10;
 801319e:	ea13000a 	movi      	r19, 10
                    outtxt[j++] = '0';
 80131a2:	ea170030 	movi      	r23, 48
            outtxt[j++] = '.';
 80131a6:	ea15002e 	movi      	r21, 46
 80131aa:	ea120004 	movi      	r18, 4
            bit = (*inuint >> (8 * i)) & 0xff;
 80131ae:	c4164043 	lsr      	r3, r22, r0
 80131b2:	74cc      	zextb      	r3, r3
            h = bit / 100;
 80131b4:	c6838022 	divu      	r2, r3, r20
 80131b8:	7748      	zextb      	r13, r2
            if (h)
 80131ba:	e90d0306 	bez      	r13, 0x80137c6	// 80137c6 <_vsnprintf+0x7d2>
            m = (bit % 100) / 10;
 80131be:	c6828422 	mult      	r2, r2, r20
 80131c2:	60ca      	subu      	r3, r2
 80131c4:	74cc      	zextb      	r3, r3
                outtxt[j++] = '0' + h;
 80131c6:	e70e002f 	addi      	r24, r14, 48
            m = (bit % 100) / 10;
 80131ca:	c6638022 	divu      	r2, r3, r19
                outtxt[j++] = '0' + h;
 80131ce:	e5840000 	addi      	r12, r4, 1
 80131d2:	e5ad002f 	addi      	r13, r13, 48
 80131d6:	7730      	zextb      	r12, r12
 80131d8:	d498002d 	str.b      	r13, (r24, r4 << 0)
            if (m)
 80131dc:	e92202fe 	bnez      	r2, 0x80137d8	// 80137d8 <_vsnprintf+0x7e4>
                    outtxt[j++] = '0';
 80131e0:	1a0c      	addi      	r2, r14, 48
 80131e2:	2401      	addi      	r4, 2
 80131e4:	7510      	zextb      	r4, r4
 80131e6:	d5820037 	str.b      	r23, (r2, r12 << 0)
            l = (bit % 100) % 10;
 80131ea:	c6638022 	divu      	r2, r3, r19
 80131ee:	c6628422 	mult      	r2, r2, r19
 80131f2:	60ca      	subu      	r3, r2
            outtxt[j++] = '0' + l;
 80131f4:	1a0c      	addi      	r2, r14, 48
 80131f6:	e5840000 	addi      	r12, r4, 1
 80131fa:	232f      	addi      	r3, 48
 80131fc:	d4820023 	str.b      	r3, (r2, r4 << 0)
 8013200:	7730      	zextb      	r12, r12
            outtxt[j++] = '.';
 8013202:	2401      	addi      	r4, 2
 8013204:	7510      	zextb      	r4, r4
 8013206:	d5820035 	str.b      	r21, (r2, r12 << 0)
 801320a:	2007      	addi      	r0, 8
        for(i = 0; i < 4; i++)
 801320c:	e832ffd1 	bnezad      	r18, 0x80131ae	// 80131ae <_vsnprintf+0x1ba>
    outtxt[j - 1] = 0;
 8013210:	e46e002e 	addi      	r3, r14, 47
 8013214:	3200      	movi      	r2, 0
 8013216:	d4830022 	str.b      	r2, (r3, r4 << 0)
    return j - 1;
 801321a:	5c63      	subi      	r3, r4, 1
        if (flags & FLAGS_PRECISION) {
 801321c:	e4412400 	andi      	r2, r1, 1024
    return j - 1;
 8013220:	6c0f      	mov      	r0, r3
          l = (l < precision ? l : precision);
 8013222:	3a40      	cmpnei      	r2, 0
 8013224:	f943cd23 	min.u32      	r3, r3, r10
        if (flags & FLAGS_PRECISION) {
 8013228:	b84a      	st.w      	r2, (r14, 0x28)
          l = (l < precision ? l : precision);
 801322a:	6c83      	mov      	r2, r0
 801322c:	c4430c40 	inct      	r2, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 8013230:	e4612002 	andi      	r3, r1, 2
          l = (l < precision ? l : precision);
 8013234:	b848      	st.w      	r2, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 8013236:	b86b      	st.w      	r3, (r14, 0x2c)
 8013238:	e9230333 	bnez      	r3, 0x801389e	// 801389e <_vsnprintf+0x8aa>
          while (l++ < width) {
 801323c:	c6220420 	cmphs      	r2, r17
 8013240:	6ccb      	mov      	r3, r2
 8013242:	2300      	addi      	r3, 1
 8013244:	e86003ff 	bt      	0x8013a42	// 8013a42 <_vsnprintf+0xa4e>
 8013248:	c5710023 	addu      	r3, r17, r11
 801324c:	5b89      	subu      	r4, r3, r2
 801324e:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8013250:	e56b0000 	addi      	r11, r11, 1
 8013254:	6cdf      	mov      	r3, r7
 8013256:	6c63      	mov      	r1, r8
 8013258:	3020      	movi      	r0, 32
 801325a:	7bd9      	jsr      	r6
          while (l++ < width) {
 801325c:	66d2      	cmpne      	r4, r11
 801325e:	6caf      	mov      	r2, r11
 8013260:	0bf8      	bt      	0x8013250	// 8013250 <_vsnprintf+0x25c>
 8013262:	e4710000 	addi      	r3, r17, 1
 8013266:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013268:	d80e0030 	ld.b      	r0, (r14, 0x30)
 801326c:	e9000030 	bez      	r0, 0x80132cc	// 80132cc <_vsnprintf+0x2d8>
 8013270:	6caf      	mov      	r2, r11
 8013272:	e60e002f 	addi      	r16, r14, 48
 8013276:	d96e200a 	ld.w      	r11, (r14, 0x28)
 801327a:	0402      	br      	0x801327e	// 801327e <_vsnprintf+0x28a>
          out(*(pstr++), buffer, idx++, maxlen);
 801327c:	6c93      	mov      	r2, r4
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801327e:	e90b0007 	bez      	r11, 0x801328c	// 801328c <_vsnprintf+0x298>
 8013282:	e46a1000 	subi      	r3, r10, 1
 8013286:	e90a034a 	bez      	r10, 0x801391a	// 801391a <_vsnprintf+0x926>
 801328a:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 801328c:	e6100000 	addi      	r16, r16, 1
 8013290:	6cdf      	mov      	r3, r7
 8013292:	6c63      	mov      	r1, r8
 8013294:	5a82      	addi      	r4, r2, 1
 8013296:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013298:	d8100000 	ld.b      	r0, (r16, 0x0)
 801329c:	e920fff0 	bnez      	r0, 0x801327c	// 801327c <_vsnprintf+0x288>
        if (flags & FLAGS_LEFT) {
 80132a0:	986b      	ld.w      	r3, (r14, 0x2c)
 80132a2:	e90302a5 	bez      	r3, 0x80137ec	// 80137ec <_vsnprintf+0x7f8>
          while (l++ < width) {
 80132a6:	9868      	ld.w      	r3, (r14, 0x20)
 80132a8:	c6230420 	cmphs      	r3, r17
 80132ac:	e86002a0 	bt      	0x80137ec	// 80137ec <_vsnprintf+0x7f8>
 80132b0:	c4910020 	addu      	r0, r17, r4
 80132b4:	c460008a 	subu      	r10, r0, r3
 80132b8:	6c93      	mov      	r2, r4
            out(' ', buffer, idx++, maxlen);
 80132ba:	e5620000 	addi      	r11, r2, 1
 80132be:	6cdf      	mov      	r3, r7
 80132c0:	6c63      	mov      	r1, r8
 80132c2:	3020      	movi      	r0, 32
 80132c4:	7bd9      	jsr      	r6
          while (l++ < width) {
 80132c6:	66ea      	cmpne      	r10, r11
 80132c8:	6caf      	mov      	r2, r11
 80132ca:	0bf8      	bt      	0x80132ba	// 80132ba <_vsnprintf+0x2c6>
        format++;
 80132cc:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 80132ce:	9889      	ld.w      	r4, (r14, 0x24)
 80132d0:	06a1      	br      	0x8013012	// 8013012 <_vsnprintf+0x1e>
        const char* p = va_arg(va, char*);
 80132d2:	da042000 	ld.w      	r16, (r4, 0x0)
 80132d6:	5c6e      	addi      	r3, r4, 4
 80132d8:	b868      	st.w      	r3, (r14, 0x20)
  for (s = str; *s && maxsize--; ++s);
 80132da:	d8100000 	ld.b      	r0, (r16, 0x0)
        unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
 80132de:	3300      	movi      	r3, 0
 80132e0:	2b00      	subi      	r3, 1
 80132e2:	eb4a0000 	cmpnei      	r10, 0
 80132e6:	c46a0c40 	inct      	r3, r10, 0
  for (s = str; *s && maxsize--; ++s);
 80132ea:	c4104824 	lsli      	r4, r16, 0
 80132ee:	e9200006 	bnez      	r0, 0x80132fa	// 80132fa <_vsnprintf+0x306>
 80132f2:	0408      	br      	0x8013302	// 8013302 <_vsnprintf+0x30e>
 80132f4:	2b00      	subi      	r3, 1
 80132f6:	e9030006 	bez      	r3, 0x8013302	// 8013302 <_vsnprintf+0x30e>
 80132fa:	2400      	addi      	r4, 1
 80132fc:	8440      	ld.b      	r2, (r4, 0x0)
 80132fe:	e922fffb 	bnez      	r2, 0x80132f4	// 80132f4 <_vsnprintf+0x300>
  return (unsigned int)(s - str);
 8013302:	c6040084 	subu      	r4, r4, r16
        if (flags & FLAGS_PRECISION) {
 8013306:	e4412400 	andi      	r2, r1, 1024
          l = (l < precision ? l : precision);
 801330a:	f944cd23 	min.u32      	r3, r4, r10
 801330e:	3a40      	cmpnei      	r2, 0
 8013310:	c4830c40 	inct      	r4, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 8013314:	e4612002 	andi      	r3, r1, 2
        if (flags & FLAGS_PRECISION) {
 8013318:	b849      	st.w      	r2, (r14, 0x24)
        if (!(flags & FLAGS_LEFT)) {
 801331a:	b86a      	st.w      	r3, (r14, 0x28)
 801331c:	e9230287 	bnez      	r3, 0x801382a	// 801382a <_vsnprintf+0x836>
          while (l++ < width) {
 8013320:	c6240420 	cmphs      	r4, r17
 8013324:	5c62      	addi      	r3, r4, 1
 8013326:	e860039c 	bt      	0x8013a5e	// 8013a5e <_vsnprintf+0xa6a>
 801332a:	c5710023 	addu      	r3, r17, r11
 801332e:	5b91      	subu      	r4, r3, r4
 8013330:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8013332:	e5620000 	addi      	r11, r2, 1
 8013336:	6cdf      	mov      	r3, r7
 8013338:	6c63      	mov      	r1, r8
 801333a:	3020      	movi      	r0, 32
 801333c:	7bd9      	jsr      	r6
          while (l++ < width) {
 801333e:	66d2      	cmpne      	r4, r11
 8013340:	6caf      	mov      	r2, r11
 8013342:	0bf8      	bt      	0x8013332	// 8013332 <_vsnprintf+0x33e>
 8013344:	c40b4832 	lsli      	r18, r11, 0
 8013348:	e4910000 	addi      	r4, r17, 1
 801334c:	d8100000 	ld.b      	r0, (r16, 0x0)
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013350:	e9000391 	bez      	r0, 0x8013a72	// 8013a72 <_vsnprintf+0xa7e>
 8013354:	b88b      	st.w      	r4, (r14, 0x2c)
 8013356:	c4124822 	lsli      	r2, r18, 0
 801335a:	d96e2009 	ld.w      	r11, (r14, 0x24)
 801335e:	0402      	br      	0x8013362	// 8013362 <_vsnprintf+0x36e>
          out(*(p++), buffer, idx++, maxlen);
 8013360:	6c93      	mov      	r2, r4
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013362:	e90b0007 	bez      	r11, 0x8013370	// 8013370 <_vsnprintf+0x37c>
 8013366:	e46a1000 	subi      	r3, r10, 1
 801336a:	e90a02d2 	bez      	r10, 0x801390e	// 801390e <_vsnprintf+0x91a>
 801336e:	6e8f      	mov      	r10, r3
          out(*(p++), buffer, idx++, maxlen);
 8013370:	e6100000 	addi      	r16, r16, 1
 8013374:	6cdf      	mov      	r3, r7
 8013376:	6c63      	mov      	r1, r8
 8013378:	5a82      	addi      	r4, r2, 1
 801337a:	7bd9      	jsr      	r6
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801337c:	d8100000 	ld.b      	r0, (r16, 0x0)
 8013380:	e920fff0 	bnez      	r0, 0x8013360	// 8013360 <_vsnprintf+0x36c>
 8013384:	6ed3      	mov      	r11, r4
 8013386:	988b      	ld.w      	r4, (r14, 0x2c)
        if (flags & FLAGS_LEFT) {
 8013388:	986a      	ld.w      	r3, (r14, 0x28)
 801338a:	e9030012 	bez      	r3, 0x80133ae	// 80133ae <_vsnprintf+0x3ba>
          while (l++ < width) {
 801338e:	c6240420 	cmphs      	r4, r17
 8013392:	080e      	bt      	0x80133ae	// 80133ae <_vsnprintf+0x3ba>
 8013394:	c5710020 	addu      	r0, r17, r11
 8013398:	5891      	subu      	r4, r0, r4
 801339a:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 801339c:	e56b0000 	addi      	r11, r11, 1
 80133a0:	6cdf      	mov      	r3, r7
 80133a2:	6c63      	mov      	r1, r8
 80133a4:	3020      	movi      	r0, 32
 80133a6:	7bd9      	jsr      	r6
          while (l++ < width) {
 80133a8:	66d2      	cmpne      	r4, r11
 80133aa:	6caf      	mov      	r2, r11
 80133ac:	0bf8      	bt      	0x801339c	// 801339c <_vsnprintf+0x3a8>
        format++;
 80133ae:	2500      	addi      	r5, 1
        const char* p = va_arg(va, char*);
 80133b0:	9888      	ld.w      	r4, (r14, 0x20)
        break;
 80133b2:	0630      	br      	0x8013012	// 8013012 <_vsnprintf+0x1e>
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 80133b4:	3308      	movi      	r3, 8
 80133b6:	b864      	st.w      	r3, (r14, 0x10)
 80133b8:	3310      	movi      	r3, 16
 80133ba:	b862      	st.w      	r3, (r14, 0x8)
        flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
 80133bc:	ec210021 	ori      	r1, r1, 33
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 80133c0:	3300      	movi      	r3, 0
 80133c2:	b825      	st.w      	r1, (r14, 0x14)
 80133c4:	dd4e2003 	st.w      	r10, (r14, 0xc)
 80133c8:	b861      	st.w      	r3, (r14, 0x4)
 80133ca:	9460      	ld.w      	r3, (r4, 0x0)
 80133cc:	b860      	st.w      	r3, (r14, 0x0)
 80133ce:	6caf      	mov      	r2, r11
 80133d0:	6cdf      	mov      	r3, r7
 80133d2:	6c63      	mov      	r1, r8
 80133d4:	6c1b      	mov      	r0, r6
 80133d6:	e6040003 	addi      	r16, r4, 4
 80133da:	e3fff8af 	bsr      	0x8012538	// 8012538 <_ntoa_long>
 80133de:	6ec3      	mov      	r11, r0
        format++;
 80133e0:	2500      	addi      	r5, 1
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 80133e2:	c4104824 	lsli      	r4, r16, 0
        break;
 80133e6:	0616      	br      	0x8013012	// 8013012 <_vsnprintf+0x1e>
        if (!(flags & FLAGS_LEFT)) {
 80133e8:	e4212002 	andi      	r1, r1, 2
 80133ec:	e9210227 	bnez      	r1, 0x801383a	// 801383a <_vsnprintf+0x846>
          while (l++ < width) {
 80133f0:	3301      	movi      	r3, 1
 80133f2:	c6230420 	cmphs      	r3, r17
 80133f6:	e860032f 	bt      	0x8013a54	// 8013a54 <_vsnprintf+0xa60>
 80133fa:	e60b1000 	subi      	r16, r11, 1
 80133fe:	c6300030 	addu      	r16, r16, r17
 8013402:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8013404:	e5420000 	addi      	r10, r2, 1
 8013408:	6cdf      	mov      	r3, r7
 801340a:	6c63      	mov      	r1, r8
 801340c:	3020      	movi      	r0, 32
 801340e:	7bd9      	jsr      	r6
          while (l++ < width) {
 8013410:	c5500480 	cmpne      	r16, r10
 8013414:	6cab      	mov      	r2, r10
 8013416:	0bf7      	bt      	0x8013404	// 8013404 <_vsnprintf+0x410>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8013418:	8400      	ld.b      	r0, (r4, 0x0)
 801341a:	e6040003 	addi      	r16, r4, 4
 801341e:	6cdf      	mov      	r3, r7
 8013420:	6cab      	mov      	r2, r10
 8013422:	6c63      	mov      	r1, r8
 8013424:	e56a0000 	addi      	r11, r10, 1
 8013428:	7bd9      	jsr      	r6
 801342a:	c4104824 	lsli      	r4, r16, 0
        format++;
 801342e:	2500      	addi      	r5, 1
        break;
 8013430:	e800fdf1 	br      	0x8013012	// 8013012 <_vsnprintf+0x1e>
        if (*format == 'x' || *format == 'X') {
 8013434:	eb400078 	cmpnei      	r0, 120
 8013438:	e8400277 	bf      	0x8013926	// 8013926 <_vsnprintf+0x932>
 801343c:	eb400058 	cmpnei      	r0, 88
 8013440:	e8400275 	bf      	0x801392a	// 801392a <_vsnprintf+0x936>
        else if (*format == 'o') {
 8013444:	eb40006f 	cmpnei      	r0, 111
 8013448:	e8400232 	bf      	0x80138ac	// 80138ac <_vsnprintf+0x8b8>
        else if (*format == 'b') {
 801344c:	eb400062 	cmpnei      	r0, 98
 8013450:	e84002d5 	bf      	0x80139fa	// 80139fa <_vsnprintf+0xa06>
        if ((*format != 'i') && (*format != 'd')) {
 8013454:	eb400069 	cmpnei      	r0, 105
          flags &= ~FLAGS_HASH;   // no hash for dec format
 8013458:	c4812823 	bclri      	r3, r1, 4
        if ((*format != 'i') && (*format != 'd')) {
 801345c:	e8600232 	bt      	0x80138c0	// 80138c0 <_vsnprintf+0x8cc>
        if (flags & FLAGS_PRECISION) {
 8013460:	e4212400 	andi      	r1, r1, 1024
          base = 10U;
 8013464:	320a      	movi      	r2, 10
        if (flags & FLAGS_PRECISION) {
 8013466:	e9010236 	bez      	r1, 0x80138d2	// 80138d2 <_vsnprintf+0x8de>
          flags &= ~FLAGS_ZEROPAD;
 801346a:	3b80      	bclri      	r3, 0
        if ((*format == 'i') || (*format == 'd')) {
 801346c:	eb400069 	cmpnei      	r0, 105
 8013470:	e8400231 	bf      	0x80138d2	// 80138d2 <_vsnprintf+0x8de>
 8013474:	eb400064 	cmpnei      	r0, 100
 8013478:	e840022d 	bf      	0x80138d2	// 80138d2 <_vsnprintf+0x8de>
          if (flags & FLAGS_LONG_LONG) {
 801347c:	e4232200 	andi      	r1, r3, 512
 8013480:	e9210276 	bnez      	r1, 0x801396c	// 801396c <_vsnprintf+0x978>
          else if (flags & FLAGS_LONG) {
 8013484:	e4032100 	andi      	r0, r3, 256
 8013488:	e92002a2 	bnez      	r0, 0x80139cc	// 80139cc <_vsnprintf+0x9d8>
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 801348c:	e4232040 	andi      	r1, r3, 64
 8013490:	e92102cf 	bnez      	r1, 0x8013a2e	// 8013a2e <_vsnprintf+0xa3a>
 8013494:	e4232080 	andi      	r1, r3, 128
 8013498:	e92102b3 	bnez      	r1, 0x80139fe	// 80139fe <_vsnprintf+0xa0a>
 801349c:	9420      	ld.w      	r1, (r4, 0x0)
 801349e:	2403      	addi      	r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
 80134a0:	b865      	st.w      	r3, (r14, 0x14)
 80134a2:	3300      	movi      	r3, 0
 80134a4:	de2e2004 	st.w      	r17, (r14, 0x10)
 80134a8:	dd4e2003 	st.w      	r10, (r14, 0xc)
 80134ac:	b842      	st.w      	r2, (r14, 0x8)
 80134ae:	b861      	st.w      	r3, (r14, 0x4)
 80134b0:	b820      	st.w      	r1, (r14, 0x0)
 80134b2:	6caf      	mov      	r2, r11
 80134b4:	6cdf      	mov      	r3, r7
 80134b6:	6c63      	mov      	r1, r8
 80134b8:	6c1b      	mov      	r0, r6
 80134ba:	e3fff83f 	bsr      	0x8012538	// 8012538 <_ntoa_long>
 80134be:	6ec3      	mov      	r11, r0
        format++;
 80134c0:	2500      	addi      	r5, 1
 80134c2:	e800fda8 	br      	0x8013012	// 8013012 <_vsnprintf+0x1e>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
 80134c6:	eb400046 	cmpnei      	r0, 70
 80134ca:	e840023c 	bf      	0x8013942	// 8013942 <_vsnprintf+0x94e>
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 80134ce:	b824      	st.w      	r1, (r14, 0x10)
 80134d0:	de2e2003 	st.w      	r17, (r14, 0xc)
 80134d4:	dd4e2002 	st.w      	r10, (r14, 0x8)
 80134d8:	e6040007 	addi      	r16, r4, 8
 80134dc:	9460      	ld.w      	r3, (r4, 0x0)
 80134de:	9481      	ld.w      	r4, (r4, 0x4)
 80134e0:	b860      	st.w      	r3, (r14, 0x0)
 80134e2:	b881      	st.w      	r4, (r14, 0x4)
 80134e4:	6caf      	mov      	r2, r11
 80134e6:	6cdf      	mov      	r3, r7
 80134e8:	6c63      	mov      	r1, r8
 80134ea:	6c1b      	mov      	r0, r6
 80134ec:	e3fff8f2 	bsr      	0x80126d0	// 80126d0 <_ftoa>
 80134f0:	6ec3      	mov      	r11, r0
        format++;
 80134f2:	2500      	addi      	r5, 1
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 80134f4:	c4104824 	lsli      	r4, r16, 0
        break;
 80134f8:	e800fd8d 	br      	0x8013012	// 8013012 <_vsnprintf+0x1e>
        out('%', buffer, idx++, maxlen);
 80134fc:	6caf      	mov      	r2, r11
 80134fe:	e54b0000 	addi      	r10, r11, 1
 8013502:	6cdf      	mov      	r3, r7
 8013504:	6c63      	mov      	r1, r8
 8013506:	3025      	movi      	r0, 37
 8013508:	7bd9      	jsr      	r6
        format++;
 801350a:	2500      	addi      	r5, 1
        out('%', buffer, idx++, maxlen);
 801350c:	6eeb      	mov      	r11, r10
        break;
 801350e:	e800fd82 	br      	0x8013012	// 8013012 <_vsnprintf+0x1e>
        char *ipv6 = va_arg(va, char*);
 8013512:	5c6e      	addi      	r3, r4, 4
 8013514:	dac42000 	ld.w      	r22, (r4, 0x0)
 8013518:	b869      	st.w      	r3, (r14, 0x24)
 801351a:	e716000f 	addi      	r24, r22, 16
 801351e:	3400      	movi      	r4, 0
                if (h > 9)
 8013520:	ea140009 	movi      	r20, 9
                    outtxt[j++] = ':';
 8013524:	ea17003a 	movi      	r23, 58
          while (l++ < width) {
 8013528:	ea0c0000 	movi      	r12, 0
 801352c:	da562000 	ld.w      	r18, (r22, 0x0)
 8013530:	6c33      	mov      	r0, r12
 8013532:	ea0d0004 	movi      	r13, 4
                m = (*inuint >> (8 * i)) & 0xff;
 8013536:	c5924043 	lsr      	r3, r18, r12
 801353a:	74cc      	zextb      	r3, r3
                h = m >> 4;
 801353c:	4b44      	lsri      	r2, r3, 4
                if (h > 9)
 801353e:	c4540420 	cmphs      	r20, r2
                    outtxt[j++] = 'A' + h - 10;
 8013542:	e6640000 	addi      	r19, r4, 1
                l = m & 0xf;
 8013546:	e463200f 	andi      	r3, r3, 15
                    outtxt[j++] = 'A' + h - 10;
 801354a:	c41354f3 	zext      	r19, r19, 7, 0
                if (h > 9)
 801354e:	092e      	bt      	0x80137aa	// 80137aa <_vsnprintf+0x7b6>
                    outtxt[j++] = 'A' + h - 10;
 8013550:	e6ae002f 	addi      	r21, r14, 48
 8013554:	2236      	addi      	r2, 55
 8013556:	d4950022 	str.b      	r2, (r21, r4 << 0)
                if (l > 9)
 801355a:	c4740420 	cmphs      	r20, r3
                    outtxt[j++] = 'A' + l - 10;
 801355e:	e4930000 	addi      	r4, r19, 1
 8013562:	7510      	zextb      	r4, r4
                if (l > 9)
 8013564:	091e      	bt      	0x80137a0	// 80137a0 <_vsnprintf+0x7ac>
                    outtxt[j++] = 'A' + l - 10;
 8013566:	1a0c      	addi      	r2, r14, 48
 8013568:	2336      	addi      	r3, 55
 801356a:	d6620023 	str.b      	r3, (r2, r19 << 0)
                if (0 != (i % 2))
 801356e:	e4602001 	andi      	r3, r0, 1
 8013572:	e9030007 	bez      	r3, 0x8013580	// 8013580 <_vsnprintf+0x58c>
                    outtxt[j++] = ':';
 8013576:	1a0c      	addi      	r2, r14, 48
 8013578:	5c62      	addi      	r3, r4, 1
 801357a:	d4820037 	str.b      	r23, (r2, r4 << 0)
 801357e:	750c      	zextb      	r4, r3
            for(i = 0; i < 4; i++)
 8013580:	2000      	addi      	r0, 1
 8013582:	7400      	zextb      	r0, r0
 8013584:	e58c0007 	addi      	r12, r12, 8
 8013588:	e82dffd7 	bnezad      	r13, 0x8013536	// 8013536 <_vsnprintf+0x542>
            inuint++;
 801358c:	e6d60003 	addi      	r22, r22, 4
        for (k = 0; k < 4; k++)
 8013590:	c6d80480 	cmpne      	r24, r22
 8013594:	0bca      	bt      	0x8013528	// 8013528 <_vsnprintf+0x534>
    outtxt[j - 1] = 0;
 8013596:	e46e002e 	addi      	r3, r14, 47
 801359a:	3200      	movi      	r2, 0
 801359c:	d4830022 	str.b      	r2, (r3, r4 << 0)
    return j - 1;
 80135a0:	5c63      	subi      	r3, r4, 1
        if (flags & FLAGS_PRECISION) {
 80135a2:	e4412400 	andi      	r2, r1, 1024
    return j - 1;
 80135a6:	6c0f      	mov      	r0, r3
          l = (l < precision ? l : precision);
 80135a8:	3a40      	cmpnei      	r2, 0
 80135aa:	f943cd23 	min.u32      	r3, r3, r10
        if (flags & FLAGS_PRECISION) {
 80135ae:	b84a      	st.w      	r2, (r14, 0x28)
          l = (l < precision ? l : precision);
 80135b0:	6c83      	mov      	r2, r0
 80135b2:	c4430c40 	inct      	r2, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 80135b6:	e4612002 	andi      	r3, r1, 2
          l = (l < precision ? l : precision);
 80135ba:	b848      	st.w      	r2, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 80135bc:	b86b      	st.w      	r3, (r14, 0x2c)
 80135be:	e923015a 	bnez      	r3, 0x8013872	// 8013872 <_vsnprintf+0x87e>
          while (l++ < width) {
 80135c2:	c6220420 	cmphs      	r2, r17
 80135c6:	6ccb      	mov      	r3, r2
 80135c8:	2300      	addi      	r3, 1
 80135ca:	e8600239 	bt      	0x8013a3c	// 8013a3c <_vsnprintf+0xa48>
 80135ce:	c5710023 	addu      	r3, r17, r11
 80135d2:	5b89      	subu      	r4, r3, r2
 80135d4:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 80135d6:	e56b0000 	addi      	r11, r11, 1
 80135da:	6cdf      	mov      	r3, r7
 80135dc:	6c63      	mov      	r1, r8
 80135de:	3020      	movi      	r0, 32
 80135e0:	7bd9      	jsr      	r6
          while (l++ < width) {
 80135e2:	66d2      	cmpne      	r4, r11
 80135e4:	6caf      	mov      	r2, r11
 80135e6:	0bf8      	bt      	0x80135d6	// 80135d6 <_vsnprintf+0x5e2>
 80135e8:	e4710000 	addi      	r3, r17, 1
 80135ec:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80135ee:	d80e0030 	ld.b      	r0, (r14, 0x30)
 80135f2:	e900fe6d 	bez      	r0, 0x80132cc	// 80132cc <_vsnprintf+0x2d8>
 80135f6:	6caf      	mov      	r2, r11
 80135f8:	e60e002f 	addi      	r16, r14, 48
 80135fc:	d96e200a 	ld.w      	r11, (r14, 0x28)
 8013600:	0402      	br      	0x8013604	// 8013604 <_vsnprintf+0x610>
          out(*(pstr++), buffer, idx++, maxlen);
 8013602:	6c93      	mov      	r2, r4
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013604:	e90b0007 	bez      	r11, 0x8013612	// 8013612 <_vsnprintf+0x61e>
 8013608:	e46a1000 	subi      	r3, r10, 1
 801360c:	e90a0185 	bez      	r10, 0x8013916	// 8013916 <_vsnprintf+0x922>
 8013610:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 8013612:	e6100000 	addi      	r16, r16, 1
 8013616:	6cdf      	mov      	r3, r7
 8013618:	6c63      	mov      	r1, r8
 801361a:	5a82      	addi      	r4, r2, 1
 801361c:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801361e:	d8100000 	ld.b      	r0, (r16, 0x0)
 8013622:	e920fff0 	bnez      	r0, 0x8013602	// 8013602 <_vsnprintf+0x60e>
        if (flags & FLAGS_LEFT) {
 8013626:	986b      	ld.w      	r3, (r14, 0x2c)
 8013628:	e90300e2 	bez      	r3, 0x80137ec	// 80137ec <_vsnprintf+0x7f8>
          while (l++ < width) {
 801362c:	9868      	ld.w      	r3, (r14, 0x20)
 801362e:	c6230420 	cmphs      	r3, r17
 8013632:	08dd      	bt      	0x80137ec	// 80137ec <_vsnprintf+0x7f8>
 8013634:	c4910020 	addu      	r0, r17, r4
 8013638:	c460008a 	subu      	r10, r0, r3
 801363c:	6c93      	mov      	r2, r4
            out(' ', buffer, idx++, maxlen);
 801363e:	e5620000 	addi      	r11, r2, 1
 8013642:	6cdf      	mov      	r3, r7
 8013644:	6c63      	mov      	r1, r8
 8013646:	3020      	movi      	r0, 32
 8013648:	7bd9      	jsr      	r6
          while (l++ < width) {
 801364a:	66ea      	cmpne      	r10, r11
 801364c:	6caf      	mov      	r2, r11
 801364e:	0bf8      	bt      	0x801363e	// 801363e <_vsnprintf+0x64a>
        format++;
 8013650:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8013652:	9889      	ld.w      	r4, (r14, 0x24)
 8013654:	e800fcdf 	br      	0x8013012	// 8013012 <_vsnprintf+0x1e>
        const char* p = va_arg(va, char*);
 8013658:	5c6e      	addi      	r3, r4, 4
 801365a:	b869      	st.w      	r3, (r14, 0x24)
 801365c:	da642000 	ld.w      	r19, (r4, 0x0)
 8013660:	1a0c      	addi      	r2, r14, 48
        if (hbit > 9)
 8013662:	ea140009 	movi      	r20, 9
        outtxt[3 * i + 2] = '-';
 8013666:	ea15002d 	movi      	r21, 45
 801366a:	ea120006 	movi      	r18, 6
        hbit = (*(inchar + i) & 0xf0) >> 4;
 801366e:	d8730000 	ld.b      	r3, (r19, 0x0)
 8013672:	4b04      	lsri      	r0, r3, 4
        if (hbit > 9)
 8013674:	c4140420 	cmphs      	r20, r0
        lbit = *(inchar + i ) & 0x0f;
 8013678:	e463200f 	andi      	r3, r3, 15
        if (hbit > 9)
 801367c:	089d      	bt      	0x80137b6	// 80137b6 <_vsnprintf+0x7c2>
        if (lbit > 9)
 801367e:	c4740420 	cmphs      	r20, r3
            outtxt[3 * i] = 'A' + hbit - 10;
 8013682:	2036      	addi      	r0, 55
 8013684:	a200      	st.b      	r0, (r2, 0x0)
        if (lbit > 9)
 8013686:	089d      	bt      	0x80137c0	// 80137c0 <_vsnprintf+0x7cc>
            outtxt[3 * i + 1] = 'A' + lbit - 10;
 8013688:	2336      	addi      	r3, 55
 801368a:	a261      	st.b      	r3, (r2, 0x1)
        outtxt[3 * i + 2] = '-';
 801368c:	dea20002 	st.b      	r21, (r2, 0x2)
 8013690:	e6730000 	addi      	r19, r19, 1
 8013694:	2202      	addi      	r2, 3
    for(i = 0; i < 6; i++)/* mac length */
 8013696:	e832ffec 	bnezad      	r18, 0x801366e	// 801366e <_vsnprintf+0x67a>
    outtxt[3 * (i - 1) + 2] = 0;
 801369a:	3300      	movi      	r3, 0
 801369c:	dc6e0041 	st.b      	r3, (r14, 0x41)
        if (flags & FLAGS_PRECISION) {
 80136a0:	e4612400 	andi      	r3, r1, 1024
 80136a4:	b86a      	st.w      	r3, (r14, 0x28)
 80136a6:	e90300f3 	bez      	r3, 0x801388c	// 801388c <_vsnprintf+0x898>
          l = (l < precision ? l : precision);
 80136aa:	ea100011 	movi      	r16, 17
 80136ae:	fa0acd23 	min.u32      	r3, r10, r16
 80136b2:	b868      	st.w      	r3, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 80136b4:	e4612002 	andi      	r3, r1, 2
 80136b8:	b86b      	st.w      	r3, (r14, 0x2c)
 80136ba:	e92300e2 	bnez      	r3, 0x801387e	// 801387e <_vsnprintf+0x88a>
          while (l++ < width) {
 80136be:	9848      	ld.w      	r2, (r14, 0x20)
 80136c0:	c6220420 	cmphs      	r2, r17
 80136c4:	6ccb      	mov      	r3, r2
 80136c6:	2300      	addi      	r3, 1
 80136c8:	09c9      	bt      	0x8013a5a	// 8013a5a <_vsnprintf+0xa66>
 80136ca:	c5710023 	addu      	r3, r17, r11
 80136ce:	c4430090 	subu      	r16, r3, r2
 80136d2:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 80136d4:	e56b0000 	addi      	r11, r11, 1
 80136d8:	6cdf      	mov      	r3, r7
 80136da:	6c63      	mov      	r1, r8
 80136dc:	3020      	movi      	r0, 32
 80136de:	7bd9      	jsr      	r6
          while (l++ < width) {
 80136e0:	c60b0480 	cmpne      	r11, r16
 80136e4:	6caf      	mov      	r2, r11
 80136e6:	0bf7      	bt      	0x80136d4	// 80136d4 <_vsnprintf+0x6e0>
 80136e8:	e4710000 	addi      	r3, r17, 1
 80136ec:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80136ee:	d80e0030 	ld.b      	r0, (r14, 0x30)
 80136f2:	e900fded 	bez      	r0, 0x80132cc	// 80132cc <_vsnprintf+0x2d8>
 80136f6:	6caf      	mov      	r2, r11
 80136f8:	1c0c      	addi      	r4, r14, 48
 80136fa:	d96e200a 	ld.w      	r11, (r14, 0x28)
 80136fe:	0403      	br      	0x8013704	// 8013704 <_vsnprintf+0x710>
          out(*(pstr++), buffer, idx++, maxlen);
 8013700:	c4104822 	lsli      	r2, r16, 0
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013704:	e90b0007 	bez      	r11, 0x8013712	// 8013712 <_vsnprintf+0x71e>
 8013708:	e46a1000 	subi      	r3, r10, 1
 801370c:	e90a010a 	bez      	r10, 0x8013920	// 8013920 <_vsnprintf+0x92c>
 8013710:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 8013712:	2400      	addi      	r4, 1
 8013714:	6cdf      	mov      	r3, r7
 8013716:	6c63      	mov      	r1, r8
 8013718:	e6020000 	addi      	r16, r2, 1
 801371c:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801371e:	8400      	ld.b      	r0, (r4, 0x0)
 8013720:	e920fff0 	bnez      	r0, 0x8013700	// 8013700 <_vsnprintf+0x70c>
        if (flags & FLAGS_LEFT) {
 8013724:	986b      	ld.w      	r3, (r14, 0x2c)
 8013726:	e90300b6 	bez      	r3, 0x8013892	// 8013892 <_vsnprintf+0x89e>
          while (l++ < width) {
 801372a:	9868      	ld.w      	r3, (r14, 0x20)
 801372c:	c6230420 	cmphs      	r3, r17
 8013730:	08b1      	bt      	0x8013892	// 8013892 <_vsnprintf+0x89e>
 8013732:	c6110020 	addu      	r0, r17, r16
 8013736:	588d      	subu      	r4, r0, r3
 8013738:	c4104822 	lsli      	r2, r16, 0
            out(' ', buffer, idx++, maxlen);
 801373c:	e5620000 	addi      	r11, r2, 1
 8013740:	6cdf      	mov      	r3, r7
 8013742:	6c63      	mov      	r1, r8
 8013744:	3020      	movi      	r0, 32
 8013746:	7bd9      	jsr      	r6
          while (l++ < width) {
 8013748:	652e      	cmpne      	r11, r4
 801374a:	6caf      	mov      	r2, r11
 801374c:	0bf8      	bt      	0x801373c	// 801373c <_vsnprintf+0x748>
        format++;
 801374e:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8013750:	9889      	ld.w      	r4, (r14, 0x24)
 8013752:	e800fc60 	br      	0x8013012	// 8013012 <_vsnprintf+0x1e>
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
 8013756:	e46020df 	andi      	r3, r0, 223
 801375a:	eb430047 	cmpnei      	r3, 71
 801375e:	0805      	bt      	0x8013768	// 8013768 <_vsnprintf+0x774>
 8013760:	ec210800 	ori      	r1, r1, 2048
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
 8013764:	e40020fd 	andi      	r0, r0, 253
 8013768:	eb400045 	cmpnei      	r0, 69
 801376c:	0803      	bt      	0x8013772	// 8013772 <_vsnprintf+0x77e>
 801376e:	ec210020 	ori      	r1, r1, 32
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8013772:	b824      	st.w      	r1, (r14, 0x10)
 8013774:	de2e2003 	st.w      	r17, (r14, 0xc)
 8013778:	dd4e2002 	st.w      	r10, (r14, 0x8)
 801377c:	e6040007 	addi      	r16, r4, 8
 8013780:	9460      	ld.w      	r3, (r4, 0x0)
 8013782:	9481      	ld.w      	r4, (r4, 0x4)
 8013784:	b860      	st.w      	r3, (r14, 0x0)
 8013786:	b881      	st.w      	r4, (r14, 0x4)
 8013788:	6caf      	mov      	r2, r11
 801378a:	6cdf      	mov      	r3, r7
 801378c:	6c63      	mov      	r1, r8
 801378e:	6c1b      	mov      	r0, r6
 8013790:	e3fff9ec 	bsr      	0x8012b68	// 8012b68 <_etoa>
 8013794:	6ec3      	mov      	r11, r0
        format++;
 8013796:	2500      	addi      	r5, 1
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8013798:	c4104824 	lsli      	r4, r16, 0
        break;
 801379c:	e800fc3b 	br      	0x8013012	// 8013012 <_vsnprintf+0x1e>
                    outtxt[j++] = '0' + l;
 80137a0:	1a0c      	addi      	r2, r14, 48
 80137a2:	232f      	addi      	r3, 48
 80137a4:	d6620023 	str.b      	r3, (r2, r19 << 0)
 80137a8:	06e3      	br      	0x801356e	// 801356e <_vsnprintf+0x57a>
                    outtxt[j++]= '0' + h;
 80137aa:	e6ae002f 	addi      	r21, r14, 48
 80137ae:	222f      	addi      	r2, 48
 80137b0:	d4950022 	str.b      	r2, (r21, r4 << 0)
 80137b4:	06d3      	br      	0x801355a	// 801355a <_vsnprintf+0x566>
        if (lbit > 9)
 80137b6:	c4740420 	cmphs      	r20, r3
            outtxt[3 * i]= '0' + hbit;
 80137ba:	202f      	addi      	r0, 48
 80137bc:	a200      	st.b      	r0, (r2, 0x0)
        if (lbit > 9)
 80137be:	0f65      	bf      	0x8013688	// 8013688 <_vsnprintf+0x694>
            outtxt[3 * i + 1] = '0' + lbit;
 80137c0:	232f      	addi      	r3, 48
 80137c2:	a261      	st.b      	r3, (r2, 0x1)
 80137c4:	0764      	br      	0x801368c	// 801368c <_vsnprintf+0x698>
            m = (bit % 100) / 10;
 80137c6:	c6828422 	mult      	r2, r2, r20
 80137ca:	60ca      	subu      	r3, r2
 80137cc:	74cc      	zextb      	r3, r3
 80137ce:	c6638022 	divu      	r2, r3, r19
            if (m)
 80137d2:	e902fd0c 	bez      	r2, 0x80131ea	// 80131ea <_vsnprintf+0x1f6>
 80137d6:	6f13      	mov      	r12, r4
                outtxt[j++] = '0' + m;
 80137d8:	e5ae002f 	addi      	r13, r14, 48
 80137dc:	e48c0000 	addi      	r4, r12, 1
 80137e0:	222f      	addi      	r2, 48
 80137e2:	7510      	zextb      	r4, r4
 80137e4:	d58d0022 	str.b      	r2, (r13, r12 << 0)
 80137e8:	e800fd01 	br      	0x80131ea	// 80131ea <_vsnprintf+0x1f6>
          while (l++ < width) {
 80137ec:	6ed3      	mov      	r11, r4
        format++;
 80137ee:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 80137f0:	9889      	ld.w      	r4, (r14, 0x24)
 80137f2:	e800fc10 	br      	0x8013012	// 8013012 <_vsnprintf+0x1e>
 80137f6:	6caf      	mov      	r2, r11
 80137f8:	e800fc81 	br      	0x80130fa	// 80130fa <_vsnprintf+0x106>
      const int w = va_arg(va, int);
 80137fc:	9400      	ld.w      	r0, (r4, 0x0)
 80137fe:	5c6e      	addi      	r3, r4, 4
      if (w < 0) {
 8013800:	e98000af 	blz      	r0, 0x801395e	// 801395e <_vsnprintf+0x96a>
        width = (unsigned int)w;
 8013804:	c4004831 	lsli      	r17, r0, 0
 8013808:	8201      	ld.b      	r0, (r2, 0x1)
      const int w = va_arg(va, int);
 801380a:	6d0f      	mov      	r4, r3
      format++;
 801380c:	5aa2      	addi      	r5, r2, 1
 801380e:	e800fc38 	br      	0x801307e	// 801307e <_vsnprintf+0x8a>
 8013812:	8502      	ld.b      	r0, (r5, 0x2)
          flags |= FLAGS_CHAR;
 8013814:	ec2100c0 	ori      	r1, r1, 192
          format++;
 8013818:	2501      	addi      	r5, 2
 801381a:	e800fc47 	br      	0x80130a8	// 80130a8 <_vsnprintf+0xb4>
 801381e:	8502      	ld.b      	r0, (r5, 0x2)
          flags |= FLAGS_LONG_LONG;
 8013820:	ec210300 	ori      	r1, r1, 768
          format++;
 8013824:	2501      	addi      	r5, 2
 8013826:	e800fc41 	br      	0x80130a8	// 80130a8 <_vsnprintf+0xb4>
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801382a:	e900fdb2 	bez      	r0, 0x801338e	// 801338e <_vsnprintf+0x39a>
 801382e:	6caf      	mov      	r2, r11
 8013830:	b88b      	st.w      	r4, (r14, 0x2c)
 8013832:	d96e2009 	ld.w      	r11, (r14, 0x24)
 8013836:	e800fd96 	br      	0x8013362	// 8013362 <_vsnprintf+0x36e>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 801383a:	6cdf      	mov      	r3, r7
 801383c:	6caf      	mov      	r2, r11
 801383e:	6c63      	mov      	r1, r8
 8013840:	8400      	ld.b      	r0, (r4, 0x0)
 8013842:	7bd9      	jsr      	r6
          while (l++ < width) {
 8013844:	eb110001 	cmphsi      	r17, 2
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8013848:	e6040003 	addi      	r16, r4, 4
 801384c:	e54b0000 	addi      	r10, r11, 1
          while (l++ < width) {
 8013850:	0cfc      	bf      	0x8013a48	// 8013a48 <_vsnprintf+0xa54>
 8013852:	c571002b 	addu      	r11, r17, r11
 8013856:	6cab      	mov      	r2, r10
            out(' ', buffer, idx++, maxlen);
 8013858:	5a82      	addi      	r4, r2, 1
 801385a:	6cdf      	mov      	r3, r7
 801385c:	6c63      	mov      	r1, r8
 801385e:	3020      	movi      	r0, 32
 8013860:	7bd9      	jsr      	r6
          while (l++ < width) {
 8013862:	652e      	cmpne      	r11, r4
 8013864:	6c93      	mov      	r2, r4
 8013866:	0bf9      	bt      	0x8013858	// 8013858 <_vsnprintf+0x864>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8013868:	c4104824 	lsli      	r4, r16, 0
        format++;
 801386c:	2500      	addi      	r5, 1
 801386e:	e800fbd2 	br      	0x8013012	// 8013012 <_vsnprintf+0x1e>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013872:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8013876:	e920fec0 	bnez      	r0, 0x80135f6	// 80135f6 <_vsnprintf+0x602>
 801387a:	6d2f      	mov      	r4, r11
 801387c:	06d8      	br      	0x801362c	// 801362c <_vsnprintf+0x638>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801387e:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8013882:	e920ff3a 	bnez      	r0, 0x80136f6	// 80136f6 <_vsnprintf+0x702>
 8013886:	c40b4830 	lsli      	r16, r11, 0
 801388a:	0750      	br      	0x801372a	// 801372a <_vsnprintf+0x736>
        unsigned int l = __mac2str((unsigned char *)p, store);
 801388c:	3311      	movi      	r3, 17
 801388e:	b868      	st.w      	r3, (r14, 0x20)
 8013890:	0712      	br      	0x80136b4	// 80136b4 <_vsnprintf+0x6c0>
          while (l++ < width) {
 8013892:	c410482b 	lsli      	r11, r16, 0
        format++;
 8013896:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8013898:	9889      	ld.w      	r4, (r14, 0x24)
 801389a:	e800fbbc 	br      	0x8013012	// 8013012 <_vsnprintf+0x1e>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801389e:	d80e0030 	ld.b      	r0, (r14, 0x30)
 80138a2:	e920fce7 	bnez      	r0, 0x8013270	// 8013270 <_vsnprintf+0x27c>
 80138a6:	6d2f      	mov      	r4, r11
 80138a8:	e800fcff 	br      	0x80132a6	// 80132a6 <_vsnprintf+0x2b2>
          base =  8U;
 80138ac:	3208      	movi      	r2, 8
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 80138ae:	c4412823 	bclri      	r3, r1, 2
 80138b2:	3b83      	bclri      	r3, 3
        if (flags & FLAGS_PRECISION) {
 80138b4:	e4212400 	andi      	r1, r1, 1024
 80138b8:	e901fdda 	bez      	r1, 0x801346c	// 801346c <_vsnprintf+0x478>
 80138bc:	e800fdd7 	br      	0x801346a	// 801346a <_vsnprintf+0x476>
        if ((*format != 'i') && (*format != 'd')) {
 80138c0:	eb400064 	cmpnei      	r0, 100
          flags &= ~FLAGS_HASH;   // no hash for dec format
 80138c4:	6c4f      	mov      	r1, r3
          base = 10U;
 80138c6:	320a      	movi      	r2, 10
        if ((*format != 'i') && (*format != 'd')) {
 80138c8:	0bf3      	bt      	0x80138ae	// 80138ae <_vsnprintf+0x8ba>
        if (flags & FLAGS_PRECISION) {
 80138ca:	e4232400 	andi      	r1, r3, 1024
 80138ce:	e921fdce 	bnez      	r1, 0x801346a	// 801346a <_vsnprintf+0x476>
          if (flags & FLAGS_LONG_LONG) {
 80138d2:	e4232200 	andi      	r1, r3, 512
 80138d6:	e9210066 	bnez      	r1, 0x80139a2	// 80139a2 <_vsnprintf+0x9ae>
          else if (flags & FLAGS_LONG) {
 80138da:	e4032100 	andi      	r0, r3, 256
 80138de:	e9200099 	bnez      	r0, 0x8013a10	// 8013a10 <_vsnprintf+0xa1c>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 80138e2:	e4232040 	andi      	r1, r3, 64
 80138e6:	e92100a8 	bnez      	r1, 0x8013a36	// 8013a36 <_vsnprintf+0xa42>
 80138ea:	e4232080 	andi      	r1, r3, 128
 80138ee:	e921008c 	bnez      	r1, 0x8013a06	// 8013a06 <_vsnprintf+0xa12>
 80138f2:	9420      	ld.w      	r1, (r4, 0x0)
 80138f4:	491f      	lsri      	r0, r1, 31
 80138f6:	2403      	addi      	r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80138f8:	b865      	st.w      	r3, (r14, 0x14)
 80138fa:	de2e2004 	st.w      	r17, (r14, 0x10)
 80138fe:	dd4e2003 	st.w      	r10, (r14, 0xc)
 8013902:	b842      	st.w      	r2, (r14, 0x8)
 8013904:	b801      	st.w      	r0, (r14, 0x4)
 8013906:	c4010201 	abs      	r1, r1
 801390a:	e800fdd3 	br      	0x80134b0	// 80134b0 <_vsnprintf+0x4bc>
 801390e:	988b      	ld.w      	r4, (r14, 0x2c)
 8013910:	6ecb      	mov      	r11, r2
 8013912:	e800fd3b 	br      	0x8013388	// 8013388 <_vsnprintf+0x394>
 8013916:	6d0b      	mov      	r4, r2
 8013918:	0687      	br      	0x8013626	// 8013626 <_vsnprintf+0x632>
 801391a:	6d0b      	mov      	r4, r2
 801391c:	e800fcc2 	br      	0x80132a0	// 80132a0 <_vsnprintf+0x2ac>
 8013920:	c4024830 	lsli      	r16, r2, 0
 8013924:	0700      	br      	0x8013724	// 8013724 <_vsnprintf+0x730>
          base = 16U;
 8013926:	3210      	movi      	r2, 16
 8013928:	07c3      	br      	0x80138ae	// 80138ae <_vsnprintf+0x8ba>
 801392a:	c4412823 	bclri      	r3, r1, 2
 801392e:	3b83      	bclri      	r3, 3
        if (flags & FLAGS_PRECISION) {
 8013930:	e4212400 	andi      	r1, r1, 1024
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 8013934:	ec630020 	ori      	r3, r3, 32
          base = 16U;
 8013938:	3210      	movi      	r2, 16
        if (flags & FLAGS_PRECISION) {
 801393a:	e921fd98 	bnez      	r1, 0x801346a	// 801346a <_vsnprintf+0x476>
 801393e:	e800fd9f 	br      	0x801347c	// 801347c <_vsnprintf+0x488>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
 8013942:	ec210020 	ori      	r1, r1, 32
 8013946:	e800fdc4 	br      	0x80134ce	// 80134ce <_vsnprintf+0x4da>
        precision = prec > 0 ? (unsigned int)prec : 0U;
 801394a:	d9a42000 	ld.w      	r13, (r4, 0x0)
 801394e:	3300      	movi      	r3, 0
 8013950:	8502      	ld.b      	r0, (r5, 0x2)
 8013952:	f86dccaa 	max.s32      	r10, r13, r3
        const int prec = (int)va_arg(va, int);
 8013956:	2403      	addi      	r4, 4
        format++;
 8013958:	2501      	addi      	r5, 2
 801395a:	e800fb97 	br      	0x8013088	// 8013088 <_vsnprintf+0x94>
        width = (unsigned int)-w;
 801395e:	ea0c0000 	movi      	r12, 0
        flags |= FLAGS_LEFT;    // reverse padding
 8013962:	ec210002 	ori      	r1, r1, 2
        width = (unsigned int)-w;
 8013966:	c40c0091 	subu      	r17, r12, r0
 801396a:	074f      	br      	0x8013808	// 8013808 <_vsnprintf+0x814>
            idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
 801396c:	b867      	st.w      	r3, (r14, 0x1c)
 801396e:	3300      	movi      	r3, 0
 8013970:	de2e2006 	st.w      	r17, (r14, 0x18)
 8013974:	dd4e2005 	st.w      	r10, (r14, 0x14)
 8013978:	b843      	st.w      	r2, (r14, 0xc)
 801397a:	b864      	st.w      	r3, (r14, 0x10)
 801397c:	b862      	st.w      	r3, (r14, 0x8)
 801397e:	e6040007 	addi      	r16, r4, 8
 8013982:	9460      	ld.w      	r3, (r4, 0x0)
 8013984:	9481      	ld.w      	r4, (r4, 0x4)
 8013986:	b860      	st.w      	r3, (r14, 0x0)
 8013988:	b881      	st.w      	r4, (r14, 0x4)
 801398a:	6caf      	mov      	r2, r11
 801398c:	6cdf      	mov      	r3, r7
 801398e:	6c63      	mov      	r1, r8
 8013990:	6c1b      	mov      	r0, r6
 8013992:	e3fff633 	bsr      	0x80125f8	// 80125f8 <_ntoa_long_long>
 8013996:	6ec3      	mov      	r11, r0
 8013998:	c4104824 	lsli      	r4, r16, 0
        format++;
 801399c:	2500      	addi      	r5, 1
 801399e:	e800fb3a 	br      	0x8013012	// 8013012 <_vsnprintf+0x1e>
            const long long value = va_arg(va, long long);
 80139a2:	9421      	ld.w      	r1, (r4, 0x4)
 80139a4:	9400      	ld.w      	r0, (r4, 0x0)
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80139a6:	b867      	st.w      	r3, (r14, 0x1c)
 80139a8:	3300      	movi      	r3, 0
 80139aa:	b864      	st.w      	r3, (r14, 0x10)
 80139ac:	497f      	lsri      	r3, r1, 31
 80139ae:	b843      	st.w      	r2, (r14, 0xc)
 80139b0:	b862      	st.w      	r3, (r14, 0x8)
            const long long value = va_arg(va, long long);
 80139b2:	e6040007 	addi      	r16, r4, 8
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80139b6:	de2e2006 	st.w      	r17, (r14, 0x18)
 80139ba:	dd4e2005 	st.w      	r10, (r14, 0x14)
 80139be:	6c83      	mov      	r2, r0
 80139c0:	6cc7      	mov      	r3, r1
 80139c2:	e9810053 	blz      	r1, 0x8013a68	// 8013a68 <_vsnprintf+0xa74>
 80139c6:	b840      	st.w      	r2, (r14, 0x0)
 80139c8:	b861      	st.w      	r3, (r14, 0x4)
 80139ca:	07e0      	br      	0x801398a	// 801398a <_vsnprintf+0x996>
            idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
 80139cc:	b865      	st.w      	r3, (r14, 0x14)
 80139ce:	de2e2004 	st.w      	r17, (r14, 0x10)
 80139d2:	dd4e2003 	st.w      	r10, (r14, 0xc)
 80139d6:	b842      	st.w      	r2, (r14, 0x8)
 80139d8:	b821      	st.w      	r1, (r14, 0x4)
 80139da:	9460      	ld.w      	r3, (r4, 0x0)
 80139dc:	e6040003 	addi      	r16, r4, 4
 80139e0:	b860      	st.w      	r3, (r14, 0x0)
 80139e2:	6caf      	mov      	r2, r11
 80139e4:	6cdf      	mov      	r3, r7
 80139e6:	6c63      	mov      	r1, r8
 80139e8:	6c1b      	mov      	r0, r6
 80139ea:	e3fff5a7 	bsr      	0x8012538	// 8012538 <_ntoa_long>
 80139ee:	6ec3      	mov      	r11, r0
 80139f0:	c4104824 	lsli      	r4, r16, 0
        format++;
 80139f4:	2500      	addi      	r5, 1
 80139f6:	e800fb0e 	br      	0x8013012	// 8013012 <_vsnprintf+0x1e>
          base =  2U;
 80139fa:	3202      	movi      	r2, 2
 80139fc:	0759      	br      	0x80138ae	// 80138ae <_vsnprintf+0x8ba>
 80139fe:	8c20      	ld.h      	r1, (r4, 0x0)
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8013a00:	2403      	addi      	r4, 4
 8013a02:	e800fd4f 	br      	0x80134a0	// 80134a0 <_vsnprintf+0x4ac>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 8013a06:	d8245000 	ld.hs      	r1, (r4, 0x0)
 8013a0a:	491f      	lsri      	r0, r1, 31
 8013a0c:	2403      	addi      	r4, 4
 8013a0e:	0775      	br      	0x80138f8	// 80138f8 <_vsnprintf+0x904>
            const long value = va_arg(va, long);
 8013a10:	9420      	ld.w      	r1, (r4, 0x0)
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8013a12:	b865      	st.w      	r3, (r14, 0x14)
 8013a14:	497f      	lsri      	r3, r1, 31
 8013a16:	c4010201 	abs      	r1, r1
            const long value = va_arg(va, long);
 8013a1a:	e6040003 	addi      	r16, r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8013a1e:	de2e2004 	st.w      	r17, (r14, 0x10)
 8013a22:	dd4e2003 	st.w      	r10, (r14, 0xc)
 8013a26:	b842      	st.w      	r2, (r14, 0x8)
 8013a28:	b861      	st.w      	r3, (r14, 0x4)
 8013a2a:	b820      	st.w      	r1, (r14, 0x0)
 8013a2c:	07db      	br      	0x80139e2	// 80139e2 <_vsnprintf+0x9ee>
 8013a2e:	8420      	ld.b      	r1, (r4, 0x0)
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8013a30:	2403      	addi      	r4, 4
 8013a32:	e800fd37 	br      	0x80134a0	// 80134a0 <_vsnprintf+0x4ac>
 8013a36:	8420      	ld.b      	r1, (r4, 0x0)
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 8013a38:	2403      	addi      	r4, 4
 8013a3a:	075f      	br      	0x80138f8	// 80138f8 <_vsnprintf+0x904>
          while (l++ < width) {
 8013a3c:	b868      	st.w      	r3, (r14, 0x20)
 8013a3e:	e800fdd8 	br      	0x80135ee	// 80135ee <_vsnprintf+0x5fa>
          while (l++ < width) {
 8013a42:	b868      	st.w      	r3, (r14, 0x20)
 8013a44:	e800fc12 	br      	0x8013268	// 8013268 <_vsnprintf+0x274>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8013a48:	c4104824 	lsli      	r4, r16, 0
 8013a4c:	6eeb      	mov      	r11, r10
        format++;
 8013a4e:	2500      	addi      	r5, 1
 8013a50:	e800fae1 	br      	0x8013012	// 8013012 <_vsnprintf+0x1e>
          while (l++ < width) {
 8013a54:	6eaf      	mov      	r10, r11
 8013a56:	e800fce1 	br      	0x8013418	// 8013418 <_vsnprintf+0x424>
          while (l++ < width) {
 8013a5a:	b868      	st.w      	r3, (r14, 0x20)
 8013a5c:	0649      	br      	0x80136ee	// 80136ee <_vsnprintf+0x6fa>
          while (l++ < width) {
 8013a5e:	6d0f      	mov      	r4, r3
 8013a60:	c40b4832 	lsli      	r18, r11, 0
 8013a64:	e800fc76 	br      	0x8013350	// 8013350 <_vsnprintf+0x35c>
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8013a68:	3000      	movi      	r0, 0
 8013a6a:	3100      	movi      	r1, 0
 8013a6c:	f840c462 	sub.64      	r2, r0, r2
 8013a70:	07ab      	br      	0x80139c6	// 80139c6 <_vsnprintf+0x9d2>
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013a72:	c412482b 	lsli      	r11, r18, 0
 8013a76:	e800fc9c 	br      	0x80133ae	// 80133ae <_vsnprintf+0x3ba>
	...

08013a7c <fputc>:
    while((READ_REG(UART0->FIFOS) & 0x3F) >= 32);
 8013a7c:	1046      	lrw      	r2, 0x40010600	// 8013a94 <fputc+0x18>
 8013a7e:	9267      	ld.w      	r3, (r2, 0x1c)
 8013a80:	e463203f 	andi      	r3, r3, 63
 8013a84:	3b1f      	cmphsi      	r3, 32
 8013a86:	0bfc      	bt      	0x8013a7e	// 8013a7e <fputc+0x2>
    WRITE_REG(UART0->TDW, (char)ch);
 8013a88:	e40020ff 	andi      	r0, r0, 255
 8013a8c:	b208      	st.w      	r0, (r2, 0x20)
}
 8013a8e:	3000      	movi      	r0, 0
 8013a90:	783c      	jmp      	r15
 8013a92:	0000      	.short	0x0000
 8013a94:	40010600 	.long	0x40010600

08013a98 <wm_printf>:
  return _vsnprintf(_out_buffer, buffer, count, format, va);
}


int wm_printf(const char *fmt,...)
{
 8013a98:	1424      	subi      	r14, r14, 16
 8013a9a:	b863      	st.w      	r3, (r14, 0xc)
 8013a9c:	b842      	st.w      	r2, (r14, 0x8)
 8013a9e:	b821      	st.w      	r1, (r14, 0x4)
 8013aa0:	b800      	st.w      	r0, (r14, 0x0)
 8013aa2:	14d0      	push      	r15
 8013aa4:	1421      	subi      	r14, r14, 4
 8013aa6:	9862      	ld.w      	r3, (r14, 0x8)
 8013aa8:	6c8f      	mov      	r2, r3
    va_list args;
    size_t length;

	va_start(args, fmt);
	length = _vsnprintf(_out_uart, (char*)fmt, (size_t) - 1, fmt, args);
 8013aaa:	1b03      	addi      	r3, r14, 12
 8013aac:	b860      	st.w      	r3, (r14, 0x0)
 8013aae:	6ccb      	mov      	r3, r2
 8013ab0:	3200      	movi      	r2, 0
 8013ab2:	2a00      	subi      	r2, 1
 8013ab4:	6c4f      	mov      	r1, r3
 8013ab6:	1005      	lrw      	r0, 0x801229c	// 8013ac8 <wm_printf+0x30>
 8013ab8:	e3fffa9e 	bsr      	0x8012ff4	// 8012ff4 <_vsnprintf>
	va_end(args);

	return length;
}
 8013abc:	1401      	addi      	r14, r14, 4
 8013abe:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8013ac2:	1405      	addi      	r14, r14, 20
 8013ac4:	783c      	jmp      	r15
 8013ac6:	0000      	.short	0x0000
 8013ac8:	0801229c 	.long	0x0801229c
 8013acc:	00000000 	.long	0x00000000
