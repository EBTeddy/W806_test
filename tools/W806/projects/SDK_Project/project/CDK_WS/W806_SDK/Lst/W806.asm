
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
 80104b0:	d0 05 01 08 d0 05 01 08 80 1d 01 08 b4 1d 01 08     ................
 80104c0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104d0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104e0:	d0 05 01 08 4c 1d 01 08 d0 05 01 08 d0 05 01 08     ....L...........
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
 8010524:	1035      	lrw      	r1, 0x8013ab4	// 8010578 <__exit+0x18>
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
 8010540:	1052      	lrw      	r2, 0x20001370	// 8010588 <__exit+0x28>

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
 8010554:	e0000c4a 	bsr      	0x8011de8	// 8011de8 <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jbsr    board_init
 8010558:	e0000c9e 	bsr      	0x8011e94	// 8011e94 <board_init>
#endif

    jbsr    main
 801055c:	e0000b9e 	bsr      	0x8011c98	// 8011c98 <main>

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
 8010578:	08013ab4 	.long	0x08013ab4
 801057c:	20000100 	.long	0x20000100
 8010580:	20000160 	.long	0x20000160
 8010584:	20000160 	.long	0x20000160
 8010588:	20001370 	.long	0x20001370

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
 80105cc:	e0000c26 	bsr      	0x8011e18	// 8011e18 <trap_c>

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
 801063a:	01dc      	lrw      	r6, 0x8013714	// 8010944 <__udivdi3+0x330>
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
 80106e2:	0386      	lrw      	r4, 0x8013714	// 8010944 <__udivdi3+0x330>
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
 8010724:	0357      	lrw      	r2, 0x8013714	// 8010944 <__udivdi3+0x330>
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
 8010944:	08013714 	.long	0x08013714

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
 8010970:	0281      	lrw      	r4, 0x8013714	// 8010c68 <__umoddi3+0x320>
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
 8010a00:	03a5      	lrw      	r5, 0x8013714	// 8010c68 <__umoddi3+0x320>
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
 8010a4e:	0358      	lrw      	r2, 0x8013714	// 8010c68 <__umoddi3+0x320>
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
 8010c68:	08013714 	.long	0x08013714

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
 8010e6c:	124b      	lrw      	r2, 0x8013700	// 8010f98 <__subdf3+0x38>
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
 8010f98:	08013700 	.long	0x08013700

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
 801115e:	100f      	lrw      	r0, 0x8013700	// 8011198 <__muldf3+0x1fc>
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
 8011198:	08013700 	.long	0x08013700

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
 801126c:	1011      	lrw      	r0, 0x8013700	// 80112b0 <__divdf3+0x114>
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
 80112b0:	08013700 	.long	0x08013700

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
 801185e:	e000003f 	bsr      	0x80118dc	// 80118dc <__GI_putc>
 8011862:	1490      	pop      	r15
 8011864:	20000120 	.long	0x20000120

08011868 <__GI_puts>:
 8011868:	14d1      	push      	r4, r15
 801186a:	1085      	lrw      	r4, 0x20000120	// 801187c <__GI_puts+0x14>
 801186c:	9420      	ld.w      	r1, (r4, 0x0)
 801186e:	e0000009 	bsr      	0x8011880	// 8011880 <__GI_fputs>
 8011872:	9420      	ld.w      	r1, (r4, 0x0)
 8011874:	300a      	movi      	r0, 10
 8011876:	e0000f17 	bsr      	0x80136a4	// 80136a4 <fputc>
 801187a:	1491      	pop      	r4, r15
 801187c:	20000120 	.long	0x20000120

08011880 <__GI_fputs>:
 8011880:	14d5      	push      	r4-r8, r15
 8011882:	6d03      	mov      	r4, r0
 8011884:	6d87      	mov      	r6, r1
 8011886:	e9010018 	bez      	r1, 0x80118b6	// 80118b6 <__GI_fputs+0x36>
 801188a:	e5010017 	addi      	r8, r1, 24
 801188e:	6c23      	mov      	r0, r8
 8011890:	e0000020 	bsr      	0x80118d0	// 80118d0 <__GI_os_critical_enter>
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
 80118ae:	e0000efb 	bsr      	0x80136a4	// 80136a4 <fputc>
 80118b2:	65c2      	cmpne      	r0, r7
 80118b4:	0bf7      	bt      	0x80118a2	// 80118a2 <__GI_fputs+0x22>
 80118b6:	3500      	movi      	r5, 0
 80118b8:	2d00      	subi      	r5, 1
 80118ba:	6c17      	mov      	r0, r5
 80118bc:	1495      	pop      	r4-r8, r15
 80118be:	6d43      	mov      	r5, r0
 80118c0:	6c23      	mov      	r0, r8
 80118c2:	e0000009 	bsr      	0x80118d4	// 80118d4 <__GI_os_critical_exit>
 80118c6:	6c17      	mov      	r0, r5
 80118c8:	1495      	pop      	r4-r8, r15
	...

080118cc <__GI_os_critical_open>:
 80118cc:	3000      	movi      	r0, 0
 80118ce:	783c      	jmp      	r15

080118d0 <__GI_os_critical_enter>:
 80118d0:	3000      	movi      	r0, 0
 80118d2:	783c      	jmp      	r15

080118d4 <__GI_os_critical_exit>:
 80118d4:	3000      	movi      	r0, 0
 80118d6:	783c      	jmp      	r15

080118d8 <__GI_os_critical_close>:
 80118d8:	3000      	movi      	r0, 0
 80118da:	783c      	jmp      	r15

080118dc <__GI_putc>:
 80118dc:	14d0      	push      	r15
 80118de:	e0000ee3 	bsr      	0x80136a4	// 80136a4 <fputc>
 80118e2:	1490      	pop      	r15

080118e4 <HAL_GPIO_Init>:
	
	assert_param(IS_GPIO_ALL_INSTANCE(GPIOx));
	assert_param(IS_GPIO_PIN(GPIO_Init->Pin));
	assert_param(IS_GPIO_MODE(GPIO_Init->Mode));

	while (((GPIO_Init->Pin) >>  position) != 0x00)
 80118e4:	d9812000 	ld.w      	r12, (r1, 0x0)
 80118e8:	e90c0044 	bez      	r12, 0x8011970	// 8011970 <HAL_GPIO_Init+0x8c>
 80118ec:	3200      	movi      	r2, 0
	{
		ioposition = (0x01 << position);
 80118ee:	ea140001 	movi      	r20, 1
			{
					SET_BIT(GPIOx->PULLUP_EN, ioposition);
					SET_BIT(GPIOx->PULLDOWN_EN, ioposition);
			}
			
			switch (GPIO_Init->Mode)
 80118f2:	ea96001f 	lrw      	r22, 0x8013814	// 801196c <HAL_GPIO_Init+0x88>
 80118f6:	0406      	br      	0x8011902	// 8011902 <HAL_GPIO_Init+0x1e>
			{
				SET_BIT(GPIOx->IE, ioposition);
			}
		}
		
		position++;
 80118f8:	2200      	addi      	r2, 1
	while (((GPIO_Init->Pin) >>  position) != 0x00)
 80118fa:	c44c4043 	lsr      	r3, r12, r2
 80118fe:	e9030039 	bez      	r3, 0x8011970	// 8011970 <HAL_GPIO_Init+0x8c>
		ioposition = (0x01 << position);
 8011902:	c4544023 	lsl      	r3, r20, r2
		iocurrent = (uint32_t)(GPIO_Init->Pin) & ioposition;
 8011906:	c583202d 	and      	r13, r3, r12
		if (iocurrent == ioposition)
 801190a:	674e      	cmpne      	r3, r13
 801190c:	0bf6      	bt      	0x80118f8	// 80118f8 <HAL_GPIO_Init+0x14>
			switch (GPIO_Init->Mode)
 801190e:	da612001 	ld.w      	r19, (r1, 0x4)
			__AFIO_REMAP_SET_OPT5(GPIOx, ioposition);
 8011912:	da402004 	ld.w      	r18, (r0, 0x10)
 8011916:	c463248d 	nor      	r13, r3, r3
			switch (GPIO_Init->Mode)
 801191a:	eb530002 	cmpnei      	r19, 2
			__AFIO_REMAP_SET_OPT5(GPIOx, ioposition);
 801191e:	c5b22032 	and      	r18, r18, r13
 8011922:	de402004 	st.w      	r18, (r0, 0x10)
			switch (GPIO_Init->Mode)
 8011926:	0c44      	bf      	0x80119ae	// 80119ae <HAL_GPIO_Init+0xca>
 8011928:	eb130002 	cmphsi      	r19, 3
 801192c:	0823      	bt      	0x8011972	// 8011972 <HAL_GPIO_Init+0x8e>
 801192e:	eb530001 	cmpnei      	r19, 1
 8011932:	08a3      	bt      	0x8011a78	// 8011a78 <HAL_GPIO_Init+0x194>
 8011934:	ea120000 	movi      	r18, 0
 8011938:	e6521085 	subi      	r18, r18, 134
					CLEAR_BIT(GPIOx->DIR, ioposition);
 801193c:	daa02002 	ld.w      	r21, (r0, 0x8)
 8011940:	c6ad2035 	and      	r21, r13, r21
 8011944:	dea02002 	st.w      	r21, (r0, 0x8)
			if (GPIO_Init->Pull == GPIO_NOPULL)
 8011948:	daa12002 	ld.w      	r21, (r1, 0x8)
 801194c:	eb550012 	cmpnei      	r21, 18
 8011950:	0c1b      	bf      	0x8011986	// 8011986 <HAL_GPIO_Init+0xa2>
			else if (GPIO_Init->Pull == GPIO_PULLUP)
 8011952:	eb550013 	cmpnei      	r21, 19
 8011956:	0c37      	bf      	0x80119c4	// 80119c4 <HAL_GPIO_Init+0xe0>
			else if(GPIO_Init->Pull == GPIO_PULLDOWN)
 8011958:	eb550014 	cmpnei      	r21, 20
 801195c:	0c91      	bf      	0x8011a7e	// 8011a7e <HAL_GPIO_Init+0x19a>
			switch (GPIO_Init->Mode)
 801195e:	eb120004 	cmphsi      	r18, 5
 8011962:	0821      	bt      	0x80119a4	// 80119a4 <HAL_GPIO_Init+0xc0>
 8011964:	d2560892 	ldr.w      	r18, (r22, r18 << 2)
 8011968:	e8d20000 	jmp      	r18
 801196c:	08013814 	.long	0x08013814
	}
}
 8011970:	783c      	jmp      	r15
			switch (GPIO_Init->Mode)
 8011972:	e6531086 	subi      	r18, r19, 135
 8011976:	eb120004 	cmphsi      	r18, 5
 801197a:	0fe1      	bf      	0x801193c	// 801193c <HAL_GPIO_Init+0x58>
			if (GPIO_Init->Pull == GPIO_NOPULL)
 801197c:	daa12002 	ld.w      	r21, (r1, 0x8)
 8011980:	eb550012 	cmpnei      	r21, 18
 8011984:	0be7      	bt      	0x8011952	// 8011952 <HAL_GPIO_Init+0x6e>
					SET_BIT(GPIOx->PULLUP_EN, ioposition);
 8011986:	daa02003 	ld.w      	r21, (r0, 0xc)
 801198a:	c6a32435 	or      	r21, r3, r21
 801198e:	dea02003 	st.w      	r21, (r0, 0xc)
					CLEAR_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8011992:	daa02007 	ld.w      	r21, (r0, 0x1c)
			switch (GPIO_Init->Mode)
 8011996:	eb120004 	cmphsi      	r18, 5
					CLEAR_BIT(GPIOx->PULLDOWN_EN, ioposition);
 801199a:	c6ad2035 	and      	r21, r13, r21
 801199e:	dea02007 	st.w      	r21, (r0, 0x1c)
			switch (GPIO_Init->Mode)
 80119a2:	0fe1      	bf      	0x8011964	// 8011964 <HAL_GPIO_Init+0x80>
			if ((GPIO_Init->Mode & EXTI_MODE) == EXTI_MODE)
 80119a4:	e6732080 	andi      	r19, r19, 128
 80119a8:	e913ffa8 	bez      	r19, 0x80118f8	// 80118f8 <HAL_GPIO_Init+0x14>
 80119ac:	0423      	br      	0x80119f2	// 80119f2 <HAL_GPIO_Init+0x10e>
					SET_BIT(GPIOx->DIR, ioposition);
 80119ae:	da402002 	ld.w      	r18, (r0, 0x8)
 80119b2:	c6432432 	or      	r18, r3, r18
 80119b6:	de402002 	st.w      	r18, (r0, 0x8)
 80119ba:	ea120000 	movi      	r18, 0
 80119be:	e6521084 	subi      	r18, r18, 133
					break;
 80119c2:	07c3      	br      	0x8011948	// 8011948 <HAL_GPIO_Init+0x64>
					CLEAR_BIT(GPIOx->PULLUP_EN, ioposition);
 80119c4:	daa02003 	ld.w      	r21, (r0, 0xc)
 80119c8:	c6ad2035 	and      	r21, r13, r21
 80119cc:	dea02003 	st.w      	r21, (r0, 0xc)
					CLEAR_BIT(GPIOx->PULLDOWN_EN, ioposition);
 80119d0:	daa02007 	ld.w      	r21, (r0, 0x1c)
 80119d4:	c6ad2035 	and      	r21, r13, r21
 80119d8:	dea02007 	st.w      	r21, (r0, 0x1c)
 80119dc:	07c1      	br      	0x801195e	// 801195e <HAL_GPIO_Init+0x7a>
					SET_BIT(GPIOx->IS, ioposition);
 80119de:	d9a02008 	ld.w      	r13, (r0, 0x20)
 80119e2:	6f4c      	or      	r13, r3
 80119e4:	dda02008 	st.w      	r13, (r0, 0x20)
					SET_BIT(GPIOx->IEV, ioposition);
 80119e8:	d9a0200a 	ld.w      	r13, (r0, 0x28)
 80119ec:	6f4c      	or      	r13, r3
 80119ee:	dda0200a 	st.w      	r13, (r0, 0x28)
				SET_BIT(GPIOx->IE, ioposition);
 80119f2:	d9a0200b 	ld.w      	r13, (r0, 0x2c)
 80119f6:	6cf4      	or      	r3, r13
 80119f8:	b06b      	st.w      	r3, (r0, 0x2c)
 80119fa:	077f      	br      	0x80118f8	// 80118f8 <HAL_GPIO_Init+0x14>
					CLEAR_BIT(GPIOx->IS, ioposition);
 80119fc:	da402008 	ld.w      	r18, (r0, 0x20)
 8011a00:	c64d202d 	and      	r13, r13, r18
 8011a04:	dda02008 	st.w      	r13, (r0, 0x20)
					SET_BIT(GPIOx->IBE, ioposition);
 8011a08:	d9a02009 	ld.w      	r13, (r0, 0x24)
 8011a0c:	6f4c      	or      	r13, r3
 8011a0e:	dda02009 	st.w      	r13, (r0, 0x24)
					break;
 8011a12:	07f0      	br      	0x80119f2	// 80119f2 <HAL_GPIO_Init+0x10e>
					CLEAR_BIT(GPIOx->IS, ioposition);
 8011a14:	da402008 	ld.w      	r18, (r0, 0x20)
 8011a18:	c64d2032 	and      	r18, r13, r18
 8011a1c:	de402008 	st.w      	r18, (r0, 0x20)
					CLEAR_BIT(GPIOx->IBE, ioposition);
 8011a20:	da402009 	ld.w      	r18, (r0, 0x24)
 8011a24:	c64d2032 	and      	r18, r13, r18
 8011a28:	de402009 	st.w      	r18, (r0, 0x24)
					CLEAR_BIT(GPIOx->IEV, ioposition);
 8011a2c:	da40200a 	ld.w      	r18, (r0, 0x28)
 8011a30:	c64d202d 	and      	r13, r13, r18
 8011a34:	dda0200a 	st.w      	r13, (r0, 0x28)
					break;
 8011a38:	07dd      	br      	0x80119f2	// 80119f2 <HAL_GPIO_Init+0x10e>
					CLEAR_BIT(GPIOx->IS, ioposition);
 8011a3a:	da402008 	ld.w      	r18, (r0, 0x20)
 8011a3e:	c64d2032 	and      	r18, r13, r18
 8011a42:	de402008 	st.w      	r18, (r0, 0x20)
					CLEAR_BIT(GPIOx->IBE, ioposition);
 8011a46:	da402009 	ld.w      	r18, (r0, 0x24)
 8011a4a:	c64d202d 	and      	r13, r13, r18
 8011a4e:	dda02009 	st.w      	r13, (r0, 0x24)
					SET_BIT(GPIOx->IEV, ioposition);
 8011a52:	d9a0200a 	ld.w      	r13, (r0, 0x28)
 8011a56:	6f4c      	or      	r13, r3
 8011a58:	dda0200a 	st.w      	r13, (r0, 0x28)
					break;
 8011a5c:	07cb      	br      	0x80119f2	// 80119f2 <HAL_GPIO_Init+0x10e>
					SET_BIT(GPIOx->IS, ioposition);
 8011a5e:	da402008 	ld.w      	r18, (r0, 0x20)
 8011a62:	c6432432 	or      	r18, r3, r18
 8011a66:	de402008 	st.w      	r18, (r0, 0x20)
					CLEAR_BIT(GPIOx->IEV, ioposition);
 8011a6a:	da40200a 	ld.w      	r18, (r0, 0x28)
 8011a6e:	c64d202d 	and      	r13, r13, r18
 8011a72:	dda0200a 	st.w      	r13, (r0, 0x28)
					break;
 8011a76:	07be      	br      	0x80119f2	// 80119f2 <HAL_GPIO_Init+0x10e>
 8011a78:	e6531086 	subi      	r18, r19, 135
 8011a7c:	0766      	br      	0x8011948	// 8011948 <HAL_GPIO_Init+0x64>
					SET_BIT(GPIOx->PULLUP_EN, ioposition);
 8011a7e:	daa02003 	ld.w      	r21, (r0, 0xc)
 8011a82:	c6a32435 	or      	r21, r3, r21
 8011a86:	dea02003 	st.w      	r21, (r0, 0xc)
					SET_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8011a8a:	daa02007 	ld.w      	r21, (r0, 0x1c)
 8011a8e:	c6a32435 	or      	r21, r3, r21
 8011a92:	dea02007 	st.w      	r21, (r0, 0x1c)
 8011a96:	0764      	br      	0x801195e	// 801195e <HAL_GPIO_Init+0x7a>

08011a98 <HAL_GPIO_WritePin>:
	uint32_t data_en;
	
	assert_param(IS_GPIO_PIN(GPIO_Pin));
	assert_param(IS_GPIO_PIN_ACTION(PinState));

	data_en = READ_REG(GPIOx->DATA_B_EN);
 8011a98:	d9802001 	ld.w      	r12, (r0, 0x4)
	SET_BIT(GPIOx->DATA_B_EN, GPIO_Pin);
 8011a9c:	9061      	ld.w      	r3, (r0, 0x4)
 8011a9e:	6cc4      	or      	r3, r1
 8011aa0:	b061      	st.w      	r3, (r0, 0x4)
	if (PinState != GPIO_PIN_RESET)
	{
		SET_BIT(GPIOx->DATA, GPIO_Pin);
 8011aa2:	9060      	ld.w      	r3, (r0, 0x0)
	if (PinState != GPIO_PIN_RESET)
 8011aa4:	e9220008 	bnez      	r2, 0x8011ab4	// 8011ab4 <HAL_GPIO_WritePin+0x1c>
	}
	else
	{
		CLEAR_BIT(GPIOx->DATA, GPIO_Pin);
 8011aa8:	c4232041 	andn      	r1, r3, r1
 8011aac:	b020      	st.w      	r1, (r0, 0x0)
	}
	WRITE_REG(GPIOx->DATA_B_EN, data_en);
 8011aae:	dd802001 	st.w      	r12, (r0, 0x4)
}
 8011ab2:	783c      	jmp      	r15
		SET_BIT(GPIOx->DATA, GPIO_Pin);
 8011ab4:	6c4c      	or      	r1, r3
 8011ab6:	b020      	st.w      	r1, (r0, 0x0)
	WRITE_REG(GPIOx->DATA_B_EN, data_en);
 8011ab8:	dd802001 	st.w      	r12, (r0, 0x4)
}
 8011abc:	783c      	jmp      	r15
	...

08011ac0 <HAL_GPIO_TogglePin>:
{
	uint32_t data_en, position = 0x00, iocurrent;
	
	assert_param(IS_GPIO_PIN(GPIO_Pin));
	
	data_en = READ_REG(GPIOx->DATA_B_EN);
 8011ac0:	da402001 	ld.w      	r18, (r0, 0x4)
	SET_BIT(GPIOx->DATA_B_EN, GPIO_Pin);
 8011ac4:	9061      	ld.w      	r3, (r0, 0x4)
 8011ac6:	6cc4      	or      	r3, r1
 8011ac8:	b061      	st.w      	r3, (r0, 0x4)
	while ((GPIO_Pin >> position) != 0)
 8011aca:	e9010023 	bez      	r1, 0x8011b10	// 8011b10 <HAL_GPIO_TogglePin+0x50>
 8011ace:	3200      	movi      	r2, 0
	{
		iocurrent = (GPIO_Pin) & (1uL << position);
 8011ad0:	ea0d0001 	movi      	r13, 1
 8011ad4:	040b      	br      	0x8011aea	// 8011aea <HAL_GPIO_TogglePin+0x2a>
		
		if (iocurrent)
		{
			if ((GPIOx->DATA & iocurrent) != GPIO_PIN_RESET)
			{
				CLEAR_BIT(GPIOx->DATA, iocurrent);
 8011ad6:	d9802000 	ld.w      	r12, (r0, 0x0)
 8011ada:	c46c2043 	andn      	r3, r12, r3
 8011ade:	b060      	st.w      	r3, (r0, 0x0)
			{
				SET_BIT(GPIOx->DATA, iocurrent);
			}
		}
		
		position++;
 8011ae0:	2200      	addi      	r2, 1
	while ((GPIO_Pin >> position) != 0)
 8011ae2:	c4414043 	lsr      	r3, r1, r2
 8011ae6:	e9030015 	bez      	r3, 0x8011b10	// 8011b10 <HAL_GPIO_TogglePin+0x50>
		iocurrent = (GPIO_Pin) & (1uL << position);
 8011aea:	c44d4023 	lsl      	r3, r13, r2
 8011aee:	68c4      	and      	r3, r1
		if (iocurrent)
 8011af0:	e903fff8 	bez      	r3, 0x8011ae0	// 8011ae0 <HAL_GPIO_TogglePin+0x20>
			if ((GPIOx->DATA & iocurrent) != GPIO_PIN_RESET)
 8011af4:	d9802000 	ld.w      	r12, (r0, 0x0)
 8011af8:	6b0c      	and      	r12, r3
 8011afa:	e92cffee 	bnez      	r12, 0x8011ad6	// 8011ad6 <HAL_GPIO_TogglePin+0x16>
				SET_BIT(GPIOx->DATA, iocurrent);
 8011afe:	d9802000 	ld.w      	r12, (r0, 0x0)
 8011b02:	6cf0      	or      	r3, r12
		position++;
 8011b04:	2200      	addi      	r2, 1
				SET_BIT(GPIOx->DATA, iocurrent);
 8011b06:	b060      	st.w      	r3, (r0, 0x0)
	while ((GPIO_Pin >> position) != 0)
 8011b08:	c4414043 	lsr      	r3, r1, r2
 8011b0c:	e923ffef 	bnez      	r3, 0x8011aea	// 8011aea <HAL_GPIO_TogglePin+0x2a>
	}
	WRITE_REG(GPIOx->DATA_B_EN, data_en);
 8011b10:	de402001 	st.w      	r18, (r0, 0x4)
}
 8011b14:	783c      	jmp      	r15
	...

08011b18 <HAL_GPIO_EXTI_IRQHandler>:

void HAL_GPIO_EXTI_IRQHandler(GPIO_TypeDef *GPIOx, uint32_t GPIO_Pin)
{
 8011b18:	14d0      	push      	r15
	if ((GPIOx->MIS & GPIO_Pin) != 0)
 8011b1a:	906d      	ld.w      	r3, (r0, 0x34)
 8011b1c:	68c4      	and      	r3, r1
{
 8011b1e:	6c87      	mov      	r2, r1
	if ((GPIOx->MIS & GPIO_Pin) != 0)
 8011b20:	e9230003 	bnez      	r3, 0x8011b26	// 8011b26 <HAL_GPIO_EXTI_IRQHandler+0xe>
	{
		SET_BIT(GPIOx->IC, GPIO_Pin);
		HAL_GPIO_EXTI_Callback(GPIOx, GPIO_Pin);
	}
}
 8011b24:	1490      	pop      	r15
		SET_BIT(GPIOx->IC, GPIO_Pin);
 8011b26:	906e      	ld.w      	r3, (r0, 0x38)
 8011b28:	6c8c      	or      	r2, r3
 8011b2a:	b04e      	st.w      	r2, (r0, 0x38)
		HAL_GPIO_EXTI_Callback(GPIOx, GPIO_Pin);
 8011b2c:	e00000fe 	bsr      	0x8011d28	// 8011d28 <HAL_GPIO_EXTI_Callback>
}
 8011b30:	1490      	pop      	r15
	...

08011b34 <HAL_InitTick>:
 */
void SystemClock_Get(wm_sys_clk *sysclk)
{
	clk_div_reg clk_div;

	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011b34:	ea234000 	movih      	r3, 16384
 8011b38:	e4630dff 	addi      	r3, r3, 3584
	sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
}


__attribute__((weak)) HAL_StatusTypeDef HAL_InitTick(uint32_t TickPriority)
{
 8011b3c:	6f03      	mov      	r12, r0
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011b3e:	9364      	ld.w      	r3, (r3, 0x10)
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011b40:	748c      	zextb      	r2, r3
 8011b42:	ea0301e0 	movi      	r3, 480
 8011b46:	c4438043 	divs      	r3, r3, r2
	wm_sys_clk sysclk;
	
	SystemClock_Get(&sysclk);
	SysTick_Config(sysclk.cpuclk * UNIT_MHZ / uwTickFreq);
 8011b4a:	ea02f424 	movi      	r2, 62500
 8011b4e:	c4824902 	rotli      	r2, r2, 4
 8011b52:	7cc8      	mult      	r3, r2
 8011b54:	ea0203e8 	movi      	r2, 1000
 8011b58:	c4438023 	divu      	r3, r3, r2
{
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
        return (1UL);                                                   /* Reload value impossible */
    }

    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
 8011b5c:	104f      	lrw      	r2, 0xe000e010	// 8011b98 <HAL_InitTick+0x64>
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
 8011b5e:	2b00      	subi      	r3, 1
    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
 8011b60:	b261      	st.w      	r3, (r2, 0x4)
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011b62:	3000      	movi      	r0, 0
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
 8011b64:	3307      	movi      	r3, 7
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
 8011b66:	b202      	st.w      	r0, (r2, 0x8)
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
 8011b68:	b260      	st.w      	r3, (r2, 0x0)
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011b6a:	104d      	lrw      	r2, 0xe000e100	// 8011b9c <HAL_InitTick+0x68>
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011b6c:	c5cc4823 	lsli      	r3, r12, 14
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011b70:	d82220c6 	ld.w      	r1, (r2, 0x318)
 8011b74:	ea0dff00 	movi      	r13, 65280
 8011b78:	6f76      	nor      	r13, r13
 8011b7a:	6874      	and      	r1, r13
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011b7c:	c40355e3 	zext      	r3, r3, 15, 0
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011b80:	6cc4      	or      	r3, r1
 8011b82:	dc6220c6 	st.w      	r3, (r2, 0x318)
    VIC->ISER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011b86:	ea230200 	movih      	r3, 512
 8011b8a:	b260      	st.w      	r3, (r2, 0x0)
    VIC->ISSR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011b8c:	dc622050 	st.w      	r3, (r2, 0x140)
	HAL_NVIC_SetPriority(SYS_TICK_IRQn, TickPriority);
	HAL_NVIC_EnableIRQ(SYS_TICK_IRQn);
	uwTickPrio = TickPriority;
 8011b90:	1064      	lrw      	r3, 0x2000136c	// 8011ba0 <HAL_InitTick+0x6c>
 8011b92:	dd832000 	st.w      	r12, (r3, 0x0)
	return HAL_OK;
}
 8011b96:	783c      	jmp      	r15
 8011b98:	e000e010 	.long	0xe000e010
 8011b9c:	e000e100 	.long	0xe000e100
 8011ba0:	2000136c 	.long	0x2000136c

08011ba4 <SystemClock_Config>:
{
 8011ba4:	14d0      	push      	r15
	if ((clk < 2) || (clk > 240))
 8011ba6:	5867      	subi      	r3, r0, 2
 8011ba8:	eb0300ee 	cmphsi      	r3, 239
 8011bac:	0826      	bt      	0x8011bf8	// 8011bf8 <SystemClock_Config+0x54>
    RegValue = READ_REG(RCC->CLK_EN);
 8011bae:	ea224000 	movih      	r2, 16384
 8011bb2:	e4420dff 	addi      	r2, r2, 3584
    RegValue &= ~0x3FFFFF;
 8011bb6:	ea21ffc0 	movih      	r1, 65472
    RegValue = READ_REG(RCC->CLK_EN);
 8011bba:	9260      	ld.w      	r3, (r2, 0x0)
    RegValue &= ~0x3FFFFF;
 8011bbc:	68c4      	and      	r3, r1
    RegValue |= 0x802;
 8011bbe:	ec630802 	ori      	r3, r3, 2050
    WRITE_REG(RCC->CLK_EN, RegValue);
 8011bc2:	b260      	st.w      	r3, (r2, 0x0)
	WRITE_REG(RCC->BBP_CLK, 0x0F);
 8011bc4:	330f      	movi      	r3, 15
 8011bc6:	b262      	st.w      	r3, (r2, 0x8)
	RegValue = READ_REG(RCC->CLK_DIV);
 8011bc8:	9264      	ld.w      	r3, (r2, 0x10)
	RegValue &= 0xFF000000;
 8011bca:	ea22ff00 	movih      	r2, 65280
 8011bce:	68c8      	and      	r3, r2
	if(cpuDiv > 12)
 8011bd0:	320c      	movi      	r2, 12
 8011bd2:	6408      	cmphs      	r2, r0
	RegValue |= 0x80000000;
 8011bd4:	3bbf      	bseti      	r3, 31
	if(cpuDiv > 12)
 8011bd6:	0c12      	bf      	0x8011bfa	// 8011bfa <SystemClock_Config+0x56>
		bus2Fac = (wlanDiv*4/cpuDiv)&0xFF;
 8011bd8:	c4028022 	divu      	r2, r2, r0
 8011bdc:	4250      	lsli      	r2, r2, 16
 8011bde:	ea010300 	movi      	r1, 768
 8011be2:	6c0c      	or      	r0, r3
 8011be4:	6c08      	or      	r0, r2
	WRITE_REG(RCC->CLK_DIV, RegValue);
 8011be6:	ea234000 	movih      	r3, 16384
 8011bea:	e4630dff 	addi      	r3, r3, 3584
	RegValue |= (bus2Fac<<16) | (wlanDiv<<8) | cpuDiv;
 8011bee:	6c04      	or      	r0, r1
	WRITE_REG(RCC->CLK_DIV, RegValue);
 8011bf0:	b304      	st.w      	r0, (r3, 0x10)
	HAL_InitTick(TICK_INT_PRIORITY);
 8011bf2:	3007      	movi      	r0, 7
 8011bf4:	e3ffffa0 	bsr      	0x8011b34	// 8011b34 <HAL_InitTick>
}
 8011bf8:	1490      	pop      	r15
		wlanDiv = cpuDiv/4;
 8011bfa:	4822      	lsri      	r1, r0, 2
 8011bfc:	4128      	lsli      	r1, r1, 8
 8011bfe:	ea220001 	movih      	r2, 1
 8011c02:	07f0      	br      	0x8011be2	// 8011be2 <SystemClock_Config+0x3e>

08011c04 <HAL_IncTick>:

__attribute__((weak)) void HAL_IncTick(void)
{
	uwTick += 1;
 8011c04:	1043      	lrw      	r2, 0x20001368	// 8011c10 <HAL_IncTick+0xc>
 8011c06:	9260      	ld.w      	r3, (r2, 0x0)
 8011c08:	2300      	addi      	r3, 1
 8011c0a:	b260      	st.w      	r3, (r2, 0x0)
}
 8011c0c:	783c      	jmp      	r15
 8011c0e:	0000      	.short	0x0000
 8011c10:	20001368 	.long	0x20001368

08011c14 <HAL_GetTick>:

__attribute__((weak)) uint32_t HAL_GetTick(void)
{
	return uwTick;
 8011c14:	1062      	lrw      	r3, 0x20001368	// 8011c1c <HAL_GetTick+0x8>
 8011c16:	9300      	ld.w      	r0, (r3, 0x0)
}
 8011c18:	783c      	jmp      	r15
 8011c1a:	0000      	.short	0x0000
 8011c1c:	20001368 	.long	0x20001368

08011c20 <HAL_Delay>:

__attribute__((weak)) void HAL_Delay(uint32_t Delay)
{
 8011c20:	14d2      	push      	r4-r5, r15
 8011c22:	6d43      	mov      	r5, r0
	uint32_t tickstart = HAL_GetTick();
 8011c24:	e3fffff8 	bsr      	0x8011c14	// 8011c14 <HAL_GetTick>
 8011c28:	6d03      	mov      	r4, r0
	uint32_t wait = Delay;

	while ((HAL_GetTick() - tickstart) < wait)
 8011c2a:	e3fffff5 	bsr      	0x8011c14	// 8011c14 <HAL_GetTick>
 8011c2e:	6012      	subu      	r0, r4
 8011c30:	6540      	cmphs      	r0, r5
 8011c32:	0ffc      	bf      	0x8011c2a	// 8011c2a <HAL_Delay+0xa>
	{
	}
}
 8011c34:	1492      	pop      	r4-r5, r15
	...

08011c38 <HAL_NVIC_SetPriority>:

/* Priority: a value between 0 and 15
 * A lower priority value indicates a higher priority */
void HAL_NVIC_SetPriority(IRQn_Type IRQn, uint32_t Priority)
{   
 8011c38:	c4002822 	bclri      	r2, r0, 0
 8011c3c:	3a81      	bclri      	r2, 1
 8011c3e:	106b      	lrw      	r3, 0xe000e100	// 8011c68 <HAL_NVIC_SetPriority+0x30>
 8011c40:	608c      	addu      	r2, r3
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011c42:	e4002003 	andi      	r0, r0, 3
 8011c46:	4003      	lsli      	r0, r0, 3
 8011c48:	33ff      	movi      	r3, 255
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011c4a:	4126      	lsli      	r1, r1, 6
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011c4c:	d98220c0 	ld.w      	r12, (r2, 0x300)
 8011c50:	70c0      	lsl      	r3, r0
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011c52:	e42120ff 	andi      	r1, r1, 255
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011c56:	c46c2043 	andn      	r3, r12, r3
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011c5a:	c4014020 	lsl      	r0, r1, r0
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011c5e:	6cc0      	or      	r3, r0
 8011c60:	dc6220c0 	st.w      	r3, (r2, 0x300)
	NVIC_SetPriority(IRQn, Priority);
}
 8011c64:	783c      	jmp      	r15
 8011c66:	0000      	.short	0x0000
 8011c68:	e000e100 	.long	0xe000e100

08011c6c <HAL_NVIC_EnableIRQ>:
    VIC->ISER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011c6c:	e440201f 	andi      	r2, r0, 31
 8011c70:	3301      	movi      	r3, 1
 8011c72:	c4a054c0 	zext      	r0, r0, 6, 5
 8011c76:	70c8      	lsl      	r3, r2
 8011c78:	4002      	lsli      	r0, r0, 2
 8011c7a:	1044      	lrw      	r2, 0xe000e100	// 8011c88 <HAL_NVIC_EnableIRQ+0x1c>
 8011c7c:	6008      	addu      	r0, r2
 8011c7e:	b060      	st.w      	r3, (r0, 0x0)
    VIC->ISSR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011c80:	dc602050 	st.w      	r3, (r0, 0x140)
	/* Check the parameters */
	assert_param(IS_NVIC_DEVICE_IRQ(IRQn));

	/* Enable interrupt */
	NVIC_EnableIRQ(IRQn);
}
 8011c84:	783c      	jmp      	r15
 8011c86:	0000      	.short	0x0000
 8011c88:	e000e100 	.long	0xe000e100

08011c8c <HAL_Init>:
#include "wm_hal.h"

HAL_StatusTypeDef HAL_Init(void)
{
 8011c8c:	14d0      	push      	r15
	HAL_MspInit();
 8011c8e:	e000005d 	bsr      	0x8011d48	// 8011d48 <HAL_MspInit>
	return HAL_OK;
}
 8011c92:	3000      	movi      	r0, 0
 8011c94:	1490      	pop      	r15
	...

08011c98 <main>:
static void GPIO_Init(void);

static volatile uint8_t key_flag = 0;

int main(void)
{
 8011c98:	14d3      	push      	r4-r6, r15
 8011c9a:	1423      	subi      	r14, r14, 12
	SystemClock_Config(CPU_CLK_160M);
 8011c9c:	3003      	movi      	r0, 3
 8011c9e:	e3ffff83 	bsr      	0x8011ba4	// 8011ba4 <SystemClock_Config>
	printf("enter main\r\n");
 8011ca2:	101f      	lrw      	r0, 0x8013828	// 8011d1c <main+0x84>
 8011ca4:	e3fffde2 	bsr      	0x8011868	// 8011868 <__GI_puts>
	HAL_Init();
 8011ca8:	e3fffff2 	bsr      	0x8011c8c	// 8011c8c <HAL_Init>
    return 0;
}

static void GPIO_Init(void)
{
	GPIO_InitTypeDef GPIO_InitStruct = {0};
 8011cac:	3400      	movi      	r4, 0
	
	__HAL_RCC_GPIO_CLK_ENABLE();
 8011cae:	ea224000 	movih      	r2, 16384
 8011cb2:	e4420dff 	addi      	r2, r2, 3584
	GPIO_InitTypeDef GPIO_InitStruct = {0};
 8011cb6:	b880      	st.w      	r4, (r14, 0x0)
 8011cb8:	b881      	st.w      	r4, (r14, 0x4)
 8011cba:	b882      	st.w      	r4, (r14, 0x8)
	__HAL_RCC_GPIO_CLK_ENABLE();
 8011cbc:	9260      	ld.w      	r3, (r2, 0x0)
 8011cbe:	ec630800 	ori      	r3, r3, 2048
 8011cc2:	b260      	st.w      	r3, (r2, 0x0)

	GPIO_InitStruct.Pin = GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT;
 8011cc4:	3302      	movi      	r3, 2
	GPIO_InitStruct.Pin = GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2;
 8011cc6:	3507      	movi      	r5, 7
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT;
 8011cc8:	b861      	st.w      	r3, (r14, 0x4)
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 8011cca:	6c7b      	mov      	r1, r14
	GPIO_InitStruct.Pull = GPIO_NOPULL;
 8011ccc:	3312      	movi      	r3, 18
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 8011cce:	1015      	lrw      	r0, 0x40011400	// 8011d20 <main+0x88>
	GPIO_InitStruct.Pull = GPIO_NOPULL;
 8011cd0:	b862      	st.w      	r3, (r14, 0x8)
	GPIO_InitStruct.Pin = GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2;
 8011cd2:	b8a0      	st.w      	r5, (r14, 0x0)
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 8011cd4:	e3fffe08 	bsr      	0x80118e4	// 80118e4 <HAL_GPIO_Init>
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2, GPIO_PIN_SET);
 8011cd8:	3201      	movi      	r2, 1
 8011cda:	6c57      	mov      	r1, r5
 8011cdc:	1011      	lrw      	r0, 0x40011400	// 8011d20 <main+0x88>
 8011cde:	e3fffedd 	bsr      	0x8011a98	// 8011a98 <HAL_GPIO_WritePin>
	
	GPIO_InitStruct.Pin = GPIO_PIN_5;
 8011ce2:	3320      	movi      	r3, 32
 8011ce4:	b860      	st.w      	r3, (r14, 0x0)
	GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
 8011ce6:	3388      	movi      	r3, 136
 8011ce8:	b861      	st.w      	r3, (r14, 0x4)
	GPIO_InitStruct.Pull = GPIO_PULLUP;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 8011cea:	6c7b      	mov      	r1, r14
	GPIO_InitStruct.Pull = GPIO_PULLUP;
 8011cec:	3313      	movi      	r3, 19
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 8011cee:	100d      	lrw      	r0, 0x40011400	// 8011d20 <main+0x88>
	GPIO_InitStruct.Pull = GPIO_PULLUP;
 8011cf0:	b862      	st.w      	r3, (r14, 0x8)
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 8011cf2:	e3fffdf9 	bsr      	0x80118e4	// 80118e4 <HAL_GPIO_Init>
	
	HAL_NVIC_SetPriority(GPIOB_IRQn, 0);
 8011cf6:	6c53      	mov      	r1, r4
 8011cf8:	300f      	movi      	r0, 15
 8011cfa:	e3ffff9f 	bsr      	0x8011c38	// 8011c38 <HAL_NVIC_SetPriority>
	HAL_NVIC_EnableIRQ(GPIOB_IRQn);
 8011cfe:	300f      	movi      	r0, 15
 8011d00:	e3ffffb6 	bsr      	0x8011c6c	// 8011c6c <HAL_NVIC_EnableIRQ>
 8011d04:	10c8      	lrw      	r6, 0x20001364	// 8011d24 <main+0x8c>
				HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2);
 8011d06:	10a7      	lrw      	r5, 0x40011400	// 8011d20 <main+0x88>
			HAL_Delay(20);
 8011d08:	3014      	movi      	r0, 20
 8011d0a:	e3ffff8b 	bsr      	0x8011c20	// 8011c20 <HAL_Delay>
				HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2);
 8011d0e:	3107      	movi      	r1, 7
 8011d10:	6c17      	mov      	r0, r5
 8011d12:	e3fffed7 	bsr      	0x8011ac0	// 8011ac0 <HAL_GPIO_TogglePin>
			key_flag = 0;
 8011d16:	a680      	st.b      	r4, (r6, 0x0)
 8011d18:	07f8      	br      	0x8011d08	// 8011d08 <main+0x70>
 8011d1a:	0000      	.short	0x0000
 8011d1c:	08013828 	.long	0x08013828
 8011d20:	40011400 	.long	0x40011400
 8011d24:	20001364 	.long	0x20001364

08011d28 <HAL_GPIO_EXTI_Callback>:

}

void HAL_GPIO_EXTI_Callback(GPIO_TypeDef *GPIOx, uint32_t GPIO_Pin)
{
	if ((GPIOx == GPIOB) && (GPIO_Pin == GPIO_PIN_5))
 8011d28:	1066      	lrw      	r3, 0x40011400	// 8011d40 <HAL_GPIO_EXTI_Callback+0x18>
 8011d2a:	64c2      	cmpne      	r0, r3
 8011d2c:	0c02      	bf      	0x8011d30	// 8011d30 <HAL_GPIO_EXTI_Callback+0x8>
	{
		key_flag = 1;
	}
}
 8011d2e:	783c      	jmp      	r15
	if ((GPIOx == GPIOB) && (GPIO_Pin == GPIO_PIN_5))
 8011d30:	eb410020 	cmpnei      	r1, 32
 8011d34:	0bfd      	bt      	0x8011d2e	// 8011d2e <HAL_GPIO_EXTI_Callback+0x6>
		key_flag = 1;
 8011d36:	1064      	lrw      	r3, 0x20001364	// 8011d44 <HAL_GPIO_EXTI_Callback+0x1c>
 8011d38:	3201      	movi      	r2, 1
 8011d3a:	a340      	st.b      	r2, (r3, 0x0)
}
 8011d3c:	07f9      	br      	0x8011d2e	// 8011d2e <HAL_GPIO_EXTI_Callback+0x6>
 8011d3e:	0000      	.short	0x0000
 8011d40:	40011400 	.long	0x40011400
 8011d44:	20001364 	.long	0x20001364

08011d48 <HAL_MspInit>:
#include "wm_hal.h"

void HAL_MspInit(void)
{

}
 8011d48:	783c      	jmp      	r15
	...

08011d4c <CORET_IRQHandler>:

#include "wm_hal.h"

__attribute__((isr)) void CORET_IRQHandler(void)
{
 8011d4c:	1460      	nie
 8011d4e:	1462      	ipush
 8011d50:	142e      	subi      	r14, r14, 56
 8011d52:	d64e1c2d 	stm      	r18-r31, (r14)
 8011d56:	1428      	subi      	r14, r14, 32
 8011d58:	f4ee3400 	fstms      	fr0-fr7, (r14)
 8011d5c:	14d0      	push      	r15
	uint32_t temp;
	
	temp = (*(volatile unsigned int *) (0xE000E010));
 8011d5e:	1068      	lrw      	r3, 0xe000e000	// 8011d7c <CORET_IRQHandler+0x30>
 8011d60:	9364      	ld.w      	r3, (r3, 0x10)
	HAL_IncTick();
 8011d62:	e3ffff51 	bsr      	0x8011c04	// 8011c04 <HAL_IncTick>
}
 8011d66:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8011d6a:	1401      	addi      	r14, r14, 4
 8011d6c:	f4ee3000 	fldms      	fr0-fr7, (r14)
 8011d70:	1408      	addi      	r14, r14, 32
 8011d72:	d24e1c2d 	ldm      	r18-r31, (r14)
 8011d76:	140e      	addi      	r14, r14, 56
 8011d78:	1463      	ipop
 8011d7a:	1461      	nir
 8011d7c:	e000e000 	.long	0xe000e000

08011d80 <GPIOA_IRQHandler>:

__attribute__((isr)) void GPIOA_IRQHandler(void)
{
 8011d80:	1460      	nie
 8011d82:	1462      	ipush
 8011d84:	142e      	subi      	r14, r14, 56
 8011d86:	d64e1c2d 	stm      	r18-r31, (r14)
 8011d8a:	1428      	subi      	r14, r14, 32
 8011d8c:	f4ee3400 	fstms      	fr0-fr7, (r14)
 8011d90:	14d0      	push      	r15
 	HAL_GPIO_EXTI_IRQHandler(GPIOA, GPIO_PIN_0);
 8011d92:	3101      	movi      	r1, 1
 8011d94:	1007      	lrw      	r0, 0x40011200	// 8011db0 <GPIOA_IRQHandler+0x30>
 8011d96:	e3fffec1 	bsr      	0x8011b18	// 8011b18 <HAL_GPIO_EXTI_IRQHandler>
}
 8011d9a:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8011d9e:	1401      	addi      	r14, r14, 4
 8011da0:	f4ee3000 	fldms      	fr0-fr7, (r14)
 8011da4:	1408      	addi      	r14, r14, 32
 8011da6:	d24e1c2d 	ldm      	r18-r31, (r14)
 8011daa:	140e      	addi      	r14, r14, 56
 8011dac:	1463      	ipop
 8011dae:	1461      	nir
 8011db0:	40011200 	.long	0x40011200

08011db4 <GPIOB_IRQHandler>:

__attribute__((isr)) void GPIOB_IRQHandler(void)
{
 8011db4:	1460      	nie
 8011db6:	1462      	ipush
 8011db8:	142e      	subi      	r14, r14, 56
 8011dba:	d64e1c2d 	stm      	r18-r31, (r14)
 8011dbe:	1428      	subi      	r14, r14, 32
 8011dc0:	f4ee3400 	fstms      	fr0-fr7, (r14)
 8011dc4:	14d0      	push      	r15
	HAL_GPIO_EXTI_IRQHandler(GPIOB, GPIO_PIN_5);
 8011dc6:	3120      	movi      	r1, 32
 8011dc8:	1007      	lrw      	r0, 0x40011400	// 8011de4 <GPIOB_IRQHandler+0x30>
 8011dca:	e3fffea7 	bsr      	0x8011b18	// 8011b18 <HAL_GPIO_EXTI_IRQHandler>
}
 8011dce:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8011dd2:	1401      	addi      	r14, r14, 4
 8011dd4:	f4ee3000 	fldms      	fr0-fr7, (r14)
 8011dd8:	1408      	addi      	r14, r14, 32
 8011dda:	d24e1c2d 	ldm      	r18-r31, (r14)
 8011dde:	140e      	addi      	r14, r14, 56
 8011de0:	1463      	ipop
 8011de2:	1461      	nir
 8011de4:	40011400 	.long	0x40011400

08011de8 <SystemInit>:
  \details Writes the given value to the VBR Register.
  \param [in]    vbr  VBR Register value to set
 */
__ALWAYS_STATIC_INLINE void __set_VBR(uint32_t vbr)
{
    __ASM volatile("mtcr %0, vbr" : : "r"(vbr));
 8011de8:	106a      	lrw      	r3, 0x20000000	// 8011e10 <SystemInit+0x28>
 8011dea:	c0036421 	mtcr      	r3, cr<1, 0>
 */
__ALWAYS_STATIC_INLINE uint32_t __get_CHR(void)
{
    uint32_t result;

    __ASM volatile("mfcr %0, cr<31, 0>\n" :"=r"(result));
 8011dee:	c01f6023 	mfcr      	r3, cr<31, 0>
    __set_Int_SP((uint32_t)&g_top_irqstack);
    __set_CHR(__get_CHR() | CHR_ISE_Msk);
    VIC->TSPR = 0xFF;
#endif

    __set_CHR(__get_CHR() | CHR_IAE_Msk);
 8011df2:	ec630010 	ori      	r3, r3, 16
  \details Assigns the given value to the CHR.
  \param [in]    chr  CHR value to set
 */
__ALWAYS_STATIC_INLINE void __set_CHR(uint32_t chr)
{
    __ASM volatile("mtcr %0, cr<31, 0>\n" : : "r"(chr));
 8011df6:	c003643f 	mtcr      	r3, cr<31, 0>

    /* Clear active and pending IRQ */
    VIC->IABR[0] = 0x0;
 8011dfa:	1047      	lrw      	r2, 0xe000e100	// 8011e14 <SystemInit+0x2c>
 8011dfc:	3300      	movi      	r3, 0
 8011dfe:	dc622080 	st.w      	r3, (r2, 0x200)
    VIC->ICPR[0] = 0xFFFFFFFF;
 8011e02:	2b00      	subi      	r3, 1
 8011e04:	dc622060 	st.w      	r3, (r2, 0x180)
  \details Enables interrupts and exceptions by setting the IE-bit and EE-bit in the PSR.
           Can only be executed in Privileged modes.
 */
__ALWAYS_STATIC_INLINE void __enable_excp_irq(void)
{
    __ASM volatile("psrset ee, ie");
 8011e08:	c1807420 	psrset      	ee, ie

#ifdef CONFIG_KERNEL_NONE
    __enable_excp_irq();
#endif
}
 8011e0c:	783c      	jmp      	r15
 8011e0e:	0000      	.short	0x0000
 8011e10:	20000000 	.long	0x20000000
 8011e14:	e000e100 	.long	0xe000e100

08011e18 <trap_c>:
#include <stdio.h>
#include <stdlib.h>
#include <csi_config.h>

void trap_c(uint32_t *regs)
{
 8011e18:	14d4      	push      	r4-r7, r15
 8011e1a:	6d43      	mov      	r5, r0
    int i;
    uint32_t vec = 0;
    asm volatile(
 8011e1c:	c0006021 	mfcr      	r1, cr<0, 0>
 8011e20:	4930      	lsri      	r1, r1, 16
 8011e22:	7446      	sextb      	r1, r1
        "mfcr    %0, psr \n"
        "lsri    %0, 16 \n"
        "sextb   %0 \n"
        :"=r"(vec):);
    //while (1);
    printf("CPU Exception : %u", vec);
 8011e24:	1018      	lrw      	r0, 0x8013834	// 8011e84 <trap_c+0x6c>
 8011e26:	e0000c4d 	bsr      	0x80136c0	// 80136c0 <wm_printf>
    printf("\n");
 8011e2a:	300a      	movi      	r0, 10
 8011e2c:	e3fffd16 	bsr      	0x8011858	// 8011858 <__GI_putchar>

    for (i = 0; i < 16; i++) {
        printf("r%d: %08x\t", i, regs[i]);
 8011e30:	9540      	ld.w      	r2, (r5, 0x0)
 8011e32:	3100      	movi      	r1, 0
 8011e34:	1015      	lrw      	r0, 0x8013848	// 8011e88 <trap_c+0x70>
 8011e36:	e0000c45 	bsr      	0x80136c0	// 80136c0 <wm_printf>
    for (i = 0; i < 16; i++) {
 8011e3a:	3400      	movi      	r4, 0
        printf("r%d: %08x\t", i, regs[i]);
 8011e3c:	10f3      	lrw      	r7, 0x8013848	// 8011e88 <trap_c+0x70>

        if ((i % 5) == 4) {
 8011e3e:	3605      	movi      	r6, 5
    for (i = 0; i < 16; i++) {
 8011e40:	2400      	addi      	r4, 1
 8011e42:	3c50      	cmpnei      	r4, 16
 8011e44:	0c13      	bf      	0x8011e6a	// 8011e6a <trap_c+0x52>
        printf("r%d: %08x\t", i, regs[i]);
 8011e46:	d0850882 	ldr.w      	r2, (r5, r4 << 2)
 8011e4a:	6c53      	mov      	r1, r4
 8011e4c:	6c1f      	mov      	r0, r7
 8011e4e:	e0000c39 	bsr      	0x80136c0	// 80136c0 <wm_printf>
        if ((i % 5) == 4) {
 8011e52:	c4c48043 	divs      	r3, r4, r6
 8011e56:	7cd8      	mult      	r3, r6
 8011e58:	5c6d      	subu      	r3, r4, r3
 8011e5a:	3b44      	cmpnei      	r3, 4
 8011e5c:	0bf2      	bt      	0x8011e40	// 8011e40 <trap_c+0x28>
            printf("\n");
 8011e5e:	300a      	movi      	r0, 10
    for (i = 0; i < 16; i++) {
 8011e60:	2400      	addi      	r4, 1
            printf("\n");
 8011e62:	e3fffcfb 	bsr      	0x8011858	// 8011858 <__GI_putchar>
    for (i = 0; i < 16; i++) {
 8011e66:	3c50      	cmpnei      	r4, 16
 8011e68:	0bef      	bt      	0x8011e46	// 8011e46 <trap_c+0x2e>
        }
    }

    printf("\n");
 8011e6a:	300a      	movi      	r0, 10
 8011e6c:	e3fffcf6 	bsr      	0x8011858	// 8011858 <__GI_putchar>
    printf("epsr: %8x\n", regs[16]);
 8011e70:	9530      	ld.w      	r1, (r5, 0x40)
 8011e72:	1007      	lrw      	r0, 0x8013854	// 8011e8c <trap_c+0x74>
 8011e74:	e0000c26 	bsr      	0x80136c0	// 80136c0 <wm_printf>
    printf("epc : %8x\n", regs[17]);
 8011e78:	9531      	ld.w      	r1, (r5, 0x44)
 8011e7a:	1006      	lrw      	r0, 0x8013860	// 8011e90 <trap_c+0x78>
 8011e7c:	e0000c22 	bsr      	0x80136c0	// 80136c0 <wm_printf>
 8011e80:	0400      	br      	0x8011e80	// 8011e80 <trap_c+0x68>
 8011e82:	0000      	.short	0x0000
 8011e84:	08013834 	.long	0x08013834
 8011e88:	08013848 	.long	0x08013848
 8011e8c:	08013854 	.long	0x08013854
 8011e90:	08013860 	.long	0x08013860

08011e94 <board_init>:
    VIC->ICER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011e94:	106a      	lrw      	r3, 0xe000e100	// 8011ebc <board_init+0x28>
 8011e96:	ea210001 	movih      	r1, 1
 8011e9a:	dc232020 	st.w      	r1, (r3, 0x80)
    VIC->ICPR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011e9e:	dc232060 	st.w      	r1, (r3, 0x180)

	NVIC_DisableIRQ(UART0_IRQn);
	NVIC_ClearPendingIRQ(UART0_IRQn);

	bd = (APB_CLK/(16*bandrate) - 1)|(((APB_CLK%(bandrate*16))*16/(bandrate*16))<<16);
	WRITE_REG(UART0->BAUDR, bd);
 8011ea2:	1068      	lrw      	r3, 0x40010600	// 8011ec0 <board_init+0x2c>
 8011ea4:	ea21000b 	movih      	r1, 11
 8011ea8:	2113      	addi      	r1, 20
 8011eaa:	b324      	st.w      	r1, (r3, 0x10)
    VIC->ICER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011eac:	3200      	movi      	r2, 0

	WRITE_REG(UART0->LC, UART_BITSTOP_VAL | UART_TXEN_BIT | UART_RXEN_BIT);
 8011eae:	31c3      	movi      	r1, 195
 8011eb0:	b320      	st.w      	r1, (r3, 0x0)
	WRITE_REG(UART0->FC, 0x00);   			/* Disable afc */
 8011eb2:	b341      	st.w      	r2, (r3, 0x4)
	WRITE_REG(UART0->DMAC, 0x00);             		/* Disable DMA */
 8011eb4:	b342      	st.w      	r2, (r3, 0x8)
	WRITE_REG(UART0->FIFOC, 0x00);             		/* one byte TX/RX */
 8011eb6:	b343      	st.w      	r2, (r3, 0xc)
#else
    uart1_io_init();
    /* use uart1 as log output io */
	uart1Init(115200);
#endif
}
 8011eb8:	783c      	jmp      	r15
 8011eba:	0000      	.short	0x0000
 8011ebc:	e000e100 	.long	0xe000e100
 8011ec0:	40010600 	.long	0x40010600

08011ec4 <_out_uart>:
#include "wm_regs.h"
#include "wm_hal.h"

int sendchar(int ch)
{
    while((READ_REG(UART0->FIFOS) & 0x3F) >= 32);
 8011ec4:	1044      	lrw      	r2, 0x40010600	// 8011ed4 <_out_uart+0x10>
 8011ec6:	9267      	ld.w      	r3, (r2, 0x1c)
 8011ec8:	e463203f 	andi      	r3, r3, 63
 8011ecc:	3b1f      	cmphsi      	r3, 32
 8011ece:	0bfc      	bt      	0x8011ec6	// 8011ec6 <_out_uart+0x2>
    WRITE_REG(UART0->TDW, (char)ch);
 8011ed0:	b208      	st.w      	r0, (r2, 0x20)
}

static inline void _out_uart(char character, void* buffer, size_t idx, size_t maxlen)
{
  _write_r(NULL, 0, &character, 1);
}
 8011ed2:	783c      	jmp      	r15
 8011ed4:	40010600 	.long	0x40010600

08011ed8 <_out_null>:

// internal null output
static inline void _out_null(char character, void* buffer, size_t idx, size_t maxlen)
{
  (void)character; (void)buffer; (void)idx; (void)maxlen;
}
 8011ed8:	783c      	jmp      	r15
	...

08011edc <_out_rev>:
  return i;
}

// output the specified string in reverse, taking care of any zero-padding
static size_t _out_rev(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
 8011edc:	ebe00058 	push      	r4-r11, r15, r16-r17
 8011ee0:	6e4f      	mov      	r9, r3
 8011ee2:	da0e200e 	ld.w      	r16, (r14, 0x38)
 8011ee6:	986b      	ld.w      	r3, (r14, 0x2c)
 8011ee8:	c4034831 	lsli      	r17, r3, 0
  const size_t start_idx = idx;

  // pad spaces up to given width
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 8011eec:	e4702003 	andi      	r3, r16, 3
{
 8011ef0:	6dc3      	mov      	r7, r0
 8011ef2:	6e07      	mov      	r8, r1
 8011ef4:	6e8b      	mov      	r10, r2
 8011ef6:	98ac      	ld.w      	r5, (r14, 0x30)
 8011ef8:	d96e200d 	ld.w      	r11, (r14, 0x34)
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 8011efc:	e9230010 	bnez      	r3, 0x8011f1c	// 8011f1c <_out_rev+0x40>
    for (size_t i = len; i < width; i++) {
 8011f00:	66d4      	cmphs      	r5, r11
 8011f02:	080d      	bt      	0x8011f1c	// 8011f1c <_out_rev+0x40>
 8011f04:	c4ab0086 	subu      	r6, r11, r5
 8011f08:	6188      	addu      	r6, r2
      out(' ', buffer, idx++, maxlen);
 8011f0a:	5a82      	addi      	r4, r2, 1
 8011f0c:	6ce7      	mov      	r3, r9
 8011f0e:	6c63      	mov      	r1, r8
 8011f10:	3020      	movi      	r0, 32
 8011f12:	7bdd      	jsr      	r7
    for (size_t i = len; i < width; i++) {
 8011f14:	6592      	cmpne      	r4, r6
 8011f16:	6c93      	mov      	r2, r4
 8011f18:	0bf9      	bt      	0x8011f0a	// 8011f0a <_out_rev+0x2e>
 8011f1a:	0402      	br      	0x8011f1e	// 8011f1e <_out_rev+0x42>
 8011f1c:	6d2b      	mov      	r4, r10
    }
  }

  // reverse string
  while (len) {
 8011f1e:	e905002a 	bez      	r5, 0x8011f72	// 8011f72 <_out_rev+0x96>
 8011f22:	5dc3      	subi      	r6, r5, 1
 8011f24:	c4114823 	lsli      	r3, r17, 0
 8011f28:	60d8      	addu      	r3, r6
 8011f2a:	6d8f      	mov      	r6, r3
 8011f2c:	6150      	addu      	r5, r4
    out(buf[--len], buffer, idx++, maxlen);
 8011f2e:	e6240000 	addi      	r17, r4, 1
 8011f32:	6c93      	mov      	r2, r4
 8011f34:	8600      	ld.b      	r0, (r6, 0x0)
 8011f36:	6ce7      	mov      	r3, r9
 8011f38:	6c63      	mov      	r1, r8
 8011f3a:	c4114824 	lsli      	r4, r17, 0
 8011f3e:	7bdd      	jsr      	r7
  while (len) {
 8011f40:	6552      	cmpne      	r4, r5
 8011f42:	2e00      	subi      	r6, 1
 8011f44:	0bf5      	bt      	0x8011f2e	// 8011f2e <_out_rev+0x52>
  }

  // append pad spaces up to given width
  if (flags & FLAGS_LEFT) {
 8011f46:	e6102002 	andi      	r16, r16, 2
 8011f4a:	e9100011 	bez      	r16, 0x8011f6c	// 8011f6c <_out_rev+0x90>
    while (idx - start_idx < width) {
 8011f4e:	c5450083 	subu      	r3, r5, r10
 8011f52:	66cc      	cmphs      	r3, r11
 8011f54:	080c      	bt      	0x8011f6c	// 8011f6c <_out_rev+0x90>
 8011f56:	6c97      	mov      	r2, r5
      out(' ', buffer, idx++, maxlen);
 8011f58:	2500      	addi      	r5, 1
 8011f5a:	6ce7      	mov      	r3, r9
 8011f5c:	6c63      	mov      	r1, r8
 8011f5e:	3020      	movi      	r0, 32
 8011f60:	7bdd      	jsr      	r7
    while (idx - start_idx < width) {
 8011f62:	c5450083 	subu      	r3, r5, r10
 8011f66:	66cc      	cmphs      	r3, r11
      out(' ', buffer, idx++, maxlen);
 8011f68:	6c97      	mov      	r2, r5
    while (idx - start_idx < width) {
 8011f6a:	0ff7      	bf      	0x8011f58	// 8011f58 <_out_rev+0x7c>
    }
  }

  return idx;
}
 8011f6c:	6c17      	mov      	r0, r5
 8011f6e:	ebc00058 	pop      	r4-r11, r15, r16-r17
  while (len) {
 8011f72:	6d53      	mov      	r5, r4
 8011f74:	07e9      	br      	0x8011f46	// 8011f46 <_out_rev+0x6a>
	...

08011f78 <_ntoa_format>:

// internal itoa format
static size_t _ntoa_format(out_fct_type out, char* buffer, size_t idx, size_t maxlen, char* buf, size_t len, bool negative, unsigned int base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8011f78:	14d1      	push      	r4, r15
 8011f7a:	1424      	subi      	r14, r14, 16
 8011f7c:	d9ae2009 	ld.w      	r13, (r14, 0x24)
 8011f80:	da8e200c 	ld.w      	r20, (r14, 0x30)
 8011f84:	c40d4839 	lsli      	r25, r13, 0
  // pad leading zeros
  if (!(flags & FLAGS_LEFT)) {
 8011f88:	e5b42002 	andi      	r13, r20, 2
{
 8011f8c:	dace2006 	ld.w      	r22, (r14, 0x18)
 8011f90:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 8011f94:	da6e200a 	ld.w      	r19, (r14, 0x28)
 8011f98:	da4e200b 	ld.w      	r18, (r14, 0x2c)
 8011f9c:	daee0020 	ld.b      	r23, (r14, 0x20)
  if (!(flags & FLAGS_LEFT)) {
 8011fa0:	e92d0039 	bnez      	r13, 0x8012012	// 8012012 <_ntoa_format+0x9a>
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8011fa4:	e9320071 	bnez      	r18, 0x8012086	// 8012086 <_ntoa_format+0x10e>
      width--;
    }
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011fa8:	c66c0420 	cmphs      	r12, r19
 8011fac:	0833      	bt      	0x8012012	// 8012012 <_ntoa_format+0x9a>
 8011fae:	eb0c001f 	cmphsi      	r12, 32
 8011fb2:	e7142001 	andi      	r24, r20, 1
 8011fb6:	082e      	bt      	0x8012012	// 8012012 <_ntoa_format+0x9a>
 8011fb8:	c596002d 	addu      	r13, r22, r12
      buf[len++] = '0';
 8011fbc:	ea150030 	movi      	r21, 48
 8011fc0:	0406      	br      	0x8011fcc	// 8011fcc <_ntoa_format+0x54>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011fc2:	eb4c0020 	cmpnei      	r12, 32
 8011fc6:	e5ad0000 	addi      	r13, r13, 1
 8011fca:	0c08      	bf      	0x8011fda	// 8011fda <_ntoa_format+0x62>
      buf[len++] = '0';
 8011fcc:	e58c0000 	addi      	r12, r12, 1
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011fd0:	c66c0420 	cmphs      	r12, r19
      buf[len++] = '0';
 8011fd4:	dead0000 	st.b      	r21, (r13, 0x0)
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011fd8:	0ff5      	bf      	0x8011fc2	// 8011fc2 <_ntoa_format+0x4a>
    }
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011fda:	e918001c 	bez      	r24, 0x8012012	// 8012012 <_ntoa_format+0x9a>
 8011fde:	c64c0420 	cmphs      	r12, r18
 8011fe2:	0818      	bt      	0x8012012	// 8012012 <_ntoa_format+0x9a>
 8011fe4:	ea0d001f 	movi      	r13, 31
 8011fe8:	6734      	cmphs      	r13, r12
 8011fea:	0c62      	bf      	0x80120ae	// 80120ae <_ntoa_format+0x136>
 8011fec:	c596002d 	addu      	r13, r22, r12
      buf[len++] = '0';
 8011ff0:	ea150030 	movi      	r21, 48
 8011ff4:	0406      	br      	0x8012000	// 8012000 <_ntoa_format+0x88>
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011ff6:	eb4c0020 	cmpnei      	r12, 32
 8011ffa:	e5ad0000 	addi      	r13, r13, 1
 8011ffe:	0c58      	bf      	0x80120ae	// 80120ae <_ntoa_format+0x136>
      buf[len++] = '0';
 8012000:	e58c0000 	addi      	r12, r12, 1
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8012004:	c64c0480 	cmpne      	r12, r18
      buf[len++] = '0';
 8012008:	dead0000 	st.b      	r21, (r13, 0x0)
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 801200c:	0bf5      	bt      	0x8011ff6	// 8011ff6 <_ntoa_format+0x7e>
      buf[len++] = '0';
 801200e:	c40c4832 	lsli      	r18, r12, 0
    }
  }

  // handle hash
  if (flags & FLAGS_HASH) {
 8012012:	e5b42010 	andi      	r13, r20, 16
 8012016:	e90d0019 	bez      	r13, 0x8012048	// 8012048 <_ntoa_format+0xd0>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 801201a:	e5b42400 	andi      	r13, r20, 1024
 801201e:	e92d0004 	bnez      	r13, 0x8012026	// 8012026 <_ntoa_format+0xae>
 8012022:	e92c004e 	bnez      	r12, 0x80120be	// 80120be <_ntoa_format+0x146>
      len--;
      if (len && (base == 16U)) {
        len--;
      }
    }
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8012026:	c4194824 	lsli      	r4, r25, 0
 801202a:	3c50      	cmpnei      	r4, 16
 801202c:	0c74      	bf      	0x8012114	// 8012114 <_ntoa_format+0x19c>
      buf[len++] = 'x';
    }
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
      buf[len++] = 'X';
    }
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 801202e:	c4194824 	lsli      	r4, r25, 0
 8012032:	3c42      	cmpnei      	r4, 2
 8012034:	0c7e      	bf      	0x8012130	// 8012130 <_ntoa_format+0x1b8>
      buf[len++] = 'b';
    }
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
 8012036:	eb0c001f 	cmphsi      	r12, 32
 801203a:	081a      	bt      	0x801206e	// 801206e <_ntoa_format+0xf6>
      buf[len++] = '0';
 801203c:	ea0d0030 	movi      	r13, 48
 8012040:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8012044:	e58c0000 	addi      	r12, r12, 1
    }
  }

  if (len < PRINTF_NTOA_BUFFER_SIZE) {
 8012048:	eb0c001f 	cmphsi      	r12, 32
 801204c:	0811      	bt      	0x801206e	// 801206e <_ntoa_format+0xf6>
    if (negative) {
 801204e:	e9370048 	bnez      	r23, 0x80120de	// 80120de <_ntoa_format+0x166>
      buf[len++] = '-';
    }
    else if (flags & FLAGS_PLUS) {
 8012052:	e5b42004 	andi      	r13, r20, 4
 8012056:	e92d0056 	bnez      	r13, 0x8012102	// 8012102 <_ntoa_format+0x18a>
      buf[len++] = '+';  // ignore the space if the '+' exists
    }
    else if (flags & FLAGS_SPACE) {
 801205a:	e5b42008 	andi      	r13, r20, 8
 801205e:	e90d0008 	bez      	r13, 0x801206e	// 801206e <_ntoa_format+0xf6>
      buf[len++] = ' ';
 8012062:	ea0d0020 	movi      	r13, 32
 8012066:	d596002d 	str.b      	r13, (r22, r12 << 0)
 801206a:	e58c0000 	addi      	r12, r12, 1
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 801206e:	de8e2003 	st.w      	r20, (r14, 0xc)
 8012072:	de4e2002 	st.w      	r18, (r14, 0x8)
 8012076:	dd8e2001 	st.w      	r12, (r14, 0x4)
 801207a:	dece2000 	st.w      	r22, (r14, 0x0)
 801207e:	e3ffff2f 	bsr      	0x8011edc	// 8011edc <_out_rev>
}
 8012082:	1404      	addi      	r14, r14, 16
 8012084:	1491      	pop      	r4, r15
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8012086:	e7142001 	andi      	r24, r20, 1
 801208a:	e9180031 	bez      	r24, 0x80120ec	// 80120ec <_ntoa_format+0x174>
 801208e:	e9370037 	bnez      	r23, 0x80120fc	// 80120fc <_ntoa_format+0x184>
 8012092:	e5b4200c 	andi      	r13, r20, 12
 8012096:	e92d0033 	bnez      	r13, 0x80120fc	// 80120fc <_ntoa_format+0x184>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 801209a:	c66c0420 	cmphs      	r12, r19
 801209e:	0ba0      	bt      	0x8011fde	// 8011fde <_ntoa_format+0x66>
 80120a0:	ea0d001f 	movi      	r13, 31
 80120a4:	6734      	cmphs      	r13, r12
 80120a6:	0b89      	bt      	0x8011fb8	// 8011fb8 <_ntoa_format+0x40>
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80120a8:	c64c0420 	cmphs      	r12, r18
 80120ac:	0bb3      	bt      	0x8012012	// 8012012 <_ntoa_format+0x9a>
  if (flags & FLAGS_HASH) {
 80120ae:	e5b42010 	andi      	r13, r20, 16
 80120b2:	e90dffde 	bez      	r13, 0x801206e	// 801206e <_ntoa_format+0xf6>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 80120b6:	e5b42400 	andi      	r13, r20, 1024
 80120ba:	e92dffb6 	bnez      	r13, 0x8012026	// 8012026 <_ntoa_format+0xae>
 80120be:	c5930480 	cmpne      	r19, r12
 80120c2:	0c04      	bf      	0x80120ca	// 80120ca <_ntoa_format+0x152>
 80120c4:	c64c0480 	cmpne      	r12, r18
 80120c8:	0baf      	bt      	0x8012026	// 8012026 <_ntoa_format+0xae>
      len--;
 80120ca:	e5ac1000 	subi      	r13, r12, 1
      if (len && (base == 16U)) {
 80120ce:	e90d0046 	bez      	r13, 0x801215a	// 801215a <_ntoa_format+0x1e2>
 80120d2:	c4194824 	lsli      	r4, r25, 0
 80120d6:	3c50      	cmpnei      	r4, 16
 80120d8:	0c1c      	bf      	0x8012110	// 8012110 <_ntoa_format+0x198>
 80120da:	6f37      	mov      	r12, r13
 80120dc:	07a9      	br      	0x801202e	// 801202e <_ntoa_format+0xb6>
      buf[len++] = '-';
 80120de:	ea0d002d 	movi      	r13, 45
 80120e2:	d596002d 	str.b      	r13, (r22, r12 << 0)
 80120e6:	e58c0000 	addi      	r12, r12, 1
 80120ea:	07c2      	br      	0x801206e	// 801206e <_ntoa_format+0xf6>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80120ec:	c66c0420 	cmphs      	r12, r19
 80120f0:	0b91      	bt      	0x8012012	// 8012012 <_ntoa_format+0x9a>
 80120f2:	ea0d001f 	movi      	r13, 31
 80120f6:	6734      	cmphs      	r13, r12
 80120f8:	0b60      	bt      	0x8011fb8	// 8011fb8 <_ntoa_format+0x40>
 80120fa:	078c      	br      	0x8012012	// 8012012 <_ntoa_format+0x9a>
      width--;
 80120fc:	e6521000 	subi      	r18, r18, 1
 8012100:	07cd      	br      	0x801209a	// 801209a <_ntoa_format+0x122>
      buf[len++] = '+';  // ignore the space if the '+' exists
 8012102:	ea0d002b 	movi      	r13, 43
 8012106:	d596002d 	str.b      	r13, (r22, r12 << 0)
 801210a:	e58c0000 	addi      	r12, r12, 1
 801210e:	07b0      	br      	0x801206e	// 801206e <_ntoa_format+0xf6>
        len--;
 8012110:	e58c1001 	subi      	r12, r12, 2
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8012114:	e5b42020 	andi      	r13, r20, 32
 8012118:	e92d0016 	bnez      	r13, 0x8012144	// 8012144 <_ntoa_format+0x1cc>
 801211c:	eb0c001f 	cmphsi      	r12, 32
 8012120:	0ba7      	bt      	0x801206e	// 801206e <_ntoa_format+0xf6>
      buf[len++] = 'x';
 8012122:	ea0d0078 	movi      	r13, 120
 8012126:	d596002d 	str.b      	r13, (r22, r12 << 0)
 801212a:	e58c0000 	addi      	r12, r12, 1
 801212e:	0784      	br      	0x8012036	// 8012036 <_ntoa_format+0xbe>
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8012130:	eb0c001f 	cmphsi      	r12, 32
 8012134:	0b9d      	bt      	0x801206e	// 801206e <_ntoa_format+0xf6>
      buf[len++] = 'b';
 8012136:	ea0d0062 	movi      	r13, 98
 801213a:	d596002d 	str.b      	r13, (r22, r12 << 0)
 801213e:	e58c0000 	addi      	r12, r12, 1
 8012142:	077a      	br      	0x8012036	// 8012036 <_ntoa_format+0xbe>
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8012144:	ea0d001f 	movi      	r13, 31
 8012148:	6734      	cmphs      	r13, r12
 801214a:	0f92      	bf      	0x801206e	// 801206e <_ntoa_format+0xf6>
      buf[len++] = 'X';
 801214c:	ea0d0058 	movi      	r13, 88
 8012150:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8012154:	e58c0000 	addi      	r12, r12, 1
 8012158:	076f      	br      	0x8012036	// 8012036 <_ntoa_format+0xbe>
 801215a:	6f37      	mov      	r12, r13
 801215c:	0765      	br      	0x8012026	// 8012026 <_ntoa_format+0xae>
	...

08012160 <_ntoa_long>:


// internal itoa for 'long' type
static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8012160:	14d3      	push      	r4-r6, r15
 8012162:	142f      	subi      	r14, r14, 60
 8012164:	d9ae2016 	ld.w      	r13, (r14, 0x58)
 8012168:	d98e2013 	ld.w      	r12, (r14, 0x4c)
 801216c:	6d77      	mov      	r5, r13
 801216e:	d9ae2017 	ld.w      	r13, (r14, 0x5c)
 8012172:	da8e2015 	ld.w      	r20, (r14, 0x54)
 8012176:	6db7      	mov      	r6, r13
 8012178:	db0e2018 	ld.w      	r24, (r14, 0x60)
 801217c:	d88e0050 	ld.b      	r4, (r14, 0x50)
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;

  // no hash for 0 values
  if (!value) {
 8012180:	e92c000a 	bnez      	r12, 0x8012194	// 8012194 <_ntoa_long+0x34>
    flags &= ~FLAGS_HASH;
 8012184:	c498282d 	bclri      	r13, r24, 4
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
 8012188:	e7182400 	andi      	r24, r24, 1024
 801218c:	e9380043 	bnez      	r24, 0x8012212	// 8012212 <_ntoa_long+0xb2>
    flags &= ~FLAGS_HASH;
 8012190:	c40d4838 	lsli      	r24, r13, 0
    do {
      const char digit = (char)(value % base);
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8012194:	e5b82020 	andi      	r13, r24, 32
 8012198:	eb4d0000 	cmpnei      	r13, 0
 801219c:	ea170041 	movi      	r23, 65
 80121a0:	ea0d0061 	movi      	r13, 97
 80121a4:	c6ed0c20 	incf      	r23, r13, 0
 80121a8:	e72e001b 	addi      	r25, r14, 28
 80121ac:	c4194832 	lsli      	r18, r25, 0
 80121b0:	ea150000 	movi      	r21, 0
 80121b4:	e6f71009 	subi      	r23, r23, 10
 80121b8:	ea130020 	movi      	r19, 32
      const char digit = (char)(value % base);
 80121bc:	c68c802d 	divu      	r13, r12, r20
 80121c0:	c68d8436 	mult      	r22, r13, r20
 80121c4:	c6cc008c 	subu      	r12, r12, r22
 80121c8:	7730      	zextb      	r12, r12
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 80121ca:	eb0c0009 	cmphsi      	r12, 10
 80121ce:	e6b50000 	addi      	r21, r21, 1
 80121d2:	081c      	bt      	0x801220a	// 801220a <_ntoa_long+0xaa>
 80121d4:	e58c002f 	addi      	r12, r12, 48
 80121d8:	7730      	zextb      	r12, r12
 80121da:	dd920000 	st.b      	r12, (r18, 0x0)
      value /= base;
 80121de:	6f37      	mov      	r12, r13
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 80121e0:	e90d0006 	bez      	r13, 0x80121ec	// 80121ec <_ntoa_long+0x8c>
 80121e4:	e6520000 	addi      	r18, r18, 1
 80121e8:	e833ffea 	bnezad      	r19, 0x80121bc	// 80121bc <_ntoa_long+0x5c>
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 80121ec:	df0e2006 	st.w      	r24, (r14, 0x18)
 80121f0:	b8c5      	st.w      	r6, (r14, 0x14)
 80121f2:	b8a4      	st.w      	r5, (r14, 0x10)
 80121f4:	de8e2003 	st.w      	r20, (r14, 0xc)
 80121f8:	b882      	st.w      	r4, (r14, 0x8)
 80121fa:	deae2001 	st.w      	r21, (r14, 0x4)
 80121fe:	df2e2000 	st.w      	r25, (r14, 0x0)
 8012202:	e3fffebb 	bsr      	0x8011f78	// 8011f78 <_ntoa_format>
}
 8012206:	140f      	addi      	r14, r14, 60
 8012208:	1493      	pop      	r4-r6, r15
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 801220a:	c6ec002c 	addu      	r12, r12, r23
 801220e:	7730      	zextb      	r12, r12
 8012210:	07e5      	br      	0x80121da	// 80121da <_ntoa_long+0x7a>
    flags &= ~FLAGS_HASH;
 8012212:	c40d4838 	lsli      	r24, r13, 0
  size_t len = 0U;
 8012216:	c40c4835 	lsli      	r21, r12, 0
 801221a:	e72e001b 	addi      	r25, r14, 28
 801221e:	07e7      	br      	0x80121ec	// 80121ec <_ntoa_long+0x8c>

08012220 <_ntoa_long_long>:


// internal itoa for 'long long' type
#if defined(PRINTF_SUPPORT_LONG_LONG)
static size_t _ntoa_long_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long long value, bool negative, unsigned long long base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8012220:	ebe00058 	push      	r4-r11, r15, r16-r17
 8012224:	1435      	subi      	r14, r14, 84
 8012226:	c4034831 	lsli      	r17, r3, 0
 801222a:	d96e2020 	ld.w      	r11, (r14, 0x80)
 801222e:	9965      	ld.w      	r3, (r14, 0x94)
 8012230:	da0e2021 	ld.w      	r16, (r14, 0x84)
 8012234:	b86b      	st.w      	r3, (r14, 0x2c)
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;

  // no hash for 0 values
  if (!value) {
 8012236:	c60b2424 	or      	r4, r11, r16
{
 801223a:	9966      	ld.w      	r3, (r14, 0x98)
 801223c:	b86c      	st.w      	r3, (r14, 0x30)
 801223e:	d86e0088 	ld.b      	r3, (r14, 0x88)
 8012242:	b807      	st.w      	r0, (r14, 0x1c)
 8012244:	b828      	st.w      	r1, (r14, 0x20)
 8012246:	b849      	st.w      	r2, (r14, 0x24)
 8012248:	99c3      	ld.w      	r6, (r14, 0x8c)
 801224a:	99e4      	ld.w      	r7, (r14, 0x90)
 801224c:	d94e2027 	ld.w      	r10, (r14, 0x9c)
 8012250:	b86a      	st.w      	r3, (r14, 0x28)
  if (!value) {
 8012252:	e9240009 	bnez      	r4, 0x8012264	// 8012264 <_ntoa_long_long+0x44>
    flags &= ~FLAGS_HASH;
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
 8012256:	e44a2400 	andi      	r2, r10, 1024
    flags &= ~FLAGS_HASH;
 801225a:	c48a2823 	bclri      	r3, r10, 4
 801225e:	6e8f      	mov      	r10, r3
  if (!(flags & FLAGS_PRECISION) || value) {
 8012260:	e9220033 	bnez      	r2, 0x80122c6	// 80122c6 <_ntoa_long_long+0xa6>
    do {
      const char digit = (char)(value % base);
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8012264:	e46a2020 	andi      	r3, r10, 32
 8012268:	3b40      	cmpnei      	r3, 0
 801226a:	ea080041 	movi      	r8, 65
 801226e:	3361      	movi      	r3, 97
 8012270:	c5030c20 	incf      	r8, r3, 0
 8012274:	e52e0033 	addi      	r9, r14, 52
 8012278:	6d67      	mov      	r5, r9
 801227a:	3400      	movi      	r4, 0
 801227c:	e5081009 	subi      	r8, r8, 10
 8012280:	0415      	br      	0x80122aa	// 80122aa <_ntoa_long_long+0x8a>
 8012282:	202f      	addi      	r0, 48
 8012284:	7400      	zextb      	r0, r0
 8012286:	a500      	st.b      	r0, (r5, 0x0)
      value /= base;
 8012288:	c4104821 	lsli      	r1, r16, 0
 801228c:	6c2f      	mov      	r0, r11
 801228e:	6c9b      	mov      	r2, r6
 8012290:	6cdf      	mov      	r3, r7
 8012292:	e3fff1c1 	bsr      	0x8010614	// 8010614 <__udivdi3>
 8012296:	c4014830 	lsli      	r16, r1, 0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 801229a:	6c40      	or      	r1, r0
      value /= base;
 801229c:	6ec3      	mov      	r11, r0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 801229e:	e9010016 	bez      	r1, 0x80122ca	// 80122ca <_ntoa_long_long+0xaa>
 80122a2:	eb440020 	cmpnei      	r4, 32
 80122a6:	2500      	addi      	r5, 1
 80122a8:	0c11      	bf      	0x80122ca	// 80122ca <_ntoa_long_long+0xaa>
      const char digit = (char)(value % base);
 80122aa:	6c9b      	mov      	r2, r6
 80122ac:	6cdf      	mov      	r3, r7
 80122ae:	6c2f      	mov      	r0, r11
 80122b0:	c4104821 	lsli      	r1, r16, 0
 80122b4:	e3fff34a 	bsr      	0x8010948	// 8010948 <__umoddi3>
 80122b8:	7400      	zextb      	r0, r0
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 80122ba:	3809      	cmphsi      	r0, 10
 80122bc:	2400      	addi      	r4, 1
 80122be:	0fe2      	bf      	0x8012282	// 8012282 <_ntoa_long_long+0x62>
 80122c0:	6020      	addu      	r0, r8
 80122c2:	7400      	zextb      	r0, r0
 80122c4:	07e1      	br      	0x8012286	// 8012286 <_ntoa_long_long+0x66>
 80122c6:	e52e0033 	addi      	r9, r14, 52
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 80122ca:	986c      	ld.w      	r3, (r14, 0x30)
 80122cc:	b865      	st.w      	r3, (r14, 0x14)
 80122ce:	986b      	ld.w      	r3, (r14, 0x2c)
 80122d0:	b864      	st.w      	r3, (r14, 0x10)
 80122d2:	986a      	ld.w      	r3, (r14, 0x28)
 80122d4:	b862      	st.w      	r3, (r14, 0x8)
 80122d6:	dd4e2006 	st.w      	r10, (r14, 0x18)
 80122da:	b8c3      	st.w      	r6, (r14, 0xc)
 80122dc:	b881      	st.w      	r4, (r14, 0x4)
 80122de:	dd2e2000 	st.w      	r9, (r14, 0x0)
 80122e2:	c4114823 	lsli      	r3, r17, 0
 80122e6:	9849      	ld.w      	r2, (r14, 0x24)
 80122e8:	9828      	ld.w      	r1, (r14, 0x20)
 80122ea:	9807      	ld.w      	r0, (r14, 0x1c)
 80122ec:	e3fffe46 	bsr      	0x8011f78	// 8011f78 <_ntoa_format>
}
 80122f0:	1415      	addi      	r14, r14, 84
 80122f2:	ebc00058 	pop      	r4-r11, r15, r16-r17
	...

080122f8 <_ftoa>:
#endif


// internal ftoa for fixed decimal floating point
static size_t _ftoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
 80122f8:	ebe00058 	push      	r4-r11, r15, r16-r17
 80122fc:	1435      	subi      	r14, r14, 84
 80122fe:	6ecf      	mov      	r11, r3
 8012300:	9962      	ld.w      	r3, (r14, 0x88)
 8012302:	6e4f      	mov      	r9, r3
 8012304:	9963      	ld.w      	r3, (r14, 0x8c)
 8012306:	9980      	ld.w      	r4, (r14, 0x80)
 8012308:	99a1      	ld.w      	r5, (r14, 0x84)
 801230a:	b865      	st.w      	r3, (r14, 0x14)
 801230c:	9964      	ld.w      	r3, (r14, 0x90)
 801230e:	6d83      	mov      	r6, r0
 8012310:	6dc7      	mov      	r7, r1
 8012312:	6e8b      	mov      	r10, r2
 8012314:	b866      	st.w      	r3, (r14, 0x18)

  // powers of 10
  static const double pow10[] = { 1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000 };

  // test for special values
  if (value != value)
 8012316:	6c93      	mov      	r2, r4
 8012318:	6cd7      	mov      	r3, r5
 801231a:	6c13      	mov      	r0, r4
 801231c:	6c57      	mov      	r1, r5
 801231e:	e3fff7cb 	bsr      	0x80112b4	// 80112b4 <__nedf2>
 8012322:	e920010c 	bnez      	r0, 0x801253a	// 801253a <_ftoa+0x242>
    return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
  if (value < -DBL_MAX)
 8012326:	3200      	movi      	r2, 0
 8012328:	ea23fff0 	movih      	r3, 65520
 801232c:	2a00      	subi      	r2, 1
 801232e:	2b00      	subi      	r3, 1
 8012330:	6c13      	mov      	r0, r4
 8012332:	9921      	ld.w      	r1, (r14, 0x84)
 8012334:	e3fff81c 	bsr      	0x801136c	// 801136c <__ltdf2>
 8012338:	e980011b 	blz      	r0, 0x801256e	// 801256e <_ftoa+0x276>
    return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
  if (value > DBL_MAX)
 801233c:	3200      	movi      	r2, 0
 801233e:	ea237ff0 	movih      	r3, 32752
 8012342:	2a00      	subi      	r2, 1
 8012344:	2b00      	subi      	r3, 1
 8012346:	6c13      	mov      	r0, r4
 8012348:	9921      	ld.w      	r1, (r14, 0x84)
 801234a:	e3fff7d1 	bsr      	0x80112ec	// 80112ec <__gtdf2>
 801234e:	e960001d 	blsz      	r0, 0x8012388	// 8012388 <_ftoa+0x90>
    return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
 8012352:	9806      	ld.w      	r0, (r14, 0x18)
 8012354:	e4402004 	andi      	r2, r0, 4
 8012358:	3a40      	cmpnei      	r2, 0
 801235a:	0137      	lrw      	r1, 0x8013a54	// 8012678 <_ftoa+0x380>
 801235c:	0177      	lrw      	r3, 0x8013a4c	// 801267c <_ftoa+0x384>
 801235e:	c4610c20 	incf      	r3, r1, 0
 8012362:	3a40      	cmpnei      	r2, 0
 8012364:	3103      	movi      	r1, 3
 8012366:	3204      	movi      	r2, 4
 8012368:	c4410c20 	incf      	r2, r1, 0
 801236c:	9825      	ld.w      	r1, (r14, 0x14)
 801236e:	b803      	st.w      	r0, (r14, 0xc)
 8012370:	b822      	st.w      	r1, (r14, 0x8)
 8012372:	b841      	st.w      	r2, (r14, 0x4)
 8012374:	b860      	st.w      	r3, (r14, 0x0)
    else if (flags & FLAGS_SPACE) {
      buf[len++] = ' ';
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 8012376:	6cef      	mov      	r3, r11
 8012378:	6cab      	mov      	r2, r10
 801237a:	6c5f      	mov      	r1, r7
 801237c:	6c1b      	mov      	r0, r6
 801237e:	e3fffdaf 	bsr      	0x8011edc	// 8011edc <_out_rev>
}
 8012382:	1415      	addi      	r14, r14, 84
 8012384:	ebc00058 	pop      	r4-r11, r15, r16-r17
  if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
 8012388:	3200      	movi      	r2, 0
 801238a:	0261      	lrw      	r3, 0x41cdcd65	// 8012680 <_ftoa+0x388>
 801238c:	6c13      	mov      	r0, r4
 801238e:	9921      	ld.w      	r1, (r14, 0x84)
 8012390:	e3fff7ae 	bsr      	0x80112ec	// 80112ec <__gtdf2>
 8012394:	e94000dc 	bhz      	r0, 0x801254c	// 801254c <_ftoa+0x254>
 8012398:	3200      	movi      	r2, 0
 801239a:	0264      	lrw      	r3, 0xc1cdcd65	// 8012684 <_ftoa+0x38c>
 801239c:	6c13      	mov      	r0, r4
 801239e:	9921      	ld.w      	r1, (r14, 0x84)
 80123a0:	e3fff7e6 	bsr      	0x801136c	// 801136c <__ltdf2>
 80123a4:	e98000d4 	blz      	r0, 0x801254c	// 801254c <_ftoa+0x254>
  if (value < 0) {
 80123a8:	3200      	movi      	r2, 0
 80123aa:	6ccb      	mov      	r3, r2
 80123ac:	6c13      	mov      	r0, r4
 80123ae:	9921      	ld.w      	r1, (r14, 0x84)
 80123b0:	e3fff7de 	bsr      	0x801136c	// 801136c <__ltdf2>
 80123b4:	e98001b0 	blz      	r0, 0x8012714	// 8012714 <_ftoa+0x41c>
  bool negative = false;
 80123b8:	3300      	movi      	r3, 0
 80123ba:	b86c      	st.w      	r3, (r14, 0x30)
  if (!(flags & FLAGS_PRECISION)) {
 80123bc:	9866      	ld.w      	r3, (r14, 0x18)
 80123be:	e5a32400 	andi      	r13, r3, 1024
 80123c2:	e92d0136 	bnez      	r13, 0x801262e	// 801262e <_ftoa+0x336>
 80123c6:	026e      	lrw      	r3, 0x412e8480	// 8012688 <_ftoa+0x390>
 80123c8:	ddae2007 	st.w      	r13, (r14, 0x1c)
 80123cc:	b868      	st.w      	r3, (r14, 0x20)
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 80123ce:	ea080006 	movi      	r8, 6
 80123d2:	e68e0033 	addi      	r20, r14, 52
  int whole = (int)value;
 80123d6:	6c57      	mov      	r1, r5
 80123d8:	6c13      	mov      	r0, r4
 80123da:	de8e200b 	st.w      	r20, (r14, 0x2c)
 80123de:	ddae200a 	st.w      	r13, (r14, 0x28)
 80123e2:	e3fff815 	bsr      	0x801140c	// 801140c <__fixdfsi>
 80123e6:	6e43      	mov      	r9, r0
  double tmp = (value - whole) * pow10[prec];
 80123e8:	e3fff7de 	bsr      	0x80113a4	// 80113a4 <__floatsidf>
 80123ec:	6c83      	mov      	r2, r0
 80123ee:	6cc7      	mov      	r3, r1
 80123f0:	6c13      	mov      	r0, r4
 80123f2:	6c57      	mov      	r1, r5
 80123f4:	e3fff5b6 	bsr      	0x8010f60	// 8010f60 <__subdf3>
 80123f8:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 80123fc:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 8012400:	6cb3      	mov      	r2, r12
 8012402:	9868      	ld.w      	r3, (r14, 0x20)
 8012404:	e3fff5cc 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
 8012408:	c4014831 	lsli      	r17, r1, 0
 801240c:	c4004830 	lsli      	r16, r0, 0
  unsigned long frac = (unsigned long)tmp;
 8012410:	e3fff0e6 	bsr      	0x80105dc	// 80105dc <__fixunsdfsi>
 8012414:	b809      	st.w      	r0, (r14, 0x24)
  diff = tmp - frac;
 8012416:	e3fff833 	bsr      	0x801147c	// 801147c <__floatunsidf>
 801241a:	6c83      	mov      	r2, r0
 801241c:	6cc7      	mov      	r3, r1
 801241e:	c4104820 	lsli      	r0, r16, 0
 8012422:	c4114821 	lsli      	r1, r17, 0
 8012426:	e3fff59d 	bsr      	0x8010f60	// 8010f60 <__subdf3>
  if (diff > 0.5) {
 801242a:	3200      	movi      	r2, 0
 801242c:	ea233fe0 	movih      	r3, 16352
  diff = tmp - frac;
 8012430:	c4004830 	lsli      	r16, r0, 0
 8012434:	c4014831 	lsli      	r17, r1, 0
  if (diff > 0.5) {
 8012438:	e3fff75a 	bsr      	0x80112ec	// 80112ec <__gtdf2>
 801243c:	da4e2009 	ld.w      	r18, (r14, 0x24)
 8012440:	d9ae200a 	ld.w      	r13, (r14, 0x28)
 8012444:	da8e200b 	ld.w      	r20, (r14, 0x2c)
 8012448:	e96000d3 	blsz      	r0, 0x80125ee	// 80125ee <_ftoa+0x2f6>
    ++frac;
 801244c:	e6520000 	addi      	r18, r18, 1
    if (frac >= pow10[prec]) {
 8012450:	c4124820 	lsli      	r0, r18, 0
 8012454:	de8e2009 	st.w      	r20, (r14, 0x24)
 8012458:	c40d4831 	lsli      	r17, r13, 0
 801245c:	c4124830 	lsli      	r16, r18, 0
 8012460:	e3fff80e 	bsr      	0x801147c	// 801147c <__floatunsidf>
 8012464:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 8012468:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 801246c:	6cf7      	mov      	r3, r13
 801246e:	6cb3      	mov      	r2, r12
 8012470:	e3fff75e 	bsr      	0x801132c	// 801132c <__gedf2>
 8012474:	c4104832 	lsli      	r18, r16, 0
 8012478:	c411482d 	lsli      	r13, r17, 0
 801247c:	da8e2009 	ld.w      	r20, (r14, 0x24)
 8012480:	e9a0011f 	bhsz      	r0, 0x80126be	// 80126be <_ftoa+0x3c6>
  if (prec == 0U) {
 8012484:	e928007e 	bnez      	r8, 0x8012580	// 8012580 <_ftoa+0x288>
    diff = value - (double)whole;
 8012488:	6c27      	mov      	r0, r9
 801248a:	c4144831 	lsli      	r17, r20, 0
 801248e:	c40d4830 	lsli      	r16, r13, 0
 8012492:	e3fff789 	bsr      	0x80113a4	// 80113a4 <__floatsidf>
 8012496:	6c83      	mov      	r2, r0
 8012498:	6cc7      	mov      	r3, r1
 801249a:	6c13      	mov      	r0, r4
 801249c:	6c57      	mov      	r1, r5
 801249e:	e3fff561 	bsr      	0x8010f60	// 8010f60 <__subdf3>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 80124a2:	6ca3      	mov      	r2, r8
 80124a4:	ea233fe0 	movih      	r3, 16352
    diff = value - (double)whole;
 80124a8:	6d03      	mov      	r4, r0
 80124aa:	6d47      	mov      	r5, r1
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 80124ac:	e3fff760 	bsr      	0x801136c	// 801136c <__ltdf2>
 80124b0:	c410482d 	lsli      	r13, r16, 0
 80124b4:	c4114834 	lsli      	r20, r17, 0
 80124b8:	e98000f5 	blz      	r0, 0x80126a2	// 80126a2 <_ftoa+0x3aa>
 80124bc:	e4692001 	andi      	r3, r9, 1
      ++whole;
 80124c0:	3b40      	cmpnei      	r3, 0
 80124c2:	c4690c20 	incf      	r3, r9, 0
 80124c6:	c4690c41 	inct      	r3, r9, 1
 80124ca:	6e4f      	mov      	r9, r3
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 80124cc:	eb4d0020 	cmpnei      	r13, 32
 80124d0:	0c81      	bf      	0x80125d2	// 80125d2 <_ftoa+0x2da>
    buf[len++] = (char)(48 + (whole % 10));
 80124d2:	300a      	movi      	r0, 10
 80124d4:	c4098043 	divs      	r3, r9, r0
 80124d8:	6d27      	mov      	r4, r9
 80124da:	c4038421 	mult      	r1, r3, r0
 80124de:	5c25      	subu      	r1, r4, r1
 80124e0:	212f      	addi      	r1, 48
 80124e2:	e44d0000 	addi      	r2, r13, 1
 80124e6:	d5b40021 	str.b      	r1, (r20, r13 << 0)
    if (!(whole /= 10)) {
 80124ea:	e9030013 	bez      	r3, 0x8012510	// 8012510 <_ftoa+0x218>
 80124ee:	c454002c 	addu      	r12, r20, r2
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 80124f2:	eb420020 	cmpnei      	r2, 32
 80124f6:	0c6e      	bf      	0x80125d2	// 80125d2 <_ftoa+0x2da>
    buf[len++] = (char)(48 + (whole % 10));
 80124f8:	c4038041 	divs      	r1, r3, r0
 80124fc:	c401842d 	mult      	r13, r1, r0
 8012500:	60f6      	subu      	r3, r13
 8012502:	232f      	addi      	r3, 48
 8012504:	d40c8003 	stbi.b      	r3, (r12)
 8012508:	2200      	addi      	r2, 1
    if (!(whole /= 10)) {
 801250a:	6cc7      	mov      	r3, r1
 801250c:	e921fff3 	bnez      	r1, 0x80124f2	// 80124f2 <_ftoa+0x1fa>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 8012510:	9866      	ld.w      	r3, (r14, 0x18)
 8012512:	e4632003 	andi      	r3, r3, 3
 8012516:	3b41      	cmpnei      	r3, 1
 8012518:	0cda      	bf      	0x80126cc	// 80126cc <_ftoa+0x3d4>
  if (len < PRINTF_FTOA_BUFFER_SIZE) {
 801251a:	eb420020 	cmpnei      	r2, 32
 801251e:	0d27      	bf      	0x801276c	// 801276c <_ftoa+0x474>
    if (negative) {
 8012520:	986c      	ld.w      	r3, (r14, 0x30)
 8012522:	e92300bb 	bnez      	r3, 0x8012698	// 8012698 <_ftoa+0x3a0>
    else if (flags & FLAGS_PLUS) {
 8012526:	9866      	ld.w      	r3, (r14, 0x18)
 8012528:	e4632004 	andi      	r3, r3, 4
 801252c:	e9030116 	bez      	r3, 0x8012758	// 8012758 <_ftoa+0x460>
      buf[len++] = '+';  // ignore the space if the '+' exists
 8012530:	312b      	movi      	r1, 43
 8012532:	5a62      	addi      	r3, r2, 1
 8012534:	d4540021 	str.b      	r1, (r20, r2 << 0)
 8012538:	0453      	br      	0x80125de	// 80125de <_ftoa+0x2e6>
    return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
 801253a:	9866      	ld.w      	r3, (r14, 0x18)
 801253c:	b863      	st.w      	r3, (r14, 0xc)
 801253e:	9865      	ld.w      	r3, (r14, 0x14)
 8012540:	b862      	st.w      	r3, (r14, 0x8)
 8012542:	3303      	movi      	r3, 3
 8012544:	b861      	st.w      	r3, (r14, 0x4)
 8012546:	1272      	lrw      	r3, 0x8013a58	// 801268c <_ftoa+0x394>
 8012548:	b860      	st.w      	r3, (r14, 0x0)
 801254a:	0716      	br      	0x8012376	// 8012376 <_ftoa+0x7e>
    return _etoa(out, buffer, idx, maxlen, value, prec, width, flags);
 801254c:	9866      	ld.w      	r3, (r14, 0x18)
 801254e:	b864      	st.w      	r3, (r14, 0x10)
 8012550:	9865      	ld.w      	r3, (r14, 0x14)
 8012552:	b863      	st.w      	r3, (r14, 0xc)
 8012554:	dd2e2002 	st.w      	r9, (r14, 0x8)
 8012558:	b880      	st.w      	r4, (r14, 0x0)
 801255a:	b8a1      	st.w      	r5, (r14, 0x4)
 801255c:	6cef      	mov      	r3, r11
 801255e:	6cab      	mov      	r2, r10
 8012560:	6c5f      	mov      	r1, r7
 8012562:	6c1b      	mov      	r0, r6
 8012564:	e0000116 	bsr      	0x8012790	// 8012790 <_etoa>
}
 8012568:	1415      	addi      	r14, r14, 84
 801256a:	ebc00058 	pop      	r4-r11, r15, r16-r17
    return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
 801256e:	9866      	ld.w      	r3, (r14, 0x18)
 8012570:	b863      	st.w      	r3, (r14, 0xc)
 8012572:	9865      	ld.w      	r3, (r14, 0x14)
 8012574:	b862      	st.w      	r3, (r14, 0x8)
 8012576:	3304      	movi      	r3, 4
 8012578:	b861      	st.w      	r3, (r14, 0x4)
 801257a:	1266      	lrw      	r3, 0x8013a5c	// 8012690 <_ftoa+0x398>
 801257c:	b860      	st.w      	r3, (r14, 0x0)
 801257e:	06fc      	br      	0x8012376	// 8012376 <_ftoa+0x7e>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8012580:	eb4d0020 	cmpnei      	r13, 32
 8012584:	0c27      	bf      	0x80125d2	// 80125d2 <_ftoa+0x2da>
      buf[len++] = (char)(48U + (frac % 10U));
 8012586:	300a      	movi      	r0, 10
 8012588:	c4128023 	divu      	r3, r18, r0
 801258c:	c4038421 	mult      	r1, r3, r0
 8012590:	c4320092 	subu      	r18, r18, r1
 8012594:	e652002f 	addi      	r18, r18, 48
      --count;
 8012598:	e5881000 	subi      	r12, r8, 1
      buf[len++] = (char)(48U + (frac % 10U));
 801259c:	e44d0000 	addi      	r2, r13, 1
 80125a0:	d5b40032 	str.b      	r18, (r20, r13 << 0)
      if (!(frac /= 10U)) {
 80125a4:	e90300c3 	bez      	r3, 0x801272a	// 801272a <_ftoa+0x432>
 80125a8:	c454002d 	addu      	r13, r20, r2
 80125ac:	0410      	br      	0x80125cc	// 80125cc <_ftoa+0x2d4>
      buf[len++] = (char)(48U + (frac % 10U));
 80125ae:	c4038021 	divu      	r1, r3, r0
 80125b2:	c4018432 	mult      	r18, r1, r0
 80125b6:	c6430083 	subu      	r3, r3, r18
 80125ba:	232f      	addi      	r3, 48
 80125bc:	d40d8003 	stbi.b      	r3, (r13)
      --count;
 80125c0:	e58c1000 	subi      	r12, r12, 1
      buf[len++] = (char)(48U + (frac % 10U));
 80125c4:	2200      	addi      	r2, 1
      if (!(frac /= 10U)) {
 80125c6:	6cc7      	mov      	r3, r1
 80125c8:	e90100b1 	bez      	r1, 0x801272a	// 801272a <_ftoa+0x432>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 80125cc:	eb420020 	cmpnei      	r2, 32
 80125d0:	0bef      	bt      	0x80125ae	// 80125ae <_ftoa+0x2b6>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 80125d2:	9866      	ld.w      	r3, (r14, 0x18)
 80125d4:	e4632003 	andi      	r3, r3, 3
 80125d8:	3b41      	cmpnei      	r3, 1
 80125da:	0c78      	bf      	0x80126ca	// 80126ca <_ftoa+0x3d2>
 80125dc:	3320      	movi      	r3, 32
  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 80125de:	9846      	ld.w      	r2, (r14, 0x18)
 80125e0:	b843      	st.w      	r2, (r14, 0xc)
 80125e2:	9845      	ld.w      	r2, (r14, 0x14)
 80125e4:	b842      	st.w      	r2, (r14, 0x8)
 80125e6:	b861      	st.w      	r3, (r14, 0x4)
 80125e8:	de8e2000 	st.w      	r20, (r14, 0x0)
 80125ec:	06c5      	br      	0x8012376	// 8012376 <_ftoa+0x7e>
  else if (diff < 0.5) {
 80125ee:	3200      	movi      	r2, 0
 80125f0:	ea233fe0 	movih      	r3, 16352
 80125f4:	c4104820 	lsli      	r0, r16, 0
 80125f8:	c4114821 	lsli      	r1, r17, 0
 80125fc:	de8e200a 	st.w      	r20, (r14, 0x28)
 8012600:	de4e2009 	st.w      	r18, (r14, 0x24)
 8012604:	ddae2007 	st.w      	r13, (r14, 0x1c)
 8012608:	e3fff6b2 	bsr      	0x801136c	// 801136c <__ltdf2>
 801260c:	d9ae2007 	ld.w      	r13, (r14, 0x1c)
 8012610:	da4e2009 	ld.w      	r18, (r14, 0x24)
 8012614:	da8e200a 	ld.w      	r20, (r14, 0x28)
 8012618:	e980ff36 	blz      	r0, 0x8012484	// 8012484 <_ftoa+0x18c>
  else if ((frac == 0U) || (frac & 1U)) {
 801261c:	e9120006 	bez      	r18, 0x8012628	// 8012628 <_ftoa+0x330>
 8012620:	e4722001 	andi      	r3, r18, 1
 8012624:	e903ff30 	bez      	r3, 0x8012484	// 8012484 <_ftoa+0x18c>
    ++frac;
 8012628:	e6520000 	addi      	r18, r18, 1
 801262c:	072c      	br      	0x8012484	// 8012484 <_ftoa+0x18c>
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 801262e:	6ce7      	mov      	r3, r9
 8012630:	3b09      	cmphsi      	r3, 10
 8012632:	0c9f      	bf      	0x8012770	// 8012770 <_ftoa+0x478>
    buf[len++] = '0';
 8012634:	e68e0033 	addi      	r20, r14, 52
 8012638:	3030      	movi      	r0, 48
 801263a:	dc140000 	st.b      	r0, (r20, 0x0)
    prec--;
 801263e:	e5091000 	subi      	r8, r9, 1
 8012642:	e44e0034 	addi      	r2, r14, 53
 8012646:	e4291008 	subi      	r1, r9, 9
 801264a:	ea0d0001 	movi      	r13, 1
    buf[len++] = '0';
 801264e:	331f      	movi      	r3, 31
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8012650:	6476      	cmpne      	r13, r1
 8012652:	0c09      	bf      	0x8012664	// 8012664 <_ftoa+0x36c>
    buf[len++] = '0';
 8012654:	e5ad0000 	addi      	r13, r13, 1
 8012658:	d4028000 	stbi.b      	r0, (r2)
    prec--;
 801265c:	e5081000 	subi      	r8, r8, 1
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8012660:	e823fff8 	bnezad      	r3, 0x8012650	// 8012650 <_ftoa+0x358>
 8012664:	104c      	lrw      	r2, 0x8013a64	// 8012694 <_ftoa+0x39c>
 8012666:	c4684823 	lsli      	r3, r8, 3
 801266a:	60c8      	addu      	r3, r2
 801266c:	9340      	ld.w      	r2, (r3, 0x0)
 801266e:	9361      	ld.w      	r3, (r3, 0x4)
 8012670:	b847      	st.w      	r2, (r14, 0x1c)
 8012672:	b868      	st.w      	r3, (r14, 0x20)
 8012674:	06b1      	br      	0x80123d6	// 80123d6 <_ftoa+0xde>
 8012676:	0000      	.short	0x0000
 8012678:	08013a54 	.long	0x08013a54
 801267c:	08013a4c 	.long	0x08013a4c
 8012680:	41cdcd65 	.long	0x41cdcd65
 8012684:	c1cdcd65 	.long	0xc1cdcd65
 8012688:	412e8480 	.long	0x412e8480
 801268c:	08013a58 	.long	0x08013a58
 8012690:	08013a5c 	.long	0x08013a5c
 8012694:	08013a64 	.long	0x08013a64
      buf[len++] = '-';
 8012698:	312d      	movi      	r1, 45
 801269a:	5a62      	addi      	r3, r2, 1
 801269c:	d4540021 	str.b      	r1, (r20, r2 << 0)
 80126a0:	079f      	br      	0x80125de	// 80125de <_ftoa+0x2e6>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 80126a2:	6ca3      	mov      	r2, r8
 80126a4:	ea233fe0 	movih      	r3, 16352
 80126a8:	6c13      	mov      	r0, r4
 80126aa:	6c57      	mov      	r1, r5
 80126ac:	e3fff620 	bsr      	0x80112ec	// 80112ec <__gtdf2>
 80126b0:	c410482d 	lsli      	r13, r16, 0
 80126b4:	c4114834 	lsli      	r20, r17, 0
 80126b8:	e960ff0a 	blsz      	r0, 0x80124cc	// 80124cc <_ftoa+0x1d4>
 80126bc:	0700      	br      	0x80124bc	// 80124bc <_ftoa+0x1c4>
      ++whole;
 80126be:	6ce7      	mov      	r3, r9
 80126c0:	2300      	addi      	r3, 1
 80126c2:	6e4f      	mov      	r9, r3
      frac = 0;
 80126c4:	ea120000 	movi      	r18, 0
 80126c8:	06de      	br      	0x8012484	// 8012484 <_ftoa+0x18c>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 80126ca:	3220      	movi      	r2, 32
    if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 80126cc:	9865      	ld.w      	r3, (r14, 0x14)
 80126ce:	e903ff26 	bez      	r3, 0x801251a	// 801251a <_ftoa+0x222>
 80126d2:	986c      	ld.w      	r3, (r14, 0x30)
 80126d4:	e9230007 	bnez      	r3, 0x80126e2	// 80126e2 <_ftoa+0x3ea>
 80126d8:	9866      	ld.w      	r3, (r14, 0x18)
 80126da:	e463200c 	andi      	r3, r3, 12
 80126de:	e9030005 	bez      	r3, 0x80126e8	// 80126e8 <_ftoa+0x3f0>
      width--;
 80126e2:	9865      	ld.w      	r3, (r14, 0x14)
 80126e4:	2b00      	subi      	r3, 1
 80126e6:	b865      	st.w      	r3, (r14, 0x14)
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 80126e8:	9865      	ld.w      	r3, (r14, 0x14)
 80126ea:	64c8      	cmphs      	r2, r3
 80126ec:	0b17      	bt      	0x801251a	// 801251a <_ftoa+0x222>
 80126ee:	eb420020 	cmpnei      	r2, 32
 80126f2:	0c3d      	bf      	0x801276c	// 801276c <_ftoa+0x474>
 80126f4:	c4540021 	addu      	r1, r20, r2
 80126f8:	6ccb      	mov      	r3, r2
      buf[len++] = '0';
 80126fa:	3230      	movi      	r2, 48
 80126fc:	0405      	br      	0x8012706	// 8012706 <_ftoa+0x40e>
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 80126fe:	eb430020 	cmpnei      	r3, 32
 8012702:	2100      	addi      	r1, 1
 8012704:	0f6d      	bf      	0x80125de	// 80125de <_ftoa+0x2e6>
      buf[len++] = '0';
 8012706:	2300      	addi      	r3, 1
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 8012708:	9805      	ld.w      	r0, (r14, 0x14)
 801270a:	640e      	cmpne      	r3, r0
      buf[len++] = '0';
 801270c:	a140      	st.b      	r2, (r1, 0x0)
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 801270e:	0bf8      	bt      	0x80126fe	// 80126fe <_ftoa+0x406>
      buf[len++] = '0';
 8012710:	9845      	ld.w      	r2, (r14, 0x14)
 8012712:	0704      	br      	0x801251a	// 801251a <_ftoa+0x222>
    value = 0 - value;
 8012714:	6c93      	mov      	r2, r4
 8012716:	9961      	ld.w      	r3, (r14, 0x84)
 8012718:	3000      	movi      	r0, 0
 801271a:	3100      	movi      	r1, 0
 801271c:	e3fff422 	bsr      	0x8010f60	// 8010f60 <__subdf3>
    negative = true;
 8012720:	3301      	movi      	r3, 1
    value = 0 - value;
 8012722:	6d03      	mov      	r4, r0
 8012724:	6d47      	mov      	r5, r1
    negative = true;
 8012726:	b86c      	st.w      	r3, (r14, 0x30)
 8012728:	064a      	br      	0x80123bc	// 80123bc <_ftoa+0xc4>
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 801272a:	eb420020 	cmpnei      	r2, 32
 801272e:	0f52      	bf      	0x80125d2	// 80125d2 <_ftoa+0x2da>
 8012730:	e90c000e 	bez      	r12, 0x801274c	// 801274c <_ftoa+0x454>
 8012734:	c4540023 	addu      	r3, r20, r2
 8012738:	6308      	addu      	r12, r2
      buf[len++] = '0';
 801273a:	3130      	movi      	r1, 48
 801273c:	2200      	addi      	r2, 1
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 801273e:	eb420020 	cmpnei      	r2, 32
      buf[len++] = '0';
 8012742:	a320      	st.b      	r1, (r3, 0x0)
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 8012744:	0f47      	bf      	0x80125d2	// 80125d2 <_ftoa+0x2da>
 8012746:	670a      	cmpne      	r2, r12
 8012748:	2300      	addi      	r3, 1
 801274a:	0bf9      	bt      	0x801273c	// 801273c <_ftoa+0x444>
      buf[len++] = '.';
 801274c:	332e      	movi      	r3, 46
 801274e:	e5a20000 	addi      	r13, r2, 1
 8012752:	d4540023 	str.b      	r3, (r20, r2 << 0)
 8012756:	06bb      	br      	0x80124cc	// 80124cc <_ftoa+0x1d4>
    else if (flags & FLAGS_SPACE) {
 8012758:	9866      	ld.w      	r3, (r14, 0x18)
 801275a:	e4632008 	andi      	r3, r3, 8
 801275e:	e9030007 	bez      	r3, 0x801276c	// 801276c <_ftoa+0x474>
      buf[len++] = ' ';
 8012762:	3120      	movi      	r1, 32
 8012764:	5a62      	addi      	r3, r2, 1
 8012766:	d4540021 	str.b      	r1, (r20, r2 << 0)
 801276a:	073a      	br      	0x80125de	// 80125de <_ftoa+0x2e6>
    else if (flags & FLAGS_SPACE) {
 801276c:	6ccb      	mov      	r3, r2
 801276e:	0738      	br      	0x80125de	// 80125de <_ftoa+0x2e6>
 8012770:	1047      	lrw      	r2, 0x8013a64	// 801278c <_ftoa+0x494>
 8012772:	4363      	lsli      	r3, r3, 3
 8012774:	60c8      	addu      	r3, r2
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8012776:	6e27      	mov      	r8, r9
 8012778:	9340      	ld.w      	r2, (r3, 0x0)
 801277a:	9361      	ld.w      	r3, (r3, 0x4)
 801277c:	b847      	st.w      	r2, (r14, 0x1c)
 801277e:	b868      	st.w      	r3, (r14, 0x20)
 8012780:	ea0d0000 	movi      	r13, 0
 8012784:	e68e0033 	addi      	r20, r14, 52
 8012788:	0627      	br      	0x80123d6	// 80123d6 <_ftoa+0xde>
 801278a:	0000      	.short	0x0000
 801278c:	08013a64 	.long	0x08013a64

08012790 <_etoa>:


#if defined(PRINTF_SUPPORT_EXPONENTIAL)
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
 8012790:	ebe00058 	push      	r4-r11, r15, r16-r17
 8012794:	1434      	subi      	r14, r14, 80
 8012796:	6e0f      	mov      	r8, r3
 8012798:	9961      	ld.w      	r3, (r14, 0x84)
 801279a:	b867      	st.w      	r3, (r14, 0x1c)
 801279c:	9962      	ld.w      	r3, (r14, 0x88)
 801279e:	98bf      	ld.w      	r5, (r14, 0x7c)
 80127a0:	9980      	ld.w      	r4, (r14, 0x80)
 80127a2:	b868      	st.w      	r3, (r14, 0x20)
 80127a4:	9963      	ld.w      	r3, (r14, 0x8c)
 80127a6:	b866      	st.w      	r3, (r14, 0x18)
 80127a8:	6d83      	mov      	r6, r0
 80127aa:	6dc7      	mov      	r7, r1
 80127ac:	6ecb      	mov      	r11, r2
  // check for NaN and special values
  if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
 80127ae:	6cd3      	mov      	r3, r4
 80127b0:	6c97      	mov      	r2, r5
 80127b2:	6c17      	mov      	r0, r5
 80127b4:	6c53      	mov      	r1, r4
 80127b6:	e3fff57f 	bsr      	0x80112b4	// 80112b4 <__nedf2>
 80127ba:	6e43      	mov      	r9, r0
 80127bc:	e92001d7 	bnez      	r0, 0x8012b6a	// 8012b6a <_etoa+0x3da>
 80127c0:	3200      	movi      	r2, 0
 80127c2:	ea237ff0 	movih      	r3, 32752
 80127c6:	2a00      	subi      	r2, 1
 80127c8:	2b00      	subi      	r3, 1
 80127ca:	6c17      	mov      	r0, r5
 80127cc:	6c53      	mov      	r1, r4
 80127ce:	e3fff58f 	bsr      	0x80112ec	// 80112ec <__gtdf2>
 80127d2:	e94001cc 	bhz      	r0, 0x8012b6a	// 8012b6a <_etoa+0x3da>
 80127d6:	3200      	movi      	r2, 0
 80127d8:	ea23fff0 	movih      	r3, 65520
 80127dc:	2a00      	subi      	r2, 1
 80127de:	2b00      	subi      	r3, 1
 80127e0:	6c17      	mov      	r0, r5
 80127e2:	6c53      	mov      	r1, r4
 80127e4:	e3fff5c4 	bsr      	0x801136c	// 801136c <__ltdf2>
 80127e8:	e98001c1 	blz      	r0, 0x8012b6a	// 8012b6a <_etoa+0x3da>
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
  }

  // determine the sign
  const bool negative = value < 0;
  if (negative) {
 80127ec:	6ca7      	mov      	r2, r9
 80127ee:	6ce7      	mov      	r3, r9
 80127f0:	6c17      	mov      	r0, r5
 80127f2:	6c53      	mov      	r1, r4
 80127f4:	e3fff5bc 	bsr      	0x801136c	// 801136c <__ltdf2>
    value = -value;
 80127f8:	6e97      	mov      	r10, r5
  if (negative) {
 80127fa:	e9800208 	blz      	r0, 0x8012c0a	// 8012c0a <_etoa+0x47a>
 80127fe:	6e53      	mov      	r9, r4
  }

  // default precision
  if (!(flags & FLAGS_PRECISION)) {
 8012800:	9866      	ld.w      	r3, (r14, 0x18)
 8012802:	e4632400 	andi      	r3, r3, 1024
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8012806:	3b40      	cmpnei      	r3, 0
 8012808:	9847      	ld.w      	r2, (r14, 0x1c)
  if (!(flags & FLAGS_PRECISION)) {
 801280a:	b873      	st.w      	r3, (r14, 0x4c)
    uint64_t U;
    double   F;
  } conv;

  conv.F = value;
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 801280c:	c68957c0 	zext      	r0, r9, 30, 20
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8012810:	3306      	movi      	r3, 6
 8012812:	c4430c20 	incf      	r2, r3, 0
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
  // now approximate log10 from the log2 integer part and an expansion of ln around 1.5
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8012816:	e40013fe 	subi      	r0, r0, 1023
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 801281a:	b847      	st.w      	r2, (r14, 0x1c)
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 801281c:	dd4e200a 	st.w      	r10, (r14, 0x28)
 8012820:	dd2e2009 	st.w      	r9, (r14, 0x24)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8012824:	e3fff5c0 	bsr      	0x80113a4	// 80113a4 <__floatsidf>
 8012828:	0145      	lrw      	r2, 0x509f79fb	// 8012b90 <_etoa+0x400>
 801282a:	0164      	lrw      	r3, 0x3fd34413	// 8012b94 <_etoa+0x404>
 801282c:	e3fff3b8 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
 8012830:	0145      	lrw      	r2, 0x8b60c8b3	// 8012b98 <_etoa+0x408>
 8012832:	0164      	lrw      	r3, 0x3fc68a28	// 8012b9c <_etoa+0x40c>
 8012834:	e3fff37e 	bsr      	0x8010f30	// 8010f30 <__adddf3>
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 8012838:	d98e200a 	ld.w      	r12, (r14, 0x28)
 801283c:	da6e2009 	ld.w      	r19, (r14, 0x24)
 8012840:	c40c4836 	lsli      	r22, r12, 0
 8012844:	c4135677 	zext      	r23, r19, 19, 0
 8012848:	ea140000 	movi      	r20, 0
 801284c:	ea353ff0 	movih      	r21, 16368
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8012850:	c4004831 	lsli      	r17, r0, 0
 8012854:	c4014830 	lsli      	r16, r1, 0
 8012858:	3200      	movi      	r2, 0
 801285a:	c6962420 	or      	r0, r22, r20
 801285e:	c6b72421 	or      	r1, r23, r21
 8012862:	ea233ff8 	movih      	r3, 16376
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 8012866:	dd8e2012 	st.w      	r12, (r14, 0x48)
 801286a:	de6e2011 	st.w      	r19, (r14, 0x44)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 801286e:	de8e200f 	st.w      	r20, (r14, 0x3c)
 8012872:	deae2010 	st.w      	r21, (r14, 0x40)
 8012876:	e3fff375 	bsr      	0x8010f60	// 8010f60 <__subdf3>
 801287a:	0155      	lrw      	r2, 0x636f4361	// 8012ba0 <_etoa+0x410>
 801287c:	0175      	lrw      	r3, 0x3fd287a7	// 8012ba4 <_etoa+0x414>
 801287e:	e3fff38f 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
 8012882:	6c83      	mov      	r2, r0
 8012884:	6cc7      	mov      	r3, r1
 8012886:	c4114820 	lsli      	r0, r17, 0
 801288a:	c4104821 	lsli      	r1, r16, 0
 801288e:	e3fff351 	bsr      	0x8010f30	// 8010f30 <__adddf3>
 8012892:	e3fff5bd 	bsr      	0x801140c	// 801140c <__fixdfsi>
 8012896:	b809      	st.w      	r0, (r14, 0x24)
  // now we want to compute 10^expval but we want to be sure it won't overflow
  exp2 = (int)(expval * 3.321928094887362 + 0.5);
 8012898:	e3fff586 	bsr      	0x80113a4	// 80113a4 <__floatsidf>
 801289c:	015c      	lrw      	r2, 0x979a371	// 8012ba8 <_etoa+0x418>
 801289e:	017b      	lrw      	r3, 0x400a934f	// 8012bac <_etoa+0x41c>
 80128a0:	c4004831 	lsli      	r17, r0, 0
 80128a4:	c4014830 	lsli      	r16, r1, 0
 80128a8:	e3fff37a 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
 80128ac:	3200      	movi      	r2, 0
 80128ae:	ea233fe0 	movih      	r3, 16352
 80128b2:	e3fff33f 	bsr      	0x8010f30	// 8010f30 <__adddf3>
 80128b6:	e3fff5ab 	bsr      	0x801140c	// 801140c <__fixdfsi>
 80128ba:	b80a      	st.w      	r0, (r14, 0x28)
  const double z  = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
 80128bc:	0242      	lrw      	r2, 0xbbb55516	// 8012bb0 <_etoa+0x420>
 80128be:	0261      	lrw      	r3, 0x40026bb1	// 8012bb4 <_etoa+0x424>
 80128c0:	c4114820 	lsli      	r0, r17, 0
 80128c4:	c4104821 	lsli      	r1, r16, 0
 80128c8:	e3fff36a 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
 80128cc:	c4004831 	lsli      	r17, r0, 0
 80128d0:	980a      	ld.w      	r0, (r14, 0x28)
 80128d2:	c4014830 	lsli      	r16, r1, 0
 80128d6:	e3fff567 	bsr      	0x80113a4	// 80113a4 <__floatsidf>
 80128da:	0247      	lrw      	r2, 0xfefa39ef	// 8012bb8 <_etoa+0x428>
 80128dc:	0267      	lrw      	r3, 0x3fe62e42	// 8012bbc <_etoa+0x42c>
 80128de:	e3fff35f 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
 80128e2:	6c83      	mov      	r2, r0
 80128e4:	6cc7      	mov      	r3, r1
 80128e6:	c4114820 	lsli      	r0, r17, 0
 80128ea:	c4104821 	lsli      	r1, r16, 0
 80128ee:	e3fff339 	bsr      	0x8010f60	// 8010f60 <__subdf3>
  const double z2 = z * z;
 80128f2:	6c83      	mov      	r2, r0
 80128f4:	6cc7      	mov      	r3, r1
 80128f6:	b80c      	st.w      	r0, (r14, 0x30)
 80128f8:	b82b      	st.w      	r1, (r14, 0x2c)
 80128fa:	e3fff351 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
  // compute exp(z) using continued fractions, see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 80128fe:	da4e200c 	ld.w      	r18, (r14, 0x30)
 8012902:	d9ae200b 	ld.w      	r13, (r14, 0x2c)
 8012906:	c4124822 	lsli      	r2, r18, 0
 801290a:	6cf7      	mov      	r3, r13
  const double z2 = z * z;
 801290c:	c4004831 	lsli      	r17, r0, 0
 8012910:	c4014830 	lsli      	r16, r1, 0
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8012914:	c4124820 	lsli      	r0, r18, 0
 8012918:	6c77      	mov      	r1, r13
 801291a:	de4e200e 	st.w      	r18, (r14, 0x38)
 801291e:	ddae200d 	st.w      	r13, (r14, 0x34)
 8012922:	e3fff307 	bsr      	0x8010f30	// 8010f30 <__adddf3>
 8012926:	b80c      	st.w      	r0, (r14, 0x30)
 8012928:	b82b      	st.w      	r1, (r14, 0x2c)
 801292a:	3200      	movi      	r2, 0
 801292c:	ea23402c 	movih      	r3, 16428
 8012930:	c4114820 	lsli      	r0, r17, 0
 8012934:	c4104821 	lsli      	r1, r16, 0
 8012938:	e3fff432 	bsr      	0x801119c	// 801119c <__divdf3>
 801293c:	3200      	movi      	r2, 0
 801293e:	ea234024 	movih      	r3, 16420
 8012942:	e3fff2f7 	bsr      	0x8010f30	// 8010f30 <__adddf3>
 8012946:	6c83      	mov      	r2, r0
 8012948:	6cc7      	mov      	r3, r1
 801294a:	c4114820 	lsli      	r0, r17, 0
 801294e:	c4104821 	lsli      	r1, r16, 0
 8012952:	e3fff425 	bsr      	0x801119c	// 801119c <__divdf3>
 8012956:	3200      	movi      	r2, 0
 8012958:	ea234018 	movih      	r3, 16408
 801295c:	e3fff2ea 	bsr      	0x8010f30	// 8010f30 <__adddf3>
 8012960:	6c83      	mov      	r2, r0
 8012962:	6cc7      	mov      	r3, r1
 8012964:	c4114820 	lsli      	r0, r17, 0
 8012968:	c4104821 	lsli      	r1, r16, 0
 801296c:	e3fff418 	bsr      	0x801119c	// 801119c <__divdf3>
 8012970:	da4e200e 	ld.w      	r18, (r14, 0x38)
 8012974:	d9ae200d 	ld.w      	r13, (r14, 0x34)
 8012978:	c4124822 	lsli      	r2, r18, 0
 801297c:	6cf7      	mov      	r3, r13
 801297e:	c4004831 	lsli      	r17, r0, 0
 8012982:	c4014830 	lsli      	r16, r1, 0
 8012986:	3000      	movi      	r0, 0
 8012988:	ea214000 	movih      	r1, 16384
 801298c:	e3fff2ea 	bsr      	0x8010f60	// 8010f60 <__subdf3>
 8012990:	6c83      	mov      	r2, r0
 8012992:	6cc7      	mov      	r3, r1
 8012994:	c4114820 	lsli      	r0, r17, 0
 8012998:	c4104821 	lsli      	r1, r16, 0
 801299c:	e3fff2ca 	bsr      	0x8010f30	// 8010f30 <__adddf3>
 80129a0:	daee200c 	ld.w      	r23, (r14, 0x30)
 80129a4:	dace200b 	ld.w      	r22, (r14, 0x2c)
 80129a8:	6c83      	mov      	r2, r0
 80129aa:	6cc7      	mov      	r3, r1
 80129ac:	c4174820 	lsli      	r0, r23, 0
 80129b0:	c4164821 	lsli      	r1, r22, 0
 80129b4:	e3fff3f4 	bsr      	0x801119c	// 801119c <__divdf3>
 80129b8:	da8e200f 	ld.w      	r20, (r14, 0x3c)
 80129bc:	daae2010 	ld.w      	r21, (r14, 0x40)
 80129c0:	c4144822 	lsli      	r2, r20, 0
 80129c4:	c4154823 	lsli      	r3, r21, 0
 80129c8:	e3fff2b4 	bsr      	0x8010f30	// 8010f30 <__adddf3>
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
 80129cc:	984a      	ld.w      	r2, (r14, 0x28)
 80129ce:	e46203fe 	addi      	r3, r2, 1023
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 80129d2:	4374      	lsli      	r3, r3, 20
 80129d4:	3200      	movi      	r2, 0
 80129d6:	e3fff2e3 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
  // correct for rounding errors
  if (value < conv.F) {
 80129da:	d98e2012 	ld.w      	r12, (r14, 0x48)
 80129de:	da6e2011 	ld.w      	r19, (r14, 0x44)
 80129e2:	6c83      	mov      	r2, r0
 80129e4:	c4004830 	lsli      	r16, r0, 0
 80129e8:	6cc7      	mov      	r3, r1
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 80129ea:	c4014831 	lsli      	r17, r1, 0
  if (value < conv.F) {
 80129ee:	6c33      	mov      	r0, r12
 80129f0:	c4134821 	lsli      	r1, r19, 0
 80129f4:	e3fff4bc 	bsr      	0x801136c	// 801136c <__ltdf2>
 80129f8:	c4104832 	lsli      	r18, r16, 0
 80129fc:	e9a00012 	bhsz      	r0, 0x8012a20	// 8012a20 <_etoa+0x290>
    expval--;
 8012a00:	9869      	ld.w      	r3, (r14, 0x24)
 8012a02:	2b00      	subi      	r3, 1
 8012a04:	b869      	st.w      	r3, (r14, 0x24)
    conv.F /= 10;
 8012a06:	c4114821 	lsli      	r1, r17, 0
 8012a0a:	3200      	movi      	r2, 0
 8012a0c:	ea234024 	movih      	r3, 16420
 8012a10:	c4104820 	lsli      	r0, r16, 0
 8012a14:	e3fff3c4 	bsr      	0x801119c	// 801119c <__divdf3>
 8012a18:	c4004832 	lsli      	r18, r0, 0
 8012a1c:	c4014831 	lsli      	r17, r1, 0
  }

  // the exponent format is "%+03d" and largest value is "307", so set aside 4-5 characters
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 8012a20:	9849      	ld.w      	r2, (r14, 0x24)
 8012a22:	e4620062 	addi      	r3, r2, 99
 8012a26:	eb0300c6 	cmphsi      	r3, 199

  // in "%g" mode, "prec" is the number of *significant figures* not decimals
  if (flags & FLAGS_ADAPT_EXP) {
 8012a2a:	9866      	ld.w      	r3, (r14, 0x18)
 8012a2c:	e4632800 	andi      	r3, r3, 2048
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 8012a30:	c4000510 	mvc      	r16
 8012a34:	e6100003 	addi      	r16, r16, 4
  if (flags & FLAGS_ADAPT_EXP) {
 8012a38:	e9030027 	bez      	r3, 0x8012a86	// 8012a86 <_etoa+0x2f6>
    // do we want to fall-back to "%f" mode?
    if ((value >= 1e-4) && (value < 1e6)) {
 8012a3c:	1341      	lrw      	r2, 0xeb1c432d	// 8012bc0 <_etoa+0x430>
 8012a3e:	1362      	lrw      	r3, 0x3f1a36e2	// 8012bc4 <_etoa+0x434>
 8012a40:	6c2b      	mov      	r0, r10
 8012a42:	6c67      	mov      	r1, r9
 8012a44:	de4e200a 	st.w      	r18, (r14, 0x28)
 8012a48:	e3fff472 	bsr      	0x801132c	// 801132c <__gedf2>
 8012a4c:	da4e200a 	ld.w      	r18, (r14, 0x28)
 8012a50:	e98000cd 	blz      	r0, 0x8012bea	// 8012bea <_etoa+0x45a>
 8012a54:	3200      	movi      	r2, 0
 8012a56:	127d      	lrw      	r3, 0x412e8480	// 8012bc8 <_etoa+0x438>
 8012a58:	6c2b      	mov      	r0, r10
 8012a5a:	6c67      	mov      	r1, r9
 8012a5c:	e3fff488 	bsr      	0x801136c	// 801136c <__ltdf2>
 8012a60:	da4e200a 	ld.w      	r18, (r14, 0x28)
 8012a64:	e9a000c3 	bhsz      	r0, 0x8012bea	// 8012bea <_etoa+0x45a>
      if ((int)prec > expval) {
 8012a68:	9849      	ld.w      	r2, (r14, 0x24)
 8012a6a:	9867      	ld.w      	r3, (r14, 0x1c)
 8012a6c:	64c9      	cmplt      	r2, r3
 8012a6e:	0cd4      	bf      	0x8012c16	// 8012c16 <_etoa+0x486>
        prec = (unsigned)((int)prec - expval - 1);
 8012a70:	60ca      	subu      	r3, r2
 8012a72:	2b00      	subi      	r3, 1
 8012a74:	b867      	st.w      	r3, (r14, 0x1c)
      }
      else {
        prec = 0;
      }
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
 8012a76:	9866      	ld.w      	r3, (r14, 0x18)
 8012a78:	ec630400 	ori      	r3, r3, 1024
      // no characters in exponent
      minwidth = 0U;
 8012a7c:	ea100000 	movi      	r16, 0
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
 8012a80:	b866      	st.w      	r3, (r14, 0x18)
      expval   = 0;
 8012a82:	de0e2009 	st.w      	r16, (r14, 0x24)

  // will everything fit?
  unsigned int fwidth = width;
  if (width > minwidth) {
    // we didn't fall-back so subtract the characters required for the exponent
    fwidth -= minwidth;
 8012a86:	9848      	ld.w      	r2, (r14, 0x20)
 8012a88:	c602008c 	subu      	r12, r2, r16
 8012a8c:	c4500420 	cmphs      	r16, r2
  } else {
    // not enough characters, so go back to default sizing
    fwidth = 0U;
  }
  if ((flags & FLAGS_LEFT) && minwidth) {
 8012a90:	9846      	ld.w      	r2, (r14, 0x18)
 8012a92:	e4422002 	andi      	r2, r2, 2
    fwidth -= minwidth;
 8012a96:	3300      	movi      	r3, 0
 8012a98:	c5830c40 	inct      	r12, r3, 0
  if ((flags & FLAGS_LEFT) && minwidth) {
 8012a9c:	b84a      	st.w      	r2, (r14, 0x28)
 8012a9e:	e9020006 	bez      	r2, 0x8012aaa	// 8012aaa <_etoa+0x31a>
    // if we're padding on the right, DON'T pad the floating part
    fwidth = 0U;
 8012aa2:	eb500000 	cmpnei      	r16, 0
 8012aa6:	c5830c40 	inct      	r12, r3, 0
  }

  // rescale the float value
  if (expval) {
 8012aaa:	9869      	ld.w      	r3, (r14, 0x24)
 8012aac:	e9230090 	bnez      	r3, 0x8012bcc	// 8012bcc <_etoa+0x43c>
    value /= conv.F;
  }

  // output the floating part
  const size_t start_idx = idx;
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 8012ab0:	3200      	movi      	r2, 0
 8012ab2:	6ccb      	mov      	r3, r2
 8012ab4:	6c17      	mov      	r0, r5
 8012ab6:	6c53      	mov      	r1, r4
 8012ab8:	c40c4831 	lsli      	r17, r12, 0
 8012abc:	e3fff458 	bsr      	0x801136c	// 801136c <__ltdf2>
 8012ac0:	c411482c 	lsli      	r12, r17, 0
 8012ac4:	e980009e 	blz      	r0, 0x8012c00	// 8012c00 <_etoa+0x470>
 8012ac8:	da2e2006 	ld.w      	r17, (r14, 0x18)
 8012acc:	98a7      	ld.w      	r5, (r14, 0x1c)
 8012ace:	c5712823 	bclri      	r3, r17, 11
 8012ad2:	b864      	st.w      	r3, (r14, 0x10)
 8012ad4:	dd2e2001 	st.w      	r9, (r14, 0x4)
 8012ad8:	dd8e2003 	st.w      	r12, (r14, 0xc)
 8012adc:	b8a2      	st.w      	r5, (r14, 0x8)
 8012ade:	dd4e2000 	st.w      	r10, (r14, 0x0)
 8012ae2:	6ce3      	mov      	r3, r8
 8012ae4:	6caf      	mov      	r2, r11
 8012ae6:	6c5f      	mov      	r1, r7
 8012ae8:	6c1b      	mov      	r0, r6
 8012aea:	e3fffc07 	bsr      	0x80122f8	// 80122f8 <_ftoa>
 8012aee:	6d03      	mov      	r4, r0

  // output the exponent part
  if (!prec && minwidth) {
 8012af0:	6e57      	mov      	r9, r5
 8012af2:	e925004b 	bnez      	r5, 0x8012b88	// 8012b88 <_etoa+0x3f8>
 8012af6:	e9100049 	bez      	r16, 0x8012b88	// 8012b88 <_etoa+0x3f8>
    // output the exponential symbol
    out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
 8012afa:	e4712020 	andi      	r3, r17, 32
 8012afe:	3b40      	cmpnei      	r3, 0
 8012b00:	6c83      	mov      	r2, r0
 8012b02:	ea0c0065 	movi      	r12, 101
 8012b06:	58a2      	addi      	r5, r0, 1
 8012b08:	3045      	movi      	r0, 69
 8012b0a:	c40c0c20 	incf      	r0, r12, 0
 8012b0e:	6ce3      	mov      	r3, r8
 8012b10:	6c5f      	mov      	r1, r7
 8012b12:	7bd9      	jsr      	r6
    // output the exponent value
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
 8012b14:	3305      	movi      	r3, 5
 8012b16:	9849      	ld.w      	r2, (r14, 0x24)
 8012b18:	b865      	st.w      	r3, (r14, 0x14)
 8012b1a:	330a      	movi      	r3, 10
 8012b1c:	b862      	st.w      	r3, (r14, 0x8)
 8012b1e:	4a7f      	lsri      	r3, r2, 31
 8012b20:	b861      	st.w      	r3, (r14, 0x4)
 8012b22:	e6101000 	subi      	r16, r16, 1
 8012b26:	c4020203 	abs      	r3, r2
 8012b2a:	b860      	st.w      	r3, (r14, 0x0)
 8012b2c:	de0e2004 	st.w      	r16, (r14, 0x10)
 8012b30:	6ce3      	mov      	r3, r8
 8012b32:	dd2e2003 	st.w      	r9, (r14, 0xc)
 8012b36:	6c97      	mov      	r2, r5
 8012b38:	6c5f      	mov      	r1, r7
 8012b3a:	6c1b      	mov      	r0, r6
 8012b3c:	e3fffb12 	bsr      	0x8012160	// 8012160 <_ntoa_long>
    // might need to right-pad spaces
    if (flags & FLAGS_LEFT) {
 8012b40:	986a      	ld.w      	r3, (r14, 0x28)
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
 8012b42:	6d03      	mov      	r4, r0
    if (flags & FLAGS_LEFT) {
 8012b44:	e9030022 	bez      	r3, 0x8012b88	// 8012b88 <_etoa+0x3f8>
      while (idx - start_idx < width) out(' ', buffer, idx++, maxlen);
 8012b48:	c5600083 	subu      	r3, r0, r11
 8012b4c:	98a8      	ld.w      	r5, (r14, 0x20)
 8012b4e:	654c      	cmphs      	r3, r5
 8012b50:	081c      	bt      	0x8012b88	// 8012b88 <_etoa+0x3f8>
 8012b52:	6c83      	mov      	r2, r0
 8012b54:	2400      	addi      	r4, 1
 8012b56:	6ce3      	mov      	r3, r8
 8012b58:	6c5f      	mov      	r1, r7
 8012b5a:	3020      	movi      	r0, 32
 8012b5c:	7bd9      	jsr      	r6
 8012b5e:	c5640083 	subu      	r3, r4, r11
 8012b62:	654c      	cmphs      	r3, r5
 8012b64:	6c93      	mov      	r2, r4
 8012b66:	0ff7      	bf      	0x8012b54	// 8012b54 <_etoa+0x3c4>
 8012b68:	0410      	br      	0x8012b88	// 8012b88 <_etoa+0x3f8>
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
 8012b6a:	9866      	ld.w      	r3, (r14, 0x18)
 8012b6c:	b864      	st.w      	r3, (r14, 0x10)
 8012b6e:	9868      	ld.w      	r3, (r14, 0x20)
 8012b70:	b863      	st.w      	r3, (r14, 0xc)
 8012b72:	9867      	ld.w      	r3, (r14, 0x1c)
 8012b74:	b862      	st.w      	r3, (r14, 0x8)
 8012b76:	b881      	st.w      	r4, (r14, 0x4)
 8012b78:	b8a0      	st.w      	r5, (r14, 0x0)
 8012b7a:	6ce3      	mov      	r3, r8
 8012b7c:	6caf      	mov      	r2, r11
 8012b7e:	6c5f      	mov      	r1, r7
 8012b80:	6c1b      	mov      	r0, r6
 8012b82:	e3fffbbb 	bsr      	0x80122f8	// 80122f8 <_ftoa>
 8012b86:	6d03      	mov      	r4, r0
    }
  }
  return idx;
}
 8012b88:	6c13      	mov      	r0, r4
 8012b8a:	1414      	addi      	r14, r14, 80
 8012b8c:	ebc00058 	pop      	r4-r11, r15, r16-r17
 8012b90:	509f79fb 	.long	0x509f79fb
 8012b94:	3fd34413 	.long	0x3fd34413
 8012b98:	8b60c8b3 	.long	0x8b60c8b3
 8012b9c:	3fc68a28 	.long	0x3fc68a28
 8012ba0:	636f4361 	.long	0x636f4361
 8012ba4:	3fd287a7 	.long	0x3fd287a7
 8012ba8:	0979a371 	.long	0x0979a371
 8012bac:	400a934f 	.long	0x400a934f
 8012bb0:	bbb55516 	.long	0xbbb55516
 8012bb4:	40026bb1 	.long	0x40026bb1
 8012bb8:	fefa39ef 	.long	0xfefa39ef
 8012bbc:	3fe62e42 	.long	0x3fe62e42
 8012bc0:	eb1c432d 	.long	0xeb1c432d
 8012bc4:	3f1a36e2 	.long	0x3f1a36e2
 8012bc8:	412e8480 	.long	0x412e8480
    value /= conv.F;
 8012bcc:	6c2b      	mov      	r0, r10
 8012bce:	6c67      	mov      	r1, r9
 8012bd0:	c4124822 	lsli      	r2, r18, 0
 8012bd4:	c4114823 	lsli      	r3, r17, 0
 8012bd8:	dd8e200b 	st.w      	r12, (r14, 0x2c)
 8012bdc:	e3fff2e0 	bsr      	0x801119c	// 801119c <__divdf3>
 8012be0:	6e83      	mov      	r10, r0
 8012be2:	6e47      	mov      	r9, r1
 8012be4:	d98e200b 	ld.w      	r12, (r14, 0x2c)
 8012be8:	0764      	br      	0x8012ab0	// 8012ab0 <_etoa+0x320>
      if ((prec > 0) && (flags & FLAGS_PRECISION)) {
 8012bea:	9847      	ld.w      	r2, (r14, 0x1c)
 8012bec:	e902ff4d 	bez      	r2, 0x8012a86	// 8012a86 <_etoa+0x2f6>
        --prec;
 8012bf0:	9873      	ld.w      	r3, (r14, 0x4c)
 8012bf2:	3b40      	cmpnei      	r3, 0
 8012bf4:	c4620c20 	incf      	r3, r2, 0
 8012bf8:	c4620d01 	dect      	r3, r2, 1
 8012bfc:	b867      	st.w      	r3, (r14, 0x1c)
 8012bfe:	0744      	br      	0x8012a86	// 8012a86 <_etoa+0x2f6>
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 8012c00:	ea238000 	movih      	r3, 32768
 8012c04:	60e4      	addu      	r3, r9
 8012c06:	6e4f      	mov      	r9, r3
 8012c08:	0760      	br      	0x8012ac8	// 8012ac8 <_etoa+0x338>
    value = -value;
 8012c0a:	ea238000 	movih      	r3, 32768
 8012c0e:	c4640029 	addu      	r9, r4, r3
 8012c12:	e800fdf7 	br      	0x8012800	// 8012800 <_etoa+0x70>
      if ((int)prec > expval) {
 8012c16:	3300      	movi      	r3, 0
 8012c18:	072e      	br      	0x8012a74	// 8012a74 <_etoa+0x2e4>
	...

08012c1c <_vsnprintf>:
#endif  // PRINTF_SUPPORT_FLOAT


// internal vsnprintf
static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
 8012c1c:	ebe00058 	push      	r4-r11, r15, r16-r17
 8012c20:	1436      	subi      	r14, r14, 88
  unsigned int flags, width, precision, n;
  size_t idx = 0U;

  if (!buffer) {
    // use null output function
    out = _out_null;
 8012c22:	3940      	cmpnei      	r1, 0
 8012c24:	10cf      	lrw      	r6, 0x8011ed8	// 8012c60 <_vsnprintf+0x44>
{
 8012c26:	6e07      	mov      	r8, r1
 8012c28:	6dcb      	mov      	r7, r2
 8012c2a:	6d4f      	mov      	r5, r3
 8012c2c:	9981      	ld.w      	r4, (r14, 0x84)
    out = _out_null;
 8012c2e:	c4c00c40 	inct      	r6, r0, 0
        format++;
        break;
      }

      case '%' :
        out('%', buffer, idx++, maxlen);
 8012c32:	ea0b0000 	movi      	r11, 0
      switch (*format) {
 8012c36:	ea89000c 	lrw      	r9, 0x801386c	// 8012c64 <_vsnprintf+0x48>
  while (*format)
 8012c3a:	8500      	ld.b      	r0, (r5, 0x0)
 8012c3c:	e900006f 	bez      	r0, 0x8012d1a	// 8012d1a <_vsnprintf+0xfe>
    if (*format != '%') {
 8012c40:	eb400025 	cmpnei      	r0, 37
 8012c44:	0860      	bt      	0x8012d04	// 8012d04 <_vsnprintf+0xe8>
      format++;
 8012c46:	5d42      	addi      	r2, r5, 1
    flags = 0U;
 8012c48:	3100      	movi      	r1, 0
      switch (*format) {
 8012c4a:	8200      	ld.b      	r0, (r2, 0x0)
 8012c4c:	e460101f 	subi      	r3, r0, 32
 8012c50:	74cc      	zextb      	r3, r3
 8012c52:	3b10      	cmphsi      	r3, 17
 8012c54:	6d4b      	mov      	r5, r2
 8012c56:	081d      	bt      	0x8012c90	// 8012c90 <_vsnprintf+0x74>
 8012c58:	d0690883 	ldr.w      	r3, (r9, r3 << 2)
 8012c5c:	780c      	jmp      	r3
 8012c5e:	0000      	.short	0x0000
 8012c60:	08011ed8 	.long	0x08011ed8
 8012c64:	0801386c 	.long	0x0801386c
        case '0': flags |= FLAGS_ZEROPAD; format++; n = 1U; break;
 8012c68:	ec210001 	ori      	r1, r1, 1
 8012c6c:	2200      	addi      	r2, 1
 8012c6e:	07ee      	br      	0x8012c4a	// 8012c4a <_vsnprintf+0x2e>
        case ' ': flags |= FLAGS_SPACE;   format++; n = 1U; break;
 8012c70:	ec210008 	ori      	r1, r1, 8
 8012c74:	2200      	addi      	r2, 1
 8012c76:	07ea      	br      	0x8012c4a	// 8012c4a <_vsnprintf+0x2e>
        case '#': flags |= FLAGS_HASH;    format++; n = 1U; break;
 8012c78:	ec210010 	ori      	r1, r1, 16
 8012c7c:	2200      	addi      	r2, 1
 8012c7e:	07e6      	br      	0x8012c4a	// 8012c4a <_vsnprintf+0x2e>
        case '+': flags |= FLAGS_PLUS;    format++; n = 1U; break;
 8012c80:	ec210004 	ori      	r1, r1, 4
 8012c84:	2200      	addi      	r2, 1
 8012c86:	07e2      	br      	0x8012c4a	// 8012c4a <_vsnprintf+0x2e>
        case '-': flags |= FLAGS_LEFT;    format++; n = 1U; break;
 8012c88:	ec210002 	ori      	r1, r1, 2
 8012c8c:	2200      	addi      	r2, 1
 8012c8e:	07de      	br      	0x8012c4a	// 8012c4a <_vsnprintf+0x2e>
  return (ch >= '0') && (ch <= '9');
 8012c90:	e460102f 	subi      	r3, r0, 48
    if (_is_digit(*format)) {
 8012c94:	74cc      	zextb      	r3, r3
 8012c96:	3b09      	cmphsi      	r3, 10
 8012c98:	0c5b      	bf      	0x8012d4e	// 8012d4e <_vsnprintf+0x132>
    else if (*format == '*') {
 8012c9a:	eb40002a 	cmpnei      	r0, 42
 8012c9e:	e84003c3 	bf      	0x8013424	// 8013424 <_vsnprintf+0x808>
    width = 0U;
 8012ca2:	ea110000 	movi      	r17, 0
    if (*format == '.') {
 8012ca6:	eb40002e 	cmpnei      	r0, 46
 8012caa:	0c65      	bf      	0x8012d74	// 8012d74 <_vsnprintf+0x158>
    precision = 0U;
 8012cac:	ea0a0000 	movi      	r10, 0
    switch (*format) {
 8012cb0:	e4601067 	subi      	r3, r0, 104
 8012cb4:	74cc      	zextb      	r3, r3
 8012cb6:	3b12      	cmphsi      	r3, 19
 8012cb8:	080c      	bt      	0x8012cd0	// 8012cd0 <_vsnprintf+0xb4>
 8012cba:	1043      	lrw      	r2, 0x80138b0	// 8012cc4 <_vsnprintf+0xa8>
 8012cbc:	d0620883 	ldr.w      	r3, (r2, r3 << 2)
 8012cc0:	780c      	jmp      	r3
 8012cc2:	0000      	.short	0x0000
 8012cc4:	080138b0 	.long	0x080138b0
 8012cc8:	8501      	ld.b      	r0, (r5, 0x1)
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 8012cca:	ec210100 	ori      	r1, r1, 256
        format++;
 8012cce:	2500      	addi      	r5, 1
    switch (*format) {
 8012cd0:	e4601024 	subi      	r3, r0, 37
 8012cd4:	74cc      	zextb      	r3, r3
 8012cd6:	eb030053 	cmphsi      	r3, 84
 8012cda:	0815      	bt      	0x8012d04	// 8012d04 <_vsnprintf+0xe8>
 8012cdc:	1042      	lrw      	r2, 0x80138fc	// 8012ce4 <_vsnprintf+0xc8>
 8012cde:	d0620883 	ldr.w      	r3, (r2, r3 << 2)
 8012ce2:	780c      	jmp      	r3
 8012ce4:	080138fc 	.long	0x080138fc
        if (*format == 'l') {
 8012ce8:	8501      	ld.b      	r0, (r5, 0x1)
 8012cea:	eb40006c 	cmpnei      	r0, 108
 8012cee:	e84003ac 	bf      	0x8013446	// 8013446 <_vsnprintf+0x82a>
    switch (*format) {
 8012cf2:	e4601024 	subi      	r3, r0, 37
 8012cf6:	74cc      	zextb      	r3, r3
 8012cf8:	eb030053 	cmphsi      	r3, 84
        flags |= FLAGS_LONG;
 8012cfc:	ec210100 	ori      	r1, r1, 256
        format++;
 8012d00:	2500      	addi      	r5, 1
    switch (*format) {
 8012d02:	0fed      	bf      	0x8012cdc	// 8012cdc <_vsnprintf+0xc0>
        format++;
        break;

      default :
        out(*format, buffer, idx++, maxlen);
        format++;
 8012d04:	2500      	addi      	r5, 1
        out(*format, buffer, idx++, maxlen);
 8012d06:	6caf      	mov      	r2, r11
 8012d08:	6cdf      	mov      	r3, r7
 8012d0a:	6c63      	mov      	r1, r8
 8012d0c:	7bd9      	jsr      	r6
  while (*format)
 8012d0e:	8500      	ld.b      	r0, (r5, 0x0)
        out(*format, buffer, idx++, maxlen);
 8012d10:	e54b0000 	addi      	r10, r11, 1
 8012d14:	6eeb      	mov      	r11, r10
  while (*format)
 8012d16:	e920ff95 	bnez      	r0, 0x8012c40	// 8012c40 <_vsnprintf+0x24>
        break;
    }
  }

  // termination
  out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
 8012d1a:	65ec      	cmphs      	r11, r7
 8012d1c:	e8400381 	bf      	0x801341e	// 801341e <_vsnprintf+0x802>
 8012d20:	5f43      	subi      	r2, r7, 1
 8012d22:	6cdf      	mov      	r3, r7
 8012d24:	6c63      	mov      	r1, r8
 8012d26:	3000      	movi      	r0, 0
 8012d28:	7bd9      	jsr      	r6

  // return written chars without terminating \0
  return (int)idx;
}
 8012d2a:	6c2f      	mov      	r0, r11
 8012d2c:	1416      	addi      	r14, r14, 88
 8012d2e:	ebc00058 	pop      	r4-r11, r15, r16-r17
        if (*format == 'h') {
 8012d32:	8501      	ld.b      	r0, (r5, 0x1)
 8012d34:	eb400068 	cmpnei      	r0, 104
 8012d38:	e8400381 	bf      	0x801343a	// 801343a <_vsnprintf+0x81e>
        flags |= FLAGS_SHORT;
 8012d3c:	ec210080 	ori      	r1, r1, 128
        format++;
 8012d40:	2500      	addi      	r5, 1
 8012d42:	07c7      	br      	0x8012cd0	// 8012cd0 <_vsnprintf+0xb4>
 8012d44:	8501      	ld.b      	r0, (r5, 0x1)
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 8012d46:	ec210200 	ori      	r1, r1, 512
        format++;
 8012d4a:	2500      	addi      	r5, 1
        break;
 8012d4c:	07c2      	br      	0x8012cd0	// 8012cd0 <_vsnprintf+0xb4>
 8012d4e:	ea110000 	movi      	r17, 0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8012d52:	ea0d000a 	movi      	r13, 10
  while (_is_digit(**str)) {
 8012d56:	3209      	movi      	r2, 9
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8012d58:	2500      	addi      	r5, 1
 8012d5a:	f9b18440 	mula.32.l      	r0, r17, r13
 8012d5e:	e620102f 	subi      	r17, r0, 48
  while (_is_digit(**str)) {
 8012d62:	8500      	ld.b      	r0, (r5, 0x0)
  return (ch >= '0') && (ch <= '9');
 8012d64:	e460102f 	subi      	r3, r0, 48
  while (_is_digit(**str)) {
 8012d68:	74cc      	zextb      	r3, r3
 8012d6a:	64c8      	cmphs      	r2, r3
 8012d6c:	0bf6      	bt      	0x8012d58	// 8012d58 <_vsnprintf+0x13c>
    if (*format == '.') {
 8012d6e:	eb40002e 	cmpnei      	r0, 46
 8012d72:	0b9d      	bt      	0x8012cac	// 8012cac <_vsnprintf+0x90>
      if (_is_digit(*format)) {
 8012d74:	8501      	ld.b      	r0, (r5, 0x1)
  return (ch >= '0') && (ch <= '9');
 8012d76:	e460102f 	subi      	r3, r0, 48
      if (_is_digit(*format)) {
 8012d7a:	74cc      	zextb      	r3, r3
 8012d7c:	3b09      	cmphsi      	r3, 10
      flags |= FLAGS_PRECISION;
 8012d7e:	ec210400 	ori      	r1, r1, 1024
      format++;
 8012d82:	5d42      	addi      	r2, r5, 1
      if (_is_digit(*format)) {
 8012d84:	0813      	bt      	0x8012daa	// 8012daa <_vsnprintf+0x18e>
 8012d86:	6d4b      	mov      	r5, r2
 8012d88:	ea0a0000 	movi      	r10, 0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8012d8c:	ea12000a 	movi      	r18, 10
  while (_is_digit(**str)) {
 8012d90:	3209      	movi      	r2, 9
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 8012d92:	2500      	addi      	r5, 1
 8012d94:	fa4a8440 	mula.32.l      	r0, r10, r18
 8012d98:	e540102f 	subi      	r10, r0, 48
  while (_is_digit(**str)) {
 8012d9c:	8500      	ld.b      	r0, (r5, 0x0)
  return (ch >= '0') && (ch <= '9');
 8012d9e:	e460102f 	subi      	r3, r0, 48
  while (_is_digit(**str)) {
 8012da2:	74cc      	zextb      	r3, r3
 8012da4:	64c8      	cmphs      	r2, r3
 8012da6:	0bf6      	bt      	0x8012d92	// 8012d92 <_vsnprintf+0x176>
 8012da8:	0784      	br      	0x8012cb0	// 8012cb0 <_vsnprintf+0x94>
      else if (*format == '*') {
 8012daa:	eb40002a 	cmpnei      	r0, 42
 8012dae:	e84003e2 	bf      	0x8013572	// 8013572 <_vsnprintf+0x956>
      format++;
 8012db2:	6d4b      	mov      	r5, r2
 8012db4:	077c      	br      	0x8012cac	// 8012cac <_vsnprintf+0x90>
        uint32_t ipv4 = va_arg(va, uint32_t);
 8012db6:	5c6e      	addi      	r3, r4, 4
 8012db8:	3000      	movi      	r0, 0
 8012dba:	dac42000 	ld.w      	r22, (r4, 0x0)
 8012dbe:	b869      	st.w      	r3, (r14, 0x24)
 8012dc0:	6d03      	mov      	r4, r0
            h = bit / 100;
 8012dc2:	ea140064 	movi      	r20, 100
            m = (bit % 100) / 10;
 8012dc6:	ea13000a 	movi      	r19, 10
                    outtxt[j++] = '0';
 8012dca:	ea170030 	movi      	r23, 48
            outtxt[j++] = '.';
 8012dce:	ea15002e 	movi      	r21, 46
 8012dd2:	ea120004 	movi      	r18, 4
            bit = (*inuint >> (8 * i)) & 0xff;
 8012dd6:	c4164043 	lsr      	r3, r22, r0
 8012dda:	74cc      	zextb      	r3, r3
            h = bit / 100;
 8012ddc:	c6838022 	divu      	r2, r3, r20
 8012de0:	7748      	zextb      	r13, r2
            if (h)
 8012de2:	e90d0306 	bez      	r13, 0x80133ee	// 80133ee <_vsnprintf+0x7d2>
            m = (bit % 100) / 10;
 8012de6:	c6828422 	mult      	r2, r2, r20
 8012dea:	60ca      	subu      	r3, r2
 8012dec:	74cc      	zextb      	r3, r3
                outtxt[j++] = '0' + h;
 8012dee:	e70e002f 	addi      	r24, r14, 48
            m = (bit % 100) / 10;
 8012df2:	c6638022 	divu      	r2, r3, r19
                outtxt[j++] = '0' + h;
 8012df6:	e5840000 	addi      	r12, r4, 1
 8012dfa:	e5ad002f 	addi      	r13, r13, 48
 8012dfe:	7730      	zextb      	r12, r12
 8012e00:	d498002d 	str.b      	r13, (r24, r4 << 0)
            if (m)
 8012e04:	e92202fe 	bnez      	r2, 0x8013400	// 8013400 <_vsnprintf+0x7e4>
                    outtxt[j++] = '0';
 8012e08:	1a0c      	addi      	r2, r14, 48
 8012e0a:	2401      	addi      	r4, 2
 8012e0c:	7510      	zextb      	r4, r4
 8012e0e:	d5820037 	str.b      	r23, (r2, r12 << 0)
            l = (bit % 100) % 10;
 8012e12:	c6638022 	divu      	r2, r3, r19
 8012e16:	c6628422 	mult      	r2, r2, r19
 8012e1a:	60ca      	subu      	r3, r2
            outtxt[j++] = '0' + l;
 8012e1c:	1a0c      	addi      	r2, r14, 48
 8012e1e:	e5840000 	addi      	r12, r4, 1
 8012e22:	232f      	addi      	r3, 48
 8012e24:	d4820023 	str.b      	r3, (r2, r4 << 0)
 8012e28:	7730      	zextb      	r12, r12
            outtxt[j++] = '.';
 8012e2a:	2401      	addi      	r4, 2
 8012e2c:	7510      	zextb      	r4, r4
 8012e2e:	d5820035 	str.b      	r21, (r2, r12 << 0)
 8012e32:	2007      	addi      	r0, 8
        for(i = 0; i < 4; i++)
 8012e34:	e832ffd1 	bnezad      	r18, 0x8012dd6	// 8012dd6 <_vsnprintf+0x1ba>
    outtxt[j - 1] = 0;
 8012e38:	e46e002e 	addi      	r3, r14, 47
 8012e3c:	3200      	movi      	r2, 0
 8012e3e:	d4830022 	str.b      	r2, (r3, r4 << 0)
    return j - 1;
 8012e42:	5c63      	subi      	r3, r4, 1
        if (flags & FLAGS_PRECISION) {
 8012e44:	e4412400 	andi      	r2, r1, 1024
    return j - 1;
 8012e48:	6c0f      	mov      	r0, r3
          l = (l < precision ? l : precision);
 8012e4a:	3a40      	cmpnei      	r2, 0
 8012e4c:	f943cd23 	min.u32      	r3, r3, r10
        if (flags & FLAGS_PRECISION) {
 8012e50:	b84a      	st.w      	r2, (r14, 0x28)
          l = (l < precision ? l : precision);
 8012e52:	6c83      	mov      	r2, r0
 8012e54:	c4430c40 	inct      	r2, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 8012e58:	e4612002 	andi      	r3, r1, 2
          l = (l < precision ? l : precision);
 8012e5c:	b848      	st.w      	r2, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 8012e5e:	b86b      	st.w      	r3, (r14, 0x2c)
 8012e60:	e9230333 	bnez      	r3, 0x80134c6	// 80134c6 <_vsnprintf+0x8aa>
          while (l++ < width) {
 8012e64:	c6220420 	cmphs      	r2, r17
 8012e68:	6ccb      	mov      	r3, r2
 8012e6a:	2300      	addi      	r3, 1
 8012e6c:	e86003ff 	bt      	0x801366a	// 801366a <_vsnprintf+0xa4e>
 8012e70:	c5710023 	addu      	r3, r17, r11
 8012e74:	5b89      	subu      	r4, r3, r2
 8012e76:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8012e78:	e56b0000 	addi      	r11, r11, 1
 8012e7c:	6cdf      	mov      	r3, r7
 8012e7e:	6c63      	mov      	r1, r8
 8012e80:	3020      	movi      	r0, 32
 8012e82:	7bd9      	jsr      	r6
          while (l++ < width) {
 8012e84:	66d2      	cmpne      	r4, r11
 8012e86:	6caf      	mov      	r2, r11
 8012e88:	0bf8      	bt      	0x8012e78	// 8012e78 <_vsnprintf+0x25c>
 8012e8a:	e4710000 	addi      	r3, r17, 1
 8012e8e:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8012e90:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8012e94:	e9000030 	bez      	r0, 0x8012ef4	// 8012ef4 <_vsnprintf+0x2d8>
 8012e98:	6caf      	mov      	r2, r11
 8012e9a:	e60e002f 	addi      	r16, r14, 48
 8012e9e:	d96e200a 	ld.w      	r11, (r14, 0x28)
 8012ea2:	0402      	br      	0x8012ea6	// 8012ea6 <_vsnprintf+0x28a>
          out(*(pstr++), buffer, idx++, maxlen);
 8012ea4:	6c93      	mov      	r2, r4
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8012ea6:	e90b0007 	bez      	r11, 0x8012eb4	// 8012eb4 <_vsnprintf+0x298>
 8012eaa:	e46a1000 	subi      	r3, r10, 1
 8012eae:	e90a034a 	bez      	r10, 0x8013542	// 8013542 <_vsnprintf+0x926>
 8012eb2:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 8012eb4:	e6100000 	addi      	r16, r16, 1
 8012eb8:	6cdf      	mov      	r3, r7
 8012eba:	6c63      	mov      	r1, r8
 8012ebc:	5a82      	addi      	r4, r2, 1
 8012ebe:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8012ec0:	d8100000 	ld.b      	r0, (r16, 0x0)
 8012ec4:	e920fff0 	bnez      	r0, 0x8012ea4	// 8012ea4 <_vsnprintf+0x288>
        if (flags & FLAGS_LEFT) {
 8012ec8:	986b      	ld.w      	r3, (r14, 0x2c)
 8012eca:	e90302a5 	bez      	r3, 0x8013414	// 8013414 <_vsnprintf+0x7f8>
          while (l++ < width) {
 8012ece:	9868      	ld.w      	r3, (r14, 0x20)
 8012ed0:	c6230420 	cmphs      	r3, r17
 8012ed4:	e86002a0 	bt      	0x8013414	// 8013414 <_vsnprintf+0x7f8>
 8012ed8:	c4910020 	addu      	r0, r17, r4
 8012edc:	c460008a 	subu      	r10, r0, r3
 8012ee0:	6c93      	mov      	r2, r4
            out(' ', buffer, idx++, maxlen);
 8012ee2:	e5620000 	addi      	r11, r2, 1
 8012ee6:	6cdf      	mov      	r3, r7
 8012ee8:	6c63      	mov      	r1, r8
 8012eea:	3020      	movi      	r0, 32
 8012eec:	7bd9      	jsr      	r6
          while (l++ < width) {
 8012eee:	66ea      	cmpne      	r10, r11
 8012ef0:	6caf      	mov      	r2, r11
 8012ef2:	0bf8      	bt      	0x8012ee2	// 8012ee2 <_vsnprintf+0x2c6>
        format++;
 8012ef4:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8012ef6:	9889      	ld.w      	r4, (r14, 0x24)
 8012ef8:	06a1      	br      	0x8012c3a	// 8012c3a <_vsnprintf+0x1e>
        const char* p = va_arg(va, char*);
 8012efa:	da042000 	ld.w      	r16, (r4, 0x0)
 8012efe:	5c6e      	addi      	r3, r4, 4
 8012f00:	b868      	st.w      	r3, (r14, 0x20)
  for (s = str; *s && maxsize--; ++s);
 8012f02:	d8100000 	ld.b      	r0, (r16, 0x0)
        unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
 8012f06:	3300      	movi      	r3, 0
 8012f08:	2b00      	subi      	r3, 1
 8012f0a:	eb4a0000 	cmpnei      	r10, 0
 8012f0e:	c46a0c40 	inct      	r3, r10, 0
  for (s = str; *s && maxsize--; ++s);
 8012f12:	c4104824 	lsli      	r4, r16, 0
 8012f16:	e9200006 	bnez      	r0, 0x8012f22	// 8012f22 <_vsnprintf+0x306>
 8012f1a:	0408      	br      	0x8012f2a	// 8012f2a <_vsnprintf+0x30e>
 8012f1c:	2b00      	subi      	r3, 1
 8012f1e:	e9030006 	bez      	r3, 0x8012f2a	// 8012f2a <_vsnprintf+0x30e>
 8012f22:	2400      	addi      	r4, 1
 8012f24:	8440      	ld.b      	r2, (r4, 0x0)
 8012f26:	e922fffb 	bnez      	r2, 0x8012f1c	// 8012f1c <_vsnprintf+0x300>
  return (unsigned int)(s - str);
 8012f2a:	c6040084 	subu      	r4, r4, r16
        if (flags & FLAGS_PRECISION) {
 8012f2e:	e4412400 	andi      	r2, r1, 1024
          l = (l < precision ? l : precision);
 8012f32:	f944cd23 	min.u32      	r3, r4, r10
 8012f36:	3a40      	cmpnei      	r2, 0
 8012f38:	c4830c40 	inct      	r4, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 8012f3c:	e4612002 	andi      	r3, r1, 2
        if (flags & FLAGS_PRECISION) {
 8012f40:	b849      	st.w      	r2, (r14, 0x24)
        if (!(flags & FLAGS_LEFT)) {
 8012f42:	b86a      	st.w      	r3, (r14, 0x28)
 8012f44:	e9230287 	bnez      	r3, 0x8013452	// 8013452 <_vsnprintf+0x836>
          while (l++ < width) {
 8012f48:	c6240420 	cmphs      	r4, r17
 8012f4c:	5c62      	addi      	r3, r4, 1
 8012f4e:	e860039c 	bt      	0x8013686	// 8013686 <_vsnprintf+0xa6a>
 8012f52:	c5710023 	addu      	r3, r17, r11
 8012f56:	5b91      	subu      	r4, r3, r4
 8012f58:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8012f5a:	e5620000 	addi      	r11, r2, 1
 8012f5e:	6cdf      	mov      	r3, r7
 8012f60:	6c63      	mov      	r1, r8
 8012f62:	3020      	movi      	r0, 32
 8012f64:	7bd9      	jsr      	r6
          while (l++ < width) {
 8012f66:	66d2      	cmpne      	r4, r11
 8012f68:	6caf      	mov      	r2, r11
 8012f6a:	0bf8      	bt      	0x8012f5a	// 8012f5a <_vsnprintf+0x33e>
 8012f6c:	c40b4832 	lsli      	r18, r11, 0
 8012f70:	e4910000 	addi      	r4, r17, 1
 8012f74:	d8100000 	ld.b      	r0, (r16, 0x0)
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8012f78:	e9000391 	bez      	r0, 0x801369a	// 801369a <_vsnprintf+0xa7e>
 8012f7c:	b88b      	st.w      	r4, (r14, 0x2c)
 8012f7e:	c4124822 	lsli      	r2, r18, 0
 8012f82:	d96e2009 	ld.w      	r11, (r14, 0x24)
 8012f86:	0402      	br      	0x8012f8a	// 8012f8a <_vsnprintf+0x36e>
          out(*(p++), buffer, idx++, maxlen);
 8012f88:	6c93      	mov      	r2, r4
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8012f8a:	e90b0007 	bez      	r11, 0x8012f98	// 8012f98 <_vsnprintf+0x37c>
 8012f8e:	e46a1000 	subi      	r3, r10, 1
 8012f92:	e90a02d2 	bez      	r10, 0x8013536	// 8013536 <_vsnprintf+0x91a>
 8012f96:	6e8f      	mov      	r10, r3
          out(*(p++), buffer, idx++, maxlen);
 8012f98:	e6100000 	addi      	r16, r16, 1
 8012f9c:	6cdf      	mov      	r3, r7
 8012f9e:	6c63      	mov      	r1, r8
 8012fa0:	5a82      	addi      	r4, r2, 1
 8012fa2:	7bd9      	jsr      	r6
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8012fa4:	d8100000 	ld.b      	r0, (r16, 0x0)
 8012fa8:	e920fff0 	bnez      	r0, 0x8012f88	// 8012f88 <_vsnprintf+0x36c>
 8012fac:	6ed3      	mov      	r11, r4
 8012fae:	988b      	ld.w      	r4, (r14, 0x2c)
        if (flags & FLAGS_LEFT) {
 8012fb0:	986a      	ld.w      	r3, (r14, 0x28)
 8012fb2:	e9030012 	bez      	r3, 0x8012fd6	// 8012fd6 <_vsnprintf+0x3ba>
          while (l++ < width) {
 8012fb6:	c6240420 	cmphs      	r4, r17
 8012fba:	080e      	bt      	0x8012fd6	// 8012fd6 <_vsnprintf+0x3ba>
 8012fbc:	c5710020 	addu      	r0, r17, r11
 8012fc0:	5891      	subu      	r4, r0, r4
 8012fc2:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8012fc4:	e56b0000 	addi      	r11, r11, 1
 8012fc8:	6cdf      	mov      	r3, r7
 8012fca:	6c63      	mov      	r1, r8
 8012fcc:	3020      	movi      	r0, 32
 8012fce:	7bd9      	jsr      	r6
          while (l++ < width) {
 8012fd0:	66d2      	cmpne      	r4, r11
 8012fd2:	6caf      	mov      	r2, r11
 8012fd4:	0bf8      	bt      	0x8012fc4	// 8012fc4 <_vsnprintf+0x3a8>
        format++;
 8012fd6:	2500      	addi      	r5, 1
        const char* p = va_arg(va, char*);
 8012fd8:	9888      	ld.w      	r4, (r14, 0x20)
        break;
 8012fda:	0630      	br      	0x8012c3a	// 8012c3a <_vsnprintf+0x1e>
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 8012fdc:	3308      	movi      	r3, 8
 8012fde:	b864      	st.w      	r3, (r14, 0x10)
 8012fe0:	3310      	movi      	r3, 16
 8012fe2:	b862      	st.w      	r3, (r14, 0x8)
        flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
 8012fe4:	ec210021 	ori      	r1, r1, 33
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 8012fe8:	3300      	movi      	r3, 0
 8012fea:	b825      	st.w      	r1, (r14, 0x14)
 8012fec:	dd4e2003 	st.w      	r10, (r14, 0xc)
 8012ff0:	b861      	st.w      	r3, (r14, 0x4)
 8012ff2:	9460      	ld.w      	r3, (r4, 0x0)
 8012ff4:	b860      	st.w      	r3, (r14, 0x0)
 8012ff6:	6caf      	mov      	r2, r11
 8012ff8:	6cdf      	mov      	r3, r7
 8012ffa:	6c63      	mov      	r1, r8
 8012ffc:	6c1b      	mov      	r0, r6
 8012ffe:	e6040003 	addi      	r16, r4, 4
 8013002:	e3fff8af 	bsr      	0x8012160	// 8012160 <_ntoa_long>
 8013006:	6ec3      	mov      	r11, r0
        format++;
 8013008:	2500      	addi      	r5, 1
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 801300a:	c4104824 	lsli      	r4, r16, 0
        break;
 801300e:	0616      	br      	0x8012c3a	// 8012c3a <_vsnprintf+0x1e>
        if (!(flags & FLAGS_LEFT)) {
 8013010:	e4212002 	andi      	r1, r1, 2
 8013014:	e9210227 	bnez      	r1, 0x8013462	// 8013462 <_vsnprintf+0x846>
          while (l++ < width) {
 8013018:	3301      	movi      	r3, 1
 801301a:	c6230420 	cmphs      	r3, r17
 801301e:	e860032f 	bt      	0x801367c	// 801367c <_vsnprintf+0xa60>
 8013022:	e60b1000 	subi      	r16, r11, 1
 8013026:	c6300030 	addu      	r16, r16, r17
 801302a:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 801302c:	e5420000 	addi      	r10, r2, 1
 8013030:	6cdf      	mov      	r3, r7
 8013032:	6c63      	mov      	r1, r8
 8013034:	3020      	movi      	r0, 32
 8013036:	7bd9      	jsr      	r6
          while (l++ < width) {
 8013038:	c5500480 	cmpne      	r16, r10
 801303c:	6cab      	mov      	r2, r10
 801303e:	0bf7      	bt      	0x801302c	// 801302c <_vsnprintf+0x410>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8013040:	8400      	ld.b      	r0, (r4, 0x0)
 8013042:	e6040003 	addi      	r16, r4, 4
 8013046:	6cdf      	mov      	r3, r7
 8013048:	6cab      	mov      	r2, r10
 801304a:	6c63      	mov      	r1, r8
 801304c:	e56a0000 	addi      	r11, r10, 1
 8013050:	7bd9      	jsr      	r6
 8013052:	c4104824 	lsli      	r4, r16, 0
        format++;
 8013056:	2500      	addi      	r5, 1
        break;
 8013058:	e800fdf1 	br      	0x8012c3a	// 8012c3a <_vsnprintf+0x1e>
        if (*format == 'x' || *format == 'X') {
 801305c:	eb400078 	cmpnei      	r0, 120
 8013060:	e8400277 	bf      	0x801354e	// 801354e <_vsnprintf+0x932>
 8013064:	eb400058 	cmpnei      	r0, 88
 8013068:	e8400275 	bf      	0x8013552	// 8013552 <_vsnprintf+0x936>
        else if (*format == 'o') {
 801306c:	eb40006f 	cmpnei      	r0, 111
 8013070:	e8400232 	bf      	0x80134d4	// 80134d4 <_vsnprintf+0x8b8>
        else if (*format == 'b') {
 8013074:	eb400062 	cmpnei      	r0, 98
 8013078:	e84002d5 	bf      	0x8013622	// 8013622 <_vsnprintf+0xa06>
        if ((*format != 'i') && (*format != 'd')) {
 801307c:	eb400069 	cmpnei      	r0, 105
          flags &= ~FLAGS_HASH;   // no hash for dec format
 8013080:	c4812823 	bclri      	r3, r1, 4
        if ((*format != 'i') && (*format != 'd')) {
 8013084:	e8600232 	bt      	0x80134e8	// 80134e8 <_vsnprintf+0x8cc>
        if (flags & FLAGS_PRECISION) {
 8013088:	e4212400 	andi      	r1, r1, 1024
          base = 10U;
 801308c:	320a      	movi      	r2, 10
        if (flags & FLAGS_PRECISION) {
 801308e:	e9010236 	bez      	r1, 0x80134fa	// 80134fa <_vsnprintf+0x8de>
          flags &= ~FLAGS_ZEROPAD;
 8013092:	3b80      	bclri      	r3, 0
        if ((*format == 'i') || (*format == 'd')) {
 8013094:	eb400069 	cmpnei      	r0, 105
 8013098:	e8400231 	bf      	0x80134fa	// 80134fa <_vsnprintf+0x8de>
 801309c:	eb400064 	cmpnei      	r0, 100
 80130a0:	e840022d 	bf      	0x80134fa	// 80134fa <_vsnprintf+0x8de>
          if (flags & FLAGS_LONG_LONG) {
 80130a4:	e4232200 	andi      	r1, r3, 512
 80130a8:	e9210276 	bnez      	r1, 0x8013594	// 8013594 <_vsnprintf+0x978>
          else if (flags & FLAGS_LONG) {
 80130ac:	e4032100 	andi      	r0, r3, 256
 80130b0:	e92002a2 	bnez      	r0, 0x80135f4	// 80135f4 <_vsnprintf+0x9d8>
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 80130b4:	e4232040 	andi      	r1, r3, 64
 80130b8:	e92102cf 	bnez      	r1, 0x8013656	// 8013656 <_vsnprintf+0xa3a>
 80130bc:	e4232080 	andi      	r1, r3, 128
 80130c0:	e92102b3 	bnez      	r1, 0x8013626	// 8013626 <_vsnprintf+0xa0a>
 80130c4:	9420      	ld.w      	r1, (r4, 0x0)
 80130c6:	2403      	addi      	r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
 80130c8:	b865      	st.w      	r3, (r14, 0x14)
 80130ca:	3300      	movi      	r3, 0
 80130cc:	de2e2004 	st.w      	r17, (r14, 0x10)
 80130d0:	dd4e2003 	st.w      	r10, (r14, 0xc)
 80130d4:	b842      	st.w      	r2, (r14, 0x8)
 80130d6:	b861      	st.w      	r3, (r14, 0x4)
 80130d8:	b820      	st.w      	r1, (r14, 0x0)
 80130da:	6caf      	mov      	r2, r11
 80130dc:	6cdf      	mov      	r3, r7
 80130de:	6c63      	mov      	r1, r8
 80130e0:	6c1b      	mov      	r0, r6
 80130e2:	e3fff83f 	bsr      	0x8012160	// 8012160 <_ntoa_long>
 80130e6:	6ec3      	mov      	r11, r0
        format++;
 80130e8:	2500      	addi      	r5, 1
 80130ea:	e800fda8 	br      	0x8012c3a	// 8012c3a <_vsnprintf+0x1e>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
 80130ee:	eb400046 	cmpnei      	r0, 70
 80130f2:	e840023c 	bf      	0x801356a	// 801356a <_vsnprintf+0x94e>
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 80130f6:	b824      	st.w      	r1, (r14, 0x10)
 80130f8:	de2e2003 	st.w      	r17, (r14, 0xc)
 80130fc:	dd4e2002 	st.w      	r10, (r14, 0x8)
 8013100:	e6040007 	addi      	r16, r4, 8
 8013104:	9460      	ld.w      	r3, (r4, 0x0)
 8013106:	9481      	ld.w      	r4, (r4, 0x4)
 8013108:	b860      	st.w      	r3, (r14, 0x0)
 801310a:	b881      	st.w      	r4, (r14, 0x4)
 801310c:	6caf      	mov      	r2, r11
 801310e:	6cdf      	mov      	r3, r7
 8013110:	6c63      	mov      	r1, r8
 8013112:	6c1b      	mov      	r0, r6
 8013114:	e3fff8f2 	bsr      	0x80122f8	// 80122f8 <_ftoa>
 8013118:	6ec3      	mov      	r11, r0
        format++;
 801311a:	2500      	addi      	r5, 1
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 801311c:	c4104824 	lsli      	r4, r16, 0
        break;
 8013120:	e800fd8d 	br      	0x8012c3a	// 8012c3a <_vsnprintf+0x1e>
        out('%', buffer, idx++, maxlen);
 8013124:	6caf      	mov      	r2, r11
 8013126:	e54b0000 	addi      	r10, r11, 1
 801312a:	6cdf      	mov      	r3, r7
 801312c:	6c63      	mov      	r1, r8
 801312e:	3025      	movi      	r0, 37
 8013130:	7bd9      	jsr      	r6
        format++;
 8013132:	2500      	addi      	r5, 1
        out('%', buffer, idx++, maxlen);
 8013134:	6eeb      	mov      	r11, r10
        break;
 8013136:	e800fd82 	br      	0x8012c3a	// 8012c3a <_vsnprintf+0x1e>
        char *ipv6 = va_arg(va, char*);
 801313a:	5c6e      	addi      	r3, r4, 4
 801313c:	dac42000 	ld.w      	r22, (r4, 0x0)
 8013140:	b869      	st.w      	r3, (r14, 0x24)
 8013142:	e716000f 	addi      	r24, r22, 16
 8013146:	3400      	movi      	r4, 0
                if (h > 9)
 8013148:	ea140009 	movi      	r20, 9
                    outtxt[j++] = ':';
 801314c:	ea17003a 	movi      	r23, 58
          while (l++ < width) {
 8013150:	ea0c0000 	movi      	r12, 0
 8013154:	da562000 	ld.w      	r18, (r22, 0x0)
 8013158:	6c33      	mov      	r0, r12
 801315a:	ea0d0004 	movi      	r13, 4
                m = (*inuint >> (8 * i)) & 0xff;
 801315e:	c5924043 	lsr      	r3, r18, r12
 8013162:	74cc      	zextb      	r3, r3
                h = m >> 4;
 8013164:	4b44      	lsri      	r2, r3, 4
                if (h > 9)
 8013166:	c4540420 	cmphs      	r20, r2
                    outtxt[j++] = 'A' + h - 10;
 801316a:	e6640000 	addi      	r19, r4, 1
                l = m & 0xf;
 801316e:	e463200f 	andi      	r3, r3, 15
                    outtxt[j++] = 'A' + h - 10;
 8013172:	c41354f3 	zext      	r19, r19, 7, 0
                if (h > 9)
 8013176:	092e      	bt      	0x80133d2	// 80133d2 <_vsnprintf+0x7b6>
                    outtxt[j++] = 'A' + h - 10;
 8013178:	e6ae002f 	addi      	r21, r14, 48
 801317c:	2236      	addi      	r2, 55
 801317e:	d4950022 	str.b      	r2, (r21, r4 << 0)
                if (l > 9)
 8013182:	c4740420 	cmphs      	r20, r3
                    outtxt[j++] = 'A' + l - 10;
 8013186:	e4930000 	addi      	r4, r19, 1
 801318a:	7510      	zextb      	r4, r4
                if (l > 9)
 801318c:	091e      	bt      	0x80133c8	// 80133c8 <_vsnprintf+0x7ac>
                    outtxt[j++] = 'A' + l - 10;
 801318e:	1a0c      	addi      	r2, r14, 48
 8013190:	2336      	addi      	r3, 55
 8013192:	d6620023 	str.b      	r3, (r2, r19 << 0)
                if (0 != (i % 2))
 8013196:	e4602001 	andi      	r3, r0, 1
 801319a:	e9030007 	bez      	r3, 0x80131a8	// 80131a8 <_vsnprintf+0x58c>
                    outtxt[j++] = ':';
 801319e:	1a0c      	addi      	r2, r14, 48
 80131a0:	5c62      	addi      	r3, r4, 1
 80131a2:	d4820037 	str.b      	r23, (r2, r4 << 0)
 80131a6:	750c      	zextb      	r4, r3
            for(i = 0; i < 4; i++)
 80131a8:	2000      	addi      	r0, 1
 80131aa:	7400      	zextb      	r0, r0
 80131ac:	e58c0007 	addi      	r12, r12, 8
 80131b0:	e82dffd7 	bnezad      	r13, 0x801315e	// 801315e <_vsnprintf+0x542>
            inuint++;
 80131b4:	e6d60003 	addi      	r22, r22, 4
        for (k = 0; k < 4; k++)
 80131b8:	c6d80480 	cmpne      	r24, r22
 80131bc:	0bca      	bt      	0x8013150	// 8013150 <_vsnprintf+0x534>
    outtxt[j - 1] = 0;
 80131be:	e46e002e 	addi      	r3, r14, 47
 80131c2:	3200      	movi      	r2, 0
 80131c4:	d4830022 	str.b      	r2, (r3, r4 << 0)
    return j - 1;
 80131c8:	5c63      	subi      	r3, r4, 1
        if (flags & FLAGS_PRECISION) {
 80131ca:	e4412400 	andi      	r2, r1, 1024
    return j - 1;
 80131ce:	6c0f      	mov      	r0, r3
          l = (l < precision ? l : precision);
 80131d0:	3a40      	cmpnei      	r2, 0
 80131d2:	f943cd23 	min.u32      	r3, r3, r10
        if (flags & FLAGS_PRECISION) {
 80131d6:	b84a      	st.w      	r2, (r14, 0x28)
          l = (l < precision ? l : precision);
 80131d8:	6c83      	mov      	r2, r0
 80131da:	c4430c40 	inct      	r2, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 80131de:	e4612002 	andi      	r3, r1, 2
          l = (l < precision ? l : precision);
 80131e2:	b848      	st.w      	r2, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 80131e4:	b86b      	st.w      	r3, (r14, 0x2c)
 80131e6:	e923015a 	bnez      	r3, 0x801349a	// 801349a <_vsnprintf+0x87e>
          while (l++ < width) {
 80131ea:	c6220420 	cmphs      	r2, r17
 80131ee:	6ccb      	mov      	r3, r2
 80131f0:	2300      	addi      	r3, 1
 80131f2:	e8600239 	bt      	0x8013664	// 8013664 <_vsnprintf+0xa48>
 80131f6:	c5710023 	addu      	r3, r17, r11
 80131fa:	5b89      	subu      	r4, r3, r2
 80131fc:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 80131fe:	e56b0000 	addi      	r11, r11, 1
 8013202:	6cdf      	mov      	r3, r7
 8013204:	6c63      	mov      	r1, r8
 8013206:	3020      	movi      	r0, 32
 8013208:	7bd9      	jsr      	r6
          while (l++ < width) {
 801320a:	66d2      	cmpne      	r4, r11
 801320c:	6caf      	mov      	r2, r11
 801320e:	0bf8      	bt      	0x80131fe	// 80131fe <_vsnprintf+0x5e2>
 8013210:	e4710000 	addi      	r3, r17, 1
 8013214:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013216:	d80e0030 	ld.b      	r0, (r14, 0x30)
 801321a:	e900fe6d 	bez      	r0, 0x8012ef4	// 8012ef4 <_vsnprintf+0x2d8>
 801321e:	6caf      	mov      	r2, r11
 8013220:	e60e002f 	addi      	r16, r14, 48
 8013224:	d96e200a 	ld.w      	r11, (r14, 0x28)
 8013228:	0402      	br      	0x801322c	// 801322c <_vsnprintf+0x610>
          out(*(pstr++), buffer, idx++, maxlen);
 801322a:	6c93      	mov      	r2, r4
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801322c:	e90b0007 	bez      	r11, 0x801323a	// 801323a <_vsnprintf+0x61e>
 8013230:	e46a1000 	subi      	r3, r10, 1
 8013234:	e90a0185 	bez      	r10, 0x801353e	// 801353e <_vsnprintf+0x922>
 8013238:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 801323a:	e6100000 	addi      	r16, r16, 1
 801323e:	6cdf      	mov      	r3, r7
 8013240:	6c63      	mov      	r1, r8
 8013242:	5a82      	addi      	r4, r2, 1
 8013244:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013246:	d8100000 	ld.b      	r0, (r16, 0x0)
 801324a:	e920fff0 	bnez      	r0, 0x801322a	// 801322a <_vsnprintf+0x60e>
        if (flags & FLAGS_LEFT) {
 801324e:	986b      	ld.w      	r3, (r14, 0x2c)
 8013250:	e90300e2 	bez      	r3, 0x8013414	// 8013414 <_vsnprintf+0x7f8>
          while (l++ < width) {
 8013254:	9868      	ld.w      	r3, (r14, 0x20)
 8013256:	c6230420 	cmphs      	r3, r17
 801325a:	08dd      	bt      	0x8013414	// 8013414 <_vsnprintf+0x7f8>
 801325c:	c4910020 	addu      	r0, r17, r4
 8013260:	c460008a 	subu      	r10, r0, r3
 8013264:	6c93      	mov      	r2, r4
            out(' ', buffer, idx++, maxlen);
 8013266:	e5620000 	addi      	r11, r2, 1
 801326a:	6cdf      	mov      	r3, r7
 801326c:	6c63      	mov      	r1, r8
 801326e:	3020      	movi      	r0, 32
 8013270:	7bd9      	jsr      	r6
          while (l++ < width) {
 8013272:	66ea      	cmpne      	r10, r11
 8013274:	6caf      	mov      	r2, r11
 8013276:	0bf8      	bt      	0x8013266	// 8013266 <_vsnprintf+0x64a>
        format++;
 8013278:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 801327a:	9889      	ld.w      	r4, (r14, 0x24)
 801327c:	e800fcdf 	br      	0x8012c3a	// 8012c3a <_vsnprintf+0x1e>
        const char* p = va_arg(va, char*);
 8013280:	5c6e      	addi      	r3, r4, 4
 8013282:	b869      	st.w      	r3, (r14, 0x24)
 8013284:	da642000 	ld.w      	r19, (r4, 0x0)
 8013288:	1a0c      	addi      	r2, r14, 48
        if (hbit > 9)
 801328a:	ea140009 	movi      	r20, 9
        outtxt[3 * i + 2] = '-';
 801328e:	ea15002d 	movi      	r21, 45
 8013292:	ea120006 	movi      	r18, 6
        hbit = (*(inchar + i) & 0xf0) >> 4;
 8013296:	d8730000 	ld.b      	r3, (r19, 0x0)
 801329a:	4b04      	lsri      	r0, r3, 4
        if (hbit > 9)
 801329c:	c4140420 	cmphs      	r20, r0
        lbit = *(inchar + i ) & 0x0f;
 80132a0:	e463200f 	andi      	r3, r3, 15
        if (hbit > 9)
 80132a4:	089d      	bt      	0x80133de	// 80133de <_vsnprintf+0x7c2>
        if (lbit > 9)
 80132a6:	c4740420 	cmphs      	r20, r3
            outtxt[3 * i] = 'A' + hbit - 10;
 80132aa:	2036      	addi      	r0, 55
 80132ac:	a200      	st.b      	r0, (r2, 0x0)
        if (lbit > 9)
 80132ae:	089d      	bt      	0x80133e8	// 80133e8 <_vsnprintf+0x7cc>
            outtxt[3 * i + 1] = 'A' + lbit - 10;
 80132b0:	2336      	addi      	r3, 55
 80132b2:	a261      	st.b      	r3, (r2, 0x1)
        outtxt[3 * i + 2] = '-';
 80132b4:	dea20002 	st.b      	r21, (r2, 0x2)
 80132b8:	e6730000 	addi      	r19, r19, 1
 80132bc:	2202      	addi      	r2, 3
    for(i = 0; i < 6; i++)/* mac length */
 80132be:	e832ffec 	bnezad      	r18, 0x8013296	// 8013296 <_vsnprintf+0x67a>
    outtxt[3 * (i - 1) + 2] = 0;
 80132c2:	3300      	movi      	r3, 0
 80132c4:	dc6e0041 	st.b      	r3, (r14, 0x41)
        if (flags & FLAGS_PRECISION) {
 80132c8:	e4612400 	andi      	r3, r1, 1024
 80132cc:	b86a      	st.w      	r3, (r14, 0x28)
 80132ce:	e90300f3 	bez      	r3, 0x80134b4	// 80134b4 <_vsnprintf+0x898>
          l = (l < precision ? l : precision);
 80132d2:	ea100011 	movi      	r16, 17
 80132d6:	fa0acd23 	min.u32      	r3, r10, r16
 80132da:	b868      	st.w      	r3, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 80132dc:	e4612002 	andi      	r3, r1, 2
 80132e0:	b86b      	st.w      	r3, (r14, 0x2c)
 80132e2:	e92300e2 	bnez      	r3, 0x80134a6	// 80134a6 <_vsnprintf+0x88a>
          while (l++ < width) {
 80132e6:	9848      	ld.w      	r2, (r14, 0x20)
 80132e8:	c6220420 	cmphs      	r2, r17
 80132ec:	6ccb      	mov      	r3, r2
 80132ee:	2300      	addi      	r3, 1
 80132f0:	09c9      	bt      	0x8013682	// 8013682 <_vsnprintf+0xa66>
 80132f2:	c5710023 	addu      	r3, r17, r11
 80132f6:	c4430090 	subu      	r16, r3, r2
 80132fa:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 80132fc:	e56b0000 	addi      	r11, r11, 1
 8013300:	6cdf      	mov      	r3, r7
 8013302:	6c63      	mov      	r1, r8
 8013304:	3020      	movi      	r0, 32
 8013306:	7bd9      	jsr      	r6
          while (l++ < width) {
 8013308:	c60b0480 	cmpne      	r11, r16
 801330c:	6caf      	mov      	r2, r11
 801330e:	0bf7      	bt      	0x80132fc	// 80132fc <_vsnprintf+0x6e0>
 8013310:	e4710000 	addi      	r3, r17, 1
 8013314:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013316:	d80e0030 	ld.b      	r0, (r14, 0x30)
 801331a:	e900fded 	bez      	r0, 0x8012ef4	// 8012ef4 <_vsnprintf+0x2d8>
 801331e:	6caf      	mov      	r2, r11
 8013320:	1c0c      	addi      	r4, r14, 48
 8013322:	d96e200a 	ld.w      	r11, (r14, 0x28)
 8013326:	0403      	br      	0x801332c	// 801332c <_vsnprintf+0x710>
          out(*(pstr++), buffer, idx++, maxlen);
 8013328:	c4104822 	lsli      	r2, r16, 0
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801332c:	e90b0007 	bez      	r11, 0x801333a	// 801333a <_vsnprintf+0x71e>
 8013330:	e46a1000 	subi      	r3, r10, 1
 8013334:	e90a010a 	bez      	r10, 0x8013548	// 8013548 <_vsnprintf+0x92c>
 8013338:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 801333a:	2400      	addi      	r4, 1
 801333c:	6cdf      	mov      	r3, r7
 801333e:	6c63      	mov      	r1, r8
 8013340:	e6020000 	addi      	r16, r2, 1
 8013344:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013346:	8400      	ld.b      	r0, (r4, 0x0)
 8013348:	e920fff0 	bnez      	r0, 0x8013328	// 8013328 <_vsnprintf+0x70c>
        if (flags & FLAGS_LEFT) {
 801334c:	986b      	ld.w      	r3, (r14, 0x2c)
 801334e:	e90300b6 	bez      	r3, 0x80134ba	// 80134ba <_vsnprintf+0x89e>
          while (l++ < width) {
 8013352:	9868      	ld.w      	r3, (r14, 0x20)
 8013354:	c6230420 	cmphs      	r3, r17
 8013358:	08b1      	bt      	0x80134ba	// 80134ba <_vsnprintf+0x89e>
 801335a:	c6110020 	addu      	r0, r17, r16
 801335e:	588d      	subu      	r4, r0, r3
 8013360:	c4104822 	lsli      	r2, r16, 0
            out(' ', buffer, idx++, maxlen);
 8013364:	e5620000 	addi      	r11, r2, 1
 8013368:	6cdf      	mov      	r3, r7
 801336a:	6c63      	mov      	r1, r8
 801336c:	3020      	movi      	r0, 32
 801336e:	7bd9      	jsr      	r6
          while (l++ < width) {
 8013370:	652e      	cmpne      	r11, r4
 8013372:	6caf      	mov      	r2, r11
 8013374:	0bf8      	bt      	0x8013364	// 8013364 <_vsnprintf+0x748>
        format++;
 8013376:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8013378:	9889      	ld.w      	r4, (r14, 0x24)
 801337a:	e800fc60 	br      	0x8012c3a	// 8012c3a <_vsnprintf+0x1e>
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
 801337e:	e46020df 	andi      	r3, r0, 223
 8013382:	eb430047 	cmpnei      	r3, 71
 8013386:	0805      	bt      	0x8013390	// 8013390 <_vsnprintf+0x774>
 8013388:	ec210800 	ori      	r1, r1, 2048
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
 801338c:	e40020fd 	andi      	r0, r0, 253
 8013390:	eb400045 	cmpnei      	r0, 69
 8013394:	0803      	bt      	0x801339a	// 801339a <_vsnprintf+0x77e>
 8013396:	ec210020 	ori      	r1, r1, 32
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 801339a:	b824      	st.w      	r1, (r14, 0x10)
 801339c:	de2e2003 	st.w      	r17, (r14, 0xc)
 80133a0:	dd4e2002 	st.w      	r10, (r14, 0x8)
 80133a4:	e6040007 	addi      	r16, r4, 8
 80133a8:	9460      	ld.w      	r3, (r4, 0x0)
 80133aa:	9481      	ld.w      	r4, (r4, 0x4)
 80133ac:	b860      	st.w      	r3, (r14, 0x0)
 80133ae:	b881      	st.w      	r4, (r14, 0x4)
 80133b0:	6caf      	mov      	r2, r11
 80133b2:	6cdf      	mov      	r3, r7
 80133b4:	6c63      	mov      	r1, r8
 80133b6:	6c1b      	mov      	r0, r6
 80133b8:	e3fff9ec 	bsr      	0x8012790	// 8012790 <_etoa>
 80133bc:	6ec3      	mov      	r11, r0
        format++;
 80133be:	2500      	addi      	r5, 1
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 80133c0:	c4104824 	lsli      	r4, r16, 0
        break;
 80133c4:	e800fc3b 	br      	0x8012c3a	// 8012c3a <_vsnprintf+0x1e>
                    outtxt[j++] = '0' + l;
 80133c8:	1a0c      	addi      	r2, r14, 48
 80133ca:	232f      	addi      	r3, 48
 80133cc:	d6620023 	str.b      	r3, (r2, r19 << 0)
 80133d0:	06e3      	br      	0x8013196	// 8013196 <_vsnprintf+0x57a>
                    outtxt[j++]= '0' + h;
 80133d2:	e6ae002f 	addi      	r21, r14, 48
 80133d6:	222f      	addi      	r2, 48
 80133d8:	d4950022 	str.b      	r2, (r21, r4 << 0)
 80133dc:	06d3      	br      	0x8013182	// 8013182 <_vsnprintf+0x566>
        if (lbit > 9)
 80133de:	c4740420 	cmphs      	r20, r3
            outtxt[3 * i]= '0' + hbit;
 80133e2:	202f      	addi      	r0, 48
 80133e4:	a200      	st.b      	r0, (r2, 0x0)
        if (lbit > 9)
 80133e6:	0f65      	bf      	0x80132b0	// 80132b0 <_vsnprintf+0x694>
            outtxt[3 * i + 1] = '0' + lbit;
 80133e8:	232f      	addi      	r3, 48
 80133ea:	a261      	st.b      	r3, (r2, 0x1)
 80133ec:	0764      	br      	0x80132b4	// 80132b4 <_vsnprintf+0x698>
            m = (bit % 100) / 10;
 80133ee:	c6828422 	mult      	r2, r2, r20
 80133f2:	60ca      	subu      	r3, r2
 80133f4:	74cc      	zextb      	r3, r3
 80133f6:	c6638022 	divu      	r2, r3, r19
            if (m)
 80133fa:	e902fd0c 	bez      	r2, 0x8012e12	// 8012e12 <_vsnprintf+0x1f6>
 80133fe:	6f13      	mov      	r12, r4
                outtxt[j++] = '0' + m;
 8013400:	e5ae002f 	addi      	r13, r14, 48
 8013404:	e48c0000 	addi      	r4, r12, 1
 8013408:	222f      	addi      	r2, 48
 801340a:	7510      	zextb      	r4, r4
 801340c:	d58d0022 	str.b      	r2, (r13, r12 << 0)
 8013410:	e800fd01 	br      	0x8012e12	// 8012e12 <_vsnprintf+0x1f6>
          while (l++ < width) {
 8013414:	6ed3      	mov      	r11, r4
        format++;
 8013416:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8013418:	9889      	ld.w      	r4, (r14, 0x24)
 801341a:	e800fc10 	br      	0x8012c3a	// 8012c3a <_vsnprintf+0x1e>
 801341e:	6caf      	mov      	r2, r11
 8013420:	e800fc81 	br      	0x8012d22	// 8012d22 <_vsnprintf+0x106>
      const int w = va_arg(va, int);
 8013424:	9400      	ld.w      	r0, (r4, 0x0)
 8013426:	5c6e      	addi      	r3, r4, 4
      if (w < 0) {
 8013428:	e98000af 	blz      	r0, 0x8013586	// 8013586 <_vsnprintf+0x96a>
        width = (unsigned int)w;
 801342c:	c4004831 	lsli      	r17, r0, 0
 8013430:	8201      	ld.b      	r0, (r2, 0x1)
      const int w = va_arg(va, int);
 8013432:	6d0f      	mov      	r4, r3
      format++;
 8013434:	5aa2      	addi      	r5, r2, 1
 8013436:	e800fc38 	br      	0x8012ca6	// 8012ca6 <_vsnprintf+0x8a>
 801343a:	8502      	ld.b      	r0, (r5, 0x2)
          flags |= FLAGS_CHAR;
 801343c:	ec2100c0 	ori      	r1, r1, 192
          format++;
 8013440:	2501      	addi      	r5, 2
 8013442:	e800fc47 	br      	0x8012cd0	// 8012cd0 <_vsnprintf+0xb4>
 8013446:	8502      	ld.b      	r0, (r5, 0x2)
          flags |= FLAGS_LONG_LONG;
 8013448:	ec210300 	ori      	r1, r1, 768
          format++;
 801344c:	2501      	addi      	r5, 2
 801344e:	e800fc41 	br      	0x8012cd0	// 8012cd0 <_vsnprintf+0xb4>
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013452:	e900fdb2 	bez      	r0, 0x8012fb6	// 8012fb6 <_vsnprintf+0x39a>
 8013456:	6caf      	mov      	r2, r11
 8013458:	b88b      	st.w      	r4, (r14, 0x2c)
 801345a:	d96e2009 	ld.w      	r11, (r14, 0x24)
 801345e:	e800fd96 	br      	0x8012f8a	// 8012f8a <_vsnprintf+0x36e>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8013462:	6cdf      	mov      	r3, r7
 8013464:	6caf      	mov      	r2, r11
 8013466:	6c63      	mov      	r1, r8
 8013468:	8400      	ld.b      	r0, (r4, 0x0)
 801346a:	7bd9      	jsr      	r6
          while (l++ < width) {
 801346c:	eb110001 	cmphsi      	r17, 2
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8013470:	e6040003 	addi      	r16, r4, 4
 8013474:	e54b0000 	addi      	r10, r11, 1
          while (l++ < width) {
 8013478:	0cfc      	bf      	0x8013670	// 8013670 <_vsnprintf+0xa54>
 801347a:	c571002b 	addu      	r11, r17, r11
 801347e:	6cab      	mov      	r2, r10
            out(' ', buffer, idx++, maxlen);
 8013480:	5a82      	addi      	r4, r2, 1
 8013482:	6cdf      	mov      	r3, r7
 8013484:	6c63      	mov      	r1, r8
 8013486:	3020      	movi      	r0, 32
 8013488:	7bd9      	jsr      	r6
          while (l++ < width) {
 801348a:	652e      	cmpne      	r11, r4
 801348c:	6c93      	mov      	r2, r4
 801348e:	0bf9      	bt      	0x8013480	// 8013480 <_vsnprintf+0x864>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8013490:	c4104824 	lsli      	r4, r16, 0
        format++;
 8013494:	2500      	addi      	r5, 1
 8013496:	e800fbd2 	br      	0x8012c3a	// 8012c3a <_vsnprintf+0x1e>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801349a:	d80e0030 	ld.b      	r0, (r14, 0x30)
 801349e:	e920fec0 	bnez      	r0, 0x801321e	// 801321e <_vsnprintf+0x602>
 80134a2:	6d2f      	mov      	r4, r11
 80134a4:	06d8      	br      	0x8013254	// 8013254 <_vsnprintf+0x638>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80134a6:	d80e0030 	ld.b      	r0, (r14, 0x30)
 80134aa:	e920ff3a 	bnez      	r0, 0x801331e	// 801331e <_vsnprintf+0x702>
 80134ae:	c40b4830 	lsli      	r16, r11, 0
 80134b2:	0750      	br      	0x8013352	// 8013352 <_vsnprintf+0x736>
        unsigned int l = __mac2str((unsigned char *)p, store);
 80134b4:	3311      	movi      	r3, 17
 80134b6:	b868      	st.w      	r3, (r14, 0x20)
 80134b8:	0712      	br      	0x80132dc	// 80132dc <_vsnprintf+0x6c0>
          while (l++ < width) {
 80134ba:	c410482b 	lsli      	r11, r16, 0
        format++;
 80134be:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 80134c0:	9889      	ld.w      	r4, (r14, 0x24)
 80134c2:	e800fbbc 	br      	0x8012c3a	// 8012c3a <_vsnprintf+0x1e>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80134c6:	d80e0030 	ld.b      	r0, (r14, 0x30)
 80134ca:	e920fce7 	bnez      	r0, 0x8012e98	// 8012e98 <_vsnprintf+0x27c>
 80134ce:	6d2f      	mov      	r4, r11
 80134d0:	e800fcff 	br      	0x8012ece	// 8012ece <_vsnprintf+0x2b2>
          base =  8U;
 80134d4:	3208      	movi      	r2, 8
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 80134d6:	c4412823 	bclri      	r3, r1, 2
 80134da:	3b83      	bclri      	r3, 3
        if (flags & FLAGS_PRECISION) {
 80134dc:	e4212400 	andi      	r1, r1, 1024
 80134e0:	e901fdda 	bez      	r1, 0x8013094	// 8013094 <_vsnprintf+0x478>
 80134e4:	e800fdd7 	br      	0x8013092	// 8013092 <_vsnprintf+0x476>
        if ((*format != 'i') && (*format != 'd')) {
 80134e8:	eb400064 	cmpnei      	r0, 100
          flags &= ~FLAGS_HASH;   // no hash for dec format
 80134ec:	6c4f      	mov      	r1, r3
          base = 10U;
 80134ee:	320a      	movi      	r2, 10
        if ((*format != 'i') && (*format != 'd')) {
 80134f0:	0bf3      	bt      	0x80134d6	// 80134d6 <_vsnprintf+0x8ba>
        if (flags & FLAGS_PRECISION) {
 80134f2:	e4232400 	andi      	r1, r3, 1024
 80134f6:	e921fdce 	bnez      	r1, 0x8013092	// 8013092 <_vsnprintf+0x476>
          if (flags & FLAGS_LONG_LONG) {
 80134fa:	e4232200 	andi      	r1, r3, 512
 80134fe:	e9210066 	bnez      	r1, 0x80135ca	// 80135ca <_vsnprintf+0x9ae>
          else if (flags & FLAGS_LONG) {
 8013502:	e4032100 	andi      	r0, r3, 256
 8013506:	e9200099 	bnez      	r0, 0x8013638	// 8013638 <_vsnprintf+0xa1c>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 801350a:	e4232040 	andi      	r1, r3, 64
 801350e:	e92100a8 	bnez      	r1, 0x801365e	// 801365e <_vsnprintf+0xa42>
 8013512:	e4232080 	andi      	r1, r3, 128
 8013516:	e921008c 	bnez      	r1, 0x801362e	// 801362e <_vsnprintf+0xa12>
 801351a:	9420      	ld.w      	r1, (r4, 0x0)
 801351c:	491f      	lsri      	r0, r1, 31
 801351e:	2403      	addi      	r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8013520:	b865      	st.w      	r3, (r14, 0x14)
 8013522:	de2e2004 	st.w      	r17, (r14, 0x10)
 8013526:	dd4e2003 	st.w      	r10, (r14, 0xc)
 801352a:	b842      	st.w      	r2, (r14, 0x8)
 801352c:	b801      	st.w      	r0, (r14, 0x4)
 801352e:	c4010201 	abs      	r1, r1
 8013532:	e800fdd3 	br      	0x80130d8	// 80130d8 <_vsnprintf+0x4bc>
 8013536:	988b      	ld.w      	r4, (r14, 0x2c)
 8013538:	6ecb      	mov      	r11, r2
 801353a:	e800fd3b 	br      	0x8012fb0	// 8012fb0 <_vsnprintf+0x394>
 801353e:	6d0b      	mov      	r4, r2
 8013540:	0687      	br      	0x801324e	// 801324e <_vsnprintf+0x632>
 8013542:	6d0b      	mov      	r4, r2
 8013544:	e800fcc2 	br      	0x8012ec8	// 8012ec8 <_vsnprintf+0x2ac>
 8013548:	c4024830 	lsli      	r16, r2, 0
 801354c:	0700      	br      	0x801334c	// 801334c <_vsnprintf+0x730>
          base = 16U;
 801354e:	3210      	movi      	r2, 16
 8013550:	07c3      	br      	0x80134d6	// 80134d6 <_vsnprintf+0x8ba>
 8013552:	c4412823 	bclri      	r3, r1, 2
 8013556:	3b83      	bclri      	r3, 3
        if (flags & FLAGS_PRECISION) {
 8013558:	e4212400 	andi      	r1, r1, 1024
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 801355c:	ec630020 	ori      	r3, r3, 32
          base = 16U;
 8013560:	3210      	movi      	r2, 16
        if (flags & FLAGS_PRECISION) {
 8013562:	e921fd98 	bnez      	r1, 0x8013092	// 8013092 <_vsnprintf+0x476>
 8013566:	e800fd9f 	br      	0x80130a4	// 80130a4 <_vsnprintf+0x488>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
 801356a:	ec210020 	ori      	r1, r1, 32
 801356e:	e800fdc4 	br      	0x80130f6	// 80130f6 <_vsnprintf+0x4da>
        precision = prec > 0 ? (unsigned int)prec : 0U;
 8013572:	d9a42000 	ld.w      	r13, (r4, 0x0)
 8013576:	3300      	movi      	r3, 0
 8013578:	8502      	ld.b      	r0, (r5, 0x2)
 801357a:	f86dccaa 	max.s32      	r10, r13, r3
        const int prec = (int)va_arg(va, int);
 801357e:	2403      	addi      	r4, 4
        format++;
 8013580:	2501      	addi      	r5, 2
 8013582:	e800fb97 	br      	0x8012cb0	// 8012cb0 <_vsnprintf+0x94>
        width = (unsigned int)-w;
 8013586:	ea0c0000 	movi      	r12, 0
        flags |= FLAGS_LEFT;    // reverse padding
 801358a:	ec210002 	ori      	r1, r1, 2
        width = (unsigned int)-w;
 801358e:	c40c0091 	subu      	r17, r12, r0
 8013592:	074f      	br      	0x8013430	// 8013430 <_vsnprintf+0x814>
            idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
 8013594:	b867      	st.w      	r3, (r14, 0x1c)
 8013596:	3300      	movi      	r3, 0
 8013598:	de2e2006 	st.w      	r17, (r14, 0x18)
 801359c:	dd4e2005 	st.w      	r10, (r14, 0x14)
 80135a0:	b843      	st.w      	r2, (r14, 0xc)
 80135a2:	b864      	st.w      	r3, (r14, 0x10)
 80135a4:	b862      	st.w      	r3, (r14, 0x8)
 80135a6:	e6040007 	addi      	r16, r4, 8
 80135aa:	9460      	ld.w      	r3, (r4, 0x0)
 80135ac:	9481      	ld.w      	r4, (r4, 0x4)
 80135ae:	b860      	st.w      	r3, (r14, 0x0)
 80135b0:	b881      	st.w      	r4, (r14, 0x4)
 80135b2:	6caf      	mov      	r2, r11
 80135b4:	6cdf      	mov      	r3, r7
 80135b6:	6c63      	mov      	r1, r8
 80135b8:	6c1b      	mov      	r0, r6
 80135ba:	e3fff633 	bsr      	0x8012220	// 8012220 <_ntoa_long_long>
 80135be:	6ec3      	mov      	r11, r0
 80135c0:	c4104824 	lsli      	r4, r16, 0
        format++;
 80135c4:	2500      	addi      	r5, 1
 80135c6:	e800fb3a 	br      	0x8012c3a	// 8012c3a <_vsnprintf+0x1e>
            const long long value = va_arg(va, long long);
 80135ca:	9421      	ld.w      	r1, (r4, 0x4)
 80135cc:	9400      	ld.w      	r0, (r4, 0x0)
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80135ce:	b867      	st.w      	r3, (r14, 0x1c)
 80135d0:	3300      	movi      	r3, 0
 80135d2:	b864      	st.w      	r3, (r14, 0x10)
 80135d4:	497f      	lsri      	r3, r1, 31
 80135d6:	b843      	st.w      	r2, (r14, 0xc)
 80135d8:	b862      	st.w      	r3, (r14, 0x8)
            const long long value = va_arg(va, long long);
 80135da:	e6040007 	addi      	r16, r4, 8
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80135de:	de2e2006 	st.w      	r17, (r14, 0x18)
 80135e2:	dd4e2005 	st.w      	r10, (r14, 0x14)
 80135e6:	6c83      	mov      	r2, r0
 80135e8:	6cc7      	mov      	r3, r1
 80135ea:	e9810053 	blz      	r1, 0x8013690	// 8013690 <_vsnprintf+0xa74>
 80135ee:	b840      	st.w      	r2, (r14, 0x0)
 80135f0:	b861      	st.w      	r3, (r14, 0x4)
 80135f2:	07e0      	br      	0x80135b2	// 80135b2 <_vsnprintf+0x996>
            idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
 80135f4:	b865      	st.w      	r3, (r14, 0x14)
 80135f6:	de2e2004 	st.w      	r17, (r14, 0x10)
 80135fa:	dd4e2003 	st.w      	r10, (r14, 0xc)
 80135fe:	b842      	st.w      	r2, (r14, 0x8)
 8013600:	b821      	st.w      	r1, (r14, 0x4)
 8013602:	9460      	ld.w      	r3, (r4, 0x0)
 8013604:	e6040003 	addi      	r16, r4, 4
 8013608:	b860      	st.w      	r3, (r14, 0x0)
 801360a:	6caf      	mov      	r2, r11
 801360c:	6cdf      	mov      	r3, r7
 801360e:	6c63      	mov      	r1, r8
 8013610:	6c1b      	mov      	r0, r6
 8013612:	e3fff5a7 	bsr      	0x8012160	// 8012160 <_ntoa_long>
 8013616:	6ec3      	mov      	r11, r0
 8013618:	c4104824 	lsli      	r4, r16, 0
        format++;
 801361c:	2500      	addi      	r5, 1
 801361e:	e800fb0e 	br      	0x8012c3a	// 8012c3a <_vsnprintf+0x1e>
          base =  2U;
 8013622:	3202      	movi      	r2, 2
 8013624:	0759      	br      	0x80134d6	// 80134d6 <_vsnprintf+0x8ba>
 8013626:	8c20      	ld.h      	r1, (r4, 0x0)
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8013628:	2403      	addi      	r4, 4
 801362a:	e800fd4f 	br      	0x80130c8	// 80130c8 <_vsnprintf+0x4ac>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 801362e:	d8245000 	ld.hs      	r1, (r4, 0x0)
 8013632:	491f      	lsri      	r0, r1, 31
 8013634:	2403      	addi      	r4, 4
 8013636:	0775      	br      	0x8013520	// 8013520 <_vsnprintf+0x904>
            const long value = va_arg(va, long);
 8013638:	9420      	ld.w      	r1, (r4, 0x0)
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 801363a:	b865      	st.w      	r3, (r14, 0x14)
 801363c:	497f      	lsri      	r3, r1, 31
 801363e:	c4010201 	abs      	r1, r1
            const long value = va_arg(va, long);
 8013642:	e6040003 	addi      	r16, r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8013646:	de2e2004 	st.w      	r17, (r14, 0x10)
 801364a:	dd4e2003 	st.w      	r10, (r14, 0xc)
 801364e:	b842      	st.w      	r2, (r14, 0x8)
 8013650:	b861      	st.w      	r3, (r14, 0x4)
 8013652:	b820      	st.w      	r1, (r14, 0x0)
 8013654:	07db      	br      	0x801360a	// 801360a <_vsnprintf+0x9ee>
 8013656:	8420      	ld.b      	r1, (r4, 0x0)
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8013658:	2403      	addi      	r4, 4
 801365a:	e800fd37 	br      	0x80130c8	// 80130c8 <_vsnprintf+0x4ac>
 801365e:	8420      	ld.b      	r1, (r4, 0x0)
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 8013660:	2403      	addi      	r4, 4
 8013662:	075f      	br      	0x8013520	// 8013520 <_vsnprintf+0x904>
          while (l++ < width) {
 8013664:	b868      	st.w      	r3, (r14, 0x20)
 8013666:	e800fdd8 	br      	0x8013216	// 8013216 <_vsnprintf+0x5fa>
          while (l++ < width) {
 801366a:	b868      	st.w      	r3, (r14, 0x20)
 801366c:	e800fc12 	br      	0x8012e90	// 8012e90 <_vsnprintf+0x274>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8013670:	c4104824 	lsli      	r4, r16, 0
 8013674:	6eeb      	mov      	r11, r10
        format++;
 8013676:	2500      	addi      	r5, 1
 8013678:	e800fae1 	br      	0x8012c3a	// 8012c3a <_vsnprintf+0x1e>
          while (l++ < width) {
 801367c:	6eaf      	mov      	r10, r11
 801367e:	e800fce1 	br      	0x8013040	// 8013040 <_vsnprintf+0x424>
          while (l++ < width) {
 8013682:	b868      	st.w      	r3, (r14, 0x20)
 8013684:	0649      	br      	0x8013316	// 8013316 <_vsnprintf+0x6fa>
          while (l++ < width) {
 8013686:	6d0f      	mov      	r4, r3
 8013688:	c40b4832 	lsli      	r18, r11, 0
 801368c:	e800fc76 	br      	0x8012f78	// 8012f78 <_vsnprintf+0x35c>
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8013690:	3000      	movi      	r0, 0
 8013692:	3100      	movi      	r1, 0
 8013694:	f840c462 	sub.64      	r2, r0, r2
 8013698:	07ab      	br      	0x80135ee	// 80135ee <_vsnprintf+0x9d2>
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801369a:	c412482b 	lsli      	r11, r18, 0
 801369e:	e800fc9c 	br      	0x8012fd6	// 8012fd6 <_vsnprintf+0x3ba>
	...

080136a4 <fputc>:
    while((READ_REG(UART0->FIFOS) & 0x3F) >= 32);
 80136a4:	1046      	lrw      	r2, 0x40010600	// 80136bc <fputc+0x18>
 80136a6:	9267      	ld.w      	r3, (r2, 0x1c)
 80136a8:	e463203f 	andi      	r3, r3, 63
 80136ac:	3b1f      	cmphsi      	r3, 32
 80136ae:	0bfc      	bt      	0x80136a6	// 80136a6 <fputc+0x2>
    WRITE_REG(UART0->TDW, (char)ch);
 80136b0:	e40020ff 	andi      	r0, r0, 255
 80136b4:	b208      	st.w      	r0, (r2, 0x20)
}
 80136b6:	3000      	movi      	r0, 0
 80136b8:	783c      	jmp      	r15
 80136ba:	0000      	.short	0x0000
 80136bc:	40010600 	.long	0x40010600

080136c0 <wm_printf>:
  return _vsnprintf(_out_buffer, buffer, count, format, va);
}


int wm_printf(const char *fmt,...)
{
 80136c0:	1424      	subi      	r14, r14, 16
 80136c2:	b863      	st.w      	r3, (r14, 0xc)
 80136c4:	b842      	st.w      	r2, (r14, 0x8)
 80136c6:	b821      	st.w      	r1, (r14, 0x4)
 80136c8:	b800      	st.w      	r0, (r14, 0x0)
 80136ca:	14d0      	push      	r15
 80136cc:	1421      	subi      	r14, r14, 4
 80136ce:	9862      	ld.w      	r3, (r14, 0x8)
 80136d0:	6c8f      	mov      	r2, r3
    va_list args;
    size_t length;

	va_start(args, fmt);
	length = _vsnprintf(_out_uart, (char*)fmt, (size_t) - 1, fmt, args);
 80136d2:	1b03      	addi      	r3, r14, 12
 80136d4:	b860      	st.w      	r3, (r14, 0x0)
 80136d6:	6ccb      	mov      	r3, r2
 80136d8:	3200      	movi      	r2, 0
 80136da:	2a00      	subi      	r2, 1
 80136dc:	6c4f      	mov      	r1, r3
 80136de:	1005      	lrw      	r0, 0x8011ec4	// 80136f0 <wm_printf+0x30>
 80136e0:	e3fffa9e 	bsr      	0x8012c1c	// 8012c1c <_vsnprintf>
	va_end(args);

	return length;
}
 80136e4:	1401      	addi      	r14, r14, 4
 80136e6:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 80136ea:	1405      	addi      	r14, r14, 20
 80136ec:	783c      	jmp      	r15
 80136ee:	0000      	.short	0x0000
 80136f0:	08011ec4 	.long	0x08011ec4
	...
