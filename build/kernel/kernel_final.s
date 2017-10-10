	.file	"kernel_final.c"
	.text
.Ltext0:
	.section	.text.unlikely,"ax",@progbits
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.section	.text.unlikely
.Ltext_cold0:
	.text
	.globl	idle_thread
	.type	idle_thread, @function
idle_thread:
.LFB500:
	.file 1 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/idle.c"
	.loc 1 17 0
	.cfi_startproc
	.p2align 4,,10
	.p2align 3
.L2:
	.loc 1 19 0 discriminator 1
#APP
# 19 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/idle.c" 1
	hlt
# 0 "" 2
#NO_APP
	jmp	.L2
	.cfi_endproc
.LFE500:
	.size	idle_thread, .-idle_thread
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.boot.text,"ax",@progbits
.LCOLDB3:
.LHOTB3:
	.p2align 4,,15
	.type	merge_regions, @function
merge_regions:
.LFB507:
	.file 2 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/kernel/boot.c"
	.loc 2 85 0
	.cfi_startproc
.LVL0:
	movl	allocated_p_regions+264, %edx
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.loc 2 88 0
	movl	$1, %ecx
	.loc 2 85 0
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
.LVL1:
.L4:
	.loc 2 88 0 discriminator 1
	cmpl	%edx, %ecx
	jnb	.L14
.L10:
	.loc 2 89 0
	leal	-1(%ecx), %eax
	movl	allocated_p_regions(,%ecx,8), %ebx
	cmpl	%ebx, allocated_p_regions+4(,%eax,8)
	je	.L15
	.loc 2 100 0
	addl	$1, %ecx
.LVL2:
	.loc 2 88 0
	cmpl	%edx, %ecx
	jb	.L10
.L14:
	.loc 2 103 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L15:
	.cfi_restore_state
	.loc 2 91 0
	movl	allocated_p_regions+4(,%ecx,8), %ebx
	movl	%ebx, allocated_p_regions+4(,%eax,8)
.LVL3:
	.loc 2 93 0
	leal	-1(%edx), %ebx
	leal	allocated_p_regions+8(,%ecx,8), %eax
	leal	allocated_p_regions(,%edx,8), %edx
	cmpl	%ebx, %ecx
	jnb	.L9
.LVL4:
	.p2align 4,,10
	.p2align 3
.L8:
	.loc 2 94 0 discriminator 3
	movl	(%eax), %esi
	addl	$8, %eax
	movl	-4(%eax), %edi
	movl	%esi, -16(%eax)
	movl	%edi, -12(%eax)
	.loc 2 93 0 discriminator 3
	cmpl	%edx, %eax
	jne	.L8
.L9:
	.loc 2 96 0
	movl	%ebx, allocated_p_regions+264
	.loc 2 93 0
	movl	%ebx, %edx
	jmp	.L4
	.cfi_endproc
.LFE507:
	.size	merge_regions, .-merge_regions
.LCOLDE3:
.LHOTE3:
	.section	.text.unlikely
.LCOLDB4:
	.text
.LHOTB4:
	.p2align 4,,15
	.type	lookupIOPTSlot_resolve_levels, @function
lookupIOPTSlot_resolve_levels:
.LFB609:
	.file 3 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/object/iospace.c"
	.loc 3 85 0
	.cfi_startproc
.LVL5:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 3 85 0
	movl	%eax, %ebx
	movl	20(%esp), %esi
	.loc 3 92 0
	testl	%edx, %edx
	je	.L23
	.loc 3 100 0
	movl	%esi, %eax
.LVL6:
	subl	16(%esp), %eax
	movl	%ecx, %edi
.LVL7:
	addl	x86KSnumIOPTLevels, %eax
	leal	-9(%eax,%eax,8), %ecx
.LVL8:
	movl	%edi, %eax
	shrl	%cl, %eax
	andl	$511, %eax
	leal	(%edx,%eax,8), %eax
.LVL9:
	movl	(%eax), %edx
.LVL10:
	.loc 3 102 0
	testb	$2, %dl
	je	.L21
	testl	%esi, %esi
	je	.L21
.LVL11:
	.loc 3 109 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	subl	$1, %esi
	andl	$-4096, %edx
	pushl	%esi
	.cfi_def_cfa_offset 28
	movl	%ebx, %eax
	movl	%edi, %ecx
.LVL12:
	subl	$536870912, %edx
	pushl	28(%esp)
	.cfi_def_cfa_offset 32
	call	lookupIOPTSlot_resolve_levels
.LVL13:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.LVL14:
	.loc 3 110 0
	movl	%ebx, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL15:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL16:
	ret
.LVL17:
	.p2align 4,,10
	.p2align 3
.L21:
	.cfi_restore_state
	.loc 3 106 0
	movl	%eax, 4(%ebx)
	.loc 3 110 0
	movl	%ebx, %eax
	.loc 3 106 0
	movl	%esi, 8(%ebx)
	movl	$0, (%ebx)
	.loc 3 110 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL18:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL19:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL20:
	ret
.LVL21:
	.p2align 4,,10
	.p2align 3
.L23:
	.cfi_restore_state
	.loc 3 96 0
	movl	$2, (%eax)
	movl	$0, 4(%eax)
	movl	%esi, 8(%eax)
	.loc 3 110 0
	movl	%ebx, %eax
.LVL22:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL23:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL24:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE609:
	.size	lookupIOPTSlot_resolve_levels, .-lookupIOPTSlot_resolve_levels
	.section	.text.unlikely
.LCOLDE4:
	.text
.LHOTE4:
	.section	.text.unlikely
.LCOLDB5:
	.text
.LHOTB5:
	.p2align 4,,15
	.type	pic_get_isr, @function
pic_get_isr:
.LFB882:
	.file 4 "/home/axjllt/Desktop/ori_refos/kernel/src/plat/pc99/machine/pic.c"
	.loc 4 89 0
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$16, %esp
	.cfi_def_cfa_offset 24
	.loc 4 90 0
	pushl	$11
	.cfi_def_cfa_offset 28
	pushl	$32
	.cfi_def_cfa_offset 32
	call	out8
.LVL25:
	.loc 4 91 0
	popl	%eax
	.cfi_def_cfa_offset 28
	popl	%edx
	.cfi_def_cfa_offset 24
	pushl	$11
	.cfi_def_cfa_offset 28
	pushl	$160
	.cfi_def_cfa_offset 32
	call	out8
.LVL26:
	.loc 4 92 0
	movl	$160, (%esp)
	call	in8
.LVL27:
	movl	$32, (%esp)
	movl	%eax, %ebx
	call	in8
.LVL28:
	.loc 4 93 0
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	.loc 4 92 0
	movzbl	%al, %edx
	movl	%ebx, %eax
	.loc 4 93 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	.loc 4 92 0
	sall	$8, %eax
	orl	%edx, %eax
	.loc 4 93 0
	ret
	.cfi_endproc
.LFE882:
	.size	pic_get_isr, .-pic_get_isr
	.section	.text.unlikely
.LCOLDE5:
	.text
.LHOTE5:
	.section	.text.unlikely
.LCOLDB6:
	.text
.LHOTB6:
	.p2align 4,,15
	.type	Mode_sanitiseRegister.part.55, @function
Mode_sanitiseRegister.part.55:
.LFB950:
	.file 5 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/32/machine/registerset.c"
	.loc 5 46 0
	.cfi_startproc
.LVL29:
	.loc 5 49 0
	movl	%eax, %edx
	andl	$-9, %edx
	.loc 5 50 0
	cmpl	$51, %edx
	movl	$0, %edx
	cmovne	%edx, %eax
.LVL30:
	.loc 5 54 0
	ret
	.cfi_endproc
.LFE950:
	.size	Mode_sanitiseRegister.part.55, .-Mode_sanitiseRegister.part.55
	.section	.text.unlikely
.LCOLDE6:
	.text
.LHOTE6:
	.section	.text.unlikely
.LCOLDB7:
	.text
.LHOTB7:
	.p2align 4,,15
	.type	fpuThreadDelete.part.56, @function
fpuThreadDelete.part.56:
.LFB951:
	.file 6 "/home/axjllt/Desktop/ori_refos/kernel/src/machine/fpu.c"
	.loc 6 68 0
	.cfi_startproc
.LVL31:
.LBB6525:
.LBB6526:
.LBB6527:
.LBB6528:
.LBB6529:
.LBB6530:
.LBB6531:
	.file 7 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h"
	.loc 7 29 0
#APP
# 29 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h" 1
	movl %cr0, %eax
# 0 "" 2
.LVL32:
#NO_APP
.LBE6531:
.LBE6530:
.LBB6532:
.LBB6533:
	.loc 7 35 0
	orl	$8, %eax
.LVL33:
#APP
# 35 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h" 1
	movl %eax, %cr0
# 0 "" 2
.LVL34:
#NO_APP
.LBE6533:
.LBE6532:
.LBE6529:
.LBE6528:
	.loc 6 33 0
	movl	$0, ksActiveFPUState
	ret
.LBE6527:
.LBE6526:
.LBE6525:
	.cfi_endproc
.LFE951:
	.size	fpuThreadDelete.part.56, .-fpuThreadDelete.part.56
	.section	.text.unlikely
.LCOLDE7:
	.text
.LHOTE7:
	.section	.text.unlikely
.LCOLDB8:
	.text
.LHOTB8:
	.p2align 4,,15
	.type	parse_opt.constprop.298, @function
parse_opt.constprop.298:
.LFB1230:
	.file 8 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/kernel/cmdline.c"
	.loc 8 36 0
	.cfi_startproc
.LVL35:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	.loc 8 38 0
	movl	$-1, %edi
	.loc 8 36 0
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$16, %esp
	.cfi_def_cfa_offset 36
	.loc 8 36 0
	movl	%edx, 8(%esp)
	movzbl	(%eax), %edx
.LVL36:
	.p2align 4,,10
	.p2align 3
.L32:
	.loc 8 42 0
	cmpb	$32, %dl
	jle	.L33
.L71:
.LVL37:
	.loc 8 47 0
	movl	8(%esp), %ebx
	movzbl	(%ebx), %ecx
	testb	%cl, %cl
	je	.L34
	cmpb	$61, %dl
	je	.L69
	cmpb	%dl, %cl
	jne	.L69
	movl	8(%esp), %ecx
	movl	%edi, 12(%esp)
	movl	%ecx, (%esp)
	jmp	.L43
.LVL38:
	.p2align 4,,10
	.p2align 3
.L40:
	movzbl	1(%eax), %edx
	movl	%esi, %eax
	cmpb	$61, %dl
	setne	%cl
	cmpb	$32, %dl
	movl	%ecx, %ebp
	setg	%cl
	movl	%ecx, %edi
.LVL39:
	movl	%ebp, %ecx
	movl	%edi, %ebx
	testb	%bl, %cl
	je	.L67
.LVL40:
	cmpb	%dl, 7(%esp)
	jne	.L67
.L43:
	addl	$1, (%esp)
.LVL41:
	movl	(%esp), %edi
.LVL42:
	leal	1(%eax), %esi
.LVL43:
	movzbl	(%edi), %ebx
	movb	%bl, 7(%esp)
	testb	%bl, %bl
	jne	.L40
	movzbl	1(%eax), %edx
	movl	12(%esp), %edi
.LVL44:
	.loc 8 49 0
	cmpb	$61, %dl
	je	.L41
.LVL45:
.L42:
	.loc 8 59 0
	cmpb	$32, %dl
	jle	.L51
.L37:
	.loc 8 49 0
	movl	%esi, %eax
.LVL46:
	.p2align 4,,10
	.p2align 3
.L49:
	.loc 8 59 0
	addl	$1, %eax
.LVL47:
	movzbl	(%eax), %edx
	cmpb	$32, %dl
	jg	.L49
	.loc 8 42 0
	cmpb	$32, %dl
	jg	.L71
.L33:
	testb	%dl, %dl
	jne	.L38
	.loc 8 63 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%edi, %eax
.LVL48:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL49:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL50:
.L51:
	.cfi_restore_state
	.loc 8 59 0
	movl	%esi, %eax
	jmp	.L32
.LVL51:
	.p2align 4,,10
	.p2align 3
.L38:
	movzbl	1(%eax), %edx
	.loc 8 42 0
	addl	$1, %eax
.LVL52:
	jmp	.L32
.LVL53:
	.p2align 4,,10
	.p2align 3
.L67:
	movl	12(%esp), %edi
	jmp	.L42
.LVL54:
.L52:
	.loc 8 49 0
	movl	%eax, %esi
.LVL55:
	.p2align 4,,10
	.p2align 3
.L41:
	.loc 8 52 0
	movzbl	1(%esi), %edx
	.loc 8 50 0
	leal	1(%esi), %eax
.LVL56:
	.loc 8 52 0
	cmpb	$32, %dl
	jle	.L50
	xorl	%edi, %edi
	jmp	.L47
.LVL57:
	.p2align 4,,10
	.p2align 3
.L46:
	cmpl	$999, %edi
	je	.L72
.LVL58:
.L47:
	addl	$1, %eax
.LVL59:
	.loc 8 53 0
	movb	%dl, cmdline_val(%edi)
	.loc 8 52 0
	addl	$1, %edi
.LVL60:
	movzbl	(%eax), %edx
	cmpb	$32, %dl
	jg	.L46
	leal	cmdline_val(%edi), %edx
.LVL61:
.L45:
	.loc 8 56 0
	movb	$0, (%edx)
	movl	%eax, %esi
	movzbl	(%eax), %edx
	jmp	.L42
.LVL62:
.L72:
	.loc 8 52 0
	movl	$cmdline_val+999, %edx
	jmp	.L45
.LVL63:
.L50:
	movl	$cmdline_val, %edx
	xorl	%edi, %edi
	jmp	.L45
.LVL64:
.L34:
	.loc 8 49 0
	cmpb	$61, %dl
	je	.L52
.L69:
	movl	%eax, %esi
	jmp	.L37
	.cfi_endproc
.LFE1230:
	.size	parse_opt.constprop.298, .-parse_opt.constprop.298
	.section	.text.unlikely
.LCOLDE8:
	.text
.LHOTE8:
	.section	.boot.text
.LCOLDB9:
.LHOTB9:
	.p2align 4,,15
	.globl	x2apic_is_enabled
	.type	x2apic_is_enabled, @function
x2apic_is_enabled:
.LFB561:
	.file 9 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/kernel/x2apic.c"
	.loc 9 18 0
	.cfi_startproc
.LVL65:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
.LBB6534:
.LBB6535:
.LBB6536:
.LBB6537:
	.file 10 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine.h"
	.loc 10 101 0
	movl	$27, %ecx
.LBE6537:
.LBE6536:
.LBE6535:
.LBE6534:
	.loc 9 18 0
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
.LBB6544:
.LBB6542:
.LBB6540:
.LBB6538:
	.loc 10 101 0
#APP
# 101 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine.h" 1
	rdmsr
# 0 "" 2
#NO_APP
.LBE6538:
.LBE6540:
.LBE6542:
.LBE6544:
.LBB6545:
.LBB6546:
	.loc 10 160 0
	xorl	%ecx, %ecx
.LBE6546:
.LBE6545:
.LBB6548:
.LBB6543:
.LBB6541:
.LBB6539:
	.loc 10 101 0
	movl	%eax, %esi
.LVL66:
.LBE6539:
.LBE6541:
.LBE6543:
.LBE6548:
.LBB6549:
.LBB6547:
	.loc 10 160 0
	movl	$1, %eax
#APP
# 160 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine.h" 1
	cpuid
# 0 "" 2
.LVL67:
#NO_APP
.LBE6547:
.LBE6549:
	.loc 9 22 0
	movl	%ecx, %eax
	andl	$2097152, %eax
	je	.L74
.LVL68:
	.loc 9 27 0 discriminator 1
	xorl	%eax, %eax
	.loc 9 22 0 discriminator 1
	testl	$2048, %esi
	je	.L74
.LVL69:
.LBB6550:
.LBB6551:
	.file 11 "./arch/object/structures_gen.h"
	.loc 11 479 0
	andl	$1024, %esi
.LBE6551:
.LBE6550:
	.loc 9 25 0
	movl	%esi, %eax
	shrl	$10, %eax
.L74:
	.loc 9 28 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE561:
	.size	x2apic_is_enabled, .-x2apic_is_enabled
.LCOLDE9:
.LHOTE9:
.LCOLDB10:
.LHOTB10:
	.p2align 4,,15
	.globl	apic_get_base_paddr
	.type	apic_get_base_paddr, @function
apic_get_base_paddr:
.LFB503:
	.file 12 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/kernel/apic.c"
	.loc 12 39 0
	.cfi_startproc
.LVL70:
.LBB6552:
.LBB6553:
.LBB6554:
.LBB6555:
	.loc 10 101 0
	movl	$27, %ecx
#APP
# 101 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine.h" 1
	rdmsr
# 0 "" 2
.LVL71:
#NO_APP
.LBE6555:
.LBE6554:
.LBE6553:
.LBE6552:
	.loc 12 43 0
	andl	$-4096, %eax
	.loc 12 44 0
	ret
	.cfi_endproc
.LFE503:
	.size	apic_get_base_paddr, .-apic_get_base_paddr
.LCOLDE10:
.LHOTE10:
.LCOLDB11:
.LHOTB11:
	.p2align 4,,15
	.globl	elf_checkFile
	.type	elf_checkFile, @function
elf_checkFile:
.LFB429:
	.file 13 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/32/kernel/elf.c"
	.loc 13 20 0
	.cfi_startproc
.LVL72:
	.loc 13 20 0
	movl	4(%esp), %edx
	xorl	%eax, %eax
	.loc 13 25 0
	cmpl	$1179403647, (%edx)
	je	.L85
	.loc 13 28 0
	ret
	.p2align 4,,10
	.p2align 3
.L85:
	xorl	%eax, %eax
	cmpb	$1, 4(%edx)
	sete	%al
	.loc 13 28 0 is_stmt 0 discriminator 1
	ret
	.cfi_endproc
.LFE429:
	.size	elf_checkFile, .-elf_checkFile
.LCOLDE11:
.LHOTE11:
.LCOLDB12:
.LHOTB12:
	.p2align 4,,15
	.globl	elf_getMemoryBounds
	.type	elf_getMemoryBounds, @function
elf_getMemoryBounds:
.LFB430:
	.loc 13 32 0 is_stmt 1
	.cfi_startproc
.LVL73:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	.loc 13 32 0
	movl	24(%esp), %ecx
	movl	20(%esp), %eax
	.loc 13 33 0
	movl	28(%ecx), %edx
	.loc 13 43 0
	movzwl	44(%ecx), %ebp
	.loc 13 33 0
	addl	%ecx, %edx
.LVL74:
	.loc 13 43 0
	testl	%ebp, %ebp
	je	.L90
	sall	$5, %ebp
	movl	$-1, %edi
	xorl	%esi, %esi
	addl	%edx, %ebp
.LVL75:
	.p2align 4,,10
	.p2align 3
.L89:
	.loc 13 44 0
	movl	20(%edx), %ecx
	testl	%ecx, %ecx
	je	.L88
	.loc 13 45 0
	movl	8(%edx), %ebx
.LVL76:
	.loc 13 46 0
	addl	%ebx, %ecx
.LVL77:
	cmpl	%ebx, %edi
	cmova	%ebx, %edi
.LVL78:
	cmpl	%ecx, %esi
	cmovb	%ecx, %esi
.LVL79:
.L88:
	addl	$32, %edx
	.loc 13 43 0 discriminator 2
	cmpl	%edx, %ebp
	jne	.L89
.LVL80:
.L87:
	.loc 13 56 0
	movl	%edi, (%eax)
	movl	%esi, 4(%eax)
	.loc 13 57 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret	$4
.LVL81:
.L90:
	.cfi_restore_state
	.loc 13 39 0
	movl	$-1, %edi
	.loc 13 40 0
	xorl	%esi, %esi
	jmp	.L87
	.cfi_endproc
.LFE430:
	.size	elf_getMemoryBounds, .-elf_getMemoryBounds
.LCOLDE12:
.LHOTE12:
.LCOLDB13:
.LHOTB13:
	.p2align 4,,15
	.globl	Arch_configureIdleThread
	.type	Arch_configureIdleThread, @function
Arch_configureIdleThread:
.LFB433:
	.file 14 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/32/kernel/thread.c"
	.loc 14 27 0
	.cfi_startproc
.LVL82:
	.loc 14 27 0
	movl	4(%esp), %eax
.LVL83:
.LBB6556:
.LBB6557:
	.file 15 "/home/axjllt/Desktop/ori_refos/kernel/include/machine/registerset.h"
	.loc 15 30 0
	movl	$514, 576(%eax)
.LVL84:
.LBE6557:
.LBE6556:
.LBB6558:
.LBB6559:
	movl	$idle_thread, 568(%eax)
.LVL85:
.LBE6559:
.LBE6558:
.LBB6560:
.LBB6561:
	movl	$8, 572(%eax)
.LVL86:
.LBE6561:
.LBE6560:
.LBB6562:
.LBB6563:
	movl	$16, 540(%eax)
.LVL87:
.LBE6563:
.LBE6562:
.LBB6564:
.LBB6565:
	movl	$16, 544(%eax)
.LVL88:
.LBE6565:
.LBE6564:
.LBB6566:
.LBB6567:
	movl	$16, 548(%eax)
.LVL89:
.LBE6567:
.LBE6566:
.LBB6568:
.LBB6569:
	movl	$16, 552(%eax)
.LVL90:
.LBE6569:
.LBE6568:
.LBB6570:
.LBB6571:
	movl	$16, 584(%eax)
.LVL91:
	ret
.LBE6571:
.LBE6570:
	.cfi_endproc
.LFE433:
	.size	Arch_configureIdleThread, .-Arch_configureIdleThread
.LCOLDE13:
.LHOTE13:
	.section	.text.unlikely
.LCOLDB14:
	.text
.LHOTB14:
	.p2align 4,,15
	.globl	Arch_activateIdleThread
	.type	Arch_activateIdleThread, @function
Arch_activateIdleThread:
.LFB435:
	.loc 14 47 0
	.cfi_startproc
.LVL92:
	ret
	.cfi_endproc
.LFE435:
	.size	Arch_activateIdleThread, .-Arch_activateIdleThread
	.section	.text.unlikely
.LCOLDE14:
	.text
.LHOTE14:
	.section	.boot.text
.LCOLDB15:
.LHOTB15:
	.p2align 4,,15
	.globl	init_dtrs
	.type	init_dtrs, @function
init_dtrs:
.LFB449:
	.file 16 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/32/kernel/vspace.c"
	.loc 16 384 0
	.cfi_startproc
	.loc 16 384 0
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	.loc 16 386 0
	movl	$63, %eax
	.loc 16 387 0
	movl	$x86KSgdt, gdt_idt_ptr+2
	.loc 16 388 0
	pushl	$gdt_idt_ptr
	.cfi_def_cfa_offset 32
	.loc 16 386 0
	movw	%ax, gdt_idt_ptr
	.loc 16 388 0
	call	ia32_install_gdt
.LVL93:
	.loc 16 391 0
	movl	$2047, %edx
	.loc 16 393 0
	movl	$gdt_idt_ptr, (%esp)
	.loc 16 391 0
	movw	%dx, gdt_idt_ptr
	.loc 16 392 0
	movl	$x86KSidt, gdt_idt_ptr+2
	.loc 16 393 0
	call	ia32_install_idt
.LVL94:
	.loc 16 396 0
	movl	$0, (%esp)
	call	ia32_install_ldt
.LVL95:
	.loc 16 399 0
	movl	$40, (%esp)
	call	ia32_install_tss
.LVL96:
	.loc 16 405 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE449:
	.size	init_dtrs, .-init_dtrs
.LCOLDE15:
.LHOTE15:
	.section	.text.unlikely
.LCOLDB16:
	.text
.LHOTB16:
	.p2align 4,,15
	.globl	hwASIDInvalidate
	.type	hwASIDInvalidate, @function
hwASIDInvalidate:
.LFB463:
	.loc 16 660 0
	.cfi_startproc
.LVL97:
	ret
	.cfi_endproc
.LFE463:
	.size	hwASIDInvalidate, .-hwASIDInvalidate
	.section	.text.unlikely
.LCOLDE16:
	.text
.LHOTE16:
	.section	.boot.text
.LCOLDB17:
.LHOTB17:
	.p2align 4,,15
	.globl	get_boot_pd
	.type	get_boot_pd, @function
get_boot_pd:
.LFB467:
	.file 17 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/32/kernel/vspace_32paging.c"
	.loc 17 33 0
	.cfi_startproc
	.loc 17 35 0
	movl	$_boot_pd, %eax
	ret
	.cfi_endproc
.LFE467:
	.size	get_boot_pd, .-get_boot_pd
.LCOLDE17:
.LHOTE17:
	.section	.phys.text,"ax",@progbits
.LCOLDB18:
.LHOTB18:
	.p2align 4,,15
	.globl	init_boot_pd
	.type	init_boot_pd, @function
init_boot_pd:
.LFB469:
	.loc 17 70 0
	.cfi_startproc
.LVL98:
	.loc 17 74 0
	xorl	%eax, %eax
.LVL99:
	.p2align 4,,10
	.p2align 3
.L103:
	.loc 17 75 0 discriminator 3
	movl	%eax, %edx
	sall	$22, %edx
	orl	$387, %edx
	movl	%edx, _boot_pd(,%eax,4)
	.loc 17 74 0 discriminator 3
	addl	$1, %eax
.LVL100:
	cmpl	$896, %eax
	jne	.L103
	xorl	%eax, %eax
.LVL101:
	.p2align 4,,10
	.p2align 3
.L104:
	.loc 17 92 0 discriminator 3
	movl	%eax, %edx
	sall	$22, %edx
	orl	$387, %edx
	movl	%edx, _boot_pd+3584(,%eax,4)
	.loc 17 91 0 discriminator 3
	addl	$1, %eax
.LVL102:
	cmpl	$128, %eax
	jne	.L104
	.loc 17 106 0
	ret
	.cfi_endproc
.LFE469:
	.size	init_boot_pd, .-init_boot_pd
.LCOLDE18:
.LHOTE18:
	.section	.text.unlikely
.LCOLDB19:
	.text
.LHOTB19:
	.p2align 4,,15
	.globl	lookupPDSlot
	.type	lookupPDSlot, @function
lookupPDSlot:
.LFB473:
	.loc 17 166 0
	.cfi_startproc
.LVL103:
	.loc 17 174 0
	movl	12(%esp), %edx
	movl	8(%esp), %ecx
	.loc 17 166 0
	movl	4(%esp), %eax
	.loc 17 174 0
	shrl	$22, %edx
.LVL104:
	leal	(%ecx,%edx,4), %edx
.LVL105:
	movl	$0, (%eax)
	movl	%edx, 4(%eax)
.LVL106:
	.loc 17 175 0
	ret	$4
	.cfi_endproc
.LFE473:
	.size	lookupPDSlot, .-lookupPDSlot
	.section	.text.unlikely
.LCOLDE19:
	.text
.LHOTE19:
	.section	.text.unlikely
.LCOLDB20:
	.text
.LHOTB20:
	.p2align 4,,15
	.globl	isVTableRoot
	.type	isVTableRoot, @function
isVTableRoot:
.LFB474:
	.loc 17 178 0
	.cfi_startproc
.LVL107:
	.loc 17 178 0
	movl	4(%esp), %eax
.LVL108:
.LBB6572:
.LBB6573:
	.loc 11 2202 0
	movl	%eax, %ecx
	.loc 11 2203 0
	movl	%eax, %edx
	movzbl	%al, %eax
.LVL109:
	.loc 11 2202 0
	andl	$14, %ecx
	.loc 11 2203 0
	andl	$15, %edx
.LVL110:
	cmpl	$14, %ecx
.LVL111:
	cmovne	%edx, %eax
.LVL112:
.LBE6573:
.LBE6572:
	.loc 17 179 0
	cmpl	$5, %eax
	sete	%al
	movzbl	%al, %eax
	.loc 17 180 0
	ret
	.cfi_endproc
.LFE474:
	.size	isVTableRoot, .-isVTableRoot
	.section	.text.unlikely
.LCOLDE20:
	.text
.LHOTE20:
	.section	.text.unlikely
.LCOLDB21:
	.text
.LHOTB21:
	.p2align 4,,15
	.globl	copyGlobalMappings
	.type	copyGlobalMappings, @function
copyGlobalMappings:
.LFB477:
	.loc 17 197 0
	.cfi_startproc
.LVL113:
	.loc 17 197 0
	movl	4(%esp), %ecx
.LVL114:
	xorl	%eax, %eax
.LVL115:
	.p2align 4,,10
	.p2align 3
.L112:
	.loc 17 202 0 discriminator 3
	movl	ia32KSGlobalPD+3584(%eax), %edx
	movl	%edx, 3584(%ecx,%eax)
	addl	$4, %eax
	.loc 17 201 0 discriminator 3
	cmpl	$512, %eax
	jne	.L112
	.loc 17 204 0
	ret
	.cfi_endproc
.LFE477:
	.size	copyGlobalMappings, .-copyGlobalMappings
	.section	.text.unlikely
.LCOLDE21:
	.text
.LHOTE21:
	.section	.text.unlikely
.LCOLDB22:
	.text
.LHOTB22:
	.p2align 4,,15
	.globl	Mode_initContext
	.type	Mode_initContext, @function
Mode_initContext:
.LFB484:
	.loc 5 31 0
	.cfi_startproc
.LVL116:
	.loc 5 31 0
	movl	4(%esp), %eax
	.loc 5 32 0
	movl	$0, 512(%eax)
	.loc 5 33 0
	movl	$0, 516(%eax)
	.loc 5 34 0
	movl	$0, 520(%eax)
	.loc 5 35 0
	movl	$0, 524(%eax)
	.loc 5 36 0
	movl	$0, 528(%eax)
	.loc 5 37 0
	movl	$0, 532(%eax)
	.loc 5 38 0
	movl	$0, 536(%eax)
	.loc 5 39 0
	movl	$35, 540(%eax)
	.loc 5 40 0
	movl	$35, 544(%eax)
	.loc 5 41 0
	movl	$59, 548(%eax)
	.loc 5 42 0
	movl	$51, 552(%eax)
	.loc 5 43 0
	movl	$0, 580(%eax)
	ret
	.cfi_endproc
.LFE484:
	.size	Mode_initContext, .-Mode_initContext
	.section	.text.unlikely
.LCOLDE22:
	.text
.LHOTE22:
	.section	.text.unlikely
.LCOLDB23:
	.text
.LHOTB23:
	.p2align 4,,15
	.globl	Mode_sanitiseRegister
	.type	Mode_sanitiseRegister, @function
Mode_sanitiseRegister:
.LFB485:
	.loc 5 47 0
	.cfi_startproc
.LVL117:
	.loc 5 48 0
	movl	4(%esp), %ecx
	.loc 5 47 0
	movl	8(%esp), %eax
	.loc 5 48 0
	leal	-9(%ecx), %edx
	cmpl	$1, %edx
	jbe	.L117
	.loc 5 54 0
	ret
	.p2align 4,,10
	.p2align 3
.L117:
	jmp	Mode_sanitiseRegister.part.55
.LVL118:
	.cfi_endproc
.LFE485:
	.size	Mode_sanitiseRegister, .-Mode_sanitiseRegister
	.section	.text.unlikely
.LCOLDE23:
	.text
.LHOTE23:
	.section	.text.unlikely
.LCOLDB24:
	.text
.LHOTB24:
	.p2align 4,,15
	.globl	Arch_isFrameType
	.type	Arch_isFrameType, @function
Arch_isFrameType:
.LFB486:
	.file 18 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/32/object/objecttype.c"
	.loc 18 29 0
	.cfi_startproc
.LVL119:
	.loc 18 30 0
	movl	4(%esp), %eax
	subl	$5, %eax
	.loc 18 32 0
	cmpl	$1, %eax
	setbe	%al
	movzbl	%al, %eax
	.loc 18 38 0
	ret
	.cfi_endproc
.LFE486:
	.size	Arch_isFrameType, .-Arch_isFrameType
	.section	.text.unlikely
.LCOLDE24:
	.text
.LHOTE24:
	.section	.text.unlikely
.LCOLDB25:
	.text
.LHOTB25:
	.p2align 4,,15
	.globl	Mode_sameRegionAs
	.type	Mode_sameRegionAs, @function
Mode_sameRegionAs:
.LFB489:
	.loc 18 125 0
	.cfi_startproc
.LVL120:
	.loc 18 127 0
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE489:
	.size	Mode_sameRegionAs, .-Mode_sameRegionAs
	.section	.text.unlikely
.LCOLDE25:
	.text
.LHOTE25:
	.section	.text.unlikely
.LCOLDB26:
	.text
.LHOTB26:
	.p2align 4,,15
	.globl	apic_ack_active_interrupt
	.type	apic_ack_active_interrupt, @function
apic_ack_active_interrupt:
.LFB505:
	.loc 12 148 0
	.cfi_startproc
.LVL121:
.LBB6574:
.LBB6575:
	.file 19 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/kernel/xapic.h"
	.loc 19 59 0
	movl	$0, -65360
.LVL122:
	ret
.LBE6575:
.LBE6574:
	.cfi_endproc
.LFE505:
	.size	apic_ack_active_interrupt, .-apic_ack_active_interrupt
	.section	.text.unlikely
.LCOLDE26:
	.text
.LHOTE26:
	.section	.boot.text
.LCOLDB27:
.LHOTB27:
	.p2align 4,,15
	.globl	init_allocated_p_regions
	.type	init_allocated_p_regions, @function
init_allocated_p_regions:
.LFB510:
	.loc 2 169 0
	.cfi_startproc
	.loc 2 170 0
	movl	$0, allocated_p_regions+264
	ret
	.cfi_endproc
.LFE510:
	.size	init_allocated_p_regions, .-init_allocated_p_regions
.LCOLDE27:
.LHOTE27:
	.section	.text.unlikely
.LCOLDB28:
	.text
.LHOTB28:
	.p2align 4,,15
	.globl	findMapForASID
	.type	findMapForASID, @function
findMapForASID:
.LFB540:
	.file 20 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/kernel/vspace.c"
	.loc 20 536 0
	.cfi_startproc
.LVL123:
	.loc 20 536 0
	movl	8(%esp), %edx
	movl	4(%esp), %eax
	.loc 20 539 0
	movl	%edx, %ecx
	shrl	$10, %ecx
	movl	x86KSASIDTable(,%ecx,4), %ecx
.LVL124:
	.loc 20 540 0
	testl	%ecx, %ecx
	je	.L128
	.loc 20 544 0
	andl	$1023, %edx
	movl	(%ecx,%edx,4), %edx
	movl	%edx, (%eax)
	.loc 20 545 0
	ret	$4
.LVL125:
	.p2align 4,,10
	.p2align 3
.L128:
.LBB6576:
.LBB6577:
	.loc 11 1322 0
	movl	$0, (%eax)
.LVL126:
	ret	$4
.LBE6577:
.LBE6576:
	.cfi_endproc
.LFE540:
	.size	findMapForASID, .-findMapForASID
	.section	.text.unlikely
.LCOLDE28:
	.text
.LHOTE28:
	.section	.text.unlikely
.LCOLDB29:
	.text
.LHOTB29:
	.p2align 4,,15
	.globl	maskVMRights
	.type	maskVMRights, @function
maskVMRights:
.LFB547:
	.loc 20 673 0
	.cfi_startproc
.LVL127:
	.loc 20 673 0
	movl	4(%esp), %edx
	.loc 20 674 0
	cmpl	$2, %edx
	je	.L137
	.loc 20 684 0
	movl	$1, %eax
	.loc 20 677 0
	cmpl	$3, %edx
	je	.L138
.L131:
	.loc 20 685 0
	ret
	.p2align 4,,10
	.p2align 3
.L138:
.LVL128:
	.loc 20 677 0 discriminator 1
	testb	$2, 8(%esp)
	je	.L131
.LVL129:
	.loc 20 678 0
	movl	8(%esp), %eax
	andl	$1, %eax
	.loc 20 681 0
	cmpl	$1, %eax
	sbbl	%eax, %eax
	addl	$3, %eax
	.loc 20 685 0
	ret
.LVL130:
	.p2align 4,,10
	.p2align 3
.L137:
	.loc 20 674 0 discriminator 1
	movl	8(%esp), %eax
	andl	$2, %eax
	shrl	%eax
	.loc 20 675 0 discriminator 1
	cmpl	$1, %eax
	sbbl	%eax, %eax
	addl	$2, %eax
	ret
	.cfi_endproc
.LFE547:
	.size	maskVMRights, .-maskVMRights
	.section	.text.unlikely
.LCOLDE29:
	.text
.LHOTE29:
	.section	.text.unlikely
.LCOLDB30:
	.text
.LHOTB30:
	.p2align 4,,15
	.globl	apic_is_interrupt_pending
	.type	apic_is_interrupt_pending, @function
apic_is_interrupt_pending:
.LFB563:
	.file 21 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/kernel/xapic.c"
	.loc 21 58 0
	.cfi_startproc
.LVL131:
	.loc 21 63 0
	movl	$32, %eax
.LVL132:
.L141:
.LBB6578:
.LBB6579:
	.loc 19 53 0
	movl	%eax, %edx
	shrl	%edx
	movl	-65024(%edx), %edx
.LVL133:
.LBE6579:
.LBE6578:
	.loc 21 64 0
	testl	%edx, %edx
	jne	.L142
	.loc 21 63 0 discriminator 2
	addl	$32, %eax
.LVL134:
	cmpl	$160, %eax
	jne	.L141
	.loc 21 68 0
	xorl	%eax, %eax
.LVL135:
	ret
.LVL136:
	.p2align 4,,10
	.p2align 3
.L142:
	.loc 21 65 0
	movl	$1, %eax
.LVL137:
	.loc 21 69 0
	ret
	.cfi_endproc
.LFE563:
	.size	apic_is_interrupt_pending, .-apic_is_interrupt_pending
	.section	.text.unlikely
.LCOLDE30:
	.text
.LHOTE30:
	.section	.boot.text
.LCOLDB31:
.LHOTB31:
	.p2align 4,,15
	.globl	x86_cpuid_get_identity
	.type	x86_cpuid_get_identity, @function
x86_cpuid_get_identity:
.LFB584:
	.file 22 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/machine/cpu_identification.c"
	.loc 22 27 0
	.cfi_startproc
	.loc 22 29 0
	movl	$cpu_identity, %eax
	ret
	.cfi_endproc
.LFE584:
	.size	x86_cpuid_get_identity, .-x86_cpuid_get_identity
.LCOLDE31:
.LHOTE31:
.LCOLDB32:
.LHOTB32:
	.p2align 4,,15
	.globl	x86_cpuid_get_model_info
	.type	x86_cpuid_get_model_info, @function
x86_cpuid_get_model_info:
.LFB585:
	.loc 22 32 0
	.cfi_startproc
	.loc 22 34 0
	movl	$cpu_identity+17, %eax
	ret
	.cfi_endproc
.LFE585:
	.size	x86_cpuid_get_model_info, .-x86_cpuid_get_model_info
.LCOLDE32:
.LHOTE32:
	.section	.text.unlikely
.LCOLDB33:
	.text
.LHOTB33:
	.p2align 4,,15
	.globl	Arch_initFpuContext
	.type	Arch_initFpuContext, @function
Arch_initFpuContext:
.LFB590:
	.file 23 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/machine/fpu.c"
	.loc 23 22 0
	.cfi_startproc
.LVL138:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.loc 23 23 0
	movl	$128, %ecx
	.loc 23 22 0
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	.loc 23 23 0
	movl	$x86KSnullFpuState, %esi
	movl	12(%esp), %edi
	rep movsl
	.loc 23 24 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE590:
	.size	Arch_initFpuContext, .-Arch_initFpuContext
	.section	.text.unlikely
.LCOLDE33:
	.text
.LHOTE33:
	.section	.boot.text
.LCOLDB34:
.LHOTB34:
	.p2align 4,,15
	.globl	Arch_initFpu
	.type	Arch_initFpu, @function
Arch_initFpu:
.LFB591:
	.loc 23 31 0
	.cfi_startproc
.LBB6580:
.LBB6581:
	.loc 7 48 0
#APP
# 48 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h" 1
	movl %cr4, %eax
# 0 "" 2
.LVL139:
#NO_APP
.LBE6581:
.LBE6580:
.LBB6582:
.LBB6583:
	.loc 7 54 0
	orb	$2, %ah
.LVL140:
#APP
# 54 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h" 1
	movl %eax, %cr4
# 0 "" 2
#NO_APP
.LBE6583:
.LBE6582:
.LBB6584:
.LBB6585:
	.loc 7 29 0
#APP
# 29 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h" 1
	movl %cr0, %eax
# 0 "" 2
.LVL141:
#NO_APP
.LBE6585:
.LBE6584:
.LBB6586:
.LBB6587:
	.loc 7 35 0
	andl	$-39, %eax
.LVL142:
	orl	$34, %eax
.LVL143:
#APP
# 35 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h" 1
	movl %eax, %cr0
# 0 "" 2
.LVL144:
#NO_APP
.LBE6587:
.LBE6586:
.LBB6588:
.LBB6589:
	.file 24 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h"
	.loc 24 108 0
#APP
# 108 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h" 1
	clts
# 0 "" 2
#NO_APP
.LBE6589:
.LBE6588:
.LBB6590:
.LBB6591:
	.loc 24 99 0
#APP
# 99 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h" 1
	finit
# 0 "" 2
.LVL145:
#NO_APP
.LBE6591:
.LBE6590:
.LBB6592:
.LBB6593:
	.loc 24 70 0
#APP
# 70 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h" 1
	fxsave x86KSnullFpuState
# 0 "" 2
.LVL146:
#NO_APP
.LBE6593:
.LBE6592:
.LBB6594:
.LBB6595:
.LBB6596:
.LBB6597:
	.loc 7 29 0
#APP
# 29 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h" 1
	movl %cr0, %eax
# 0 "" 2
.LVL147:
#NO_APP
.LBE6597:
.LBE6596:
.LBB6598:
.LBB6599:
	.loc 7 35 0
	orl	$8, %eax
.LVL148:
#APP
# 35 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h" 1
	movl %eax, %cr0
# 0 "" 2
.LVL149:
#NO_APP
.LBE6599:
.LBE6598:
.LBE6595:
.LBE6594:
	.loc 23 111 0
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE591:
	.size	Arch_initFpu, .-Arch_initFpu
.LCOLDE34:
.LHOTE34:
.LCOLDB35:
.LHOTB35:
	.p2align 4,,15
	.globl	init_sysenter_msrs
	.type	init_sysenter_msrs, @function
init_sysenter_msrs:
.LFB592:
	.file 25 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/machine/hardware.c"
	.loc 25 23 0
	.cfi_startproc
.LVL150:
.LBB6600:
.LBB6601:
.LBB6602:
.LBB6603:
	.loc 10 120 0
	movl	$372, %ecx
	xorl	%edx, %edx
	movl	$8, %eax
#APP
# 120 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine.h" 1
	wrmsr
# 0 "" 2
.LVL151:
#NO_APP
.LBE6603:
.LBE6602:
.LBE6601:
.LBE6600:
.LBB6604:
.LBB6605:
.LBB6606:
.LBB6607:
	movl	$374, %ecx
	movl	$handle_syscall, %eax
#APP
# 120 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine.h" 1
	wrmsr
# 0 "" 2
.LVL152:
#NO_APP
.LBE6607:
.LBE6606:
.LBE6605:
.LBE6604:
.LBB6608:
.LBB6609:
.LBB6610:
.LBB6611:
	movl	$373, %ecx
	movl	$x86KStss+4, %eax
.LVL153:
#APP
# 120 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine.h" 1
	wrmsr
# 0 "" 2
.LVL154:
#NO_APP
	ret
.LBE6611:
.LBE6610:
.LBE6609:
.LBE6608:
	.cfi_endproc
.LFE592:
	.size	init_sysenter_msrs, .-init_sysenter_msrs
.LCOLDE35:
.LHOTE35:
	.section	.text.unlikely
.LCOLDB36:
	.text
.LHOTB36:
	.p2align 4,,15
	.globl	getRestartPC
	.type	getRestartPC, @function
getRestartPC:
.LFB593:
	.loc 25 35 0
	.cfi_startproc
.LVL155:
	.loc 25 36 0
	movl	4(%esp), %eax
	movl	556(%eax), %eax
	.loc 25 37 0
	ret
	.cfi_endproc
.LFE593:
	.size	getRestartPC, .-getRestartPC
	.section	.text.unlikely
.LCOLDE36:
	.text
.LHOTE36:
	.section	.text.unlikely
.LCOLDB37:
	.text
.LHOTB37:
	.p2align 4,,15
	.globl	setNextPC
	.type	setNextPC, @function
setNextPC:
.LFB594:
	.loc 25 40 0
	.cfi_startproc
.LVL156:
.LBB6612:
.LBB6613:
	.loc 15 30 0
	movl	8(%esp), %edx
	movl	4(%esp), %eax
	movl	%edx, 568(%eax)
.LVL157:
	ret
.LBE6613:
.LBE6612:
	.cfi_endproc
.LFE594:
	.size	setNextPC, .-setNextPC
	.section	.text.unlikely
.LCOLDE37:
	.text
.LHOTE37:
	.section	.text.unlikely
.LCOLDB38:
	.text
.LHOTB38:
	.p2align 4,,15
	.globl	Arch_initContext
	.type	Arch_initContext, @function
Arch_initContext:
.LFB598:
	.file 26 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/machine/registerset.c"
	.loc 26 17 0
	.cfi_startproc
.LVL158:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
.LBB6614:
.LBB6615:
	.loc 23 23 0
	movl	$128, %ecx
.LBE6615:
.LBE6614:
	.loc 26 17 0
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	.loc 26 17 0
	movl	12(%esp), %eax
.LVL159:
.LBB6619:
.LBB6616:
	.loc 23 23 0
	movl	$x86KSnullFpuState, %esi
.LBE6616:
.LBE6619:
.LBB6620:
.LBB6621:
	.loc 5 32 0
	movl	$0, 512(%eax)
.LBE6621:
.LBE6620:
.LBB6623:
.LBB6617:
	.loc 23 23 0
	movl	%eax, %edi
.LBE6617:
.LBE6623:
.LBB6624:
.LBB6622:
	.loc 5 33 0
	movl	$0, 516(%eax)
	.loc 5 34 0
	movl	$0, 520(%eax)
	.loc 5 35 0
	movl	$0, 524(%eax)
	.loc 5 36 0
	movl	$0, 528(%eax)
	.loc 5 37 0
	movl	$0, 532(%eax)
	.loc 5 38 0
	movl	$0, 536(%eax)
	.loc 5 39 0
	movl	$35, 540(%eax)
	.loc 5 40 0
	movl	$35, 544(%eax)
	.loc 5 41 0
	movl	$59, 548(%eax)
	.loc 5 42 0
	movl	$51, 552(%eax)
	.loc 5 43 0
	movl	$0, 580(%eax)
.LVL160:
.LBE6622:
.LBE6624:
	.loc 26 19 0
	movl	$0, 560(%eax)
	.loc 26 20 0
	movl	$0, 564(%eax)
	.loc 26 21 0
	movl	$0, 556(%eax)
	.loc 26 22 0
	movl	$0, 568(%eax)
	.loc 26 23 0
	movl	$27, 572(%eax)
	.loc 26 24 0
	movl	$514, 576(%eax)
	.loc 26 25 0
	movl	$35, 584(%eax)
.LVL161:
.LBB6625:
.LBB6618:
	.loc 23 23 0
	rep movsl
.LVL162:
.LBE6618:
.LBE6625:
	.loc 26 31 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE598:
	.size	Arch_initContext, .-Arch_initContext
	.section	.text.unlikely
.LCOLDE38:
	.text
.LHOTE38:
	.section	.text.unlikely
.LCOLDB39:
	.text
.LHOTB39:
	.p2align 4,,15
	.globl	sanitiseRegister
	.type	sanitiseRegister, @function
sanitiseRegister:
.LFB599:
	.loc 26 34 0
	.cfi_startproc
.LVL163:
	.loc 26 34 0
	movl	4(%esp), %edx
	movl	8(%esp), %eax
.LVL164:
.LBB6626:
.LBB6627:
	.loc 5 48 0
	leal	-9(%edx), %ecx
	cmpl	$1, %ecx
	jbe	.L157
.LVL165:
.LBE6627:
.LBE6626:
	.loc 26 37 0
	cmpl	$16, %edx
	jne	.L156
.LVL166:
	andl	$3799, %eax
	.loc 26 45 0
	orl	$514, %eax
.LVL167:
.L156:
	.loc 26 48 0
	ret
.LVL168:
	.p2align 4,,10
	.p2align 3
.L157:
.LBB6629:
.LBB6628:
	jmp	Mode_sanitiseRegister.part.55
.LVL169:
.LBE6628:
.LBE6629:
	.cfi_endproc
.LFE599:
	.size	sanitiseRegister, .-sanitiseRegister
	.section	.text.unlikely
.LCOLDE39:
	.text
.LHOTE39:
	.section	.text.unlikely
.LCOLDB40:
	.text
.LHOTB40:
	.p2align 4,,15
	.globl	Arch_irqStateInit
	.type	Arch_irqStateInit, @function
Arch_irqStateInit:
.LFB600:
	.file 27 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/object/interrupt.c"
	.loc 27 21 0
	.cfi_startproc
.LVL170:
	.loc 27 21 0
	movl	$-124, %eax
.LVL171:
	.p2align 4,,10
	.p2align 3
.L161:
	.loc 27 29 0
	movl	$0, x86KSIRQState+992(,%eax,8)
	.loc 27 24 0
	cmpl	$1, %eax
	jbe	.L163
.LVL172:
	.loc 27 31 0
	movl	$0, x86KSIRQState+996(,%eax,8)
.L160:
.LVL173:
	addl	$1, %eax
.LVL174:
	.loc 27 23 0 discriminator 2
	cmpl	$2, %eax
	jne	.L161
	.loc 27 34 0
	ret
.L163:
.LVL175:
	.loc 27 29 0
	movl	$805306368, x86KSIRQState+996(,%eax,8)
	jmp	.L160
	.cfi_endproc
.LFE600:
	.size	Arch_irqStateInit, .-Arch_irqStateInit
	.section	.text.unlikely
.LCOLDE40:
	.text
.LHOTE40:
	.section	.boot.text
.LCOLDB41:
.LHOTB41:
	.p2align 4,,15
	.globl	master_iospace_cap
	.type	master_iospace_cap, @function
master_iospace_cap:
.LFB607:
	.loc 3 33 0
	.cfi_startproc
.LVL176:
	.loc 3 34 0
	movl	x86KSnumDrhu, %edx
	.loc 3 33 0
	movl	4(%esp), %eax
	.loc 3 34 0
	testl	%edx, %edx
	je	.L167
.LVL177:
.LBB6630:
.LBB6631:
	.loc 11 3313 0
	movl	$13, (%eax)
	movl	$0, 4(%eax)
.LVL178:
.LBE6631:
.LBE6630:
	.loc 3 43 0
	ret	$4
.LVL179:
	.p2align 4,,10
	.p2align 3
.L167:
.LBB6632:
.LBB6633:
	.loc 11 2225 0
	movl	$0, (%eax)
	movl	$0, 4(%eax)
.LVL180:
	ret	$4
.LBE6633:
.LBE6632:
	.cfi_endproc
.LFE607:
	.size	master_iospace_cap, .-master_iospace_cap
.LCOLDE41:
.LHOTE41:
	.section	.text.unlikely
.LCOLDB42:
	.text
.LHOTB42:
	.p2align 4,,15
	.globl	Arch_prepareThreadDelete
	.type	Arch_prepareThreadDelete, @function
Arch_prepareThreadDelete:
.LFB631:
	.file 28 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/object/objecttype.c"
	.loc 28 552 0
	.cfi_startproc
.LVL181:
	.loc 28 552 0
	movl	4(%esp), %eax
.LBB6634:
.LBB6635:
	.loc 6 72 0
	cmpl	ksActiveFPUState, %eax
	je	.L174
	ret
	.p2align 4,,10
	.p2align 3
.L174:
.LVL182:
.LBB6636:
.LBB6637:
.LBB6638:
.LBB6639:
.LBB6640:
	.loc 24 108 0
#APP
# 108 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h" 1
	clts
# 0 "" 2
#NO_APP
.LBE6640:
.LBE6639:
	.loc 6 24 0
	testl	%eax, %eax
	je	.L170
.LVL183:
.LBB6641:
.LBB6642:
	.loc 24 70 0
#APP
# 70 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h" 1
	fxsave (%eax)
# 0 "" 2
.LVL184:
#NO_APP
.L170:
.LBE6642:
.LBE6641:
.LBE6638:
.LBE6637:
.LBE6636:
	jmp	fpuThreadDelete.part.56
.LVL185:
.LBE6635:
.LBE6634:
	.cfi_endproc
.LFE631:
	.size	Arch_prepareThreadDelete, .-Arch_prepareThreadDelete
	.section	.text.unlikely
.LCOLDE42:
	.text
.LHOTE42:
	.section	.text.unlikely
.LCOLDB43:
	.text
.LHOTB43:
	.p2align 4,,15
	.globl	Arch_decodeTransfer
	.type	Arch_decodeTransfer, @function
Arch_decodeTransfer:
.LFB632:
	.file 29 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/object/tcb.c"
	.loc 29 19 0
	.cfi_startproc
.LVL186:
	.loc 29 21 0
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE632:
	.size	Arch_decodeTransfer, .-Arch_decodeTransfer
	.section	.text.unlikely
.LCOLDE43:
	.text
.LHOTE43:
	.section	.text.unlikely
.LCOLDB44:
	.text
.LHOTB44:
	.p2align 4,,15
	.globl	Arch_performTransfer
	.type	Arch_performTransfer, @function
Arch_performTransfer:
.LFB633:
	.loc 29 24 0
	.cfi_startproc
.LVL187:
	.loc 29 26 0
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE633:
	.size	Arch_performTransfer, .-Arch_performTransfer
	.section	.text.unlikely
.LCOLDE44:
	.text
.LHOTE44:
	.section	.text.unlikely
.LCOLDB45:
	.text
.LHOTB45:
	.p2align 4,,15
	.globl	Arch_setTCBIPCBuffer
	.type	Arch_setTCBIPCBuffer, @function
Arch_setTCBIPCBuffer:
.LFB634:
	.loc 29 101 0
	.cfi_startproc
.LVL188:
	ret
	.cfi_endproc
.LFE634:
	.size	Arch_setTCBIPCBuffer, .-Arch_setTCBIPCBuffer
	.section	.text.unlikely
.LCOLDE45:
	.text
.LHOTE45:
	.section	.boot.text
.LCOLDB46:
.LHOTB46:
	.p2align 4,,15
	.globl	init_core_state
	.type	init_core_state, @function
init_core_state:
.LFB661:
	.file 30 "/home/axjllt/Desktop/ori_refos/kernel/src/kernel/boot.c"
	.loc 30 481 0
	.cfi_startproc
.LVL189:
	.loc 30 483 0
	movl	$0, ksActiveFPUState
	.loc 30 481 0
	movl	4(%esp), %edx
	.loc 30 488 0
	leal	-1(%edx), %eax
	cmpl	$-3, %eax
	jbe	.L182
.LVL190:
.LBB6643:
	.loc 30 493 0
	movl	ksIdleThread, %eax
.LVL191:
.LBB6644:
.LBB6645:
	.file 31 "/home/axjllt/Desktop/ori_refos/kernel/src/object/tcb.c"
	.loc 31 178 0
	xorl	%ecx, %ecx
	movl	$0, 664(%eax)
.L180:
	.loc 31 184 0
	movl	%ecx, 660(%eax)
	.loc 31 185 0
	movl	%eax, ksDebugTCBs
.LVL192:
.LBE6645:
.LBE6644:
.LBE6643:
	.loc 30 496 0
	movl	%edx, ksSchedulerAction
	.loc 30 497 0
	movl	%eax, ksCurThread
	.loc 30 498 0
	ret
.LVL193:
	.p2align 4,,10
	.p2align 3
.L182:
.LBB6650:
	.loc 30 493 0
	movl	ksIdleThread, %eax
.LBB6648:
.LBB6646:
	.loc 31 181 0
	movl	%edx, %ecx
.LBE6646:
.LBE6648:
.LBE6650:
.LBB6651:
.LBB6652:
	.loc 31 184 0
	movl	$0, 660(%edx)
.LVL194:
.LBE6652:
.LBE6651:
.LBB6653:
.LBB6649:
.LBB6647:
	.loc 31 178 0
	movl	$0, 664(%eax)
	.loc 31 181 0
	movl	%eax, 664(%edx)
	jmp	.L180
.LBE6647:
.LBE6649:
.LBE6653:
	.cfi_endproc
.LFE661:
	.size	init_core_state, .-init_core_state
.LCOLDE46:
.LHOTE46:
.LCOLDB47:
.LHOTB47:
	.p2align 4,,15
	.globl	bi_finalise
	.type	bi_finalise, @function
bi_finalise:
.LFB666:
	.loc 30 596 0
	.cfi_startproc
.LVL195:
	.loc 30 598 0
	movl	ndks_boot+136, %edx
.LVL196:
	.loc 30 599 0
	movl	ndks_boot+128, %eax
	movl	ndks_boot+132, %ecx
	movl	%edx, 24(%eax)
.LVL197:
	movl	%ecx, 20(%eax)
	ret
	.cfi_endproc
.LFE666:
	.size	bi_finalise, .-bi_finalise
.LCOLDE47:
.LHOTE47:
	.section	.text.unlikely
.LCOLDB48:
	.text
.LHOTB48:
	.p2align 4,,15
	.globl	doNBRecvFailedTransfer
	.type	doNBRecvFailedTransfer, @function
doNBRecvFailedTransfer:
.LFB689:
	.file 32 "/home/axjllt/Desktop/ori_refos/kernel/src/kernel/thread.c"
	.loc 32 251 0
	.cfi_startproc
.LVL198:
.LBB6654:
.LBB6655:
	.loc 15 30 0
	movl	4(%esp), %eax
	movl	$0, 516(%eax)
.LVL199:
	ret
.LBE6655:
.LBE6654:
	.cfi_endproc
.LFE689:
	.size	doNBRecvFailedTransfer, .-doNBRecvFailedTransfer
	.section	.text.unlikely
.LCOLDE48:
	.text
.LHOTE48:
	.section	.text.unlikely
.LCOLDB49:
	.text
.LHOTB49:
	.p2align 4,,15
	.globl	setMCPriority
	.type	setMCPriority, @function
setMCPriority:
.LFB696:
	.loc 32 360 0
	.cfi_startproc
.LVL200:
	.loc 32 361 0
	movl	8(%esp), %edx
	movl	4(%esp), %eax
	movl	%edx, 624(%eax)
	ret
	.cfi_endproc
.LFE696:
	.size	setMCPriority, .-setMCPriority
	.section	.text.unlikely
.LCOLDE49:
	.text
.LHOTE49:
	.section	.text.unlikely
.LCOLDB50:
	.text
.LHOTB50:
	.p2align 4,,15
	.globl	switchLocalFpuOwner
	.type	switchLocalFpuOwner, @function
switchLocalFpuOwner:
.LFB705:
	.loc 6 22 0
	.cfi_startproc
.LVL201:
	.loc 6 22 0
	movl	4(%esp), %eax
.LBB6656:
.LBB6657:
	.loc 24 108 0
#APP
# 108 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h" 1
	clts
# 0 "" 2
#NO_APP
.LBE6657:
.LBE6656:
	.loc 6 24 0
	movl	ksActiveFPUState, %edx
	testl	%edx, %edx
	je	.L187
.LVL202:
.LBB6658:
.LBB6659:
	.loc 24 70 0
#APP
# 70 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h" 1
	fxsave (%edx)
# 0 "" 2
.LVL203:
#NO_APP
.L187:
.LBE6659:
.LBE6658:
	.loc 6 27 0
	testl	%eax, %eax
	je	.L188
	.loc 6 28 0
	movl	$0, ksFPURestoresSinceSwitch
.LVL204:
.LBB6660:
.LBB6661:
	.loc 24 86 0
#APP
# 86 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h" 1
	fxrstor (%eax)
# 0 "" 2
#NO_APP
.LBE6661:
.LBE6660:
	.loc 6 33 0
	movl	%eax, ksActiveFPUState
	ret
.LVL205:
	.p2align 4,,10
	.p2align 3
.L188:
.LBB6662:
.LBB6663:
.LBB6664:
.LBB6665:
	.loc 7 29 0
#APP
# 29 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h" 1
	movl %cr0, %edx
# 0 "" 2
.LVL206:
#NO_APP
.LBE6665:
.LBE6664:
.LBB6666:
.LBB6667:
	.loc 7 35 0
	orl	$8, %edx
.LVL207:
#APP
# 35 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h" 1
	movl %edx, %cr0
# 0 "" 2
.LVL208:
#NO_APP
.LBE6667:
.LBE6666:
.LBE6663:
.LBE6662:
	.loc 6 33 0
	movl	%eax, ksActiveFPUState
	ret
	.cfi_endproc
.LFE705:
	.size	switchLocalFpuOwner, .-switchLocalFpuOwner
	.section	.text.unlikely
.LCOLDE50:
	.text
.LHOTE50:
	.section	.text.unlikely
.LCOLDB51:
	.text
.LHOTB51:
	.p2align 4,,15
	.globl	switchFpuOwner
	.type	switchFpuOwner, @function
switchFpuOwner:
.LFB706:
	.loc 6 37 0
	.cfi_startproc
.LVL209:
	.loc 6 37 0
	movl	4(%esp), %eax
.LVL210:
.LBB6668:
.LBB6669:
.LBB6670:
.LBB6671:
	.loc 24 108 0
#APP
# 108 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h" 1
	clts
# 0 "" 2
#NO_APP
.LBE6671:
.LBE6670:
	.loc 6 24 0
	movl	ksActiveFPUState, %edx
	testl	%edx, %edx
	je	.L194
.LVL211:
.LBB6672:
.LBB6673:
	.loc 24 70 0
#APP
# 70 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h" 1
	fxsave (%edx)
# 0 "" 2
.LVL212:
#NO_APP
.L194:
.LBE6673:
.LBE6672:
	.loc 6 27 0
	testl	%eax, %eax
	je	.L195
	.loc 6 28 0
	movl	$0, ksFPURestoresSinceSwitch
.LVL213:
.LBB6674:
.LBB6675:
	.loc 24 86 0
#APP
# 86 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h" 1
	fxrstor (%eax)
# 0 "" 2
#NO_APP
.LBE6675:
.LBE6674:
	.loc 6 33 0
	movl	%eax, ksActiveFPUState
.LVL214:
	ret
.LVL215:
	.p2align 4,,10
	.p2align 3
.L195:
.LBB6676:
.LBB6677:
.LBB6678:
.LBB6679:
	.loc 7 29 0
#APP
# 29 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h" 1
	movl %cr0, %edx
# 0 "" 2
.LVL216:
#NO_APP
.LBE6679:
.LBE6678:
.LBB6680:
.LBB6681:
	.loc 7 35 0
	orl	$8, %edx
.LVL217:
#APP
# 35 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h" 1
	movl %edx, %cr0
# 0 "" 2
.LVL218:
#NO_APP
.LBE6681:
.LBE6680:
.LBE6677:
.LBE6676:
	.loc 6 33 0
	movl	%eax, ksActiveFPUState
.LVL219:
	ret
.LBE6669:
.LBE6668:
	.cfi_endproc
.LFE706:
	.size	switchFpuOwner, .-switchFpuOwner
	.section	.text.unlikely
.LCOLDE51:
	.text
.LHOTE51:
	.section	.text.unlikely
.LCOLDB52:
	.text
.LHOTB52:
	.p2align 4,,15
	.globl	fpuThreadDelete
	.type	fpuThreadDelete, @function
fpuThreadDelete:
.LFB708:
	.loc 6 69 0
	.cfi_startproc
.LVL220:
	.loc 6 69 0
	movl	4(%esp), %eax
	.loc 6 72 0
	cmpl	ksActiveFPUState, %eax
	je	.L206
	ret
	.p2align 4,,10
	.p2align 3
.L206:
.LVL221:
.LBB6682:
.LBB6683:
.LBB6684:
.LBB6685:
.LBB6686:
	.loc 24 108 0
#APP
# 108 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h" 1
	clts
# 0 "" 2
#NO_APP
.LBE6686:
.LBE6685:
	.loc 6 24 0
	testl	%eax, %eax
	je	.L202
.LVL222:
.LBB6687:
.LBB6688:
	.loc 24 70 0
#APP
# 70 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h" 1
	fxsave (%eax)
# 0 "" 2
.LVL223:
#NO_APP
.L202:
.LBE6688:
.LBE6687:
.LBE6684:
.LBE6683:
.LBE6682:
	jmp	fpuThreadDelete.part.56
.LVL224:
	.cfi_endproc
.LFE708:
	.size	fpuThreadDelete, .-fpuThreadDelete
	.section	.text.unlikely
.LCOLDE52:
	.text
.LHOTE52:
	.section	.text.unlikely
.LCOLDB53:
	.text
.LHOTB53:
	.p2align 4,,15
	.globl	ensureEmptySlot
	.type	ensureEmptySlot, @function
ensureEmptySlot:
.LFB747:
	.file 33 "/home/axjllt/Desktop/ori_refos/kernel/src/object/cnode.c"
	.loc 33 875 0
	.cfi_startproc
.LVL225:
	movl	4(%esp), %eax
	movl	(%eax), %eax
.LVL226:
.LBB6689:
.LBB6690:
	.loc 11 2202 0
	movl	%eax, %ecx
	.loc 11 2203 0
	movl	%eax, %edx
	movzbl	%al, %eax
.LVL227:
	.loc 11 2202 0
	andl	$14, %ecx
	.loc 11 2203 0
	andl	$15, %edx
.LVL228:
	cmpl	$14, %ecx
	cmove	%eax, %edx
.LVL229:
.LBE6690:
.LBE6689:
	.loc 33 881 0
	xorl	%eax, %eax
	.loc 33 876 0
	testl	%edx, %edx
	je	.L210
	.loc 33 877 0
	movl	$8, current_syscall_error+24
	.loc 33 878 0
	movl	$3, %eax
.L210:
	.loc 33 882 0
	ret
	.cfi_endproc
.LFE747:
	.size	ensureEmptySlot, .-ensureEmptySlot
	.section	.text.unlikely
.LCOLDE53:
	.text
.LHOTE53:
	.section	.text.unlikely
.LCOLDB54:
	.text
.LHOTB54:
	.p2align 4,,15
	.globl	loadCapTransfer
	.type	loadCapTransfer, @function
loadCapTransfer:
.LFB751:
	.loc 33 973 0
	.cfi_startproc
.LVL230:
	.loc 33 973 0
	movl	8(%esp), %edx
.LVL231:
	movl	4(%esp), %eax
.LBB6691:
.LBB6692:
	.file 34 "/home/axjllt/Desktop/ori_refos/kernel/include/api/types.h"
	.loc 34 66 0
	movl	504(%edx), %ecx
	movl	%ecx, 4(%eax)
.LVL232:
	.loc 34 67 0
	movl	508(%edx), %ecx
.LVL233:
	.loc 34 68 0
	movl	500(%edx), %edx
	movl	%ecx, 8(%eax)
.LVL234:
	movl	%edx, (%eax)
.LBE6692:
.LBE6691:
	.loc 33 976 0
	ret	$4
	.cfi_endproc
.LFE751:
	.size	loadCapTransfer, .-loadCapTransfer
	.section	.text.unlikely
.LCOLDE54:
	.text
.LHOTE54:
	.section	.text.unlikely
.LCOLDB55:
	.text
.LHOTB55:
	.p2align 4,,15
	.globl	isIRQActive
	.type	isIRQActive, @function
isIRQActive:
.LFB770:
	.file 35 "/home/axjllt/Desktop/ori_refos/kernel/src/object/interrupt.c"
	.loc 35 259 0
	.cfi_startproc
.LVL235:
	.loc 35 260 0
	movzbl	4(%esp), %eax
	movl	intStateIRQTable(,%eax,4), %eax
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	.loc 35 261 0
	ret
	.cfi_endproc
.LFE770:
	.size	isIRQActive, .-isIRQActive
	.section	.text.unlikely
.LCOLDE55:
	.text
.LHOTE55:
	.section	.text.unlikely
.LCOLDB56:
	.text
.LHOTB56:
	.p2align 4,,15
	.globl	unbindMaybeNotification
	.type	unbindMaybeNotification, @function
unbindMaybeNotification:
.LFB781:
	.file 36 "/home/axjllt/Desktop/ori_refos/kernel/src/object/notification.c"
	.loc 36 229 0
	.cfi_startproc
.LVL236:
	.loc 36 229 0
	movl	4(%esp), %edx
	movl	12(%edx), %eax
.LVL237:
	.loc 36 233 0
	movl	%eax, %ecx
	andl	$-16, %ecx
.LVL238:
	je	.L215
.LVL239:
.LBB6693:
.LBB6694:
.LBB6695:
.LBB6696:
	.loc 11 1047 0
	andl	$15, %eax
	movl	%eax, 12(%edx)
.LVL240:
.LBE6696:
.LBE6695:
	.loc 36 224 0
	movl	$0, 600(%ecx)
.LVL241:
.L215:
	ret
.LBE6694:
.LBE6693:
	.cfi_endproc
.LFE781:
	.size	unbindMaybeNotification, .-unbindMaybeNotification
	.section	.text.unlikely
.LCOLDE56:
	.text
.LHOTE56:
	.section	.text.unlikely
.LCOLDB57:
	.text
.LHOTB57:
	.p2align 4,,15
	.globl	unbindNotification
	.type	unbindNotification, @function
unbindNotification:
.LFB782:
	.loc 36 240 0
	.cfi_startproc
.LVL242:
	.loc 36 240 0
	movl	4(%esp), %edx
	.loc 36 242 0
	movl	600(%edx), %eax
.LVL243:
	.loc 36 244 0
	testl	%eax, %eax
	je	.L220
.LVL244:
.LBB6697:
.LBB6698:
.LBB6699:
.LBB6700:
	.loc 11 1047 0
	andl	$15, 12(%eax)
.LVL245:
.LBE6700:
.LBE6699:
	.loc 36 224 0
	movl	$0, 600(%edx)
.LVL246:
.L220:
	ret
.LBE6698:
.LBE6697:
	.cfi_endproc
.LFE782:
	.size	unbindNotification, .-unbindNotification
	.section	.text.unlikely
.LCOLDE57:
	.text
.LHOTE57:
	.section	.text.unlikely
.LCOLDB58:
	.text
.LHOTB58:
	.p2align 4,,15
	.globl	tcbDebugAppend
	.type	tcbDebugAppend, @function
tcbDebugAppend:
.LFB804:
	.loc 31 176 0
	.cfi_startproc
.LVL247:
	.loc 31 176 0
	movl	4(%esp), %eax
	.loc 31 180 0
	movl	ksDebugTCBs, %edx
	.loc 31 178 0
	movl	$0, 664(%eax)
	.loc 31 180 0
	testl	%edx, %edx
	je	.L226
	.loc 31 181 0
	movl	%eax, 664(%edx)
.LVL248:
.L226:
	.loc 31 184 0
	movl	%edx, 660(%eax)
	.loc 31 185 0
	movl	%eax, ksDebugTCBs
	ret
	.cfi_endproc
.LFE804:
	.size	tcbDebugAppend, .-tcbDebugAppend
	.section	.text.unlikely
.LCOLDE58:
	.text
.LHOTE58:
	.section	.text.unlikely
.LCOLDB59:
	.text
.LHOTB59:
	.p2align 4,,15
	.globl	tcbEPAppend
	.type	tcbEPAppend, @function
tcbEPAppend:
.LFB806:
	.loc 31 210 0
	.cfi_startproc
.LVL249:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	16(%esp), %ecx
	.loc 31 210 0
	movl	8(%esp), %eax
	movl	12(%esp), %edx
	movl	20(%esp), %ebx
	.loc 31 211 0
	testl	%ecx, %ecx
	je	.L232
	.loc 31 214 0
	movl	%edx, 652(%ebx)
.LVL250:
.L231:
	.loc 31 216 0
	movl	%ebx, 656(%edx)
	.loc 31 217 0
	movl	$0, 652(%edx)
	.loc 31 220 0
	movl	%ecx, (%eax)
	movl	%edx, 4(%eax)
	.loc 31 221 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL251:
	ret	$4
.LVL252:
	.p2align 4,,10
	.p2align 3
.L232:
	.cfi_restore_state
	movl	%edx, %ecx
	jmp	.L231
	.cfi_endproc
.LFE806:
	.size	tcbEPAppend, .-tcbEPAppend
	.section	.text.unlikely
.LCOLDE59:
	.text
.LHOTE59:
	.section	.text.unlikely
.LCOLDB60:
	.text
.LHOTB60:
	.p2align 4,,15
	.globl	tcbEPDequeue
	.type	tcbEPDequeue, @function
tcbEPDequeue:
.LFB807:
	.loc 31 226 0
	.cfi_startproc
.LVL253:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 31 226 0
	movl	20(%esp), %edx
	movl	16(%esp), %eax
	movl	24(%esp), %ebx
	movl	28(%esp), %esi
	.loc 31 227 0
	movl	656(%edx), %ecx
	testl	%ecx, %ecx
	je	.L235
	.loc 31 228 0
	movl	652(%edx), %edi
	movl	%edi, 652(%ecx)
	movl	652(%edx), %edx
	.loc 31 233 0
	testl	%edx, %edx
	je	.L238
.L240:
	.loc 31 234 0
	movl	%ecx, 656(%edx)
	.loc 31 239 0
	movl	%ebx, (%eax)
	movl	%esi, 4(%eax)
	.loc 31 240 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL254:
	.p2align 4,,10
	.p2align 3
.L235:
	.cfi_restore_state
	.loc 31 230 0
	movl	652(%edx), %ebx
	movl	%ebx, %edx
.LVL255:
	.loc 31 233 0
	testl	%edx, %edx
	jne	.L240
.L238:
	.loc 31 227 0
	movl	%ecx, %esi
	.loc 31 239 0
	movl	%ebx, (%eax)
	movl	%esi, 4(%eax)
	.loc 31 240 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
	.cfi_endproc
.LFE807:
	.size	tcbEPDequeue, .-tcbEPDequeue
	.section	.text.unlikely
.LCOLDE60:
	.text
.LHOTE60:
	.section	.text.unlikely
.LCOLDB61:
	.text
.LHOTB61:
	.p2align 4,,15
	.globl	getExtraCPtr
	.type	getExtraCPtr, @function
getExtraCPtr:
.LFB808:
	.loc 31 244 0
	.cfi_startproc
.LVL256:
	.loc 31 245 0
	movl	8(%esp), %edx
	movl	4(%esp), %eax
	movl	488(%eax,%edx,4), %eax
	.loc 31 246 0
	ret
	.cfi_endproc
.LFE808:
	.size	getExtraCPtr, .-getExtraCPtr
	.section	.text.unlikely
.LCOLDE61:
	.text
.LHOTE61:
	.section	.text.unlikely
.LCOLDB62:
	.text
.LHOTB62:
	.p2align 4,,15
	.globl	setExtraBadge
	.type	setExtraBadge, @function
setExtraBadge:
.LFB809:
	.loc 31 251 0
	.cfi_startproc
.LVL257:
	.loc 31 252 0
	movl	12(%esp), %edx
	movl	8(%esp), %ecx
	movl	4(%esp), %eax
	movl	%ecx, 488(%eax,%edx,4)
	ret
	.cfi_endproc
.LFE809:
	.size	setExtraBadge, .-setExtraBadge
	.section	.text.unlikely
.LCOLDE62:
	.text
.LHOTE62:
	.section	.text.unlikely
.LCOLDB63:
	.text
.LHOTB63:
	.p2align 4,,15
	.globl	copyMRs
	.type	copyMRs, @function
copyMRs:
.LFB813:
	.loc 31 324 0
	.cfi_startproc
.LVL258:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 31 324 0
	movl	32(%esp), %eax
	movl	16(%esp), %ecx
	movl	20(%esp), %ebx
	movl	24(%esp), %edx
	movl	28(%esp), %esi
	.loc 31 328 0
	testl	%eax, %eax
	je	.L251
.LVL259:
.LBB6701:
.LBB6702:
	.loc 15 30 0
	movl	532(%ecx), %edi
	movl	%edi, 532(%edx)
.LVL260:
.LBE6702:
.LBE6701:
	.loc 31 328 0
	cmpl	$1, %eax
	jbe	.L247
.LVL261:
.LBB6704:
.LBB6705:
	.loc 15 36 0
	movl	536(%ecx), %ecx
.LVL262:
.LBE6705:
.LBE6704:
.LBB6706:
.LBB6703:
	.loc 15 30 0
	movl	%ecx, 536(%edx)
.LVL263:
.LBE6703:
.LBE6706:
	.loc 31 333 0
	testl	%esi, %esi
	je	.L249
	testl	%ebx, %ebx
	je	.L249
	.loc 31 338 0 discriminator 1
	cmpl	$2, %eax
	jbe	.L249
	.loc 31 338 0 is_stmt 0 discriminator 2
	movl	$2, %edx
.LVL264:
	.p2align 4,,10
	.p2align 3
.L246:
	.loc 31 339 0 is_stmt 1 discriminator 2
	addl	$1, %edx
.LVL265:
	movl	(%ebx,%edx,4), %ecx
	movl	%ecx, (%esi,%edx,4)
.LVL266:
	.loc 31 338 0 discriminator 2
	cmpl	%edx, %eax
	jne	.L246
.LVL267:
.L251:
	.loc 31 343 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL268:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL269:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL270:
	.p2align 4,,10
	.p2align 3
.L247:
	.cfi_restore_state
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL271:
	.loc 31 328 0
	movl	$1, %eax
.LVL272:
	.loc 31 343 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL273:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL274:
.L249:
	.cfi_restore_state
	.loc 31 338 0
	movl	$2, %eax
.LVL275:
	jmp	.L251
	.cfi_endproc
.LFE813:
	.size	copyMRs, .-copyMRs
	.section	.text.unlikely
.LCOLDE63:
	.text
.LHOTE63:
	.section	.text.unlikely
.LCOLDB64:
	.text
.LHOTB64:
	.p2align 4,,15
	.globl	setThreadName
	.type	setThreadName, @function
setThreadName:
.LFB833:
	.loc 31 1580 0
	.cfi_startproc
.LVL276:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	.loc 31 1580 0
	movl	16(%esp), %ecx
	movl	12(%esp), %esi
.LVL277:
.LBB6707:
.LBB6708:
	.file 37 "/home/axjllt/Desktop/ori_refos/kernel/src/string.c"
	.loc 37 27 0
	movzbl	(%ecx), %eax
	testb	%al, %al
	je	.L266
	.loc 37 28 0
	movb	%al, 668(%esi)
	leal	668(%esi), %ebx
.LVL278:
	movl	$1, %eax
	jmp	.L260
.LVL279:
	.p2align 4,,10
	.p2align 3
.L259:
	movb	%dl, (%ebx,%eax)
.LVL280:
	addl	$1, %eax
.LVL281:
	.loc 37 27 0
	cmpl	$99, %eax
	je	.L258
.LVL282:
.L260:
	movzbl	(%ecx,%eax), %edx
	testb	%dl, %dl
	jne	.L259
.LVL283:
.L258:
	.loc 37 30 0
	movb	$0, 668(%esi,%eax)
.LVL284:
.LBE6708:
.LBE6707:
	.loc 31 1582 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL285:
.L266:
	.cfi_restore_state
.LBB6710:
.LBB6709:
	.loc 37 27 0
	xorl	%eax, %eax
	jmp	.L258
.LBE6709:
.LBE6710:
	.cfi_endproc
.LFE833:
	.size	setThreadName, .-setThreadName
	.section	.text.unlikely
.LCOLDE64:
	.text
.LHOTE64:
	.section	.boot.text
.LCOLDB65:
.LHOTB65:
	.p2align 4,,15
	.globl	platAddDevices
	.type	platAddDevices, @function
platAddDevices:
.LFB847:
	.file 38 "/home/axjllt/Desktop/ori_refos/kernel/src/plat/pc99/machine/hardware.c"
	.loc 38 23 0
	.cfi_startproc
	.loc 38 35 0
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE847:
	.size	platAddDevices, .-platAddDevices
.LCOLDE65:
.LHOTE65:
	.section	.text.unlikely
.LCOLDB66:
	.text
.LHOTB66:
	.p2align 4,,15
	.globl	resetTimer
	.type	resetTimer, @function
resetTimer:
.LFB848:
	.loc 38 40 0
	.cfi_startproc
	ret
	.cfi_endproc
.LFE848:
	.size	resetTimer, .-resetTimer
	.section	.text.unlikely
.LCOLDE66:
	.text
.LHOTE66:
	.section	.text.unlikely
.LCOLDB67:
	.text
.LHOTB67:
	.p2align 4,,15
	.globl	invalidate_context_cache
	.type	invalidate_context_cache, @function
invalidate_context_cache:
.LFB857:
	.file 39 "/home/axjllt/Desktop/ori_refos/kernel/src/plat/pc99/machine/intel-vtd.c"
	.loc 39 132 0
	.cfi_startproc
.LVL286:
	.loc 39 132 0
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	.loc 39 144 0
	movl	x86KSnumDrhu, %esi
	.loc 39 132 0
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 39 144 0
	testl	%esi, %esi
	je	.L269
	xorl	%edx, %edx
.LVL287:
	.p2align 4,,10
	.p2align 3
.L275:
	movl	%edx, %edi
	sall	$12, %edi
	leal	-57304(%edi), %eax
	.p2align 4,,10
	.p2align 3
.L271:
.LVL288:
.LBB6711:
.LBB6712:
.LBB6713:
	.loc 39 105 0 discriminator 1
	movl	(%eax), %ecx
	movl	4(%eax), %ebx
.LVL289:
.LBE6713:
.LBE6712:
	.loc 39 147 0 discriminator 1
	testl	%ebx, %ebx
	js	.L271
.LVL290:
.LBB6714:
.LBB6715:
	.loc 39 110 0
	movl	$0, -57304(%edi)
	movl	$-1610612736, -57300(%edi)
	.p2align 4,,10
	.p2align 3
.L272:
.LVL291:
.LBE6715:
.LBE6714:
.LBB6716:
.LBB6717:
	.loc 39 105 0 discriminator 1
	movl	(%eax), %ecx
	movl	4(%eax), %ebx
.LVL292:
.LBE6717:
.LBE6716:
	.loc 39 158 0 discriminator 1
	testl	%ebx, %ebx
	js	.L272
.LBE6711:
	.loc 39 144 0 discriminator 2
	addl	$1, %edx
.LVL293:
	cmpl	%esi, %edx
	jne	.L275
.LVL294:
.L269:
	.loc 39 160 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE857:
	.size	invalidate_context_cache, .-invalidate_context_cache
	.section	.text.unlikely
.LCOLDE67:
	.text
.LHOTE67:
	.section	.text.unlikely
.LCOLDB68:
	.text
.LHOTB68:
	.p2align 4,,15
	.globl	invalidate_iotlb
	.type	invalidate_iotlb, @function
invalidate_iotlb:
.LFB858:
	.loc 39 163 0
	.cfi_startproc
.LVL295:
	.loc 39 178 0
	movl	x86KSnumDrhu, %eax
	testl	%eax, %eax
	je	.L292
	.loc 39 163 0
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	xorl	%ebx, %ebx
.LVL296:
	.p2align 4,,10
	.p2align 3
.L286:
.LBB6718:
.LBB6719:
.LBB6720:
.LBB6721:
	.loc 39 94 0
	movl	%ebx, %esi
	sall	$12, %esi
	movl	-57328(%esi), %ecx
.LVL297:
.LBE6721:
.LBE6720:
	.loc 39 115 0
	shrl	$4, %ecx
	andl	$16368, %ecx
.LVL298:
	leal	-57332(%esi,%ecx), %eax
	.p2align 4,,10
	.p2align 3
.L282:
.LVL299:
.LBE6719:
.LBE6718:
.LBB6722:
.LBB6723:
	.loc 39 94 0 discriminator 1
	movl	(%eax), %edx
.LVL300:
.LBE6723:
.LBE6722:
	.loc 39 182 0 discriminator 1
	testl	%edx, %edx
	js	.L282
.LVL301:
.LBB6724:
.LBB6725:
	.loc 39 99 0
	leal	-57336(%esi,%ecx), %edx
	movl	$0, (%edx)
.LVL302:
.LBE6725:
.LBE6724:
.LBB6726:
.LBB6727:
	movl	$-1878851584, (%eax)
	.p2align 4,,10
	.p2align 3
.L283:
.LVL303:
.LBE6727:
.LBE6726:
.LBB6728:
.LBB6729:
	.loc 39 94 0 discriminator 1
	movl	(%eax), %edx
.LVL304:
.LBE6729:
.LBE6728:
	.loc 39 197 0 discriminator 1
	testl	%edx, %edx
	js	.L283
	.loc 39 178 0 discriminator 2
	addl	$1, %ebx
.LVL305:
	cmpl	%ebx, x86KSnumDrhu
	ja	.L286
	.loc 39 199 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL306:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL307:
.L292:
	ret
	.cfi_endproc
.LFE858:
	.size	invalidate_iotlb, .-invalidate_iotlb
	.section	.text.unlikely
.LCOLDE68:
	.text
.LHOTE68:
	.section	.text.unlikely
.LCOLDB69:
	.text
.LHOTB69:
	.p2align 4,,15
	.globl	serial_init
	.type	serial_init, @function
serial_init:
.LFB867:
	.file 40 "/home/axjllt/Desktop/ori_refos/kernel/src/plat/pc99/machine/io.c"
	.loc 40 20 0
	.cfi_startproc
.LVL308:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 40 20 0
	movl	48(%esp), %esi
	leal	5(%esi), %ebx
	movzwl	%bx, %ebx
	.p2align 4,,10
	.p2align 3
.L294:
	.loc 40 21 0 discriminator 1
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	%ebx
	.cfi_def_cfa_offset 64
	call	in8
.LVL309:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	testb	$96, %al
	je	.L294
	.loc 40 23 0
	leal	1(%esi), %ebp
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	.loc 40 24 0
	leal	3(%esi), %edi
	.loc 40 23 0
	movzwl	%bp, %ebp
	pushl	%ebp
	.cfi_def_cfa_offset 64
	.loc 40 24 0
	movzwl	%di, %edi
	.loc 40 23 0
	call	out8
.LVL310:
	.loc 40 24 0
	popl	%eax
	.cfi_def_cfa_offset 60
	popl	%edx
	.cfi_def_cfa_offset 56
	pushl	$128
	.cfi_def_cfa_offset 60
	pushl	%edi
	.cfi_def_cfa_offset 64
	call	out8
.LVL311:
	.loc 40 25 0
	popl	%ecx
	.cfi_def_cfa_offset 60
	movzwl	%si, %edx
	popl	%eax
	.cfi_def_cfa_offset 56
	pushl	$1
	.cfi_def_cfa_offset 60
	pushl	%edx
	.cfi_def_cfa_offset 64
	movl	%edx, 28(%esp)
	call	out8
.LVL312:
	.loc 40 26 0
	popl	%eax
	.cfi_def_cfa_offset 60
	popl	%edx
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	%ebp
	.cfi_def_cfa_offset 64
	call	out8
.LVL313:
	.loc 40 27 0
	popl	%ecx
	.cfi_def_cfa_offset 60
	popl	%ebp
	.cfi_def_cfa_offset 56
	pushl	$3
	.cfi_def_cfa_offset 60
	pushl	%edi
	.cfi_def_cfa_offset 64
	call	out8
.LVL314:
	.loc 40 28 0
	popl	%eax
	.cfi_def_cfa_offset 60
	leal	4(%esi), %eax
	.loc 40 32 0
	addl	$6, %esi
	.loc 40 28 0
	popl	%edx
	.cfi_def_cfa_offset 56
	movzwl	%ax, %eax
	pushl	$11
	.cfi_def_cfa_offset 60
	.loc 40 32 0
	movzwl	%si, %esi
	.loc 40 28 0
	pushl	%eax
	.cfi_def_cfa_offset 64
	call	out8
.LVL315:
	.loc 40 30 0
	movl	28(%esp), %edx
	movl	%edx, (%esp)
	call	in8
.LVL316:
	.loc 40 31 0
	movl	%ebx, (%esp)
	call	in8
.LVL317:
	.loc 40 32 0
	movl	%esi, 64(%esp)
	.loc 40 33 0
	addl	$44, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 40 32 0
	jmp	in8
.LVL318:
	.cfi_endproc
.LFE867:
	.size	serial_init, .-serial_init
	.section	.text.unlikely
.LCOLDE69:
	.text
.LHOTE69:
	.section	.text.unlikely
.LCOLDB70:
	.text
.LHOTB70:
	.p2align 4,,15
	.globl	putConsoleChar
	.type	putConsoleChar, @function
putConsoleChar:
.LFB868:
	.loc 40 39 0
	.cfi_startproc
.LVL319:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 40 39 0
	movl	16(%esp), %ebx
	.loc 40 40 0
	jmp	.L300
	.p2align 4,,10
	.p2align 3
.L308:
	.loc 40 40 0 is_stmt 0 discriminator 1
	addl	$5, %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	movzwl	%ax, %eax
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	in8
.LVL320:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testb	$32, %al
	jne	.L307
.L300:
	.loc 40 40 0 discriminator 2
	movzwl	x86KSconsolePort, %eax
	testw	%ax, %ax
	jne	.L308
.L299:
	.loc 40 41 0 is_stmt 1
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	movzbl	%bl, %ebx
	pushl	%ebx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	out8
.LVL321:
	.loc 40 42 0
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L307:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -8
	movzwl	x86KSconsolePort, %eax
	jmp	.L299
	.cfi_endproc
.LFE868:
	.size	putConsoleChar, .-putConsoleChar
	.section	.text.unlikely
.LCOLDE70:
	.text
.LHOTE70:
	.section	.text.unlikely
.LCOLDB71:
	.text
.LHOTB71:
	.p2align 4,,15
	.globl	putchar
	.type	putchar, @function
putchar:
.LFB709:
	.file 41 "/home/axjllt/Desktop/ori_refos/kernel/src/machine/io.c"
	.loc 41 20 0
	.cfi_startproc
.LVL322:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$20, %esp
	.cfi_def_cfa_offset 28
	.loc 41 20 0
	movl	28(%esp), %ebx
	.loc 41 21 0
	movzbl	%bl, %eax
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	putConsoleChar
.LVL323:
	.loc 41 22 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	cmpb	$10, %bl
	je	.L312
	.loc 41 25 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L312:
	.cfi_restore_state
	.loc 41 23 0
	movl	$13, 16(%esp)
	.loc 41 25 0
	addl	$8, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	.loc 41 23 0
	jmp	putConsoleChar
.LVL324:
	.cfi_endproc
.LFE709:
	.size	putchar, .-putchar
	.section	.text.unlikely
.LCOLDE71:
	.text
.LHOTE71:
	.section	.text.unlikely
.LCOLDB72:
	.text
.LHOTB72:
	.p2align 4,,15
	.type	print_unsigned_long.part.57, @function
print_unsigned_long.part.57:
.LFB952:
	.loc 41 76 0
	.cfi_startproc
.LVL325:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 41 95 0
	testl	%eax, %eax
	je	.L326
	movl	%eax, %ecx
	movl	%edx, %ebx
.LVL326:
.LBB6730:
.LBB6731:
	.loc 41 65 0
	cmpl	$10, %edx
	je	.L328
	cmpl	$16, %edx
	je	.L348
	movl	$1, %edi
	movl	$48, %eax
.LVL327:
	xorl	%ebp, %ebp
.LVL328:
.L315:
.LBE6731:
.LBE6730:
	.loc 41 98 0
	movl	%edi, %esi
.L325:
	.loc 41 101 0
	movb	%al, 5(%esp,%ebp)
.LVL329:
.LBB6734:
.LBB6735:
	.loc 41 52 0
	cmpl	$10, %ebx
	jne	.L349
.LVL330:
	.loc 41 56 0
	movl	%ecx, %eax
	movl	$-858993459, %edx
	mull	%edx
.LVL331:
.LBE6735:
.LBE6734:
	.loc 41 95 0
	movl	%edx, %ecx
	shrl	$3, %ecx
.LVL332:
	je	.L321
	leal	1(%esi), %edi
.LVL333:
	movl	%esi, %ebp
.LVL334:
.L316:
	movl	%ecx, %eax
	movl	$-858993459, %edx
	movl	%ecx, %esi
	mull	%edx
	shrl	$3, %edx
	leal	(%edx,%edx,4), %eax
	addl	%eax, %eax
	subl	%eax, %esi
	movl	%esi, %eax
	addl	$48, %eax
	jmp	.L315
.LVL335:
	.p2align 4,,10
	.p2align 3
.L349:
.LBB6737:
.LBB6736:
	.loc 41 52 0
	cmpl	$16, %ebx
	je	.L320
.LVL336:
.L321:
.LBE6736:
.LBE6737:
	.loc 41 105 0
	testl	%esi, %esi
	je	.L334
	movl	%esi, %ebx
.LVL337:
	jmp	.L324
.LVL338:
	.p2align 4,,10
	.p2align 3
.L323:
	testl	%ebx, %ebx
	je	.L334
.LVL339:
.L324:
	.loc 41 106 0
	subl	$1, %ebx
.LVL340:
.LBB6738:
.LBB6739:
	.loc 41 21 0
	subl	$12, %esp
	.cfi_def_cfa_offset 60
.LBE6739:
.LBE6738:
	.loc 41 106 0
	movzbl	17(%esp,%ebx), %edi
.LVL341:
.LBB6741:
.LBB6740:
	.loc 41 21 0
	movl	%edi, %eax
	movzbl	%al, %eax
	pushl	%eax
	.cfi_def_cfa_offset 64
	call	putConsoleChar
.LVL342:
	.loc 41 22 0
	movl	%edi, %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	cmpb	$10, %al
	jne	.L323
	.loc 41 23 0
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$13
	.cfi_def_cfa_offset 64
	call	putConsoleChar
.LVL343:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.LVL344:
.LBE6740:
.LBE6741:
	.loc 41 105 0
	testl	%ebx, %ebx
	jne	.L324
.LVL345:
.L334:
	.loc 41 110 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%esi, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL346:
	.p2align 4,,10
	.p2align 3
.L318:
	.cfi_restore_state
	.loc 41 99 0
	addl	$87, %eax
	movb	%al, 5(%esp,%esi)
.LVL347:
	movl	%edx, %esi
.LVL348:
.L320:
	.loc 41 95 0
	shrl	$4, %ecx
.LVL349:
	je	.L321
	leal	1(%esi), %edx
.L317:
.LVL350:
.LBB6742:
.LBB6732:
	.loc 41 67 0
	movl	%ecx, %eax
	andl	$15, %eax
.LVL351:
.LBE6732:
.LBE6742:
	.loc 41 98 0
	cmpl	$9, %eax
	ja	.L318
	movl	%esi, %ebp
	addl	$48, %eax
	movl	%edx, %esi
.LVL352:
	jmp	.L325
.LVL353:
	.p2align 4,,10
	.p2align 3
.L326:
	.loc 41 95 0
	xorl	%esi, %esi
	jmp	.L334
.LVL354:
.L328:
.LBB6743:
.LBB6733:
	.loc 41 65 0
	movl	$1, %edi
	xorl	%ebp, %ebp
	jmp	.L316
.L348:
	movl	$1, %edx
.LVL355:
	xorl	%esi, %esi
	jmp	.L317
.LBE6733:
.LBE6743:
	.cfi_endproc
.LFE952:
	.size	print_unsigned_long.part.57, .-print_unsigned_long.part.57
	.section	.text.unlikely
.LCOLDE72:
	.text
.LHOTE72:
	.section	.text.unlikely
.LCOLDB73:
	.text
.LHOTB73:
	.p2align 4,,15
	.globl	print_unsigned_long
	.type	print_unsigned_long, @function
print_unsigned_long:
.LFB714:
	.loc 41 77 0
	.cfi_startproc
.LVL356:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 41 77 0
	movl	20(%esp), %edx
	movl	16(%esp), %ecx
	.loc 41 86 0
	cmpl	$10, %edx
	je	.L355
	.loc 41 87 0
	xorl	%eax, %eax
	.loc 41 86 0
	cmpl	$16, %edx
	je	.L355
	.loc 41 110 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L355:
	.cfi_restore_state
	.loc 41 90 0
	testl	%ecx, %ecx
	je	.L353
	movl	%ecx, %eax
	.loc 41 110 0 discriminator 1
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	jmp	print_unsigned_long.part.57
.LVL357:
	.p2align 4,,10
	.p2align 3
.L353:
	.cfi_restore_state
.LBB6744:
.LBB6745:
	.loc 41 21 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$48
	.cfi_def_cfa_offset 32
	call	putConsoleChar
.LVL358:
.LBE6745:
.LBE6744:
	.loc 41 92 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	$1, %eax
	.loc 41 110 0
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE714:
	.size	print_unsigned_long, .-print_unsigned_long
	.section	.text.unlikely
.LCOLDE73:
	.text
.LHOTE73:
	.section	.text.unlikely
.LCOLDB74:
	.text
.LHOTB74:
	.p2align 4,,15
	.globl	puts
	.type	puts, @function
puts:
.LFB719:
	.loc 41 300 0
	.cfi_startproc
.LVL359:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	.loc 41 300 0
	movl	16(%esp), %esi
.LVL360:
	.loc 41 301 0
	movzbl	(%esi), %ebx
	testb	%bl, %bl
	jne	.L365
	jmp	.L364
.LVL361:
	.p2align 4,,10
	.p2align 3
.L362:
	.loc 41 301 0 is_stmt 0 discriminator 2
	addl	$1, %esi
.LVL362:
	movzbl	(%esi), %ebx
	testb	%bl, %bl
	je	.L364
.L365:
.LVL363:
.LBB6746:
.LBB6747:
	.loc 41 21 0 is_stmt 1 discriminator 2
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	movzbl	%bl, %eax
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	putConsoleChar
.LVL364:
	.loc 41 22 0 discriminator 2
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	cmpb	$10, %bl
	jne	.L362
	.loc 41 23 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
.LBE6747:
.LBE6746:
	.loc 41 301 0
	addl	$1, %esi
.LVL365:
.LBB6750:
.LBB6748:
	.loc 41 23 0
	pushl	$13
	.cfi_def_cfa_offset 32
	call	putConsoleChar
.LVL366:
.LBE6748:
.LBE6750:
	.loc 41 301 0
	movzbl	(%esi), %ebx
.LVL367:
.LBB6751:
.LBB6749:
	.loc 41 23 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.LVL368:
.LBE6749:
.LBE6751:
	.loc 41 301 0
	testb	%bl, %bl
	jne	.L365
.L364:
.LVL369:
.LBB6752:
.LBB6753:
	.loc 41 21 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$10
	.cfi_def_cfa_offset 32
	call	putConsoleChar
.LVL370:
	.loc 41 23 0
	movl	$13, (%esp)
	call	putConsoleChar
.LVL371:
.LBE6753:
.LBE6752:
	.loc 41 306 0
	addl	$20, %esp
	.cfi_def_cfa_offset 12
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL372:
	ret
	.cfi_endproc
.LFE719:
	.size	puts, .-puts
	.section	.text.unlikely
.LCOLDE74:
	.text
.LHOTE74:
	.section	.text.unlikely
.LCOLDB75:
	.text
.LHOTB75:
	.p2align 4,,15
	.type	print_string, @function
print_string:
.LFB711:
	.loc 41 39 0
	.cfi_startproc
.LVL373:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 41 42 0
	movzbl	(%eax), %ebx
	testb	%bl, %bl
	je	.L373
	movl	%eax, %edi
	.loc 41 42 0 is_stmt 0 discriminator 3
	xorl	%esi, %esi
	jmp	.L372
.LVL374:
	.p2align 4,,10
	.p2align 3
.L371:
	addl	$1, %esi
.LVL375:
	movzbl	(%edi,%esi), %ebx
	testb	%bl, %bl
	je	.L370
.LVL376:
.L372:
.LBB6754:
.LBB6755:
	.loc 41 21 0 is_stmt 1 discriminator 3
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	movzbl	%bl, %edx
	pushl	%edx
	.cfi_def_cfa_offset 32
	call	putConsoleChar
.LVL377:
	.loc 41 22 0 discriminator 3
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	cmpb	$10, %bl
	jne	.L371
	.loc 41 23 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
.LBE6755:
.LBE6754:
	.loc 41 42 0
	addl	$1, %esi
.LVL378:
.LBB6758:
.LBB6756:
	.loc 41 23 0
	pushl	$13
	.cfi_def_cfa_offset 32
	call	putConsoleChar
.LVL379:
.LBE6756:
.LBE6758:
	.loc 41 42 0
	movzbl	(%edi,%esi), %ebx
.LVL380:
.LBB6759:
.LBB6757:
	.loc 41 23 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.LVL381:
.LBE6757:
.LBE6759:
	.loc 41 42 0
	testb	%bl, %bl
	jne	.L372
.LVL382:
.L370:
	.loc 41 47 0
	movl	%esi, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL383:
.L373:
	.cfi_restore_state
	.loc 41 42 0
	xorl	%esi, %esi
	jmp	.L370
	.cfi_endproc
.LFE711:
	.size	print_string, .-print_string
	.section	.text.unlikely
.LCOLDE75:
	.text
.LHOTE75:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC76:
	.string	"(nil)"
.LC77:
	.string	"0x"
	.section	.text.unlikely
.LCOLDB78:
	.text
.LHOTB78:
	.p2align 4,,15
	.globl	kprintf
	.type	kprintf, @function
kprintf:
.LFB720:
	.loc 41 310 0
	.cfi_startproc
.LVL384:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
.LVL385:
	.loc 41 310 0
	movl	48(%esp), %ebx
.LVL386:
.LBB6813:
.LBB6814:
	.loc 41 173 0
	testl	%ebx, %ebx
	je	.L425
	leal	52(%esp), %edi
.LVL387:
	xorl	%esi, %esi
	movl	$0, (%esp)
.LVL388:
	.p2align 4,,10
	.p2align 3
.L378:
	.loc 41 179 0
	movsbl	(%ebx), %eax
	testb	%al, %al
	je	.L443
.L424:
	.loc 41 180 0
	testl	%esi, %esi
	je	.L379
	xorl	%esi, %esi
.LVL389:
	jmp	.L380
.LVL390:
	.p2align 4,,10
	.p2align 3
.L382:
	.loc 41 182 0
	leal	(%esi,%esi,4), %edx
.LVL391:
	.loc 41 184 0
	addl	$1, %ebx
.LVL392:
	.loc 41 182 0
	leal	-48(%eax,%edx,2), %esi
.LVL393:
	.loc 41 184 0
	je	.L381
	movsbl	(%ebx), %eax
.LVL394:
.L380:
	.loc 41 181 0
	leal	-48(%eax), %edx
	cmpb	$9, %dl
	jbe	.L382
	.loc 41 188 0
	cmpb	$112, %al
	je	.L383
	jg	.L384
	cmpb	$100, %al
	je	.L385
	cmpb	$108, %al
	je	.L386
	cmpb	$37, %al
	je	.L444
.LVL395:
.L427:
.LBE6814:
.LBE6813:
	.loc 41 318 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
.LVL396:
.LBB6877:
.LBB6872:
	.loc 41 238 0
	movl	$-1, %eax
.LVL397:
.LBE6872:
.LBE6877:
	.loc 41 318 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL398:
.L444:
	.cfi_restore_state
.LBB6878:
.LBB6873:
.LBB6815:
.LBB6816:
	.loc 41 21 0
	subl	$12, %esp
	.cfi_def_cfa_offset 60
.LVL399:
.LBE6816:
.LBE6815:
	.loc 41 192 0
	addl	$1, %ebx
.LVL400:
.LBB6818:
.LBB6817:
	.loc 41 21 0
	pushl	$37
	.cfi_def_cfa_offset 64
	call	putConsoleChar
.LVL401:
.LBE6817:
.LBE6818:
	.loc 41 191 0
	movl	16(%esp), %eax
	.loc 41 192 0
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.LVL402:
	.loc 41 191 0
	addl	$1, %eax
.LVL403:
	.p2align 4,,10
	.p2align 3
.L391:
	.loc 41 277 0
	movl	%esi, (%esp)
	subl	%eax, %esi
.LVL404:
.LBB6819:
.LBB6820:
	.loc 41 30 0
	testl	%esi, %esi
	jle	.L430
	xorl	%ebp, %ebp
.LVL405:
	.p2align 4,,10
	.p2align 3
.L420:
.LBB6821:
.LBB6822:
	.loc 41 21 0
	subl	$12, %esp
	.cfi_def_cfa_offset 60
.LBE6822:
.LBE6821:
	.loc 41 30 0
	addl	$1, %ebp
.LVL406:
.LBB6824:
.LBB6823:
	.loc 41 21 0
	pushl	$32
	.cfi_def_cfa_offset 64
	call	putConsoleChar
.LVL407:
.LBE6823:
.LBE6824:
	.loc 41 30 0
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	cmpl	%ebp, %esi
	jne	.L420
.LVL408:
.L430:
.LBE6820:
.LBE6819:
	.loc 41 179 0
	movsbl	(%ebx), %eax
	.loc 41 279 0
	xorl	%esi, %esi
.LVL409:
	.loc 41 179 0
	testb	%al, %al
	jne	.L424
.L443:
	.loc 41 296 0
	movl	(%esp), %eax
.LBE6873:
.LBE6878:
	.loc 41 318 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
.LVL410:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL411:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL412:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL413:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL414:
	.p2align 4,,10
	.p2align 3
.L379:
	.cfi_restore_state
.LBB6879:
.LBB6874:
	.loc 41 281 0
	cmpb	$37, %al
	jne	.L433
.LVL415:
	.loc 41 284 0
	addl	$1, %ebx
.LVL416:
	.loc 41 283 0
	movl	$1, %esi
	jmp	.L378
.LVL417:
	.p2align 4,,10
	.p2align 3
.L381:
	.loc 41 188 0
	movzbl	0, %eax
.LVL418:
	ud2
.LVL419:
	.p2align 4,,10
	.p2align 3
.L384:
	cmpb	$117, %al
	je	.L388
	cmpb	$120, %al
	je	.L389
	cmpb	$115, %al
	jne	.L427
	.loc 41 232 0
	movl	(%edi), %eax
	leal	4(%edi), %ebp
.LVL420:
	call	print_string
.LVL421:
.L438:
.LBB6825:
	.loc 41 225 0
	addl	(%esp), %eax
.LVL422:
.L401:
	.loc 41 227 0
	addl	$1, %ebx
.LVL423:
	.loc 41 220 0
	movl	%ebp, %edi
	jmp	.L391
.LVL424:
	.p2align 4,,10
	.p2align 3
.L433:
.LBE6825:
.LBB6830:
.LBB6831:
	.loc 41 21 0
	subl	$12, %esp
	.cfi_def_cfa_offset 60
.LVL425:
	movzbl	%al, %edx
	movb	%al, 16(%esp)
	pushl	%edx
	.cfi_def_cfa_offset 64
	call	putConsoleChar
.LVL426:
	.loc 41 22 0
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.LVL427:
	movzbl	4(%esp), %eax
	cmpb	$10, %al
	je	.L445
.L423:
.LVL428:
.LBE6831:
.LBE6830:
	.loc 41 289 0
	addl	$1, (%esp)
.LVL429:
	.loc 41 290 0
	addl	$1, %ebx
.LVL430:
	jmp	.L378
.LVL431:
	.p2align 4,,10
	.p2align 3
.L383:
.LBB6833:
	.loc 41 220 0
	leal	4(%edi), %ebp
.LVL432:
	movl	(%edi), %edi
.LVL433:
	.loc 41 221 0
	testl	%edi, %edi
	jne	.L400
	.loc 41 222 0
	movl	$.LC76, %eax
	call	print_string
.LVL434:
	addl	(%esp), %eax
.LVL435:
	jmp	.L401
.LVL436:
	.p2align 4,,10
	.p2align 3
.L389:
.LBE6833:
	.loc 41 215 0
	movl	(%edi), %eax
	leal	4(%edi), %ebp
.LVL437:
.LBB6834:
.LBB6835:
	.loc 41 90 0
	testl	%eax, %eax
	jne	.L446
.LVL438:
.L398:
.LBB6836:
.LBB6837:
	.loc 41 21 0
	subl	$12, %esp
	.cfi_def_cfa_offset 60
.LVL439:
	pushl	$48
	.cfi_def_cfa_offset 64
	call	putConsoleChar
.LVL440:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.LVL441:
.LBE6837:
.LBE6836:
	.loc 41 92 0
	movl	$1, %eax
	jmp	.L438
.LVL442:
	.p2align 4,,10
	.p2align 3
.L388:
.LBE6835:
.LBE6834:
	.loc 41 210 0
	movl	(%edi), %eax
	leal	4(%edi), %ebp
.LVL443:
.LBB6839:
.LBB6840:
	.loc 41 90 0
	testl	%eax, %eax
	je	.L398
.LVL444:
.L439:
	movl	$10, %edx
	call	print_unsigned_long.part.57
.LVL445:
	jmp	.L438
.LVL446:
	.p2align 4,,10
	.p2align 3
.L386:
.LBE6840:
.LBE6839:
	.loc 41 238 0
	movzbl	1(%ebx), %eax
	cmpb	$108, %al
	je	.L402
	jle	.L447
	cmpb	$117, %al
	je	.L405
	cmpb	$120, %al
	jne	.L427
	.loc 41 263 0
	movl	(%edi), %eax
	leal	4(%edi), %ebp
.LVL447:
.LBB6841:
.LBB6842:
	.loc 41 90 0
	testl	%eax, %eax
	je	.L417
	movl	$16, %edx
	call	print_unsigned_long.part.57
.LVL448:
.L418:
.LBE6842:
.LBE6841:
	.loc 41 263 0
	addl	(%esp), %eax
.LVL449:
	.loc 41 264 0
	addl	$2, %ebx
.LVL450:
	.loc 41 263 0
	movl	%ebp, %edi
	jmp	.L391
.LVL451:
	.p2align 4,,10
	.p2align 3
.L385:
.LBB6846:
	.loc 41 196 0
	leal	4(%edi), %ebp
.LVL452:
	movl	(%edi), %edi
.LVL453:
	.loc 41 198 0
	testl	%edi, %edi
	js	.L448
.LVL454:
	.loc 41 204 0
	movl	%edi, %eax
.LBB6847:
.LBB6848:
	.loc 41 90 0
	je	.L398
	jmp	.L439
.LVL455:
.L446:
.LBE6848:
.LBE6847:
.LBE6846:
.LBB6851:
.LBB6838:
	movl	$16, %edx
	call	print_unsigned_long.part.57
.LVL456:
	jmp	.L438
.LVL457:
.L400:
.LBE6838:
.LBE6851:
.LBB6852:
	.loc 41 224 0
	movl	$.LC77, %eax
	call	print_string
.LVL458:
.LBB6826:
.LBB6827:
	movl	$16, %edx
.LBE6827:
.LBE6826:
	movl	%eax, 4(%esp)
.LVL459:
.LBB6829:
.LBB6828:
	movl	%edi, %eax
	call	print_unsigned_long.part.57
.LVL460:
.LBE6828:
.LBE6829:
	.loc 41 225 0
	addl	4(%esp), %eax
	jmp	.L438
.LVL461:
.L405:
.LBE6852:
	.loc 41 259 0
	movl	(%edi), %eax
	leal	4(%edi), %ebp
.LVL462:
.LBB6853:
.LBB6854:
	.loc 41 90 0
	testl	%eax, %eax
	je	.L417
.LVL463:
.L440:
	movl	$10, %edx
	call	print_unsigned_long.part.57
.LVL464:
	jmp	.L418
.LVL465:
.L402:
.LBE6854:
.LBE6853:
	.loc 41 253 0
	cmpb	$120, 2(%ebx)
	je	.L449
.LVL466:
.L411:
	.loc 41 256 0
	addl	$3, %ebx
.LVL467:
	movl	(%esp), %eax
	jmp	.L391
.LVL468:
.L448:
.LBB6855:
.LBB6849:
.LBB6850:
	.loc 41 21 0
	subl	$12, %esp
	.cfi_def_cfa_offset 60
.LVL469:
	pushl	$45
	.cfi_def_cfa_offset 64
	call	putConsoleChar
.LVL470:
.LBE6850:
.LBE6849:
	.loc 41 204 0
	movl	%edi, %eax
	.loc 41 200 0
	addl	$1, 16(%esp)
.LVL471:
	.loc 41 204 0
	negl	%eax
.LVL472:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L439
.LVL473:
.L445:
.LBE6855:
.LBB6856:
.LBB6832:
	.loc 41 23 0
	subl	$12, %esp
	.cfi_def_cfa_offset 60
.LVL474:
	pushl	$13
	.cfi_def_cfa_offset 64
	call	putConsoleChar
.LVL475:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.LVL476:
	jmp	.L423
.LVL477:
.L447:
.LBE6832:
.LBE6856:
	.loc 41 238 0
	cmpb	$100, %al
	jne	.L427
.LBB6857:
	.loc 41 240 0
	leal	4(%edi), %ebp
.LVL478:
	movl	(%edi), %edi
.LVL479:
	.loc 41 242 0
	testl	%edi, %edi
	js	.L450
.LVL480:
	.loc 41 248 0
	movl	%edi, %eax
.LBB6858:
.LBB6859:
	.loc 41 90 0
	jne	.L440
.LVL481:
.L417:
.LBE6859:
.LBE6858:
.LBE6857:
.LBB6862:
.LBB6845:
.LBB6843:
.LBB6844:
	.loc 41 21 0
	subl	$12, %esp
	.cfi_def_cfa_offset 60
.LVL482:
	pushl	$48
	.cfi_def_cfa_offset 64
	call	putConsoleChar
.LVL483:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.LVL484:
.LBE6844:
.LBE6843:
	.loc 41 92 0
	movl	$1, %eax
	jmp	.L418
.LVL485:
.L425:
.LBE6845:
.LBE6862:
.LBE6874:
.LBE6879:
	.loc 41 318 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
.LBB6880:
.LBB6875:
	.loc 41 173 0
	xorl	%eax, %eax
.LBE6875:
.LBE6880:
	.loc 41 318 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL486:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL487:
.L449:
	.cfi_restore_state
.LBB6881:
.LBB6876:
	.loc 41 254 0
	leal	8(%edi), %eax
	movl	(%edi), %ebp
	movl	%eax, 4(%esp)
.LVL488:
	movl	4(%edi), %eax
.LVL489:
.LBB6863:
.LBB6864:
	.loc 41 120 0
	xorl	%edi, %edi
	.loc 41 134 0
	testl	%eax, %eax
	jne	.L451
.LVL490:
.L412:
	.loc 41 148 0
	subl	$8, %esp
	.cfi_def_cfa_offset 56
.LVL491:
	pushl	$16
	.cfi_def_cfa_offset 60
	pushl	%ebp
	.cfi_def_cfa_offset 64
	call	print_unsigned_long
.LVL492:
.LBE6864:
.LBE6863:
	.loc 41 254 0
	leal	(%eax,%edi), %edx
	addl	%edx, 16(%esp)
.LVL493:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movl	4(%esp), %edi
	jmp	.L411
.LVL494:
.L450:
.LBB6870:
.LBB6860:
.LBB6861:
	.loc 41 21 0
	subl	$12, %esp
	.cfi_def_cfa_offset 60
.LVL495:
	pushl	$45
	.cfi_def_cfa_offset 64
	call	putConsoleChar
.LVL496:
.LBE6861:
.LBE6860:
	.loc 41 248 0
	movl	%edi, %eax
	.loc 41 244 0
	addl	$1, 16(%esp)
.LVL497:
	.loc 41 248 0
	negl	%eax
.LVL498:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L440
.LVL499:
.L451:
.LBE6870:
.LBB6871:
.LBB6869:
	.loc 41 135 0
	subl	$8, %esp
	.cfi_def_cfa_offset 56
.LVL500:
	pushl	$16
	.cfi_def_cfa_offset 60
	pushl	%eax
	.cfi_def_cfa_offset 64
	call	print_unsigned_long
.LVL501:
	movl	%eax, %edi
.LVL502:
	leal	8(%eax), %eax
.LVL503:
	movl	%eax, 24(%esp)
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.LVL504:
	.loc 41 121 0
	movl	$-268435456, %eax
.LVL505:
.L413:
	.loc 41 137 0
	testl	%eax, %ebp
	jne	.L412
	movl	%eax, 12(%esp)
.LVL506:
.LBB6865:
.LBB6866:
	.loc 41 21 0
	subl	$12, %esp
	.cfi_def_cfa_offset 60
.LVL507:
.LBE6866:
.LBE6865:
	.loc 41 139 0
	addl	$1, %edi
.LVL508:
.LBB6868:
.LBB6867:
	.loc 41 21 0
	pushl	$48
	.cfi_def_cfa_offset 64
	call	putConsoleChar
.LVL509:
.LBE6867:
.LBE6868:
	.loc 41 140 0
	movl	28(%esp), %eax
	.loc 41 142 0
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.LVL510:
	.loc 41 140 0
	shrl	$4, %eax
.LVL511:
	.loc 41 142 0
	cmpl	8(%esp), %edi
	jne	.L413
	jmp	.L412
.LBE6869:
.LBE6871:
.LBE6876:
.LBE6881:
	.cfi_endproc
.LFE720:
	.size	kprintf, .-kprintf
	.section	.text.unlikely
.LCOLDE78:
	.text
.LHOTE78:
	.section	.rodata.str1.1
.LC79:
	.string	"APIC: Enabled bit not set\n"
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC80:
	.string	"x2APIC enabled in BIOS but kernel does not support that\n"
	.section	.boot.text
.LCOLDB81:
.LHOTB81:
	.p2align 4,,15
	.globl	apic_enable
	.type	apic_enable, @function
apic_enable:
.LFB562:
	.loc 21 36 0
	.cfi_startproc
.LVL512:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
.LBB6882:
.LBB6883:
.LBB6884:
.LBB6885:
	.loc 10 101 0
	movl	$27, %ecx
.LBE6885:
.LBE6884:
.LBE6883:
.LBE6882:
	.loc 21 36 0
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
.LBB6889:
.LBB6888:
.LBB6887:
.LBB6886:
	.loc 10 101 0
#APP
# 101 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine.h" 1
	rdmsr
# 0 "" 2
.LVL513:
#NO_APP
.LBE6886:
.LBE6887:
.LBE6888:
.LBE6889:
	.loc 21 40 0
	testb	$8, %ah
	je	.L462
.LVL514:
.LBB6890:
.LBB6891:
.LBB6892:
.LBB6893:
.LBB6894:
.LBB6895:
	.loc 10 101 0
#APP
# 101 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine.h" 1
	rdmsr
# 0 "" 2
#NO_APP
.LBE6895:
.LBE6894:
.LBE6893:
.LBE6892:
.LBB6899:
.LBB6900:
	.loc 10 160 0
	xorl	%ecx, %ecx
.LBE6900:
.LBE6899:
.LBB6902:
.LBB6898:
.LBB6897:
.LBB6896:
	.loc 10 101 0
	movl	%eax, %esi
.LVL515:
.LBE6896:
.LBE6897:
.LBE6898:
.LBE6902:
.LBB6903:
.LBB6901:
	.loc 10 160 0
	movl	$1, %eax
#APP
# 160 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine.h" 1
	cpuid
# 0 "" 2
.LVL516:
#NO_APP
.LBE6901:
.LBE6903:
	.loc 9 22 0
	andl	$2097152, %ecx
.LBE6891:
.LBE6890:
	.loc 21 54 0
	movl	$1, %eax
.LBB6905:
.LBB6904:
	.loc 9 22 0
	je	.L458
.LVL517:
	testl	$2048, %esi
	je	.L458
.LVL518:
	.loc 9 23 0
	andl	$1024, %esi
	je	.L458
.LBE6904:
.LBE6905:
	.loc 21 46 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC80
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL519:
	.loc 21 47 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
.L458:
	.loc 21 55 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L462:
	.cfi_restore_state
	.loc 21 41 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC79
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL520:
	.loc 21 42 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	.loc 21 55 0
	addl	$4, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE562:
	.size	apic_enable, .-apic_enable
.LCOLDE81:
.LHOTE81:
	.section	.rodata.str1.1
.LC82:
	.string	"halting..."
.LC83:
	.string	"\nKernel entry via "
.LC84:
	.string	"Interrupt, irq %lu\n"
.LC85:
	.string	"Unknown syscall, word: %lu"
.LC86:
	.string	"VM Fault, fault type: %lu\n"
.LC87:
	.string	"User level fault, number: %lu"
.LC88:
	.string	"Syscall, number: %ld, %s\n"
	.section	.rodata.str1.4
	.align 4
.LC89:
	.string	"Cap type: %lu, Invocation tag: %lu\n"
	.section	.rodata.str1.1
.LC90:
	.string	"Unknown\n"
	.section	.text.unlikely
.LCOLDB91:
	.text
.LHOTB91:
	.p2align 4,,15
	.globl	halt
	.type	halt, @function
halt:
.LFB501:
	.loc 1 24 0
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	.loc 1 26 0
#APP
# 26 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/idle.c" 1
	cli
# 0 "" 2
	.loc 1 29 0
#NO_APP
	pushl	$.LC82
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL521:
.LBB6910:
.LBB6911:
	.file 42 "/home/axjllt/Desktop/ori_refos/kernel/include/api/debug.h"
	.loc 42 28 0
	movl	$.LC83, (%esp)
	call	kprintf
.LVL522:
	.loc 42 29 0
	movzbl	ksKernelEntry, %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	andl	$7, %eax
	cmpb	$5, %al
	ja	.L464
	movzbl	%al, %eax
	jmp	*.L466(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L466:
	.long	.L465
	.long	.L467
	.long	.L468
	.long	.L464
	.long	.L469
	.long	.L470
	.text
.L464:
	.loc 42 68 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC90
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL523:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	.p2align 4,,10
	.p2align 3
.L475:
.LBE6911:
.LBE6910:
.LBB6913:
.LBB6914:
	.loc 1 19 0
#APP
# 19 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/idle.c" 1
	hlt
# 0 "" 2
#NO_APP
	jmp	.L475
.L470:
.LBE6914:
.LBE6913:
.LBB6915:
.LBB6912:
	.loc 42 48 0
	movzbl	ksKernelEntry+1, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	andl	$15, %eax
	pushl	syscall_names(,%eax,4)
	.cfi_def_cfa_offset 24
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	$.LC88
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL524:
	.loc 42 50 0
	movzbl	ksKernelEntry+1, %edx
	.loc 42 49 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	.loc 42 50 0
	movl	%edx, %eax
	andl	$15, %eax
	.loc 42 49 0
	leal	-3(%eax), %ecx
	cmpb	$1, %cl
	jbe	.L473
	cmpb	$1, %al
	jne	.L475
.L473:
	.loc 42 53 0
	movzbl	ksKernelEntry+2, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	movzbl	ksKernelEntry+3, %ecx
	shrb	$2, %al
	sall	$6, %ecx
	movzbl	%al, %eax
	orl	%ecx, %eax
	movzbl	ksKernelEntry+4, %ecx
	andl	$31, %ecx
	sall	$14, %ecx
	orl	%ecx, %eax
	pushl	%eax
	.cfi_def_cfa_offset 24
	movl	%edx, %eax
	movzbl	ksKernelEntry+2, %edx
	shrb	$4, %al
	movzbl	%al, %eax
	andl	$1, %edx
	sall	$4, %edx
	orl	%edx, %eax
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	$.LC89
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL525:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	jmp	.L475
.L469:
	.loc 42 37 0
	movzbl	ksKernelEntry+2, %edx
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	movzbl	ksKernelEntry+1, %eax
	sall	$8, %edx
	orl	%edx, %eax
	movzbl	ksKernelEntry+3, %edx
	sall	$16, %edx
	orl	%edx, %eax
	movzbl	ksKernelEntry+4, %edx
	andl	$31, %edx
	sall	$24, %edx
	orl	%edx, %eax
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	$.LC86
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL526:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	jmp	.L475
.L467:
	.loc 42 34 0
	movzbl	ksKernelEntry+2, %edx
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	movzbl	ksKernelEntry+1, %eax
	sall	$8, %edx
	orl	%edx, %eax
	movzbl	ksKernelEntry+3, %edx
	sall	$16, %edx
	orl	%edx, %eax
	movzbl	ksKernelEntry+4, %edx
	andl	$31, %edx
	sall	$24, %edx
	orl	%edx, %eax
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	$.LC85
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL527:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	jmp	.L475
.L465:
	.loc 42 31 0
	movzbl	ksKernelEntry+2, %edx
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	movzbl	ksKernelEntry+1, %eax
	sall	$8, %edx
	orl	%edx, %eax
	movzbl	ksKernelEntry+3, %edx
	sall	$16, %edx
	orl	%edx, %eax
	movzbl	ksKernelEntry+4, %edx
	andl	$31, %edx
	sall	$24, %edx
	orl	%edx, %eax
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	$.LC84
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL528:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	jmp	.L475
.L468:
	.loc 42 40 0
	movzbl	ksKernelEntry+2, %edx
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	movzbl	ksKernelEntry+1, %eax
	sall	$8, %edx
	orl	%edx, %eax
	movzbl	ksKernelEntry+3, %edx
	sall	$16, %edx
	orl	%edx, %eax
	movzbl	ksKernelEntry+4, %edx
	andl	$31, %edx
	sall	$24, %edx
	orl	%edx, %eax
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	$.LC87
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL529:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	jmp	.L475
.LBE6912:
.LBE6915:
	.cfi_endproc
.LFE501:
	.size	halt, .-halt
	.section	.text.unlikely
.LCOLDE91:
	.text
.LHOTE91:
	.section	.rodata.str1.4
	.align 4
.LC92:
	.string	"\n========== KERNEL EXCEPTION ==========\n"
	.section	.rodata.str1.1
.LC93:
	.string	"Vector:  0x%lx\n"
.LC94:
	.string	"ErrCode: 0x%lx\n"
.LC95:
	.string	"IP:      0x%lx\n"
.LC96:
	.string	"SP:      0x%lx\n"
.LC97:
	.string	"FLAGS:   0x%lx\n"
.LC98:
	.string	"CR0:     0x%lx\n"
	.section	.rodata.str1.4
	.align 4
.LC99:
	.string	"CR2:     0x%lx (page-fault address)\n"
	.align 4
.LC100:
	.string	"CR3:     0x%lx (page-directory physical address)\n"
	.section	.rodata.str1.1
.LC101:
	.string	"CR4:     0x%lx\n"
.LC102:
	.string	"\nStack Dump:\n"
.LC103:
	.string	"*0x%lx == 0x%lx\n"
.LC104:
	.string	"\nHalting...\n"
	.section	.text.unlikely
.LCOLDB105:
	.text
.LHOTB105:
	.p2align 4,,15
	.globl	handleKernelException
	.type	handleKernelException, @function
handleKernelException:
.LFB495:
	.file 43 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/api/faults.c"
	.loc 43 72 0
	.cfi_startproc
.LVL530:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	.loc 43 76 0
	cmpl	$13, 16(%esp)
	jne	.L479
	.loc 43 76 0 is_stmt 0 discriminator 1
	movl	x86KSGPExceptReturnTo, %eax
	testl	%eax, %eax
	je	.L479
.LVL531:
.LBB6916:
	.loc 43 78 0 is_stmt 1
	movl	$0, x86KSGPExceptReturnTo
.LBE6916:
	.loc 43 99 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL532:
.L479:
	.cfi_restore_state
	.loc 43 81 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC92
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL533:
	.loc 43 82 0
	popl	%eax
	.cfi_def_cfa_offset 28
	popl	%edx
	.cfi_def_cfa_offset 24
	pushl	24(%esp)
	.cfi_def_cfa_offset 28
	pushl	$.LC93
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL534:
	.loc 43 83 0
	popl	%ecx
	.cfi_def_cfa_offset 28
	popl	%ebx
	.cfi_def_cfa_offset 24
	pushl	28(%esp)
	.cfi_def_cfa_offset 28
	pushl	$.LC94
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL535:
	.loc 43 84 0
	popl	%esi
	.cfi_def_cfa_offset 28
	popl	%eax
	.cfi_def_cfa_offset 24
	pushl	32(%esp)
	.cfi_def_cfa_offset 28
	pushl	$.LC95
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL536:
	.loc 43 85 0
	popl	%eax
	.cfi_def_cfa_offset 28
	popl	%edx
	.cfi_def_cfa_offset 24
	pushl	36(%esp)
	.cfi_def_cfa_offset 28
	pushl	$.LC96
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL537:
	.loc 43 86 0
	popl	%ecx
	.cfi_def_cfa_offset 28
	popl	%ebx
	.cfi_def_cfa_offset 24
	pushl	40(%esp)
	.cfi_def_cfa_offset 28
	pushl	$.LC97
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL538:
	.loc 43 87 0
	popl	%esi
	.cfi_def_cfa_offset 28
	popl	%eax
	.cfi_def_cfa_offset 24
	pushl	44(%esp)
	.cfi_def_cfa_offset 28
	pushl	$.LC98
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL539:
	.loc 43 88 0
	popl	%eax
	.cfi_def_cfa_offset 28
	popl	%edx
	.cfi_def_cfa_offset 24
	pushl	48(%esp)
	.cfi_def_cfa_offset 28
	pushl	$.LC99
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL540:
	.loc 43 89 0
	popl	%ecx
	.cfi_def_cfa_offset 28
	popl	%ebx
	.cfi_def_cfa_offset 24
	pushl	52(%esp)
	.cfi_def_cfa_offset 28
	pushl	$.LC100
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL541:
	.loc 43 90 0
	popl	%esi
	.cfi_def_cfa_offset 28
	popl	%eax
	.cfi_def_cfa_offset 24
	pushl	56(%esp)
	.cfi_def_cfa_offset 28
	pushl	$.LC101
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL542:
	.loc 43 91 0
	movl	$.LC102, (%esp)
	call	kprintf
.LVL543:
	movl	44(%esp), %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	28(%esp), %ebx
	leal	80(%eax), %esi
.LVL544:
	.p2align 4,,10
	.p2align 3
.L480:
.LBB6917:
	.loc 43 94 0 discriminator 3
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	pushl	(%ebx)
	.cfi_def_cfa_offset 24
	pushl	%ebx
	.cfi_def_cfa_offset 28
	addl	$4, %ebx
.LVL545:
	pushl	$.LC103
	.cfi_def_cfa_offset 32
.LVL546:
	call	kprintf
.LVL547:
.LBE6917:
	.loc 43 92 0 discriminator 3
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	cmpl	%esi, %ebx
	jne	.L480
	.loc 43 96 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC104
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL548:
	.loc 43 97 0
	call	halt
.LVL549:
	.cfi_endproc
.LFE495:
	.size	handleKernelException, .-handleKernelException
	.section	.text.unlikely
.LCOLDE105:
	.text
.LHOTE105:
	.section	.rodata.str1.1
.LC106:
	.string	"Cacheline size must be >0\n"
	.section	.rodata.str1.4
	.align 4
.LC107:
	.string	"Cacheline size must be a power of two\n"
	.section	.boot.text
.LCOLDB108:
.LHOTB108:
	.p2align 4,,15
	.globl	getCacheLineSizeBits
	.type	getCacheLineSizeBits, @function
getCacheLineSizeBits:
.LFB595:
	.loc 25 47 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 25 51 0
	call	getCacheLineSize
.LVL550:
	.loc 25 52 0
	testl	%eax, %eax
	je	.L489
	movl	%eax, %edx
.LVL551:
	.loc 25 59 0
	xorl	%eax, %eax
.LVL552:
	testb	$1, %dl
	jne	.L491
.LVL553:
	.p2align 4,,10
	.p2align 3
.L496:
	.loc 25 60 0
	shrl	%edx
.LVL554:
	.loc 25 61 0
	addl	$1, %eax
.LVL555:
	.loc 25 59 0
	testb	$1, %dl
	je	.L496
.LVL556:
.L491:
	.loc 25 64 0
	cmpl	$1, %edx
	je	.L492
	.loc 25 65 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC107
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL557:
	.loc 25 66 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
.L492:
	.loc 25 70 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL558:
	.p2align 4,,10
	.p2align 3
.L489:
	.cfi_restore_state
	.loc 25 53 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC106
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL559:
	.loc 25 54 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	.loc 25 70 0
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE595:
	.size	getCacheLineSizeBits, .-getCacheLineSizeBits
.LCOLDE108:
.LHOTE108:
	.section	.rodata.str1.4
	.align 4
.LC109:
	.string	"Disabling prefetchers not implemented for CPU fam %x model %x\n"
	.section	.rodata
	.align 32
.LC1:
	.long	77
	.long	86
	.long	79
	.long	71
	.long	61
	.long	60
	.long	63
	.long	69
	.long	70
	.long	154
	.long	62
	.long	58
	.long	42
	.long	45
	.long	37
	.long	44
	.long	47
	.long	30
	.long	26
	.long	46
	.long	78
	.long	94
	.section	.boot.text
.LCOLDB110:
.LHOTB110:
	.p2align 4,,15
	.globl	disablePrefetchers
	.type	disablePrefetchers, @function
disablePrefetchers:
.LFB597:
	.loc 25 94 0
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.loc 25 99 0
	movl	$22, %ecx
	.loc 25 113 0
	xorl	%eax, %eax
	.loc 25 94 0
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	.loc 25 99 0
	movl	$.LC1, %esi
	.loc 25 94 0
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$96, %esp
	.cfi_def_cfa_offset 112
	movzbl	cpu_identity+17, %edx
	.loc 25 99 0
	leal	8(%esp), %ebx
	movl	%ebx, %edi
	rep movsl
.LVL560:
	movzbl	cpu_identity+18, %ecx
	jmp	.L504
.LVL561:
	.p2align 4,,10
	.p2align 3
.L502:
	.loc 25 113 0 discriminator 2
	addl	$1, %eax
.LVL562:
	cmpl	$22, %eax
	je	.L507
.LVL563:
.L504:
	.loc 25 121 0
	cmpb	$6, %dl
	jne	.L502
	.loc 25 122 0
	cmpl	(%ebx,%eax,4), %ecx
	jne	.L502
.LVL564:
.LBB6918:
.LBB6919:
.LBB6920:
.LBB6921:
	.loc 10 101 0
	movl	$420, %ecx
#APP
# 101 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine.h" 1
	rdmsr
# 0 "" 2
.LVL565:
#NO_APP
	movl	%eax, %ebx
.LVL566:
.LBE6921:
.LBE6920:
.LBE6919:
.LBE6918:
.LBB6922:
.LBB6923:
.LBB6924:
.LBB6925:
#APP
# 101 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine.h" 1
	rdmsr
# 0 "" 2
.LVL567:
#NO_APP
.LBE6925:
.LBE6924:
.LBE6923:
.LBE6922:
	.loc 25 131 0
	movl	%ebx, %eax
	orl	$15, %eax
.LVL568:
.LBB6926:
.LBB6927:
.LBB6928:
.LBB6929:
	.loc 10 120 0
#APP
# 120 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine.h" 1
	wrmsr
# 0 "" 2
.LVL569:
#NO_APP
.LBE6929:
.LBE6928:
.LBE6927:
.LBE6926:
	.loc 25 140 0
	addl	$96, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	.loc 25 133 0
	movl	$1, %eax
	.loc 25 140 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL570:
	.p2align 4,,10
	.p2align 3
.L507:
	.cfi_restore_state
	.loc 25 137 0
	subl	$4, %esp
	.cfi_def_cfa_offset 116
	pushl	%ecx
	.cfi_def_cfa_offset 120
	pushl	%edx
	.cfi_def_cfa_offset 124
	pushl	$.LC109
	.cfi_def_cfa_offset 128
	call	kprintf
.LVL571:
	.loc 25 139 0
	addl	$16, %esp
	.cfi_def_cfa_offset 112
	xorl	%eax, %eax
	.loc 25 140 0
	addl	$96, %esp
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE597:
	.size	disablePrefetchers, .-disablePrefetchers
.LCOLDE110:
.LHOTE110:
	.section	.rodata.str1.4
	.align 4
.LC111:
	.string	"\033[0m\033[30;1m<<\033[0m\033[32mseL4(CPU %lu)\033[0m\033[30;1m [%s/%d T%p \"%s\" @%lx]: "
	.align 4
.LC112:
	.string	"IRQControl: IRQ %ld should be in range %ld - %ld"
	.section	.rodata.str1.1
.LC113:
	.string	">>\033[0m\n"
	.section	.text.unlikely
.LCOLDB114:
	.text
.LHOTB114:
	.p2align 4,,15
	.type	Arch_checkIRQ.part.58, @function
Arch_checkIRQ.part.58:
.LFB953:
	.loc 27 43 0
	.cfi_startproc
.LVL572:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	%eax, %ebx
	subl	$12, %esp
	.cfi_def_cfa_offset 20
	.loc 27 52 0
	movl	ksCurThread, %eax
.LVL573:
	pushl	556(%eax)
	.cfi_def_cfa_offset 24
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	pushl	$52
	.cfi_def_cfa_offset 36
	pushl	$__func__.7594
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL574:
	addl	$32, %esp
	.cfi_def_cfa_offset 16
	pushl	$15
	.cfi_def_cfa_offset 20
	pushl	$0
	.cfi_def_cfa_offset 24
	pushl	%ebx
	.cfi_def_cfa_offset 28
	pushl	$.LC112
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL575:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL576:
	.loc 27 58 0
	movl	$3, %eax
	.loc 27 53 0
	movl	$4, current_syscall_error+24
	.loc 27 54 0
	movl	$0, current_syscall_error+8
	.loc 27 55 0
	movl	$15, current_syscall_error+12
	.loc 27 58 0
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL577:
	ret
	.cfi_endproc
.LFE953:
	.size	Arch_checkIRQ.part.58, .-Arch_checkIRQ.part.58
	.section	.text.unlikely
.LCOLDE114:
	.text
.LHOTE114:
	.section	.text.unlikely
.LCOLDB115:
	.text
.LHOTB115:
	.p2align 4,,15
	.globl	Arch_checkIRQ
	.type	Arch_checkIRQ, @function
Arch_checkIRQ:
.LFB601:
	.loc 27 44 0
	.cfi_startproc
.LVL578:
	.loc 27 44 0
	movl	4(%esp), %eax
	.loc 27 45 0
	cmpl	$15, %eax
	ja	.L512
	.loc 27 58 0
	xorl	%eax, %eax
	ret
.LVL579:
	.p2align 4,,10
	.p2align 3
.L512:
	jmp	Arch_checkIRQ.part.58
.LVL580:
	.cfi_endproc
.LFE601:
	.size	Arch_checkIRQ, .-Arch_checkIRQ
	.section	.text.unlikely
.LCOLDE115:
	.text
.LHOTE115:
	.section	.rodata.str1.4
	.align 4
.LC116:
	.string	"IRQControl: Illegal operation."
	.section	.text.unlikely
.LCOLDB117:
	.text
.LHOTB117:
	.p2align 4,,15
	.globl	Arch_decodeIRQControlInvocation
	.type	Arch_decodeIRQControlInvocation, @function
Arch_decodeIRQControlInvocation:
.LFB604:
	.loc 27 78 0
	.cfi_startproc
.LVL581:
	subl	$16, %esp
	.cfi_def_cfa_offset 20
	.loc 27 88 0
	movl	ksCurThread, %eax
	pushl	556(%eax)
	.cfi_def_cfa_offset 24
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	pushl	$88
	.cfi_def_cfa_offset 36
	pushl	$__func__.7627
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL582:
	addl	$20, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC116
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL583:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL584:
	.loc 27 195 0
	movl	$3, %eax
	.loc 27 89 0
	movl	$3, current_syscall_error+24
	.loc 27 195 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE604:
	.size	Arch_decodeIRQControlInvocation, .-Arch_decodeIRQControlInvocation
	.section	.text.unlikely
.LCOLDE117:
	.text
.LHOTE117:
	.section	.rodata.str1.4
	.align 4
.LC118:
	.string	"IOSpace capability has no invocations"
	.section	.text.unlikely
.LCOLDB119:
	.text
.LHOTB119:
	.p2align 4,,15
	.globl	decodeX86IOSpaceInvocation
	.type	decodeX86IOSpaceInvocation, @function
decodeX86IOSpaceInvocation:
.LFB621:
	.loc 3 516 0
	.cfi_startproc
.LVL585:
	subl	$16, %esp
	.cfi_def_cfa_offset 20
	.loc 3 517 0
	movl	ksCurThread, %eax
	pushl	556(%eax)
	.cfi_def_cfa_offset 24
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	pushl	$517
	.cfi_def_cfa_offset 36
	pushl	$__func__.7802
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL586:
	addl	$20, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC118
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL587:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL588:
	.loc 3 520 0
	movl	$3, %eax
	.loc 3 518 0
	movl	$3, current_syscall_error+24
	.loc 3 520 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE621:
	.size	decodeX86IOSpaceInvocation, .-decodeX86IOSpaceInvocation
	.section	.text.unlikely
.LCOLDE119:
	.text
.LHOTE119:
	.section	.rodata.str1.4
	.align 4
.LC120:
	.string	"seL4 called fail at %s:%u in function %s, saying \"%s\"\n"
	.section	.text.unlikely
.LCOLDB121:
	.text
.LHOTB121:
	.p2align 4,,15
	.globl	_fail
	.type	_fail, @function
_fail:
.LFB635:
	.file 44 "/home/axjllt/Desktop/ori_refos/kernel/src/assert.c"
	.loc 44 21 0
	.cfi_startproc
.LVL589:
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	.loc 44 22 0
	pushl	28(%esp)
	.cfi_def_cfa_offset 32
	pushl	44(%esp)
	.cfi_def_cfa_offset 36
	pushl	44(%esp)
	.cfi_def_cfa_offset 40
	pushl	44(%esp)
	.cfi_def_cfa_offset 44
	pushl	$.LC120
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL590:
	.loc 44 29 0
	addl	$32, %esp
	.cfi_def_cfa_offset 16
	call	halt
.LVL591:
	.cfi_endproc
.LFE635:
	.size	_fail, .-_fail
	.section	.text.unlikely
.LCOLDE121:
	.text
.LHOTE121:
	.section	.rodata.str1.4
	.align 4
.LC122:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/32/kernel/vspace.c"
	.section	.rodata.str1.1
.LC123:
	.string	"Invalid page type"
	.section	.text.unlikely
.LCOLDB124:
	.text
.LHOTB124:
	.p2align 4,,15
	.globl	modeUnmapPage
	.type	modeUnmapPage, @function
modeUnmapPage:
.LFB465:
	.loc 16 687 0
	.cfi_startproc
.LVL592:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 16 688 0
	pushl	$__func__.6275
	.cfi_def_cfa_offset 20
	pushl	$688
	.cfi_def_cfa_offset 24
	pushl	$.LC122
	.cfi_def_cfa_offset 28
	pushl	$.LC123
	.cfi_def_cfa_offset 32
	call	_fail
.LVL593:
	.cfi_endproc
.LFE465:
	.size	modeUnmapPage, .-modeUnmapPage
	.section	.text.unlikely
.LCOLDE124:
	.text
.LHOTE124:
	.section	.rodata.str1.1
.LC125:
	.string	"Invalid Page type"
	.section	.text.unlikely
.LCOLDB126:
	.text
.LHOTB126:
	.p2align 4,,15
	.globl	decodeX86ModeMapRemapPage
	.type	decodeX86ModeMapRemapPage, @function
decodeX86ModeMapRemapPage:
.LFB466:
	.loc 16 693 0
	.cfi_startproc
.LVL594:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 16 694 0
	pushl	$__func__.6287
	.cfi_def_cfa_offset 20
	pushl	$694
	.cfi_def_cfa_offset 24
	pushl	$.LC122
	.cfi_def_cfa_offset 28
	pushl	$.LC125
	.cfi_def_cfa_offset 32
	call	_fail
.LVL595:
	.cfi_endproc
.LFE466:
	.size	decodeX86ModeMapRemapPage, .-decodeX86ModeMapRemapPage
	.section	.text.unlikely
.LCOLDE126:
	.text
.LHOTE126:
	.section	.rodata.str1.4
	.align 4
.LC127:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/32/kernel/vspace_32paging.c"
	.section	.rodata.str1.1
.LC128:
	.string	"Should not be called"
	.section	.boot.text
.LCOLDB129:
.LHOTB129:
	.p2align 4,,15
	.globl	map_it_pd_cap
	.type	map_it_pd_cap, @function
map_it_pd_cap:
.LFB471:
	.loc 17 131 0
	.cfi_startproc
.LVL596:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 17 133 0
	pushl	$__func__.6327
	.cfi_def_cfa_offset 20
	pushl	$133
	.cfi_def_cfa_offset 24
	pushl	$.LC127
	.cfi_def_cfa_offset 28
	pushl	$.LC128
	.cfi_def_cfa_offset 32
	call	_fail
.LVL597:
	.cfi_endproc
.LFE471:
	.size	map_it_pd_cap, .-map_it_pd_cap
.LCOLDE129:
.LHOTE129:
	.section	.rodata.str1.4
	.align 4
.LC130:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/32/object/objecttype.c"
	.section	.rodata.str1.1
.LC131:
	.string	"Invalid object type"
	.section	.text.unlikely
.LCOLDB132:
	.text
.LHOTB132:
	.p2align 4,,15
	.globl	Mode_getObjectSize
	.type	Mode_getObjectSize, @function
Mode_getObjectSize:
.LFB490:
	.loc 18 131 0
	.cfi_startproc
.LVL598:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 18 132 0
	pushl	$__func__.6475
	.cfi_def_cfa_offset 20
	pushl	$132
	.cfi_def_cfa_offset 24
	pushl	$.LC130
	.cfi_def_cfa_offset 28
	pushl	$.LC131
	.cfi_def_cfa_offset 32
	call	_fail
.LVL599:
	.cfi_endproc
.LFE490:
	.size	Mode_getObjectSize, .-Mode_getObjectSize
	.section	.text.unlikely
.LCOLDE132:
	.text
.LHOTE132:
	.section	.text.unlikely
.LCOLDB133:
	.text
.LHOTB133:
	.p2align 4,,15
	.globl	Arch_getObjectSize
	.type	Arch_getObjectSize, @function
Arch_getObjectSize:
.LFB628:
	.loc 28 435 0
	.cfi_startproc
.LVL600:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 28 435 0
	movl	16(%esp), %edx
	.loc 28 436 0
	cmpl	$9, %edx
	ja	.L529
	cmpl	$7, %edx
	jnb	.L530
	cmpl	$5, %edx
	je	.L530
	.loc 28 440 0
	movl	$22, %eax
	.loc 28 436 0
	cmpl	$6, %edx
	jne	.L528
.L532:
	.loc 28 464 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L530:
	.cfi_restore_state
	.loc 28 438 0
	movl	$12, %eax
	.loc 28 464 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L529:
	.cfi_restore_state
	.loc 28 446 0
	xorl	%eax, %eax
	.loc 28 436 0
	cmpl	$-1, %edx
	je	.L532
.L528:
	.loc 28 462 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	%edx
	.cfi_def_cfa_offset 32
	call	Mode_getObjectSize
.LVL601:
	.cfi_endproc
.LFE628:
	.size	Arch_getObjectSize, .-Arch_getObjectSize
	.section	.text.unlikely
.LCOLDE133:
	.text
.LHOTE133:
	.section	.rodata.str1.4
	.align 4
.LC134:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/api/faults.c"
	.section	.rodata.str1.1
.LC135:
	.string	"Invalid fault"
	.section	.text.unlikely
.LCOLDB136:
.LHOTB136:
	.type	Arch_handleFaultReply.part.60, @function
Arch_handleFaultReply.part.60:
.LFB955:
	.loc 43 19 0
	.cfi_startproc
.LVL602:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 43 26 0
	pushl	$__func__.6509
	.cfi_def_cfa_offset 20
	pushl	$26
	.cfi_def_cfa_offset 24
	pushl	$.LC134
	.cfi_def_cfa_offset 28
	pushl	$.LC135
	.cfi_def_cfa_offset 32
	call	_fail
.LVL603:
	.cfi_endproc
.LFE955:
	.size	Arch_handleFaultReply.part.60, .-Arch_handleFaultReply.part.60
.LCOLDE136:
.LHOTE136:
.LCOLDB137:
	.text
.LHOTB137:
	.p2align 4,,15
	.globl	Arch_handleFaultReply
	.type	Arch_handleFaultReply, @function
Arch_handleFaultReply:
.LFB493:
	.loc 43 20 0
	.cfi_startproc
.LVL604:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 43 21 0
	cmpl	$5, 24(%esp)
	jne	.L547
	.loc 43 28 0
	movl	$1, %eax
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.L547:
	.cfi_restore_state
	call	Arch_handleFaultReply.part.60
.LVL605:
	.cfi_endproc
.LFE493:
	.size	Arch_handleFaultReply, .-Arch_handleFaultReply
	.section	.text.unlikely
.LCOLDE137:
	.text
.LHOTE137:
	.section	.rodata.str1.4
	.align 4
.LC138:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/kernel/vspace.c"
	.section	.rodata.str1.1
.LC139:
	.string	"Invalid VM rights"
	.section	.text.unlikely
.LCOLDB140:
	.text
.LHOTB140:
	.p2align 4,,15
	.type	WritableFromVMRights.part.62, @function
WritableFromVMRights.part.62:
.LFB957:
	.loc 20 588 0
	.cfi_startproc
.LVL606:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 20 599 0
	pushl	$__func__.7067
	.cfi_def_cfa_offset 20
	pushl	$599
	.cfi_def_cfa_offset 24
	pushl	$.LC138
	.cfi_def_cfa_offset 28
	pushl	$.LC139
	.cfi_def_cfa_offset 32
	call	_fail
.LVL607:
	.cfi_endproc
.LFE957:
	.size	WritableFromVMRights.part.62, .-WritableFromVMRights.part.62
	.section	.text.unlikely
.LCOLDE140:
	.text
.LHOTE140:
	.section	.text.unlikely
.LCOLDB141:
	.text
.LHOTB141:
	.p2align 4,,15
	.globl	WritableFromVMRights
	.type	WritableFromVMRights, @function
WritableFromVMRights:
.LFB543:
	.loc 20 589 0
	.cfi_startproc
.LVL608:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 20 589 0
	movl	16(%esp), %eax
	.loc 20 590 0
	cmpl	$2, %eax
	je	.L554
	cmpl	$3, %eax
	je	.L553
	cmpl	$1, %eax
	je	.L553
	call	WritableFromVMRights.part.62
.LVL609:
	.p2align 4,,10
	.p2align 3
.L553:
	.loc 20 596 0
	movl	$1, %eax
	.loc 20 601 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L554:
	.cfi_restore_state
	.loc 20 592 0
	xorl	%eax, %eax
	.loc 20 601 0
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE543:
	.size	WritableFromVMRights, .-WritableFromVMRights
	.section	.text.unlikely
.LCOLDE141:
	.text
.LHOTE141:
	.section	.text.unlikely
.LCOLDB142:
	.text
.LHOTB142:
	.p2align 4,,15
	.type	SuperUserFromVMRights.part.63, @function
SuperUserFromVMRights.part.63:
.LFB958:
	.loc 20 603 0
	.cfi_startproc
.LVL610:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 20 614 0
	pushl	$__func__.7075
	.cfi_def_cfa_offset 20
	pushl	$614
	.cfi_def_cfa_offset 24
	pushl	$.LC138
	.cfi_def_cfa_offset 28
	pushl	$.LC139
	.cfi_def_cfa_offset 32
	call	_fail
.LVL611:
	.cfi_endproc
.LFE958:
	.size	SuperUserFromVMRights.part.63, .-SuperUserFromVMRights.part.63
	.section	.text.unlikely
.LCOLDE142:
	.text
.LHOTE142:
	.section	.text.unlikely
.LCOLDB143:
	.text
.LHOTB143:
	.p2align 4,,15
	.globl	SuperUserFromVMRights
	.type	SuperUserFromVMRights, @function
SuperUserFromVMRights:
.LFB544:
	.loc 20 604 0
	.cfi_startproc
.LVL612:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 20 604 0
	movl	16(%esp), %eax
	.loc 20 605 0
	cmpl	$1, %eax
	je	.L569
	jb	.L566
	cmpl	$3, %eax
	ja	.L566
	.loc 20 611 0
	movl	$1, %eax
	.loc 20 616 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L566:
	.cfi_restore_state
	call	SuperUserFromVMRights.part.63
.LVL613:
	.p2align 4,,10
	.p2align 3
.L569:
	.loc 20 607 0
	xorl	%eax, %eax
	.loc 20 616 0
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE544:
	.size	SuperUserFromVMRights, .-SuperUserFromVMRights
	.section	.text.unlikely
.LCOLDE143:
	.text
.LHOTE143:
	.section	.text.unlikely
.LCOLDB144:
	.text
.LHOTB144:
	.p2align 4,,15
	.globl	getObjectSize
	.type	getObjectSize, @function
getObjectSize:
.LFB784:
	.file 45 "/home/axjllt/Desktop/ori_refos/kernel/src/object/objecttype.c"
	.loc 45 34 0
	.cfi_startproc
.LVL614:
	.loc 45 34 0
	movl	4(%esp), %edx
	movl	8(%esp), %ecx
	.loc 45 35 0
	cmpl	$4, %edx
	ja	.L581
	.loc 45 38 0
	cmpl	$3, %edx
	ja	.L574
	.loc 45 42 0
	movl	$4, %eax
	.loc 45 38 0
	cmpl	$2, %edx
	jnb	.L576
	.loc 45 40 0
	movl	$10, %eax
	.loc 45 38 0
	cmpl	$1, %edx
	jne	.L573
.L576:
	.loc 45 54 0
	ret
	.p2align 4,,10
	.p2align 3
.L574:
	.loc 45 46 0
	leal	4(%ecx), %eax
	.loc 45 38 0
	cmpl	$4, %edx
	je	.L576
.LVL615:
.L573:
	.loc 45 48 0
	movl	%ecx, %eax
	.loc 45 54 0
	ret
	.p2align 4,,10
	.p2align 3
.L581:
	.loc 45 36 0
	jmp	Arch_getObjectSize
.LVL616:
	.cfi_endproc
.LFE784:
	.size	getObjectSize, .-getObjectSize
	.section	.text.unlikely
.LCOLDE144:
	.text
.LHOTE144:
	.section	.rodata.str1.4
	.align 4
.LC145:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/object/structures.h"
	.section	.rodata.str1.1
.LC146:
	.string	"Invalid arch cap type"
	.section	.text.unlikely
.LCOLDB147:
.LHOTB147:
	.type	cap_get_capMappedASID.part.140, @function
cap_get_capMappedASID.part.140:
.LFB1035:
	.file 46 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/object/structures.h"
	.loc 46 99 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 46 115 0
	pushl	$__func__.3028
	.cfi_def_cfa_offset 20
	pushl	$115
	.cfi_def_cfa_offset 24
	pushl	$.LC145
	.cfi_def_cfa_offset 28
	pushl	$.LC146
	.cfi_def_cfa_offset 32
	call	_fail
.LVL617:
	.cfi_endproc
.LFE1035:
	.size	cap_get_capMappedASID.part.140, .-cap_get_capMappedASID.part.140
.LCOLDE147:
.LHOTE147:
	.section	.rodata.str1.4
	.align 4
.LC148:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/object/notification.c"
	.align 4
.LC149:
	.string	"tried to complete signal with inactive notification object"
	.section	.text.unlikely
.LCOLDB150:
	.text
.LHOTB150:
	.p2align 4,,15
	.type	completeSignal.part.254, @function
completeSignal.part.254:
.LFB1149:
	.loc 36 207 0
	.cfi_startproc
.LVL618:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 36 216 0
	pushl	$__func__.9053
	.cfi_def_cfa_offset 20
	pushl	$216
	.cfi_def_cfa_offset 24
	pushl	$.LC148
	.cfi_def_cfa_offset 28
	pushl	$.LC149
	.cfi_def_cfa_offset 32
	call	_fail
.LVL619:
	.cfi_endproc
.LFE1149:
	.size	completeSignal.part.254, .-completeSignal.part.254
	.section	.text.unlikely
.LCOLDE150:
	.text
.LHOTE150:
	.section	.text.unlikely
.LCOLDB151:
	.text
.LHOTB151:
	.p2align 4,,15
	.globl	completeSignal
	.type	completeSignal, @function
completeSignal:
.LFB779:
	.loc 36 208 0
	.cfi_startproc
.LVL620:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 36 208 0
	movl	20(%esp), %ecx
	movl	16(%esp), %edx
	.loc 36 211 0
	testl	%ecx, %ecx
	je	.L587
	movl	(%edx), %eax
.LVL621:
	.loc 36 211 0 is_stmt 0 discriminator 1
	movl	%eax, %ebx
	andl	$3, %ebx
	cmpl	$2, %ebx
	jne	.L587
.LVL622:
.LBB6932:
.LBB6933:
	.loc 15 30 0 is_stmt 1
	movl	8(%edx), %ebx
.LBE6933:
.LBE6932:
.LBB6935:
.LBB6936:
	.loc 11 1123 0
	andl	$-4, %eax
.LBE6936:
.LBE6935:
.LBB6938:
.LBB6934:
	.loc 15 30 0
	movl	%ebx, 516(%ecx)
.LVL623:
.LBE6934:
.LBE6938:
.LBB6939:
.LBB6937:
	.loc 11 1123 0
	movl	%eax, (%edx)
.LVL624:
.LBE6937:
.LBE6939:
	.loc 36 218 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL625:
	.p2align 4,,10
	.p2align 3
.L587:
	.cfi_restore_state
	call	completeSignal.part.254
.LVL626:
	.cfi_endproc
.LFE779:
	.size	completeSignal, .-completeSignal
	.section	.text.unlikely
.LCOLDE151:
	.text
.LHOTE151:
	.section	.rodata.str1.4
	.align 4
.LC152:
	.string	"seL4 failed assertion '%s' at %s:%u in function %s\n"
	.section	.text.unlikely
.LCOLDB153:
	.text
.LHOTB153:
	.p2align 4,,15
	.globl	_assert_fail
	.type	_assert_fail, @function
_assert_fail:
.LFB636:
	.loc 44 37 0
	.cfi_startproc
.LVL627:
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	.loc 44 38 0
	pushl	40(%esp)
	.cfi_def_cfa_offset 32
	pushl	40(%esp)
	.cfi_def_cfa_offset 36
	pushl	40(%esp)
	.cfi_def_cfa_offset 40
	pushl	40(%esp)
	.cfi_def_cfa_offset 44
	pushl	$.LC152
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL628:
	.loc 44 44 0
	addl	$32, %esp
	.cfi_def_cfa_offset 16
	call	halt
.LVL629:
	.cfi_endproc
.LFE636:
	.size	_assert_fail, .-_assert_fail
	.section	.text.unlikely
.LCOLDE153:
	.text
.LHOTE153:
	.section	.rodata.str1.4
	.align 4
.LC154:
	.string	"./arch/object/structures_gen.h"
	.align 4
.LC155:
	.string	"(dest_shorthand & ~0x3u) == ((0 && (dest_shorthand & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB156:
.LHOTB156:
	.type	apic_icr1_new.part.69, @function
apic_icr1_new.part.69:
.LFB964:
	.loc 11 206 0
	.cfi_startproc
.LVL630:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 210 0
	pushl	$__FUNCTION__.1386
	.cfi_def_cfa_offset 20
	pushl	$210
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC155
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL631:
	.cfi_endproc
.LFE964:
	.size	apic_icr1_new.part.69, .-apic_icr1_new.part.69
.LCOLDE156:
.LHOTE156:
	.section	.rodata.str1.4
	.align 4
.LC157:
	.string	"(dest & ~0xffu) == ((0 && (dest & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB158:
.LHOTB158:
	.type	apic_icr2_new.part.70, @function
apic_icr2_new.part.70:
.LFB965:
	.loc 11 247 0
	.cfi_startproc
.LVL632:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 251 0
	pushl	$__FUNCTION__.1398
	.cfi_def_cfa_offset 20
	pushl	$251
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC157
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL633:
	.cfi_endproc
.LFE965:
	.size	apic_icr2_new.part.70, .-apic_icr2_new.part.70
.LCOLDE158:
.LHOTE158:
	.section	.rodata.str1.4
	.align 4
.LC159:
	.string	"(timer_mode & ~0x3u) == ((0 && (timer_mode & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB160:
.LHOTB160:
	.type	apic_lvt_new.part.71, @function
apic_lvt_new.part.71:
.LFB966:
	.loc 11 770 0
	.cfi_startproc
.LVL634:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 774 0
	pushl	$__FUNCTION__.1640
	.cfi_def_cfa_offset 20
	pushl	$774
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC159
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL635:
	.cfi_endproc
.LFE966:
	.size	apic_lvt_new.part.71, .-apic_lvt_new.part.71
.LCOLDE160:
.LHOTE160:
	.section	.rodata.str1.4
	.align 4
.LC161:
	.string	"((seL4_Fault.words[0] >> 0) & 0x7) == seL4_Fault_CapFault"
	.section	.text.unlikely
.LCOLDB162:
.LHOTB162:
	.type	seL4_Fault_CapFault_get_address.part.73, @function
seL4_Fault_CapFault_get_address.part.73:
.LFB968:
	.loc 11 1626 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1628 0
	pushl	$__FUNCTION__.2005
	.cfi_def_cfa_offset 20
	pushl	$1629
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC161
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL636:
	.cfi_endproc
.LFE968:
	.size	seL4_Fault_CapFault_get_address.part.73, .-seL4_Fault_CapFault_get_address.part.73
.LCOLDE162:
.LHOTE162:
.LCOLDB163:
.LHOTB163:
	.type	seL4_Fault_CapFault_get_inReceivePhase.isra.74.part.75, @function
seL4_Fault_CapFault_get_inReceivePhase.isra.74.part.75:
.LFB970:
	.loc 11 1640 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1642 0
	pushl	$__FUNCTION__.2010
	.cfi_def_cfa_offset 20
	pushl	$1643
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC161
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL637:
	.cfi_endproc
.LFE970:
	.size	seL4_Fault_CapFault_get_inReceivePhase.isra.74.part.75, .-seL4_Fault_CapFault_get_inReceivePhase.isra.74.part.75
.LCOLDE163:
.LHOTE163:
	.section	.rodata.str1.4
	.align 4
.LC164:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/object/tcb.c"
	.section	.rodata.str1.1
.LC165:
	.string	"Invalid syscall error"
	.section	.text.unlikely
.LCOLDB166:
	.text
.LHOTB166:
	.p2align 4,,15
	.globl	setMRs_syscall_error
	.type	setMRs_syscall_error, @function
setMRs_syscall_error:
.LFB834:
	.loc 31 1587 0
	.cfi_startproc
.LVL638:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	.loc 31 1588 0
	movl	current_syscall_error+24, %eax
	cmpl	$10, %eax
	ja	.L606
	jmp	*.L608(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L608:
	.long	.L606
	.long	.L607
	.long	.L609
	.long	.L617
	.long	.L611
	.long	.L617
	.long	.L612
	.long	.L617
	.long	.L617
	.long	.L617
	.long	.L613
	.text
	.p2align 4,,10
	.p2align 3
.L617:
	.loc 31 1598 0
	xorl	%eax, %eax
.L610:
	.loc 31 1625 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L611:
	.cfi_restore_state
.LVL639:
.LBB7025:
.LBB7026:
.LBB7027:
	.loc 15 30 0
	movl	16(%esp), %ebx
	movl	current_syscall_error+8, %eax
	movl	%eax, 532(%ebx)
.LVL640:
.LBE7027:
.LBE7026:
.LBE7025:
.LBB7028:
.LBB7029:
.LBB7030:
	movl	current_syscall_error+12, %eax
	movl	%eax, 536(%ebx)
.LVL641:
.LBE7030:
.LBE7029:
.LBE7028:
	.loc 31 1625 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 31 1603 0
	movl	$2, %eax
	.loc 31 1625 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L613:
	.cfi_restore_state
.LVL642:
.LBB7031:
.LBB7032:
.LBB7033:
	.loc 15 30 0
	movl	current_syscall_error+16, %eax
	movl	16(%esp), %esi
	movl	%eax, 532(%esi)
.LVL643:
.LBE7033:
.LBE7032:
.LBE7031:
	.loc 31 1625 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 31 1620 0
	movl	$1, %eax
	.loc 31 1625 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L612:
	.cfi_restore_state
.LVL644:
.LBB7034:
.LBB7035:
.LBB7036:
.LBB7037:
.LBB7038:
	.loc 15 30 0
	movl	current_syscall_error+20, %esi
	xorl	%eax, %eax
	movl	16(%esp), %ebx
	movl	current_lookup_fault, %edx
	testl	%esi, %esi
.LBE7038:
.LBE7037:
.LBE7036:
.LBB7041:
.LBB7042:
.LBB7043:
.LBB7044:
.LBB7045:
	movl	16(%esp), %esi
.LBE7045:
.LBE7044:
.LBE7043:
.LBE7042:
.LBE7041:
.LBB7085:
.LBB7040:
.LBB7039:
	setne	%al
	movl	%eax, 532(%ebx)
.LVL645:
.LBE7039:
.LBE7040:
.LBE7085:
.LBB7086:
.LBB7083:
.LBB7048:
.LBB7049:
	.loc 11 1142 0
	movl	%edx, %eax
	movl	current_lookup_fault+4, %ebx
.LVL646:
	andl	$3, %eax
.LVL647:
.LBE7049:
.LBE7048:
.LBB7050:
.LBB7047:
.LBB7046:
	.loc 15 30 0
	leal	1(%eax), %ecx
.LVL648:
	movl	%ecx, 536(%esi)
.LVL649:
.LBE7046:
.LBE7047:
.LBE7050:
	.file 47 "/home/axjllt/Desktop/ori_refos/kernel/src/api/faults.c"
	.loc 47 49 0
	cmpl	$2, %eax
	je	.L614
	cmpl	$3, %eax
	je	.L615
	cmpl	$1, %eax
	je	.L624
.LVL650:
.L621:
.LBB7051:
.LBB7052:
	.file 48 "/home/axjllt/Desktop/ori_refos/kernel/include/object/tcb.h"
	.loc 48 42 0
	movl	$2, %eax
	jmp	.L610
.LVL651:
	.p2align 4,,10
	.p2align 3
.L607:
.LBE7052:
.LBE7051:
.LBE7083:
.LBE7086:
.LBE7035:
.LBE7034:
.LBB7089:
.LBB7090:
.LBB7091:
	.loc 15 30 0
	movl	16(%esp), %ebx
	movl	current_syscall_error, %edx
	movl	%edx, 532(%ebx)
.LVL652:
.LBE7091:
.LBE7090:
.LBE7089:
	.loc 31 1625 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L609:
	.cfi_restore_state
.LVL653:
.LBB7092:
.LBB7093:
.LBB7094:
	.loc 15 30 0
	movl	current_syscall_error+4, %eax
	movl	16(%esp), %ecx
	movl	%eax, 532(%ecx)
.LVL654:
.LBE7094:
.LBE7093:
.LBE7092:
	.loc 31 1625 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 31 1594 0
	movl	$1, %eax
	.loc 31 1625 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L606:
	.cfi_restore_state
	.loc 31 1623 0
	pushl	$__func__.9609
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$1623
	.cfi_def_cfa_offset 24
	pushl	$.LC164
	.cfi_def_cfa_offset 28
	pushl	$.LC165
	.cfi_def_cfa_offset 32
	call	_fail
.LVL655:
	.p2align 4,,10
	.p2align 3
.L624:
	.cfi_restore_state
.LBB7095:
.LBB7088:
.LBB7087:
.LBB7084:
.LBB7054:
.LBB7053:
	.loc 48 38 0
	movl	20(%esp), %ebx
.LVL656:
	testl	%ebx, %ebx
	je	.L621
	.loc 48 39 0
	movl	20(%esp), %eax
	andl	$252, %edx
.LVL657:
	shrl	$2, %edx
	movl	%edx, 12(%eax)
	.loc 48 40 0
	movl	$3, %eax
	jmp	.L610
.LVL658:
	.p2align 4,,10
	.p2align 3
.L615:
.LBE7053:
.LBE7054:
.LBB7055:
.LBB7056:
	.loc 48 38 0
	movl	20(%esp), %eax
	testl	%eax, %eax
	je	.L621
	.loc 48 39 0
	movl	20(%esp), %esi
	movl	%edx, %eax
.LBE7056:
.LBE7055:
.LBB7059:
.LBB7060:
	andl	$252, %edx
.LVL659:
.LBE7060:
.LBE7059:
.LBB7064:
.LBB7057:
	andl	$16128, %eax
.LBE7057:
.LBE7064:
.LBB7065:
.LBB7061:
	shrl	$2, %edx
.LBE7061:
.LBE7065:
.LBB7066:
.LBB7058:
	shrl	$8, %eax
	movl	%eax, 12(%esi)
.LVL660:
.LBE7058:
.LBE7066:
.LBB7067:
.LBB7062:
	.loc 48 40 0
	movl	$5, %eax
.LBE7062:
.LBE7067:
.LBB7068:
.LBB7069:
	.loc 48 39 0
	movl	%ebx, 16(%esi)
.LVL661:
.LBE7069:
.LBE7068:
.LBB7070:
.LBB7063:
	movl	%edx, 20(%esi)
	jmp	.L610
.LVL662:
	.p2align 4,,10
	.p2align 3
.L614:
.LBE7063:
.LBE7070:
.LBB7071:
.LBB7072:
	.loc 48 38 0
	movl	20(%esp), %ecx
	testl	%ecx, %ecx
	je	.L621
	.loc 48 39 0
	movl	20(%esp), %esi
	movl	%edx, %eax
.LBE7072:
.LBE7071:
.LBB7075:
.LBB7076:
	andl	$16128, %edx
.LVL663:
.LBE7076:
.LBE7075:
.LBB7079:
.LBB7073:
	andl	$252, %eax
.LBE7073:
.LBE7079:
.LBB7080:
.LBB7077:
	shrl	$8, %edx
.LBE7077:
.LBE7080:
.LBB7081:
.LBB7074:
	shrl	$2, %eax
	movl	%eax, 12(%esi)
.LVL664:
.LBE7074:
.LBE7081:
.LBB7082:
.LBB7078:
	.loc 48 40 0
	movl	$4, %eax
	.loc 48 39 0
	movl	%edx, 16(%esi)
	jmp	.L610
.LBE7078:
.LBE7082:
.LBE7084:
.LBE7087:
.LBE7088:
.LBE7095:
	.cfi_endproc
.LFE834:
	.size	setMRs_syscall_error, .-setMRs_syscall_error
	.section	.text.unlikely
.LCOLDE166:
	.text
.LHOTE166:
	.section	.rodata.str1.4
	.align 4
.LC167:
	.string	"((seL4_Fault.words[0] >> 0) & 0x7) == seL4_Fault_UnknownSyscall"
	.section	.text.unlikely
.LCOLDB168:
.LHOTB168:
	.type	seL4_Fault_UnknownSyscall_get_syscallNumber.part.83, @function
seL4_Fault_UnknownSyscall_get_syscallNumber.part.83:
.LFB978:
	.loc 11 1669 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1671 0
	pushl	$__FUNCTION__.2020
	.cfi_def_cfa_offset 20
	pushl	$1672
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC167
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL665:
	.cfi_endproc
.LFE978:
	.size	seL4_Fault_UnknownSyscall_get_syscallNumber.part.83, .-seL4_Fault_UnknownSyscall_get_syscallNumber.part.83
.LCOLDE168:
.LHOTE168:
	.section	.rodata.str1.4
	.align 4
.LC169:
	.string	"((seL4_Fault.words[0] >> 0) & 0x7) == seL4_Fault_UserException"
	.section	.text.unlikely
.LCOLDB170:
.LHOTB170:
	.type	seL4_Fault_UserException_get_number.part.84, @function
seL4_Fault_UserException_get_number.part.84:
.LFB979:
	.loc 11 1700 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1702 0
	pushl	$__FUNCTION__.2031
	.cfi_def_cfa_offset 20
	pushl	$1703
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC169
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL666:
	.cfi_endproc
.LFE979:
	.size	seL4_Fault_UserException_get_number.part.84, .-seL4_Fault_UserException_get_number.part.84
.LCOLDE170:
.LHOTE170:
.LCOLDB171:
.LHOTB171:
	.type	seL4_Fault_UserException_get_code.isra.85.part.86, @function
seL4_Fault_UserException_get_code.isra.85.part.86:
.LFB981:
	.loc 11 1714 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1716 0
	pushl	$__FUNCTION__.2036
	.cfi_def_cfa_offset 20
	pushl	$1717
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC169
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL667:
	.cfi_endproc
.LFE981:
	.size	seL4_Fault_UserException_get_code.isra.85.part.86, .-seL4_Fault_UserException_get_code.isra.85.part.86
.LCOLDE171:
.LHOTE171:
	.section	.rodata.str1.4
	.align 4
.LC172:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/include/plat/pc99/plat/machine/interrupt.h"
	.align 4
.LC173:
	.string	"ARCH_NODE_STATE(x86KSPendingInterrupt) == int_invalid"
	.section	.text.unlikely
.LCOLDB174:
	.text
.LHOTB174:
	.p2align 4,,15
	.type	receivePendingIRQ.part.87, @function
receivePendingIRQ.part.87:
.LFB982:
	.file 49 "/home/axjllt/Desktop/ori_refos/kernel/include/plat/pc99/plat/machine/interrupt.h"
	.loc 49 39 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 49 41 0
	pushl	$__FUNCTION__.4660
	.cfi_def_cfa_offset 20
	pushl	$41
	.cfi_def_cfa_offset 24
	pushl	$.LC172
	.cfi_def_cfa_offset 28
	pushl	$.LC173
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL668:
	.cfi_endproc
.LFE982:
	.size	receivePendingIRQ.part.87, .-receivePendingIRQ.part.87
	.section	.text.unlikely
.LCOLDE174:
	.text
.LHOTE174:
	.section	.rodata.str1.4
	.align 4
.LC175:
	.string	"ARCH_NODE_STATE(x86KScurInterrupt) == int_invalid"
	.section	.text.unlikely
.LCOLDB176:
.LHOTB176:
	.type	servicePendingIRQ.part.88, @function
servicePendingIRQ.part.88:
.LFB983:
	.loc 49 49 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 49 51 0
	pushl	$__FUNCTION__.4664
	.cfi_def_cfa_offset 20
	pushl	$51
	.cfi_def_cfa_offset 24
	pushl	$.LC172
	.cfi_def_cfa_offset 28
	pushl	$.LC175
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL669:
	.cfi_endproc
.LFE983:
	.size	servicePendingIRQ.part.88, .-servicePendingIRQ.part.88
.LCOLDE176:
.LHOTE176:
	.section	.rodata.str1.4
	.align 4
.LC177:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_thread_cap"
	.section	.text.unlikely
.LCOLDB178:
.LHOTB178:
	.type	cap_thread_cap_get_capTCBPtr.isra.89.part.90, @function
cap_thread_cap_get_capTCBPtr.isra.89.part.90:
.LFB985:
	.loc 11 2766 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2768 0
	pushl	$__FUNCTION__.2453
	.cfi_def_cfa_offset 20
	pushl	$2769
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC177
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL670:
	.cfi_endproc
.LFE985:
	.size	cap_thread_cap_get_capTCBPtr.isra.89.part.90, .-cap_thread_cap_get_capTCBPtr.isra.89.part.90
.LCOLDE178:
.LHOTE178:
	.section	.rodata.str1.4
	.align 4
.LC179:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_reply_cap"
	.section	.text.unlikely
.LCOLDB180:
.LHOTB180:
	.type	cap_reply_cap_get_capReplyMaster.isra.92.part.93, @function
cap_reply_cap_get_capReplyMaster.isra.92.part.93:
.LFB988:
	.loc 11 2634 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2636 0
	pushl	$__FUNCTION__.2405
	.cfi_def_cfa_offset 20
	pushl	$2637
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC179
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL671:
	.cfi_endproc
.LFE988:
	.size	cap_reply_cap_get_capReplyMaster.isra.92.part.93, .-cap_reply_cap_get_capReplyMaster.isra.92.part.93
.LCOLDE180:
.LHOTE180:
.LCOLDB181:
	.text
.LHOTB181:
	.p2align 4,,15
	.type	cap_reply_cap_get_capTCBPtr.isra.94.part.95, @function
cap_reply_cap_get_capTCBPtr.isra.94.part.95:
.LFB990:
	.loc 11 2620 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2622 0
	pushl	$__FUNCTION__.2400
	.cfi_def_cfa_offset 20
	pushl	$2623
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC179
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL672:
	.cfi_endproc
.LFE990:
	.size	cap_reply_cap_get_capTCBPtr.isra.94.part.95, .-cap_reply_cap_get_capTCBPtr.isra.94.part.95
	.section	.text.unlikely
.LCOLDE181:
	.text
.LHOTE181:
	.section	.rodata.str1.4
	.align 4
.LC182:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_endpoint_cap"
	.section	.text.unlikely
.LCOLDB183:
	.text
.LHOTB183:
	.p2align 4,,15
	.type	cap_endpoint_cap_get_capCanReceive.part.96, @function
cap_endpoint_cap_get_capCanReceive.part.96:
.LFB991:
	.loc 11 2396 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2398 0
	pushl	$__FUNCTION__.2315
	.cfi_def_cfa_offset 20
	pushl	$2399
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC182
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL673:
	.cfi_endproc
.LFE991:
	.size	cap_endpoint_cap_get_capCanReceive.part.96, .-cap_endpoint_cap_get_capCanReceive.part.96
	.section	.text.unlikely
.LCOLDE183:
	.text
.LHOTE183:
	.section	.rodata.str1.4
	.align 4
.LC184:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_notification_cap"
	.section	.text.unlikely
.LCOLDB185:
.LHOTB185:
	.type	cap_notification_cap_get_capNtfnPtr.isra.97.part.98, @function
cap_notification_cap_get_capNtfnPtr.isra.97.part.98:
.LFB993:
	.loc 11 2574 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2576 0
	pushl	$__FUNCTION__.2383
	.cfi_def_cfa_offset 20
	pushl	$2577
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC184
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL674:
	.cfi_endproc
.LFE993:
	.size	cap_notification_cap_get_capNtfnPtr.isra.97.part.98, .-cap_notification_cap_get_capNtfnPtr.isra.97.part.98
.LCOLDE185:
.LHOTE185:
.LCOLDB186:
.LHOTB186:
	.type	cap_notification_cap_get_capNtfnCanReceive.part.99, @function
cap_notification_cap_get_capNtfnCanReceive.part.99:
.LFB994:
	.loc 11 2522 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2524 0
	pushl	$__FUNCTION__.2363
	.cfi_def_cfa_offset 20
	pushl	$2525
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC184
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL675:
	.cfi_endproc
.LFE994:
	.size	cap_notification_cap_get_capNtfnCanReceive.part.99, .-cap_notification_cap_get_capNtfnCanReceive.part.99
.LCOLDE186:
.LHOTE186:
	.section	.rodata.str1.4
	.align 4
.LC187:
	.string	"(bitsLeft & ~0x3fu) == ((0 && (bitsLeft & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB188:
.LHOTB188:
	.type	lookup_fault_missing_capability_new.part.100, @function
lookup_fault_missing_capability_new.part.100:
.LFB995:
	.loc 11 1160 0
	.cfi_startproc
.LVL676:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1164 0
	pushl	$__FUNCTION__.1811
	.cfi_def_cfa_offset 20
	pushl	$1164
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC187
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL677:
	.cfi_endproc
.LFE995:
	.size	lookup_fault_missing_capability_new.part.100, .-lookup_fault_missing_capability_new.part.100
.LCOLDE188:
.LHOTE188:
	.section	.rodata.str1.4
	.align 4
.LC189:
	.string	"((gdt_entry_ptr->words[1] >> 10) & 0x7) == gdt_entry_gdt_data"
	.section	.text.unlikely
.LCOLDB190:
.LHOTB190:
	.type	gdt_entry_gdt_data_ptr_set_base_low.part.101, @function
gdt_entry_gdt_data_ptr_set_base_low.part.101:
.LFB996:
	.loc 11 1520 0
	.cfi_startproc
.LVL678:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1522 0
	pushl	$__FUNCTION__.1957
	.cfi_def_cfa_offset 20
	pushl	$1523
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC189
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL679:
	.cfi_endproc
.LFE996:
	.size	gdt_entry_gdt_data_ptr_set_base_low.part.101, .-gdt_entry_gdt_data_ptr_set_base_low.part.101
.LCOLDE190:
.LHOTE190:
	.section	.rodata.str1.4
	.align 4
.LC191:
	.string	"(((~0xffu >> 0) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB192:
	.text
.LHOTB192:
	.p2align 4,,15
	.type	gdt_entry_gdt_data_ptr_set_base_mid.isra.102, @function
gdt_entry_gdt_data_ptr_set_base_mid.isra.102:
.LFB997:
	.loc 11 1507 0
	.cfi_startproc
.LVL680:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1509 0
	movl	(%eax), %ecx
	movl	%ecx, %ebx
	shrl	$10, %ebx
	andl	$7, %ebx
	cmpl	$4, %ebx
	jne	.L655
	.loc 11 1513 0
	testl	$-256, %edx
	jne	.L656
	.loc 11 1516 0
	xorb	%cl, %cl
	orl	%edx, %ecx
	movl	%ecx, (%eax)
	.loc 11 1517 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.L655:
	.cfi_restore_state
.LVL681:
.LBB7098:
.LBB7099:
	.loc 11 1509 0
	pushl	$__FUNCTION__.1952
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$1510
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC189
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL682:
.L656:
	.cfi_restore_state
.LBE7099:
.LBE7098:
	.loc 11 1513 0
	pushl	$__FUNCTION__.1952
	.cfi_def_cfa_offset 20
	pushl	$1513
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC191
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL683:
	.cfi_endproc
.LFE997:
	.size	gdt_entry_gdt_data_ptr_set_base_mid.isra.102, .-gdt_entry_gdt_data_ptr_set_base_mid.isra.102
	.section	.text.unlikely
.LCOLDE192:
	.text
.LHOTE192:
	.section	.text.unlikely
.LCOLDB193:
.LHOTB193:
	.type	gdt_entry_gdt_data_ptr_set_base_high.isra.104.part.105, @function
gdt_entry_gdt_data_ptr_set_base_high.isra.104.part.105:
.LFB1000:
	.loc 11 1494 0
	.cfi_startproc
.LVL684:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1496 0
	pushl	$__FUNCTION__.1947
	.cfi_def_cfa_offset 20
	pushl	$1497
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC189
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL685:
	.cfi_endproc
.LFE1000:
	.size	gdt_entry_gdt_data_ptr_set_base_high.isra.104.part.105, .-gdt_entry_gdt_data_ptr_set_base_high.isra.104.part.105
.LCOLDE193:
.LHOTE193:
.LCOLDB194:
	.text
.LHOTB194:
	.p2align 4,,15
	.type	x86_write_gs_base.isra.53, @function
x86_write_gs_base.isra.53:
.LFB948:
	.loc 10 269 0
	.cfi_startproc
.LVL686:
	.loc 10 271 0
	cmpl	%eax, x86KSCurrentGSBase
	je	.L665
	.loc 10 269 0
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	%eax, %ebx
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 10 272 0
	movl	%eax, x86KSCurrentGSBase
.LVL687:
.LBB7106:
.LBB7107:
.LBB7108:
.LBB7109:
	.loc 11 1522 0
	movl	x86KSgdt+52, %eax
.LVL688:
	shrl	$10, %eax
	andl	$7, %eax
	cmpl	$4, %eax
	jne	.L666
.LBE7109:
.LBE7108:
	.file 50 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine.h"
	.loc 50 133 0
	movl	%ebx, %edx
	movl	$x86KSgdt+52, %eax
.LBB7112:
.LBB7110:
	.loc 11 1529 0
	movw	%bx, x86KSgdt+50
.LVL689:
.LBE7110:
.LBE7112:
	.loc 50 134 0
	shrl	$24, %ebx
.LVL690:
	.loc 50 133 0
	shrl	$16, %edx
.LVL691:
	movzbl	%dl, %edx
	call	gdt_entry_gdt_data_ptr_set_base_mid.isra.102
.LVL692:
.LBB7113:
.LBB7114:
	.loc 11 1496 0
	movl	x86KSgdt+52, %eax
	movl	%eax, %edx
	shrl	$10, %edx
	andl	$7, %edx
	cmpl	$4, %edx
	jne	.L667
	.loc 11 1503 0
	andl	$16777215, %eax
	sall	$24, %ebx
	orl	%eax, %ebx
	movl	%ebx, x86KSgdt+52
.LBE7114:
.LBE7113:
.LBE7107:
.LBE7106:
	.loc 10 275 0
	addl	$8, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL693:
.L665:
	ret
.LVL694:
.L666:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -8
.LBB7119:
.LBB7118:
.LBB7116:
.LBB7111:
	call	gdt_entry_gdt_data_ptr_set_base_low.part.101
.LVL695:
.L667:
.LBE7111:
.LBE7116:
.LBB7117:
.LBB7115:
	call	gdt_entry_gdt_data_ptr_set_base_high.isra.104.part.105
.LVL696:
.LBE7115:
.LBE7117:
.LBE7118:
.LBE7119:
	.cfi_endproc
.LFE948:
	.size	x86_write_gs_base.isra.53, .-x86_write_gs_base.isra.53
	.section	.text.unlikely
.LCOLDE194:
	.text
.LHOTE194:
	.section	.text.unlikely
.LCOLDB195:
	.text
.LHOTB195:
	.p2align 4,,15
	.type	x86_write_fs_base.isra.37.part.38, @function
x86_write_fs_base.isra.37.part.38:
.LFB933:
	.loc 10 261 0
	.cfi_startproc
.LVL697:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	%eax, %ebx
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 10 264 0
	movl	%eax, x86KSCurrentFSBase
.LVL698:
.LBB7126:
.LBB7127:
.LBB7128:
.LBB7129:
	.loc 11 1522 0
	movl	x86KSgdt+60, %eax
.LVL699:
	shrl	$10, %eax
	andl	$7, %eax
	cmpl	$4, %eax
	jne	.L672
.LBE7129:
.LBE7128:
	.loc 50 126 0
	movl	%ebx, %edx
	movl	$x86KSgdt+60, %eax
.LBB7132:
.LBB7130:
	.loc 11 1529 0
	movw	%bx, x86KSgdt+58
.LVL700:
.LBE7130:
.LBE7132:
	.loc 50 127 0
	shrl	$24, %ebx
.LVL701:
	.loc 50 126 0
	shrl	$16, %edx
.LVL702:
	movzbl	%dl, %edx
	call	gdt_entry_gdt_data_ptr_set_base_mid.isra.102
.LVL703:
.LBB7133:
.LBB7134:
	.loc 11 1496 0
	movl	x86KSgdt+60, %eax
	movl	%eax, %edx
	shrl	$10, %edx
	andl	$7, %edx
	cmpl	$4, %edx
	jne	.L673
	.loc 11 1503 0
	andl	$16777215, %eax
	sall	$24, %ebx
	orl	%eax, %ebx
	movl	%ebx, x86KSgdt+60
.LBE7134:
.LBE7133:
.LBE7127:
.LBE7126:
	.loc 10 267 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL704:
.L672:
	.cfi_restore_state
.LBB7139:
.LBB7138:
.LBB7136:
.LBB7131:
	call	gdt_entry_gdt_data_ptr_set_base_low.part.101
.LVL705:
.L673:
.LBE7131:
.LBE7136:
.LBB7137:
.LBB7135:
	call	gdt_entry_gdt_data_ptr_set_base_high.isra.104.part.105
.LVL706:
.LBE7135:
.LBE7137:
.LBE7138:
.LBE7139:
	.cfi_endproc
.LFE933:
	.size	x86_write_fs_base.isra.37.part.38, .-x86_write_fs_base.isra.37.part.38
	.section	.text.unlikely
.LCOLDE195:
	.text
.LHOTE195:
	.section	.text.unlikely
.LCOLDB196:
	.text
.LHOTB196:
	.p2align 4,,15
	.globl	restore_user_context
	.type	restore_user_context, @function
restore_user_context:
.LFB428:
	.file 51 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/32/c_traps.c"
	.loc 51 111 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 51 118 0
	movl	x86KSPendingInterrupt, %eax
	cmpl	$-1, %eax
	je	.L675
.LBB7175:
.LBB7176:
.LBB7177:
	.loc 49 51 0
	cmpl	$-1, x86KScurInterrupt
	jne	.L688
.LVL707:
	.loc 49 54 0
	movl	$-1, x86KSPendingInterrupt
.LBE7177:
.LBE7176:
	.loc 51 122 0
	xorl	%edx, %edx
#APP
# 122 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/32/c_traps.c" 1
	and $-4096, %esp
add $4096, %esp
push %edx 
push %eax
call c_handle_interrupt
# 0 "" 2
.LVL708:
#NO_APP
.L675:
.LBE7175:
	.loc 51 143 0
	movl	ksCurThread, %edx
.LVL709:
.LBB7180:
.LBB7181:
	.file 52 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/stack.h"
	.loc 52 45 0
	leal	588(%edx), %eax
.LVL710:
	movl	%eax, x86KStss+4
.LVL711:
.LBE7181:
.LBE7180:
.LBB7182:
.LBB7183:
	.file 53 "/home/axjllt/Desktop/ori_refos/kernel/include/machine/fpu.h"
	.loc 53 43 0
	movl	ksActiveFPUState, %eax
	testl	%eax, %eax
	jne	.L689
.L677:
.LVL712:
.LBE7183:
.LBE7182:
	.loc 51 151 0
	movl	560(%edx), %eax
	call	x86_write_gs_base.isra.53
.LVL713:
	.loc 51 153 0
	movl	ksCurThread, %edx
	movl	640(%edx), %eax
.LVL714:
.LBB7206:
.LBB7207:
	.loc 10 263 0
	cmpl	x86KSCurrentFSBase, %eax
	je	.L681
	call	x86_write_fs_base.isra.37.part.38
.LVL715:
	movl	ksCurThread, %edx
.L681:
.LBE7207:
.LBE7206:
	.loc 51 157 0
	cmpl	$-1, 564(%edx)
	jne	.L682
	.loc 51 158 0
	andl	$-513, 576(%edx)
	.loc 51 159 0
	addl	$512, %edx
#APP
# 159 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/32/c_traps.c" 1
	movl %edx, %esp
popl %eax
popl %ebx
addl $8, %esp
popl %esi
popl %edi
popl %ebp
cmpl $0x23, (%esp)
je 1f
popl %ds
jmp 2f
1: addl $4, %esp
2:
cmpl $0x23, (%esp)
je 1f
popl %es
jmp 2f
1: addl $4, %esp
2:
popl %fs
popl %gs
addl $12, %esp
popl %edx
addl $4,  %esp
movl 4(%esp), %ecx
popfl
orl $512, -4(%esp)
sti
sysexit

# 0 "" 2
.LVL716:
#NO_APP
.L689:
.LBB7208:
.LBB7204:
	.loc 53 47 0
	cmpl	$64, ksFPURestoresSinceSwitch
	ja	.L690
	.loc 53 51 0
	cmpl	%edx, %eax
	jne	.L679
.LBB7184:
.LBB7185:
	.loc 24 108 0
#APP
# 108 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h" 1
	clts
# 0 "" 2
#NO_APP
.L680:
.LBE7185:
.LBE7184:
	.loc 53 58 0
	addl	$1, ksFPURestoresSinceSwitch
	jmp	.L677
.LVL717:
.L682:
.LBE7204:
.LBE7208:
	.loc 51 217 0
	addl	$512, %edx
#APP
# 217 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/32/c_traps.c" 1
	movl %edx, %esp
popl %eax
popl %ebx
popl %ecx
popl %edx
popl %esi
popl %edi
popl %ebp
popl %ds
popl %es
popl %fs
popl %gs
addl $12, %esp
iret

# 0 "" 2
.LVL718:
#NO_APP
.L690:
.LBB7209:
.LBB7205:
.LBB7186:
.LBB7187:
.LBB7188:
.LBB7189:
	.loc 24 108 0
#APP
# 108 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h" 1
	clts
# 0 "" 2
.LVL719:
#NO_APP
.LBE7189:
.LBE7188:
.LBB7190:
.LBB7191:
	.loc 24 70 0
#APP
# 70 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h" 1
	fxsave (%eax)
# 0 "" 2
#NO_APP
.LBE7191:
.LBE7190:
.LBB7192:
.LBB7193:
.LBB7194:
.LBB7195:
	.loc 7 29 0
#APP
# 29 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h" 1
	movl %cr0, %eax
# 0 "" 2
.LVL720:
#NO_APP
.LBE7195:
.LBE7194:
.LBB7196:
.LBB7197:
	.loc 7 35 0
	orl	$8, %eax
.LVL721:
#APP
# 35 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h" 1
	movl %eax, %cr0
# 0 "" 2
.LVL722:
#NO_APP
.LBE7197:
.LBE7196:
.LBE7193:
.LBE7192:
	.loc 6 33 0
	movl	$0, ksActiveFPUState
.LVL723:
.LBE7187:
.LBE7186:
	.loc 53 49 0
	movl	$0, ksFPURestoresSinceSwitch
	jmp	.L677
.L679:
.LBB7198:
.LBB7199:
.LBB7200:
.LBB7201:
	.loc 7 29 0
#APP
# 29 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h" 1
	movl %cr0, %eax
# 0 "" 2
.LVL724:
#NO_APP
.LBE7201:
.LBE7200:
.LBB7202:
.LBB7203:
	.loc 7 35 0
	orl	$8, %eax
.LVL725:
#APP
# 35 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h" 1
	movl %eax, %cr0
# 0 "" 2
.LVL726:
#NO_APP
	jmp	.L680
.LVL727:
.L688:
.LBE7203:
.LBE7202:
.LBE7199:
.LBE7198:
.LBE7205:
.LBE7209:
.LBB7210:
.LBB7179:
.LBB7178:
	call	servicePendingIRQ.part.88
.LVL728:
.LBE7178:
.LBE7179:
.LBE7210:
	.cfi_endproc
.LFE428:
	.size	restore_user_context, .-restore_user_context
	.section	.text.unlikely
.LCOLDE196:
	.text
.LHOTE196:
	.section	.rodata.str1.4
	.align 4
.LC197:
	.string	"(base_high & ~0xffu) == ((0 && (base_high & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB198:
.LHOTB198:
	.type	gdt_entry_gdt_code_new.part.106, @function
gdt_entry_gdt_code_new.part.106:
.LFB1001:
	.loc 11 1533 0
	.cfi_startproc
.LVL729:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1537 0
	pushl	$__FUNCTION__.1973
	.cfi_def_cfa_offset 20
	pushl	$1537
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC197
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL730:
	.cfi_endproc
.LFE1001:
	.size	gdt_entry_gdt_code_new.part.106, .-gdt_entry_gdt_code_new.part.106
.LCOLDE198:
.LHOTE198:
.LCOLDB199:
.LHOTB199:
	.type	gdt_entry_gdt_data_new.part.107, @function
gdt_entry_gdt_data_new.part.107:
.LFB1002:
	.loc 11 1456 0
	.cfi_startproc
.LVL731:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1460 0
	pushl	$__FUNCTION__.1942
	.cfi_def_cfa_offset 20
	pushl	$1460
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC197
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL732:
	.cfi_endproc
.LFE1002:
	.size	gdt_entry_gdt_data_new.part.107, .-gdt_entry_gdt_data_new.part.107
.LCOLDE199:
.LHOTE199:
	.section	.rodata.str1.4
	.align 4
.LC200:
	.string	"(page_base_address & ~0xffe00000u) == ((0 && (page_base_address & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB201:
.LHOTB201:
	.type	pde_pde_large_new.part.108, @function
pde_pde_large_new.part.108:
.LFB1003:
	.loc 11 2040 0
	.cfi_startproc
.LVL733:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2044 0
	pushl	$__FUNCTION__.2177
	.cfi_def_cfa_offset 20
	pushl	$2044
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC200
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL734:
	.cfi_endproc
.LFE1003:
	.size	pde_pde_large_new.part.108, .-pde_pde_large_new.part.108
.LCOLDE201:
.LHOTE201:
	.section	.rodata.str1.4
	.align 4
.LC202:
	.string	"(pt_base_address & ~0xfffff000u) == ((0 && (pt_base_address & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB203:
.LHOTB203:
	.type	pde_pde_pt_new.part.111, @function
pde_pde_pt_new.part.111:
.LFB1006:
	.loc 11 1941 0
	.cfi_startproc
.LVL735:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1945 0
	pushl	$__FUNCTION__.2137
	.cfi_def_cfa_offset 20
	pushl	$1945
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC202
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL736:
	.cfi_endproc
.LFE1006:
	.size	pde_pde_pt_new.part.111, .-pde_pde_pt_new.part.111
.LCOLDE203:
.LHOTE203:
	.section	.rodata.str1.4
	.align 4
.LC204:
	.string	"(page_base_address & ~0xfffff000u) == ((0 && (page_base_address & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB205:
.LHOTB205:
	.type	pte_new.part.112, @function
pte_new.part.112:
.LFB1007:
	.loc 11 41 0
	.cfi_startproc
.LVL737:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 45 0
	pushl	$__FUNCTION__.1316
	.cfi_def_cfa_offset 20
	pushl	$45
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC204
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL738:
	.cfi_endproc
.LFE1007:
	.size	pte_new.part.112, .-pte_new.part.112
.LCOLDE205:
.LHOTE205:
	.section	.rodata.str1.4
	.align 4
.LC206:
	.string	"(capPDIsMapped & ~0x1u) == ((0 && (capPDIsMapped & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB207:
.LHOTB207:
	.type	cap_page_directory_cap_new.part.113, @function
cap_page_directory_cap_new.part.113:
.LFB1008:
	.loc 11 3135 0
	.cfi_startproc
.LVL739:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 3139 0
	pushl	$__FUNCTION__.2596
	.cfi_def_cfa_offset 20
	pushl	$3139
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC206
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL740:
	.cfi_endproc
.LFE1008:
	.size	cap_page_directory_cap_new.part.113, .-cap_page_directory_cap_new.part.113
.LCOLDE207:
.LHOTE207:
	.section	.rodata.str1.4
	.align 4
.LC208:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_untyped_cap"
	.section	.text.unlikely
.LCOLDB209:
.LHOTB209:
	.type	cap_untyped_cap_get_capPtr.isra.115.part.116, @function
cap_untyped_cap_get_capPtr.isra.115.part.116:
.LFB1011:
	.loc 11 2318 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2320 0
	pushl	$__FUNCTION__.2286
	.cfi_def_cfa_offset 20
	pushl	$2321
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC208
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL741:
	.cfi_endproc
.LFE1011:
	.size	cap_untyped_cap_get_capPtr.isra.115.part.116, .-cap_untyped_cap_get_capPtr.isra.115.part.116
.LCOLDE209:
.LHOTE209:
.LCOLDB210:
	.text
.LHOTB210:
	.p2align 4,,15
	.type	cap_endpoint_cap_get_capEPPtr.part.117, @function
cap_endpoint_cap_get_capEPPtr.part.117:
.LFB1012:
	.loc 11 2356 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2358 0
	pushl	$__FUNCTION__.2300
	.cfi_def_cfa_offset 20
	pushl	$2359
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC182
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL742:
	.cfi_endproc
.LFE1012:
	.size	cap_endpoint_cap_get_capEPPtr.part.117, .-cap_endpoint_cap_get_capEPPtr.part.117
	.section	.text.unlikely
.LCOLDE210:
	.text
.LHOTE210:
	.section	.rodata.str1.4
	.align 4
.LC211:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_cnode_cap"
	.section	.text.unlikely
.LCOLDB212:
	.text
.LHOTB212:
	.p2align 4,,15
	.type	cap_cnode_cap_get_capCNodePtr.isra.118.part.119, @function
cap_cnode_cap_get_capCNodePtr.isra.118.part.119:
.LFB1014:
	.loc 11 2736 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2738 0
	pushl	$__FUNCTION__.2443
	.cfi_def_cfa_offset 20
	pushl	$2739
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC211
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL743:
	.cfi_endproc
.LFE1014:
	.size	cap_cnode_cap_get_capCNodePtr.isra.118.part.119, .-cap_cnode_cap_get_capCNodePtr.isra.118.part.119
	.section	.text.unlikely
.LCOLDE212:
	.text
.LHOTE212:
	.section	.rodata.str1.4
	.align 4
.LC213:
	.string	"((cap.words[0] >> 0) & 0xff) == cap_zombie_cap"
	.section	.text.unlikely
.LCOLDB214:
.LHOTB214:
	.type	cap_zombie_cap_get_capZombieType.isra.120.part.121, @function
cap_zombie_cap_get_capZombieType.isra.120.part.121:
.LFB1016:
	.loc 11 3432 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 3434 0
	pushl	$__FUNCTION__.2699
	.cfi_def_cfa_offset 20
	pushl	$3435
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC213
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL744:
	.cfi_endproc
.LFE1016:
	.size	cap_zombie_cap_get_capZombieType.isra.120.part.121, .-cap_zombie_cap_get_capZombieType.isra.120.part.121
.LCOLDE214:
.LHOTE214:
.LCOLDB215:
.LHOTB215:
	.type	cap_zombie_cap_get_capZombieID.part.123, @function
cap_zombie_cap_get_capZombieID.part.123:
.LFB1018:
	.loc 11 3406 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 3408 0
	pushl	$__FUNCTION__.2689
	.cfi_def_cfa_offset 20
	pushl	$3409
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC213
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL745:
	.cfi_endproc
.LFE1018:
	.size	cap_zombie_cap_get_capZombieID.part.123, .-cap_zombie_cap_get_capZombieID.part.123
.LCOLDE215:
.LHOTE215:
	.section	.rodata.str1.4
	.align 4
.LC216:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_frame_cap"
	.section	.text.unlikely
.LCOLDB217:
.LHOTB217:
	.type	cap_frame_cap_get_capFBasePtr.isra.125.part.126, @function
cap_frame_cap_get_capFBasePtr.isra.125.part.126:
.LFB1021:
	.loc 11 2994 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2996 0
	pushl	$__FUNCTION__.2540
	.cfi_def_cfa_offset 20
	pushl	$2997
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC216
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL746:
	.cfi_endproc
.LFE1021:
	.size	cap_frame_cap_get_capFBasePtr.isra.125.part.126, .-cap_frame_cap_get_capFBasePtr.isra.125.part.126
.LCOLDE217:
.LHOTE217:
	.section	.rodata.str1.4
	.align 4
.LC218:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_page_table_cap"
	.section	.text.unlikely
.LCOLDB219:
.LHOTB219:
	.type	cap_page_table_cap_get_capPTBasePtr.isra.127.part.128, @function
cap_page_table_cap_get_capPTBasePtr.isra.127.part.128:
.LFB1023:
	.loc 11 3121 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 3123 0
	pushl	$__FUNCTION__.2588
	.cfi_def_cfa_offset 20
	pushl	$3124
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC218
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL747:
	.cfi_endproc
.LFE1023:
	.size	cap_page_table_cap_get_capPTBasePtr.isra.127.part.128, .-cap_page_table_cap_get_capPTBasePtr.isra.127.part.128
.LCOLDE219:
.LHOTE219:
	.section	.rodata.str1.4
	.align 4
.LC220:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_page_directory_cap"
	.section	.text.unlikely
.LCOLDB221:
	.text
.LHOTB221:
	.p2align 4,,15
	.type	cap_page_directory_cap_get_capPDBasePtr.isra.129.part.130, @function
cap_page_directory_cap_get_capPDBasePtr.isra.129.part.130:
.LFB1025:
	.loc 11 3225 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 3227 0
	pushl	$__FUNCTION__.2626
	.cfi_def_cfa_offset 20
	pushl	$3228
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC220
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL748:
	.cfi_endproc
.LFE1025:
	.size	cap_page_directory_cap_get_capPDBasePtr.isra.129.part.130, .-cap_page_directory_cap_get_capPDBasePtr.isra.129.part.130
	.section	.text.unlikely
.LCOLDE221:
	.text
.LHOTE221:
	.section	.rodata.str1.4
	.align 4
.LC222:
	.string	"((cap.words[0] >> 0) & 0xff) == cap_io_page_table_cap"
	.section	.text.unlikely
.LCOLDB223:
.LHOTB223:
	.type	cap_io_page_table_cap_get_capIOPTBasePtr.isra.132.part.133, @function
cap_io_page_table_cap_get_capIOPTBasePtr.isra.132.part.133:
.LFB1028:
	.loc 11 3588 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 3590 0
	pushl	$__FUNCTION__.2758
	.cfi_def_cfa_offset 20
	pushl	$3591
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC222
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL749:
	.cfi_endproc
.LFE1028:
	.size	cap_io_page_table_cap_get_capIOPTBasePtr.isra.132.part.133, .-cap_io_page_table_cap_get_capIOPTBasePtr.isra.132.part.133
.LCOLDE223:
.LHOTE223:
	.section	.rodata.str1.4
	.align 4
.LC224:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_asid_pool_cap"
	.section	.text.unlikely
.LCOLDB225:
.LHOTB225:
	.type	cap_asid_pool_cap_get_capASIDPool.isra.134.part.135, @function
cap_asid_pool_cap_get_capASIDPool.isra.134.part.135:
.LFB1030:
	.loc 11 3285 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 3287 0
	pushl	$__FUNCTION__.2647
	.cfi_def_cfa_offset 20
	pushl	$3288
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC224
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL750:
	.cfi_endproc
.LFE1030:
	.size	cap_asid_pool_cap_get_capASIDPool.isra.134.part.135, .-cap_asid_pool_cap_get_capASIDPool.isra.134.part.135
.LCOLDE225:
.LHOTE225:
	.section	.rodata.str1.1
.LC226:
	.string	"Invalid mode cap type"
	.section	.text.unlikely
.LCOLDB227:
	.text
.LHOTB227:
	.p2align 4,,15
	.type	cap_get_capPtr, @function
cap_get_capPtr:
.LFB299:
	.file 54 "/home/axjllt/Desktop/ori_refos/kernel/include/object/structures.h"
	.loc 54 382 0
	.cfi_startproc
.LVL751:
.LBB7259:
.LBB7260:
	.loc 11 2202 0
	movl	%eax, %ecx
.LBE7260:
.LBE7259:
	.loc 54 382 0
	subl	$12, %esp
	.cfi_def_cfa_offset 16
.LBB7263:
.LBB7261:
	.loc 11 2202 0
	andl	$14, %ecx
	cmpl	$14, %ecx
	je	.L724
	.loc 11 2203 0
	movl	%eax, %ecx
	andl	$15, %ecx
.LVL752:
.LBE7261:
.LBE7263:
	.loc 54 387 0
	cmpl	$14, %ecx
	ja	.L725
	jmp	*.L727(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L727:
	.long	.L725
	.long	.L725
	.long	.L769
	.long	.L725
	.long	.L728
	.long	.L725
	.long	.L769
	.long	.L725
	.long	.L760
	.long	.L725
	.long	.L731
	.long	.L725
	.long	.L732
	.long	.L725
	.long	.L760
	.text
	.p2align 4,,10
	.p2align 3
.L728:
.LVL753:
	.loc 54 392 0
	movl	%edx, %eax
.LVL754:
.L769:
	andl	$-16, %eax
.LVL755:
.L766:
	.loc 54 421 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL756:
	.p2align 4,,10
	.p2align 3
.L724:
	.cfi_restore_state
.LBB7264:
.LBB7262:
	.loc 11 2204 0
	movzbl	%al, %ecx
.LVL757:
.LBE7262:
.LBE7264:
	.loc 54 387 0
	cmpl	$62, %ecx
	ja	.L725
	jmp	*.L734(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L734:
	.long	.L725
	.long	.L725
	.long	.L733
	.long	.L725
	.long	.L735
	.long	.L725
	.long	.L736
	.long	.L725
	.long	.L760
	.long	.L725
	.long	.L737
	.long	.L725
	.long	.L738
	.long	.L725
	.long	.L760
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L760
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L739
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L725
	.long	.L760
	.text
	.p2align 4,,10
	.p2align 3
.L760:
.LBB7265:
.LBB7266:
	.file 55 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/object/structures.h"
	.loc 55 280 0
	xorl	%eax, %eax
.LVL758:
.LBE7266:
.LBE7265:
	.loc 54 421 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL759:
	.p2align 4,,10
	.p2align 3
.L732:
	.cfi_restore_state
	.loc 54 401 0
	andl	$-1024, %eax
.LVL760:
	.loc 54 421 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL761:
	.p2align 4,,10
	.p2align 3
.L731:
	.cfi_restore_state
	.loc 54 398 0
	andl	$-32, %eax
.LVL762:
	.loc 54 421 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL763:
	.p2align 4,,10
	.p2align 3
.L725:
	.cfi_restore_state
.LBB7285:
.LBB7283:
	.loc 55 268 0
	cmpl	$31, %ecx
	ja	.L744
	jmp	*.L746(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L746:
	.long	.L744
	.long	.L745
	.long	.L744
	.long	.L747
	.long	.L744
	.long	.L748
	.long	.L744
	.long	.L744
	.long	.L744
	.long	.L760
	.long	.L744
	.long	.L749
	.long	.L744
	.long	.L760
	.long	.L744
	.long	.L750
	.long	.L744
	.long	.L744
	.long	.L744
	.long	.L744
	.long	.L744
	.long	.L744
	.long	.L744
	.long	.L744
	.long	.L744
	.long	.L744
	.long	.L744
	.long	.L744
	.long	.L744
	.long	.L744
	.long	.L744
	.long	.L760
	.text
	.p2align 4,,10
	.p2align 3
.L739:
.LVL764:
.LBE7283:
.LBE7285:
.LBB7286:
.LBB7287:
.LBB7288:
.LBB7289:
.LBB7290:
.LBB7291:
	.loc 11 3437 0
	andl	$16128, %eax
.LVL765:
	movl	%eax, %ecx
.LBE7291:
.LBE7290:
	.loc 54 103 0
	movl	$-32, %eax
.LBB7293:
.LBB7292:
	.loc 11 3437 0
	shrl	$8, %ecx
.LBE7292:
.LBE7293:
	.loc 54 103 0
	cmpl	$32, %ecx
	je	.L756
	andl	$31, %ecx
	movl	$-1, %eax
	addl	$1, %ecx
	sall	%cl, %eax
.L756:
.LVL766:
.LBE7289:
.LBE7288:
.LBE7287:
.LBE7286:
	.loc 54 404 0
	andl	%edx, %eax
	.loc 54 421 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL767:
	.p2align 4,,10
	.p2align 3
.L738:
	.cfi_restore_state
.LBB7294:
.LBB7295:
	.loc 11 2768 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$12, %edx
	je	.L732
	call	cap_thread_cap_get_capTCBPtr.isra.89.part.90
.LVL768:
	.p2align 4,,10
	.p2align 3
.L733:
.LBE7295:
.LBE7294:
.LBB7296:
.LBB7297:
	.loc 11 2320 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$2, %edx
	je	.L769
	call	cap_untyped_cap_get_capPtr.isra.115.part.116
.LVL769:
	.p2align 4,,10
	.p2align 3
.L735:
.LBE7297:
.LBE7296:
.LBB7298:
.LBB7299:
	.loc 11 2358 0
	andl	$15, %eax
.LVL770:
	cmpl	$4, %eax
	je	.L728
	call	cap_endpoint_cap_get_capEPPtr.part.117
.LVL771:
	.p2align 4,,10
	.p2align 3
.L736:
.LBE7299:
.LBE7298:
.LBB7300:
.LBB7301:
	.loc 11 2576 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$6, %edx
	je	.L769
	call	cap_notification_cap_get_capNtfnPtr.isra.97.part.98
.LVL772:
	.p2align 4,,10
	.p2align 3
.L737:
.LBE7301:
.LBE7300:
.LBB7302:
.LBB7303:
	.loc 11 2738 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$10, %edx
	je	.L731
	call	cap_cnode_cap_get_capCNodePtr.isra.118.part.119
.LVL773:
	.p2align 4,,10
	.p2align 3
.L749:
.LBE7303:
.LBE7302:
.LBB7304:
.LBB7284:
.LBB7267:
.LBB7268:
	.loc 11 3287 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$11, %edx
	jne	.L774
.LVL774:
.L755:
.LBE7268:
.LBE7267:
	.loc 55 294 0
	andl	$16777200, %eax
.LVL775:
	sall	$8, %eax
	jmp	.L766
.LVL776:
	.p2align 4,,10
	.p2align 3
.L750:
.LBB7270:
.LBB7271:
	.loc 11 3590 0
	cmpb	$15, %al
	jne	.L775
.LVL777:
.LBE7271:
.LBE7270:
	.loc 55 287 0
	andl	$268435200, %eax
.LVL778:
	sall	$4, %eax
	jmp	.L766
.LVL779:
	.p2align 4,,10
	.p2align 3
.L748:
.LBB7273:
.LBB7274:
	.loc 11 3227 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$5, %edx
	je	.L755
	call	cap_page_directory_cap_get_capPDBasePtr.isra.129.part.130
.LVL780:
	.p2align 4,,10
	.p2align 3
.L745:
.LBE7274:
.LBE7273:
.LBB7275:
.LBB7276:
	.loc 11 2996 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$1, %edx
	je	.L755
	call	cap_frame_cap_get_capFBasePtr.isra.125.part.126
.LVL781:
	.p2align 4,,10
	.p2align 3
.L747:
.LBE7276:
.LBE7275:
.LBB7277:
.LBB7278:
	.loc 11 3123 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$3, %edx
	je	.L755
	call	cap_page_table_cap_get_capPTBasePtr.isra.127.part.128
.LVL782:
	.p2align 4,,10
	.p2align 3
.L744:
.LBE7278:
.LBE7277:
.LBB7279:
.LBB7280:
	.loc 46 134 0
	pushl	$__func__.3040
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$134
	.cfi_def_cfa_offset 24
	pushl	$.LC145
	.cfi_def_cfa_offset 28
	pushl	$.LC226
	.cfi_def_cfa_offset 32
	call	_fail
.LVL783:
.L775:
	.cfi_restore_state
.LBE7280:
.LBE7279:
.LBB7281:
.LBB7272:
	call	cap_io_page_table_cap_get_capIOPTBasePtr.isra.132.part.133
.LVL784:
.L774:
.LBE7272:
.LBE7281:
.LBB7282:
.LBB7269:
	call	cap_asid_pool_cap_get_capASIDPool.isra.134.part.135
.LVL785:
.LBE7269:
.LBE7282:
.LBE7284:
.LBE7304:
	.cfi_endproc
.LFE299:
	.size	cap_get_capPtr, .-cap_get_capPtr
	.section	.text.unlikely
.LCOLDE227:
	.text
.LHOTE227:
	.section	.rodata.str1.4
	.align 4
.LC228:
	.string	"(capPTIsMapped & ~0x1u) == ((0 && (capPTIsMapped & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB229:
.LHOTB229:
	.type	cap_page_table_cap_new.part.137, @function
cap_page_table_cap_new.part.137:
.LFB1032:
	.loc 11 3008 0
	.cfi_startproc
.LVL786:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 3012 0
	pushl	$__FUNCTION__.2548
	.cfi_def_cfa_offset 20
	pushl	$3012
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC228
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL787:
	.cfi_endproc
.LFE1032:
	.size	cap_page_table_cap_new.part.137, .-cap_page_table_cap_new.part.137
.LCOLDE229:
.LHOTE229:
	.section	.rodata.str1.4
	.align 4
.LC230:
	.string	"(capFSize & ~0x1u) == ((0 && (capFSize & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB231:
.LHOTB231:
	.type	cap_frame_cap_new.part.138, @function
cap_frame_cap_new.part.138:
.LFB1033:
	.loc 11 2780 0
	.cfi_startproc
.LVL788:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2784 0
	pushl	$__FUNCTION__.2465
	.cfi_def_cfa_offset 20
	pushl	$2784
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC230
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL789:
	.cfi_endproc
.LFE1033:
	.size	cap_frame_cap_new.part.138, .-cap_frame_cap_new.part.138
.LCOLDE231:
.LHOTE231:
.LCOLDB232:
.LHOTB232:
	.type	cap_page_directory_cap_get_capPDMappedASID.part.139, @function
cap_page_directory_cap_get_capPDMappedASID.part.139:
.LFB1034:
	.loc 11 3184 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 3186 0
	pushl	$__FUNCTION__.2611
	.cfi_def_cfa_offset 20
	pushl	$3187
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC220
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL790:
	.cfi_endproc
.LFE1034:
	.size	cap_page_directory_cap_get_capPDMappedASID.part.139, .-cap_page_directory_cap_get_capPDMappedASID.part.139
.LCOLDE232:
.LHOTE232:
.LCOLDB233:
.LHOTB233:
	.type	cap_page_table_cap_get_capPTMappedAddress.part.141, @function
cap_page_table_cap_get_capPTMappedAddress.part.141:
.LFB1036:
	.loc 11 3095 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 3097 0
	pushl	$__FUNCTION__.2578
	.cfi_def_cfa_offset 20
	pushl	$3098
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC218
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL791:
	.cfi_endproc
.LFE1036:
	.size	cap_page_table_cap_get_capPTMappedAddress.part.141, .-cap_page_table_cap_get_capPTMappedAddress.part.141
.LCOLDE233:
.LHOTE233:
.LCOLDB234:
.LHOTB234:
	.type	cap_page_table_cap_get_capPTIsMapped.part.142, @function
cap_page_table_cap_get_capPTIsMapped.part.142:
.LFB1037:
	.loc 11 3030 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 3032 0
	pushl	$__FUNCTION__.2553
	.cfi_def_cfa_offset 20
	pushl	$3033
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC218
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL792:
	.cfi_endproc
.LFE1037:
	.size	cap_page_table_cap_get_capPTIsMapped.part.142, .-cap_page_table_cap_get_capPTIsMapped.part.142
.LCOLDE234:
.LHOTE234:
.LCOLDB235:
.LHOTB235:
	.type	cap_frame_cap_get_capFMappedAddress.part.143, @function
cap_frame_cap_get_capFMappedAddress.part.143:
.LFB1038:
	.loc 11 2850 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2852 0
	pushl	$__FUNCTION__.2485
	.cfi_def_cfa_offset 20
	pushl	$2853
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC216
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL793:
	.cfi_endproc
.LFE1038:
	.size	cap_frame_cap_get_capFMappedAddress.part.143, .-cap_frame_cap_get_capFMappedAddress.part.143
.LCOLDE235:
.LHOTE235:
.LCOLDB236:
.LHOTB236:
	.type	cap_frame_cap_get_capFMappedASID.part.145, @function
cap_frame_cap_get_capFMappedASID.part.145:
.LFB1040:
	.loc 46 72 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
.LBB7305:
.LBB7306:
	.loc 11 2944 0
	pushl	$__FUNCTION__.2520
	.cfi_def_cfa_offset 20
	pushl	$2945
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC216
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL794:
.LBE7306:
.LBE7305:
	.cfi_endproc
.LFE1040:
	.size	cap_frame_cap_get_capFMappedASID.part.145, .-cap_frame_cap_get_capFMappedASID.part.145
.LCOLDE236:
.LHOTE236:
	.section	.rodata.str1.4
	.align 4
.LC237:
	.string	"((pde_ptr->words[0] >> 7) & 0x1) == pde_pde_pt"
	.section	.text.unlikely
.LCOLDB238:
.LHOTB238:
	.type	pde_pde_pt_ptr_get_pt_base_address.part.148, @function
pde_pde_pt_ptr_get_pt_base_address.part.148:
.LFB1043:
	.loc 11 1984 0
	.cfi_startproc
.LVL795:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1986 0
	pushl	$__FUNCTION__.2147
	.cfi_def_cfa_offset 20
	pushl	$1987
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC237
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL796:
	.cfi_endproc
.LFE1043:
	.size	pde_pde_pt_ptr_get_pt_base_address.part.148, .-pde_pde_pt_ptr_get_pt_base_address.part.148
.LCOLDE238:
.LHOTE238:
.LCOLDB239:
	.text
.LHOTB239:
	.p2align 4,,15
	.type	cap_page_directory_cap_get_capPDIsMapped.part.149, @function
cap_page_directory_cap_get_capPDIsMapped.part.149:
.LFB1044:
	.loc 11 3157 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 3159 0
	pushl	$__FUNCTION__.2601
	.cfi_def_cfa_offset 20
	pushl	$3160
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC220
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL797:
	.cfi_endproc
.LFE1044:
	.size	cap_page_directory_cap_get_capPDIsMapped.part.149, .-cap_page_directory_cap_get_capPDIsMapped.part.149
	.section	.text.unlikely
.LCOLDE239:
	.text
.LHOTE239:
	.section	.text.unlikely
.LCOLDB240:
	.text
.LHOTB240:
	.p2align 4,,15
	.globl	isValidNativeRoot
	.type	isValidNativeRoot, @function
isValidNativeRoot:
.LFB475:
	.loc 17 183 0
	.cfi_startproc
.LVL798:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 17 183 0
	movl	16(%esp), %edx
.LVL799:
	movl	20(%esp), %ebx
.LBB7307:
.LBB7308:
.LBB7309:
	.loc 11 2202 0
	movl	%edx, %eax
	.loc 11 2203 0
	movl	%edx, %ecx
	movzbl	%dl, %edx
.LVL800:
	.loc 11 2202 0
	andl	$14, %eax
.LVL801:
	.loc 11 2203 0
	andl	$15, %ecx
.LVL802:
	cmpl	$14, %eax
.LVL803:
	cmovne	%ecx, %edx
.LVL804:
	xorl	%eax, %eax
.LBE7309:
.LBE7308:
.LBE7307:
	.loc 17 184 0
	cmpl	$5, %edx
	je	.L802
	.loc 17 186 0 discriminator 6
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L802:
	.cfi_restore_state
.LVL805:
.LBB7310:
.LBB7311:
	.loc 11 3159 0 discriminator 1
	cmpl	$5, %ecx
	jne	.L803
	.loc 11 3162 0
	movl	%ebx, %eax
.LBE7311:
.LBE7310:
	.loc 17 186 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
.LBB7314:
.LBB7312:
	.loc 11 3162 0
	andl	$16384, %eax
.LBE7312:
.LBE7314:
	.loc 17 186 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL806:
	shrl	$14, %eax
	ret
.LVL807:
.L803:
	.cfi_restore_state
.LBB7315:
.LBB7313:
	call	cap_page_directory_cap_get_capPDIsMapped.part.149
.LVL808:
.LBE7313:
.LBE7315:
	.cfi_endproc
.LFE475:
	.size	isValidNativeRoot, .-isValidNativeRoot
	.section	.text.unlikely
.LCOLDE240:
	.text
.LHOTE240:
	.section	.text.unlikely
.LCOLDB241:
	.text
.LHOTB241:
	.p2align 4,,15
	.globl	getValidNativeRoot
	.type	getValidNativeRoot, @function
getValidNativeRoot:
.LFB476:
	.loc 17 189 0
	.cfi_startproc
.LVL809:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	subl	$12, %esp
	.cfi_def_cfa_offset 24
	.loc 17 189 0
	movl	24(%esp), %esi
	movl	28(%esp), %edi
	.loc 17 190 0
	pushl	%edi
	.cfi_def_cfa_offset 28
	pushl	%esi
	.cfi_def_cfa_offset 32
	call	isValidNativeRoot
.LVL810:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	je	.L807
.LVL811:
.LBB7316:
.LBB7317:
	.loc 11 3227 0
	movl	%esi, %eax
	andl	$15, %eax
	cmpl	$5, %eax
	jne	.L809
.LVL812:
.LBE7317:
.LBE7316:
	.loc 17 191 0
	andl	$16777200, %esi
	.loc 17 194 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 17 191 0
	movl	%esi, %eax
	.loc 17 194 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	.loc 17 191 0
	sall	$8, %eax
	.loc 17 194 0
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL813:
	.p2align 4,,10
	.p2align 3
.L807:
	.cfi_restore_state
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 17 193 0
	xorl	%eax, %eax
	.loc 17 194 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL814:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL815:
	ret
.LVL816:
.L809:
	.cfi_restore_state
.LBB7319:
.LBB7318:
	call	cap_page_directory_cap_get_capPDBasePtr.isra.129.part.130
.LVL817:
.LBE7318:
.LBE7319:
	.cfi_endproc
.LFE476:
	.size	getValidNativeRoot, .-getValidNativeRoot
	.section	.text.unlikely
.LCOLDE241:
	.text
.LHOTE241:
	.section	.text.unlikely
.LCOLDB242:
	.text
.LHOTB242:
	.p2align 4,,15
	.globl	isValidVTableRoot
	.type	isValidVTableRoot, @function
isValidVTableRoot:
.LFB534:
	.loc 20 125 0
	.cfi_startproc
.LVL818:
	.loc 20 126 0
	jmp	isValidNativeRoot
.LVL819:
	.cfi_endproc
.LFE534:
	.size	isValidVTableRoot, .-isValidVTableRoot
	.section	.text.unlikely
.LCOLDE242:
	.text
.LHOTE242:
	.section	.rodata.str1.4
	.align 4
.LC243:
	.string	"(vspace_root & ~0xfffff000u) == ((0 && (vspace_root & (1u << 31))) ? 0x0 : 0)"
	.section	.boot.text
.LCOLDB244:
.LHOTB244:
	.p2align 4,,15
	.globl	write_it_asid_pool
	.type	write_it_asid_pool, @function
write_it_asid_pool:
.LFB539:
	.loc 20 528 0
	.cfi_startproc
.LVL820:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	.loc 20 528 0
	movl	16(%esp), %eax
.LVL821:
	movl	20(%esp), %ebx
.LVL822:
	movl	24(%esp), %edx
.LVL823:
	movl	28(%esp), %esi
.LVL824:
.LBB7400:
.LBB7401:
.LBB7402:
.LBB7403:
	.loc 11 2202 0
	movl	%eax, %ecx
	andl	$14, %ecx
	cmpl	$14, %ecx
	je	.L812
	.loc 11 2203 0
	movl	%eax, %ecx
	andl	$15, %ecx
.LVL825:
.LBE7403:
.LBE7402:
	.loc 54 387 0
	cmpl	$14, %ecx
	ja	.L813
	jmp	*.L815(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L815:
	.long	.L813
	.long	.L813
	.long	.L896
	.long	.L813
	.long	.L816
	.long	.L813
	.long	.L896
	.long	.L813
	.long	.L881
	.long	.L813
	.long	.L819
	.long	.L813
	.long	.L820
	.long	.L813
	.long	.L881
	.section	.boot.text
.LVL826:
	.p2align 4,,10
	.p2align 3
.L816:
	.loc 54 392 0
	movl	%ebx, %eax
.LVL827:
.L896:
	andl	$-16, %eax
.LVL828:
.L818:
.LBE7401:
.LBE7400:
.LBB7454:
.LBB7455:
.LBB7456:
.LBB7457:
	.loc 11 2202 0
	movl	%edx, %ecx
	andl	$14, %ecx
	cmpl	$14, %ecx
	je	.L844
	.loc 11 2203 0
	movl	%edx, %ecx
	andl	$15, %ecx
.LVL829:
.LBE7457:
.LBE7456:
	.loc 54 387 0
	cmpl	$14, %ecx
	ja	.L845
	jmp	*.L847(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L847:
	.long	.L845
	.long	.L845
	.long	.L849
	.long	.L845
	.long	.L848
	.long	.L845
	.long	.L849
	.long	.L845
	.long	.L884
	.long	.L845
	.long	.L851
	.long	.L845
	.long	.L852
	.long	.L845
	.long	.L884
	.section	.boot.text
	.p2align 4,,10
	.p2align 3
.L856:
.LVL830:
.LBB7459:
.LBB7460:
	.loc 11 2576 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$6, %ecx
	jne	.L830
.LVL831:
	.p2align 4,,10
	.p2align 3
.L849:
.LBE7460:
.LBE7459:
	.loc 54 395 0
	andl	$-16, %edx
.LVL832:
.L861:
.LBE7455:
.LBE7454:
.LBB7506:
.LBB7507:
	.loc 11 1330 0
	testl	$4095, %edx
	jne	.L874
	andl	$-4096, %edx
.LVL833:
	orl	$1, %edx
.LVL834:
.LBE7507:
.LBE7506:
	.loc 20 530 0
	movl	%edx, 4(%eax)
	.loc 20 531 0
	movl	%eax, x86KSASIDTable
	.loc 20 532 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
.LVL835:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL836:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL837:
	ret
.LVL838:
	.p2align 4,,10
	.p2align 3
.L812:
	.cfi_restore_state
.LBB7511:
.LBB7446:
.LBB7405:
.LBB7404:
	.loc 11 2204 0
	movzbl	%al, %ecx
.LVL839:
.LBE7404:
.LBE7405:
	.loc 54 387 0
	cmpl	$62, %ecx
	ja	.L813
	jmp	*.L822(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L822:
	.long	.L813
	.long	.L813
	.long	.L821
	.long	.L813
	.long	.L823
	.long	.L813
	.long	.L824
	.long	.L813
	.long	.L881
	.long	.L813
	.long	.L825
	.long	.L813
	.long	.L826
	.long	.L813
	.long	.L881
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L881
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L827
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L813
	.long	.L881
	.section	.boot.text
.LVL840:
	.p2align 4,,10
	.p2align 3
.L844:
.LBE7446:
.LBE7511:
.LBB7512:
.LBB7498:
.LBB7461:
.LBB7458:
	.loc 11 2204 0
	movzbl	%dl, %ecx
.LVL841:
.LBE7458:
.LBE7461:
	.loc 54 387 0
	cmpl	$62, %ecx
	ja	.L845
	jmp	*.L854(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L854:
	.long	.L845
	.long	.L845
	.long	.L853
	.long	.L845
	.long	.L855
	.long	.L845
	.long	.L856
	.long	.L845
	.long	.L884
	.long	.L845
	.long	.L857
	.long	.L845
	.long	.L858
	.long	.L845
	.long	.L884
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L884
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L859
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L845
	.long	.L884
	.section	.boot.text
.LVL842:
	.p2align 4,,10
	.p2align 3
.L881:
.LBE7498:
.LBE7512:
.LBB7513:
.LBB7447:
.LBB7406:
.LBB7407:
	.loc 55 280 0
	xorl	%eax, %eax
.LVL843:
	jmp	.L818
.LVL844:
	.p2align 4,,10
	.p2align 3
.L820:
.LBE7407:
.LBE7406:
	.loc 54 401 0
	andl	$-1024, %eax
.LVL845:
	jmp	.L818
.LVL846:
	.p2align 4,,10
	.p2align 3
.L819:
	.loc 54 398 0
	andl	$-32, %eax
.LVL847:
	jmp	.L818
.LVL848:
	.p2align 4,,10
	.p2align 3
.L884:
.LBE7447:
.LBE7513:
.LBB7514:
.LBB7499:
.LBB7462:
.LBB7463:
	.loc 55 268 0
	movl	$1, %edx
.LVL849:
.LBE7463:
.LBE7462:
.LBE7499:
.LBE7514:
	.loc 20 530 0
	movl	%edx, 4(%eax)
	.loc 20 531 0
	movl	%eax, x86KSASIDTable
	.loc 20 532 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
.LVL850:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL851:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL852:
	ret
.LVL853:
	.p2align 4,,10
	.p2align 3
.L857:
	.cfi_restore_state
.LBB7515:
.LBB7500:
.LBB7479:
.LBB7480:
	.loc 11 2738 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$10, %ecx
	jne	.L829
.LVL854:
.L851:
.LBE7480:
.LBE7479:
	.loc 54 398 0
	andl	$-32, %edx
.LVL855:
	jmp	.L861
.LVL856:
	.p2align 4,,10
	.p2align 3
.L855:
.LBB7481:
.LBB7482:
	.loc 11 2358 0
	andl	$15, %edx
.LVL857:
	cmpl	$4, %edx
	jne	.L831
.LVL858:
.L848:
.LBE7482:
.LBE7481:
	.loc 54 392 0
	andl	$-16, %esi
.LVL859:
	movl	%esi, %edx
	jmp	.L861
.LVL860:
	.p2align 4,,10
	.p2align 3
.L858:
.LBB7483:
.LBB7484:
	.loc 11 2768 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$12, %ecx
	jne	.L828
.LVL861:
.L852:
.LBE7484:
.LBE7483:
	.loc 54 401 0
	andl	$-1024, %edx
.LVL862:
	jmp	.L861
.LVL863:
	.p2align 4,,10
	.p2align 3
.L813:
.LBE7500:
.LBE7515:
.LBB7516:
.LBB7448:
.LBB7426:
.LBB7422:
	.loc 55 268 0
	cmpl	$31, %ecx
	ja	.L862
	jmp	*.L834(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L834:
	.long	.L862
	.long	.L833
	.long	.L862
	.long	.L835
	.long	.L862
	.long	.L836
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L881
	.long	.L862
	.long	.L837
	.long	.L862
	.long	.L881
	.long	.L862
	.long	.L838
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L881
	.section	.boot.text
.LVL864:
	.p2align 4,,10
	.p2align 3
.L845:
.LBE7422:
.LBE7426:
.LBE7448:
.LBE7516:
.LBB7517:
.LBB7501:
.LBB7485:
.LBB7476:
	cmpl	$31, %ecx
	ja	.L862
	jmp	*.L864(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L864:
	.long	.L862
	.long	.L863
	.long	.L862
	.long	.L865
	.long	.L862
	.long	.L866
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L884
	.long	.L862
	.long	.L867
	.long	.L862
	.long	.L884
	.long	.L862
	.long	.L868
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L862
	.long	.L884
	.section	.boot.text
.LVL865:
	.p2align 4,,10
	.p2align 3
.L827:
.LBE7476:
.LBE7485:
.LBE7501:
.LBE7517:
.LBB7518:
.LBB7449:
.LBB7427:
.LBB7428:
.LBB7429:
.LBB7430:
.LBB7431:
.LBB7432:
	.loc 11 3437 0
	andl	$16128, %eax
.LVL866:
	shrl	$8, %eax
	movl	%eax, %ecx
.LVL867:
.LBE7432:
.LBE7431:
	.loc 54 103 0
	movl	$-32, %eax
	cmpl	$32, %ecx
	je	.L875
	andl	$31, %ecx
	movl	$-1, %eax
	addl	$1, %ecx
	sall	%cl, %eax
.L875:
.LVL868:
.LBE7430:
.LBE7429:
.LBE7428:
.LBE7427:
	.loc 54 404 0
	andl	%ebx, %eax
	jmp	.L818
.LVL869:
	.p2align 4,,10
	.p2align 3
.L859:
.LBE7449:
.LBE7518:
.LBB7519:
.LBB7502:
.LBB7486:
.LBB7487:
.LBB7488:
.LBB7489:
.LBB7490:
.LBB7491:
	.loc 11 3437 0
	andl	$16128, %edx
.LVL870:
.LBE7491:
.LBE7490:
	.loc 54 103 0
	movl	$-32, %ebx
.LVL871:
.LBB7493:
.LBB7492:
	.loc 11 3437 0
	shrl	$8, %edx
.LBE7492:
.LBE7493:
	.loc 54 103 0
	cmpl	$32, %edx
	je	.L877
	andl	$31, %edx
	movl	$-1, %ebx
	leal	1(%edx), %ecx
	sall	%cl, %ebx
.L877:
.LBE7489:
.LBE7488:
.LBE7487:
.LBE7486:
	.loc 54 404 0
	andl	%ebx, %esi
.LVL872:
	movl	%esi, %edx
	jmp	.L861
.LVL873:
	.p2align 4,,10
	.p2align 3
.L825:
.LBE7502:
.LBE7519:
.LBB7520:
.LBB7450:
.LBB7433:
.LBB7434:
	.loc 11 2738 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$10, %ecx
	je	.L819
.LVL874:
.L829:
	call	cap_cnode_cap_get_capCNodePtr.isra.118.part.119
.LVL875:
	.p2align 4,,10
	.p2align 3
.L826:
.LBE7434:
.LBE7433:
.LBB7435:
.LBB7436:
	.loc 11 2768 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$12, %ecx
	je	.L820
.LVL876:
.L828:
	call	cap_thread_cap_get_capTCBPtr.isra.89.part.90
.LVL877:
	.p2align 4,,10
	.p2align 3
.L821:
.LBE7436:
.LBE7435:
.LBB7437:
.LBB7438:
	.loc 11 2320 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$2, %ecx
	je	.L896
.LVL878:
.L860:
	call	cap_untyped_cap_get_capPtr.isra.115.part.116
.LVL879:
	.p2align 4,,10
	.p2align 3
.L823:
.LBE7438:
.LBE7437:
.LBB7439:
.LBB7440:
	.loc 11 2358 0
	andl	$15, %eax
.LVL880:
	cmpl	$4, %eax
	je	.L816
.LVL881:
.L831:
	call	cap_endpoint_cap_get_capEPPtr.part.117
.LVL882:
	.p2align 4,,10
	.p2align 3
.L824:
.LBE7440:
.LBE7439:
.LBB7441:
.LBB7442:
	.loc 11 2576 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$6, %ecx
	je	.L896
.LVL883:
.L830:
	call	cap_notification_cap_get_capNtfnPtr.isra.97.part.98
.LVL884:
	.p2align 4,,10
	.p2align 3
.L853:
.LBE7442:
.LBE7441:
.LBE7450:
.LBE7520:
.LBB7521:
.LBB7503:
.LBB7494:
.LBB7495:
	.loc 11 2320 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$2, %ecx
	je	.L849
	jmp	.L860
.LVL885:
	.p2align 4,,10
	.p2align 3
.L833:
.LBE7495:
.LBE7494:
.LBE7503:
.LBE7521:
.LBB7522:
.LBB7451:
.LBB7443:
.LBB7423:
.LBB7408:
.LBB7409:
	.loc 11 2996 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$1, %ecx
	jne	.L869
.LVL886:
.L843:
.LBE7409:
.LBE7408:
	.loc 55 294 0
	andl	$16777200, %eax
.LVL887:
	sall	$8, %eax
	jmp	.L818
.LVL888:
	.p2align 4,,10
	.p2align 3
.L837:
.LBB7411:
.LBB7412:
	.loc 11 3287 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$11, %ecx
	je	.L843
.LVL889:
.L873:
	call	cap_asid_pool_cap_get_capASIDPool.isra.134.part.135
.LVL890:
	.p2align 4,,10
	.p2align 3
.L836:
.LBE7412:
.LBE7411:
.LBB7413:
.LBB7414:
	.loc 11 3227 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$5, %ecx
	je	.L843
.LVL891:
.L871:
	call	cap_page_directory_cap_get_capPDBasePtr.isra.129.part.130
.LVL892:
	.p2align 4,,10
	.p2align 3
.L835:
.LBE7414:
.LBE7413:
.LBB7415:
.LBB7416:
	.loc 11 3123 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$3, %ecx
	je	.L843
.LVL893:
.L870:
	call	cap_page_table_cap_get_capPTBasePtr.isra.127.part.128
.LVL894:
	.p2align 4,,10
	.p2align 3
.L838:
.LBE7416:
.LBE7415:
.LBB7417:
.LBB7418:
	.loc 11 3590 0
	cmpb	$15, %al
	jne	.L872
.LVL895:
.LBE7418:
.LBE7417:
	.loc 55 287 0
	andl	$268435200, %eax
.LVL896:
	sall	$4, %eax
	jmp	.L818
.LVL897:
	.p2align 4,,10
	.p2align 3
.L867:
.LBE7423:
.LBE7443:
.LBE7451:
.LBE7522:
.LBB7523:
.LBB7504:
.LBB7496:
.LBB7477:
.LBB7464:
.LBB7465:
	.loc 11 3287 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$11, %ecx
	jne	.L873
.LVL898:
.L898:
.LBE7465:
.LBE7464:
	.loc 55 294 0
	andl	$16777200, %edx
.LVL899:
	sall	$8, %edx
	jmp	.L861
.LVL900:
	.p2align 4,,10
	.p2align 3
.L868:
.LBB7466:
.LBB7467:
	.loc 11 3590 0
	cmpb	$15, %dl
	jne	.L872
.LVL901:
.LBE7467:
.LBE7466:
	.loc 55 287 0
	andl	$268435200, %edx
.LVL902:
	sall	$4, %edx
	jmp	.L861
.LVL903:
	.p2align 4,,10
	.p2align 3
.L866:
.LBB7468:
.LBB7469:
	.loc 11 3227 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$5, %ecx
	je	.L898
	jmp	.L871
.LVL904:
	.p2align 4,,10
	.p2align 3
.L865:
.LBE7469:
.LBE7468:
.LBB7470:
.LBB7471:
	.loc 11 3123 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$3, %ecx
	je	.L898
	jmp	.L870
.LVL905:
	.p2align 4,,10
	.p2align 3
.L863:
.LBE7471:
.LBE7470:
.LBB7472:
.LBB7473:
	.loc 11 2996 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$1, %ecx
	je	.L898
.LVL906:
.L869:
.LBE7473:
.LBE7472:
.LBE7477:
.LBE7496:
.LBE7504:
.LBE7523:
.LBB7524:
.LBB7452:
.LBB7444:
.LBB7424:
.LBB7420:
.LBB7410:
	call	cap_frame_cap_get_capFBasePtr.isra.125.part.126
.LVL907:
	.p2align 4,,10
	.p2align 3
.L862:
.LBE7410:
.LBE7420:
.LBE7424:
.LBE7444:
.LBE7452:
.LBE7524:
.LBB7525:
.LBB7505:
.LBB7497:
.LBB7478:
.LBB7474:
.LBB7475:
	.loc 46 134 0
	pushl	$__func__.3040
	.cfi_remember_state
	.cfi_def_cfa_offset 20
.LVL908:
	pushl	$134
	.cfi_def_cfa_offset 24
.LVL909:
	pushl	$.LC145
	.cfi_def_cfa_offset 28
.LVL910:
	pushl	$.LC226
	.cfi_def_cfa_offset 32
.LVL911:
	call	_fail
.LVL912:
.L874:
	.cfi_restore_state
.LBE7475:
.LBE7474:
.LBE7478:
.LBE7497:
.LBE7505:
.LBE7525:
.LBB7526:
.LBB7510:
.LBB7508:
.LBB7509:
	.loc 11 1330 0
	pushl	$__FUNCTION__.1874
	.cfi_remember_state
	.cfi_def_cfa_offset 20
.LVL913:
	pushl	$1330
	.cfi_def_cfa_offset 24
.LVL914:
	pushl	$.LC154
	.cfi_def_cfa_offset 28
.LVL915:
	pushl	$.LC243
	.cfi_def_cfa_offset 32
.LVL916:
	call	_assert_fail
.LVL917:
.L872:
	.cfi_restore_state
.LBE7509:
.LBE7508:
.LBE7510:
.LBE7526:
.LBB7527:
.LBB7453:
.LBB7445:
.LBB7425:
.LBB7421:
.LBB7419:
	call	cap_io_page_table_cap_get_capIOPTBasePtr.isra.132.part.133
.LVL918:
.LBE7419:
.LBE7421:
.LBE7425:
.LBE7445:
.LBE7453:
.LBE7527:
	.cfi_endproc
.LFE539:
	.size	write_it_asid_pool, .-write_it_asid_pool
.LCOLDE244:
.LHOTE244:
	.section	.rodata.str1.4
	.align 4
.LC245:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/include/api/syscall.h"
	.section	.rodata.str1.1
.LC246:
	.string	"ipc_buffer != NULL"
	.section	.text.unlikely
.LCOLDB247:
.LHOTB247:
	.type	getSyscallArg.part.152, @function
getSyscallArg.part.152:
.LFB1047:
	.file 56 "/home/axjllt/Desktop/ori_refos/kernel/include/api/syscall.h"
	.loc 56 28 0
	.cfi_startproc
.LVL919:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 56 34 0
	pushl	$__FUNCTION__.5152
	.cfi_def_cfa_offset 20
	pushl	$34
	.cfi_def_cfa_offset 24
	pushl	$.LC245
	.cfi_def_cfa_offset 28
	pushl	$.LC246
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL920:
	.cfi_endproc
.LFE1047:
	.size	getSyscallArg.part.152, .-getSyscallArg.part.152
.LCOLDE247:
.LHOTE247:
	.section	.rodata.str1.4
	.align 4
.LC248:
	.string	"((pde_ptr->words[0] >> 7) & 0x1) == pde_pde_large"
	.section	.text.unlikely
.LCOLDB249:
.LHOTB249:
	.type	pde_pde_large_ptr_get_present.part.153, @function
pde_pde_large_ptr_get_present.part.153:
.LFB1048:
	.loc 11 2159 0
	.cfi_startproc
.LVL921:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2161 0
	pushl	$__FUNCTION__.2212
	.cfi_def_cfa_offset 20
	pushl	$2162
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC248
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL922:
	.cfi_endproc
.LFE1048:
	.size	pde_pde_large_ptr_get_present.part.153, .-pde_pde_large_ptr_get_present.part.153
.LCOLDE249:
.LHOTE249:
.LCOLDB250:
.LHOTB250:
	.type	pde_pde_large_ptr_get_page_base_address.part.155, @function
pde_pde_large_ptr_get_page_base_address.part.155:
.LFB1050:
	.loc 11 2089 0
	.cfi_startproc
.LVL923:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2091 0
	pushl	$__FUNCTION__.2187
	.cfi_def_cfa_offset 20
	pushl	$2092
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC248
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL924:
	.cfi_endproc
.LFE1050:
	.size	pde_pde_large_ptr_get_page_base_address.part.155, .-pde_pde_large_ptr_get_page_base_address.part.155
.LCOLDE250:
.LHOTE250:
.LCOLDB251:
.LHOTB251:
	.type	cap_frame_cap_set_capFMapType.part.156, @function
cap_frame_cap_set_capFMapType.part.156:
.LFB1051:
	.loc 11 2903 0
	.cfi_startproc
.LVL925:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2904 0
	pushl	$__FUNCTION__.2505
	.cfi_def_cfa_offset 20
	pushl	$2905
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC216
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL926:
	.cfi_endproc
.LFE1051:
	.size	cap_frame_cap_set_capFMapType.part.156, .-cap_frame_cap_set_capFMapType.part.156
.LCOLDE251:
.LHOTE251:
.LCOLDB252:
.LHOTB252:
	.type	cap_frame_cap_set_capFMappedASID, @function
cap_frame_cap_set_capFMappedASID:
.LFB283:
	.loc 46 81 0
	.cfi_startproc
.LVL927:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
.LBB7532:
.LBB7533:
	.loc 11 2839 0
	movl	%edx, %edi
.LBE7533:
.LBE7532:
	.loc 46 81 0
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
.LBB7536:
.LBB7534:
	.loc 11 2839 0
	andl	$15, %edi
.LBE7534:
.LBE7536:
	.loc 46 81 0
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 46 81 0
	movl	16(%esp), %ebx
	.loc 46 82 0
	movl	%ebx, %esi
	andl	$1023, %esi
.LVL928:
.LBB7537:
.LBB7535:
	.loc 11 2839 0
	decl	%edi
	je	.L908
	pushl	$__FUNCTION__.2480
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$2840
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC216
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL929:
.L908:
	.cfi_restore_state
.LBE7535:
.LBE7537:
.LBB7538:
.LBB7539:
	.loc 11 2964 0
	sall	$16, %ebx
	sall	$20, %esi
.LVL930:
	.loc 11 2962 0
	andl	$-201326593, %edx
.LVL931:
	.loc 11 2964 0
	andl	$201326592, %ebx
	andl	$-1072693249, %ecx
.LVL932:
	orl	%ebx, %edx
	orl	%esi, %ecx
.LBE7539:
.LBE7538:
	.loc 46 84 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LBB7542:
.LBB7540:
	.loc 11 2964 0
	movl	%edx, (%eax)
.LBE7540:
.LBE7542:
	.loc 46 84 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LBB7543:
.LBB7541:
	.loc 11 2964 0
	movl	%ecx, 4(%eax)
.LVL933:
.LBE7541:
.LBE7543:
	.loc 46 84 0
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE283:
	.size	cap_frame_cap_set_capFMappedASID, .-cap_frame_cap_set_capFMappedASID
.LCOLDE252:
.LHOTE252:
.LCOLDB253:
.LHOTB253:
	.type	cap_frame_cap_get_capFMapType.isra.158.part.159, @function
cap_frame_cap_get_capFMapType.isra.158.part.159:
.LFB1054:
	.loc 11 2889 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2891 0
	pushl	$__FUNCTION__.2500
	.cfi_def_cfa_offset 20
	pushl	$2892
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC216
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL934:
	.cfi_endproc
.LFE1054:
	.size	cap_frame_cap_get_capFMapType.isra.158.part.159, .-cap_frame_cap_get_capFMapType.isra.158.part.159
.LCOLDE253:
.LHOTE253:
.LCOLDB254:
.LHOTB254:
	.type	cap_frame_cap_get_capFSize.part.160, @function
cap_frame_cap_get_capFSize.part.160:
.LFB1055:
	.loc 11 2810 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2812 0
	pushl	$__FUNCTION__.2470
	.cfi_def_cfa_offset 20
	pushl	$2813
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC216
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL935:
	.cfi_endproc
.LFE1055:
	.size	cap_frame_cap_get_capFSize.part.160, .-cap_frame_cap_get_capFSize.part.160
.LCOLDE254:
.LHOTE254:
	.section	.rodata.str1.4
	.align 4
.LC255:
	.string	"((seL4_Fault.words[0] >> 0) & 0x7) == seL4_Fault_VMFault"
	.section	.text.unlikely
.LCOLDB256:
.LHOTB256:
	.type	seL4_Fault_VMFault_get_address.part.161, @function
seL4_Fault_VMFault_get_address.part.161:
.LFB1056:
	.loc 11 1747 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1749 0
	pushl	$__FUNCTION__.2048
	.cfi_def_cfa_offset 20
	pushl	$1750
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC255
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL936:
	.cfi_endproc
.LFE1056:
	.size	seL4_Fault_VMFault_get_address.part.161, .-seL4_Fault_VMFault_get_address.part.161
.LCOLDE256:
.LHOTE256:
.LCOLDB257:
.LHOTB257:
	.type	seL4_Fault_VMFault_get_instructionFault.isra.162.part.163, @function
seL4_Fault_VMFault_get_instructionFault.isra.162.part.163:
.LFB1058:
	.loc 11 1775 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1777 0
	pushl	$__FUNCTION__.2058
	.cfi_def_cfa_offset 20
	pushl	$1778
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC255
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL937:
	.cfi_endproc
.LFE1058:
	.size	seL4_Fault_VMFault_get_instructionFault.isra.162.part.163, .-seL4_Fault_VMFault_get_instructionFault.isra.162.part.163
.LCOLDE257:
.LHOTE257:
.LCOLDB258:
.LHOTB258:
	.type	seL4_Fault_VMFault_get_FSR.isra.164.part.165, @function
seL4_Fault_VMFault_get_FSR.isra.164.part.165:
.LFB1060:
	.loc 11 1761 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1763 0
	pushl	$__FUNCTION__.2053
	.cfi_def_cfa_offset 20
	pushl	$1764
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC255
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL938:
	.cfi_endproc
.LFE1060:
	.size	seL4_Fault_VMFault_get_FSR.isra.164.part.165, .-seL4_Fault_VMFault_get_FSR.isra.164.part.165
.LCOLDE258:
.LHOTE258:
.LCOLDB259:
	.text
.LHOTB259:
	.p2align 4,,15
	.globl	Arch_setMRs_fault
	.type	Arch_setMRs_fault, @function
Arch_setMRs_fault:
.LFB494:
	.loc 43 32 0
	.cfi_startproc
.LVL939:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	.loc 43 33 0
	cmpl	$5, 28(%esp)
	.loc 43 32 0
	movl	16(%esp), %edx
	movl	20(%esp), %ebx
	movl	24(%esp), %ecx
	.loc 43 33 0
	jne	.L928
.LVL940:
.LBB7586:
.LBB7587:
.LBB7588:
	.loc 15 30 0
	movl	556(%edx), %eax
	movl	%eax, 532(%ebx)
.LVL941:
.LBE7588:
.LBE7587:
.LBE7586:
.LBB7589:
.LBB7590:
	.loc 11 1749 0
	movl	604(%edx), %eax
	movl	608(%edx), %esi
.LVL942:
	andl	$7, %eax
	cmpl	$5, %eax
	jne	.L931
.LVL943:
.LBE7590:
.LBE7589:
.LBB7592:
.LBB7593:
.LBB7594:
	.loc 15 30 0
	movl	%esi, 536(%ebx)
.LVL944:
	movl	604(%edx), %eax
.LVL945:
.LBE7594:
.LBE7593:
.LBE7592:
.LBB7595:
.LBB7596:
	.loc 11 1777 0
	movl	%eax, %ebx
	andl	$7, %ebx
	cmpl	$5, %ebx
	jne	.L932
	.loc 11 1780 0
	andl	$524288, %eax
	shrl	$19, %eax
.LVL946:
.LBE7596:
.LBE7595:
.LBB7598:
.LBB7599:
	.loc 48 38 0
	testl	%ecx, %ecx
	je	.L927
	.loc 48 39 0
	movl	%eax, 12(%ecx)
.LVL947:
	movl	604(%edx), %eax
.LVL948:
.LBE7599:
.LBE7598:
.LBB7600:
.LBB7601:
	.loc 11 1763 0
	movl	%eax, %edx
.LVL949:
	andl	$7, %edx
	cmpl	$5, %edx
	jne	.L933
.LVL950:
.LBE7601:
.LBE7600:
.LBB7603:
.LBB7604:
	.loc 48 39 0
	shrl	$27, %eax
	movl	%eax, 16(%ecx)
.LBE7604:
.LBE7603:
	.loc 43 46 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
.LBB7607:
.LBB7605:
	.loc 48 40 0
	movl	$4, %eax
.LVL951:
.LBE7605:
.LBE7607:
	.loc 43 46 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL952:
	ret
.LVL953:
	.p2align 4,,10
	.p2align 3
.L927:
	.cfi_restore_state
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
.LBB7608:
.LBB7606:
	.loc 48 42 0
	movl	$2, %eax
.LBE7606:
.LBE7608:
	.loc 43 46 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL954:
	ret
.LVL955:
.L933:
	.cfi_restore_state
.LBB7609:
.LBB7602:
	call	seL4_Fault_VMFault_get_FSR.isra.164.part.165
.LVL956:
.L932:
.LBE7602:
.LBE7609:
.LBB7610:
.LBB7597:
	call	seL4_Fault_VMFault_get_instructionFault.isra.162.part.163
.LVL957:
.L931:
.LBE7597:
.LBE7610:
.LBB7611:
.LBB7591:
	call	seL4_Fault_VMFault_get_address.part.161
.LVL958:
.L928:
.LBE7591:
.LBE7611:
.LBB7612:
.LBB7613:
	.loc 43 44 0
	pushl	$__func__.6518
	.cfi_def_cfa_offset 20
	pushl	$44
	.cfi_def_cfa_offset 24
	pushl	$.LC134
	.cfi_def_cfa_offset 28
	pushl	$.LC135
	.cfi_def_cfa_offset 32
	call	_fail
.LVL959:
.LBE7613:
.LBE7612:
	.cfi_endproc
.LFE494:
	.size	Arch_setMRs_fault, .-Arch_setMRs_fault
	.section	.text.unlikely
.LCOLDE259:
	.text
.LHOTE259:
	.section	.rodata.str1.4
	.align 4
.LC260:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/c_traps.c"
	.section	.text.unlikely
.LCOLDB261:
	.text
.LHOTB261:
	.p2align 4,,15
	.globl	c_nested_interrupt
	.type	c_nested_interrupt, @function
c_nested_interrupt:
.LFB496:
	.file 57 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/c_traps.c"
	.loc 57 26 0
	.cfi_startproc
.LVL960:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 57 30 0
	cmpl	$-1, x86KSPendingInterrupt
	jne	.L937
	.loc 57 31 0
	movl	16(%esp), %eax
	movl	%eax, x86KSPendingInterrupt
	.loc 57 32 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.L937:
	.cfi_restore_state
	.loc 57 30 0 discriminator 1
	pushl	$__FUNCTION__.6549
	.cfi_def_cfa_offset 20
	pushl	$30
	.cfi_def_cfa_offset 24
	pushl	$.LC260
	.cfi_def_cfa_offset 28
	pushl	$.LC173
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL961:
	.cfi_endproc
.LFE496:
	.size	c_nested_interrupt, .-c_nested_interrupt
	.section	.text.unlikely
.LCOLDE261:
	.text
.LHOTE261:
	.section	.rodata.str1.4
	.align 4
.LC262:
	.string	"((asid_map.words[0] >> 0) & 0x3) == asid_map_asid_map_vspace"
	.section	.text.unlikely
.LCOLDB263:
.LHOTB263:
	.type	asid_map_asid_map_vspace_get_vspace_root.part.168, @function
asid_map_asid_map_vspace_get_vspace_root.part.168:
.LFB1063:
	.loc 11 1341 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1343 0
	pushl	$__FUNCTION__.1879
	.cfi_def_cfa_offset 20
	pushl	$1344
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC262
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL962:
	.cfi_endproc
.LFE1063:
	.size	asid_map_asid_map_vspace_get_vspace_root.part.168, .-asid_map_asid_map_vspace_get_vspace_root.part.168
.LCOLDE263:
.LHOTE263:
.LCOLDB264:
	.text
.LHOTB264:
	.p2align 4,,15
	.globl	findVSpaceForASID
	.type	findVSpaceForASID, @function
findVSpaceForASID:
.LFB541:
	.loc 20 548 0
	.cfi_startproc
.LVL963:
	.loc 20 548 0
	movl	8(%esp), %edx
	movl	4(%esp), %eax
.LVL964:
.LBB7634:
.LBB7635:
	.loc 20 539 0
	movl	%edx, %ecx
	shrl	$10, %ecx
	movl	x86KSASIDTable(,%ecx,4), %ecx
.LVL965:
	.loc 20 540 0
	testl	%ecx, %ecx
	je	.L941
	.loc 20 544 0
	andl	$1023, %edx
	movl	(%ecx,%edx,4), %edx
.LVL966:
.LBE7635:
.LBE7634:
	.loc 20 553 0
	movl	%edx, %ecx
	andl	$3, %ecx
	cmpl	$1, %ecx
	je	.L942
.LVL967:
.L941:
.LBB7636:
.LBB7637:
	.loc 20 554 0
	movl	$0, current_lookup_fault
	movl	$0, current_lookup_fault+4
.LVL968:
	.loc 20 558 0
	movl	$2, (%eax)
	movl	$0, 4(%eax)
.LVL969:
	ret	$4
.LVL970:
	.p2align 4,,10
	.p2align 3
.L942:
.LBE7637:
.LBE7636:
	.loc 20 563 0
	andl	$-4096, %edx
.LVL971:
	movl	$0, (%eax)
	movl	%edx, 4(%eax)
.LVL972:
	.loc 20 564 0
	ret	$4
	.cfi_endproc
.LFE541:
	.size	findVSpaceForASID, .-findVSpaceForASID
	.section	.text.unlikely
.LCOLDE264:
	.text
.LHOTE264:
	.section	.text.unlikely
.LCOLDB265:
	.text
.LHOTB265:
	.p2align 4,,15
	.globl	setVMRoot
	.type	setVMRoot, @function
setVMRoot:
.LFB462:
	.loc 16 627 0
	.cfi_startproc
.LVL973:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$24, %esp
	.cfi_def_cfa_offset 40
	.loc 16 633 0
	movl	40(%esp), %eax
	andl	$-1024, %eax
	movl	16(%eax), %esi
.LVL974:
	movl	20(%eax), %edi
	.loc 16 635 0
	pushl	%edi
	.cfi_def_cfa_offset 44
.LVL975:
	pushl	%esi
	.cfi_def_cfa_offset 48
	call	getValidNativeRoot
.LVL976:
	addl	$16, %esp
	.cfi_def_cfa_offset 32
.LVL977:
	.loc 16 636 0
	testl	%eax, %eax
	je	.L955
	movl	%esi, %edx
.LVL978:
	movl	%eax, %ebx
.LBB7664:
.LBB7665:
.LBB7666:
.LBB7667:
	.loc 11 2202 0
	andl	$14, %esi
.LVL979:
	.loc 11 2203 0
	movl	%edx, %eax
.LVL980:
	movzbl	%dl, %edx
	movl	%edi, %ecx
.LVL981:
	andl	$15, %eax
	cmpl	$14, %esi
	cmovne	%eax, %edx
.LBE7667:
.LBE7666:
	.loc 46 105 0
	cmpl	$5, %edx
	jne	.L960
.LVL982:
.LBB7668:
.LBB7669:
	.loc 11 3186 0
	cmpl	$5, %eax
	jne	.L964
.LBE7669:
.LBE7668:
.LBE7665:
.LBE7664:
	.loc 16 643 0
	leal	8(%esp), %eax
	andl	$16380, %ecx
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	shrl	$2, %ecx
	pushl	%ecx
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	call	findVSpaceForASID
	.cfi_def_cfa_offset 44
.LVL983:
	movl	24(%esp), %eax
.LVL984:
	.loc 16 644 0
	addl	$12, %esp
	.cfi_def_cfa_offset 32
	movl	8(%esp), %edx
	testl	%edx, %edx
	je	.L965
.LVL985:
.L955:
.LBB7673:
.LBB7674:
	.loc 50 26 0
	movl	$ia32KSGlobalPD+536870912, ia32KSCurrentPD
.LBB7675:
.LBB7676:
	.loc 7 23 0
	movl	$ia32KSGlobalPD+536870912, %eax
#APP
# 23 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h" 1
	movl %eax, %cr3
# 0 "" 2
#NO_APP
.L947:
.LBE7676:
.LBE7675:
.LBE7674:
.LBE7673:
	.loc 16 657 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL986:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL987:
	.p2align 4,,10
	.p2align 3
.L965:
	.cfi_restore_state
	.loc 16 644 0 discriminator 1
	cmpl	%eax, %ebx
	jne	.L955
.LVL988:
.LBB7677:
.LBB7678:
	.file 58 "/home/axjllt/Desktop/ori_refos/kernel/include/machine.h"
	.loc 58 29 0
	addl	$536870912, %ebx
.LVL989:
.LBE7678:
.LBE7677:
	.loc 16 651 0
	cmpl	ia32KSCurrentPD, %ebx
	je	.L947
.LBB7679:
.LBB7680:
	.loc 50 26 0
	movl	%ebx, ia32KSCurrentPD
.LBB7681:
.LBB7682:
	.loc 7 23 0
#APP
# 23 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h" 1
	movl %ebx, %cr3
# 0 "" 2
#NO_APP
	jmp	.L947
.LVL990:
.L964:
.LBE7682:
.LBE7681:
.LBE7680:
.LBE7679:
.LBB7683:
.LBB7672:
.LBB7671:
.LBB7670:
	call	cap_page_directory_cap_get_capPDMappedASID.part.139
.LVL991:
.L960:
.LBE7670:
.LBE7671:
	call	cap_get_capMappedASID.part.140
.LVL992:
.LBE7672:
.LBE7683:
	.cfi_endproc
.LFE462:
	.size	setVMRoot, .-setVMRoot
	.section	.text.unlikely
.LCOLDE265:
	.text
.LHOTE265:
	.section	.text.unlikely
.LCOLDB266:
	.text
.LHOTB266:
	.p2align 4,,15
	.globl	Arch_switchToThread
	.type	Arch_switchToThread, @function
Arch_switchToThread:
.LFB432:
	.loc 14 20 0
	.cfi_startproc
.LVL993:
	.loc 14 22 0
	jmp	setVMRoot
.LVL994:
	.cfi_endproc
.LFE432:
	.size	Arch_switchToThread, .-Arch_switchToThread
	.section	.text.unlikely
.LCOLDE266:
	.text
.LHOTE266:
	.section	.text.unlikely
.LCOLDB267:
	.text
.LHOTB267:
	.p2align 4,,15
	.globl	Arch_switchToIdleThread
	.type	Arch_switchToIdleThread, @function
Arch_switchToIdleThread:
.LFB434:
	.loc 14 40 0
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	.loc 14 42 0
	pushl	ksIdleThread
	.cfi_def_cfa_offset 32
	call	setVMRoot
.LVL995:
	.loc 14 43 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE434:
	.size	Arch_switchToIdleThread, .-Arch_switchToIdleThread
	.section	.text.unlikely
.LCOLDE267:
	.text
.LHOTE267:
	.section	.text.unlikely
.LCOLDB268:
	.text
.LHOTB268:
	.p2align 4,,15
	.globl	switchToIdleThread
	.type	switchToIdleThread, @function
switchToIdleThread:
.LFB694:
	.loc 32 337 0
	.cfi_startproc
	subl	$24, %esp
	.cfi_def_cfa_offset 28
.LBB7684:
.LBB7685:
	.loc 14 42 0
	pushl	ksIdleThread
	.cfi_def_cfa_offset 32
	call	setVMRoot
.LVL996:
.LBE7685:
.LBE7684:
	.loc 32 342 0
	movl	ksIdleThread, %eax
	movl	%eax, ksCurThread
	.loc 32 343 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE694:
	.size	switchToIdleThread, .-switchToIdleThread
	.section	.text.unlikely
.LCOLDE268:
	.text
.LHOTE268:
	.section	.text.unlikely
.LCOLDB269:
	.text
.LHOTB269:
	.p2align 4,,15
	.globl	deleteASID
	.type	deleteASID, @function
deleteASID:
.LFB532:
	.loc 20 83 0
	.cfi_startproc
.LVL997:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.loc 20 83 0
	movl	8(%esp), %eax
	movl	12(%esp), %ecx
	.loc 20 86 0
	movl	%eax, %edx
	shrl	$10, %edx
	movl	x86KSASIDTable(,%edx,4), %edx
.LVL998:
	.loc 20 88 0
	testl	%edx, %edx
	je	.L971
.LBB7686:
	.loc 20 89 0
	andl	$1023, %eax
	leal	(%edx,%eax,4), %edx
.LVL999:
	movl	(%edx), %eax
.LVL1000:
	.loc 20 90 0
	movl	%eax, %ebx
	andl	$3, %ebx
	cmpl	$1, %ebx
	je	.L977
.LVL1001:
.L971:
.LBE7686:
	.loc 20 96 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL1002:
	.p2align 4,,10
	.p2align 3
.L977:
	.cfi_restore_state
.LBB7687:
	.loc 20 90 0
	andl	$-4096, %eax
.LVL1003:
	cmpl	%eax, %ecx
	jne	.L971
.LVL1004:
	.loc 20 93 0
	movl	ksCurThread, %eax
	.loc 20 92 0
	movl	$0, (%edx)
.LVL1005:
	.loc 20 93 0
	movl	%eax, 8(%esp)
.LVL1006:
.LBE7687:
	.loc 20 96 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LBB7688:
	.loc 20 93 0
	jmp	setVMRoot
.LVL1007:
.LBE7688:
	.cfi_endproc
.LFE532:
	.size	deleteASID, .-deleteASID
	.section	.text.unlikely
.LCOLDE269:
	.text
.LHOTE269:
	.section	.text.unlikely
.LCOLDB270:
	.text
.LHOTB270:
	.p2align 4,,15
	.globl	unmapPageDirectory
	.type	unmapPageDirectory, @function
unmapPageDirectory:
.LFB479:
	.loc 17 228 0
	.cfi_startproc
.LVL1008:
	.loc 17 229 0
	movl	12(%esp), %eax
	movl	%eax, 8(%esp)
.LVL1009:
	jmp	deleteASID
.LVL1010:
	.cfi_endproc
.LFE479:
	.size	unmapPageDirectory, .-unmapPageDirectory
	.section	.text.unlikely
.LCOLDE270:
	.text
.LHOTE270:
	.section	.text.unlikely
.LCOLDB271:
.LHOTB271:
	.type	cap_untyped_cap_get_capBlockSize.part.171, @function
cap_untyped_cap_get_capBlockSize.part.171:
.LFB1066:
	.loc 11 2304 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2306 0
	pushl	$__FUNCTION__.2281
	.cfi_def_cfa_offset 20
	pushl	$2307
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC208
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1011:
	.cfi_endproc
.LFE1066:
	.size	cap_untyped_cap_get_capBlockSize.part.171, .-cap_untyped_cap_get_capBlockSize.part.171
.LCOLDE271:
.LHOTE271:
	.section	.rodata.str1.4
	.align 4
.LC272:
	.string	"((cap_ptr->words[0] >> 0) & 0xf) == cap_untyped_cap"
	.section	.text.unlikely
.LCOLDB273:
.LHOTB273:
	.type	cap_untyped_cap_ptr_set_capFreeIndex.part.172, @function
cap_untyped_cap_ptr_set_capFreeIndex.part.172:
.LFB1067:
	.loc 11 2277 0
	.cfi_startproc
.LVL1012:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2279 0
	pushl	$__FUNCTION__.2271
	.cfi_def_cfa_offset 20
	pushl	$2280
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC272
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1013:
	.cfi_endproc
.LFE1067:
	.size	cap_untyped_cap_ptr_set_capFreeIndex.part.172, .-cap_untyped_cap_ptr_set_capFreeIndex.part.172
.LCOLDE273:
.LHOTE273:
	.section	.rodata.str1.4
	.align 4
.LC274:
	.string	"(capASIDBase & ~0xfffu) == ((0 && (capASIDBase & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB275:
.LHOTB275:
	.type	cap_asid_pool_cap_new.part.173, @function
cap_asid_pool_cap_new.part.173:
.LFB1068:
	.loc 11 3253 0
	.cfi_startproc
.LVL1014:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 3257 0
	pushl	$__FUNCTION__.2637
	.cfi_def_cfa_offset 20
	pushl	$3257
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC274
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1015:
	.cfi_endproc
.LFE1068:
	.size	cap_asid_pool_cap_new.part.173, .-cap_asid_pool_cap_new.part.173
.LCOLDE275:
.LHOTE275:
.LCOLDB276:
.LHOTB276:
	.type	cap_frame_cap_get_capFVMRights.isra.174.part.175, @function
cap_frame_cap_get_capFVMRights.isra.174.part.175:
.LFB1070:
	.loc 11 2968 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2970 0
	pushl	$__FUNCTION__.2530
	.cfi_def_cfa_offset 20
	pushl	$2971
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC216
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1016:
	.cfi_endproc
.LFE1070:
	.size	cap_frame_cap_get_capFVMRights.isra.174.part.175, .-cap_frame_cap_get_capFVMRights.isra.174.part.175
.LCOLDE276:
.LHOTE276:
.LCOLDB277:
	.text
.LHOTB277:
	.p2align 4,,15
	.globl	lookupIPCBuffer
	.type	lookupIPCBuffer, @function
lookupIPCBuffer:
.LFB533:
	.loc 20 99 0
	.cfi_startproc
.LVL1017:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 20 99 0
	movl	20(%esp), %ecx
	.loc 20 104 0
	movl	640(%ecx), %ebx
.LVL1018:
	.loc 20 105 0
	andl	$-1024, %ecx
	movl	64(%ecx), %edx
	movl	68(%ecx), %esi
.LVL1019:
.LBB7702:
.LBB7703:
	.loc 11 2202 0
	movl	%edx, %edi
	.loc 11 2203 0
	movl	%edx, %ecx
	movzbl	%dl, %eax
	.loc 11 2202 0
	andl	$14, %edi
	.loc 11 2203 0
	andl	$15, %ecx
	cmpl	$14, %edi
	cmovne	%ecx, %eax
.LVL1020:
.LBE7703:
.LBE7702:
	.loc 20 107 0
	cmpl	$1, %eax
	jne	.L996
.LVL1021:
.LBB7704:
.LBB7705:
	.loc 11 2970 0
	cmpl	$1, %ecx
	jne	.L1008
	.loc 11 2973 0
	movl	%edx, %eax
	andl	$50331648, %eax
	shrl	$24, %eax
.LVL1022:
.LBE7705:
.LBE7704:
	.loc 20 112 0
	cmpl	$3, %eax
	je	.L992
	.loc 20 112 0 is_stmt 0 discriminator 1
	movl	16(%esp), %ecx
	testl	%ecx, %ecx
	jne	.L996
	cmpl	$2, %eax
	jne	.L996
.L992:
.LVL1023:
.LBB7707:
.LBB7708:
.LBB7709:
	.file 59 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/hardware.h"
	.loc 59 57 0 is_stmt 1
	andl	$1073741824, %esi
.LVL1024:
	movl	$4095, %eax
	movl	$4194303, %ecx
	cmovne	%ecx, %eax
.LBE7709:
.LBE7708:
	.loc 20 118 0
	andl	$16777200, %edx
.LVL1025:
	sall	$8, %edx
	andl	%ebx, %eax
.LBE7707:
	.loc 20 122 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL1026:
.LBB7710:
	.loc 20 118 0
	addl	%edx, %eax
.LVL1027:
.LBE7710:
	.loc 20 122 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL1028:
	.p2align 4,,10
	.p2align 3
.L996:
	.cfi_restore_state
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL1029:
	.loc 20 108 0
	xorl	%eax, %eax
.LVL1030:
	.loc 20 122 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL1031:
.L1008:
	.cfi_restore_state
.LBB7711:
.LBB7706:
	call	cap_frame_cap_get_capFVMRights.isra.174.part.175
.LVL1032:
.LBE7706:
.LBE7711:
	.cfi_endproc
.LFE533:
	.size	lookupIPCBuffer, .-lookupIPCBuffer
	.section	.text.unlikely
.LCOLDE277:
	.text
.LHOTE277:
	.section	.text.unlikely
.LCOLDB278:
	.text
.LHOTB278:
	.p2align 4,,15
	.globl	handleFaultReply
	.type	handleFaultReply, @function
handleFaultReply:
.LFB389:
	.loc 47 120 0
	.cfi_startproc
.LVL1033:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 47 120 0
	movl	52(%esp), %edx
	movl	48(%esp), %ebx
.LVL1034:
.LBB7766:
.LBB7767:
	.loc 15 36 0
	movl	528(%edx), %ecx
.LVL1035:
.LBE7767:
.LBE7766:
.LBB7768:
.LBB7769:
	.loc 34 89 0
	movl	%ecx, %esi
	andl	$127, %esi
	cmpl	$120, %esi
	jbe	.L1010
.LVL1036:
.LBB7770:
.LBB7771:
	.file 60 "32/mode/api/shared_types_gen.h"
	.loc 60 125 0
	andl	$-128, %ecx
.LVL1037:
	movl	$120, %esi
	.loc 60 126 0
	orl	$120, %ecx
.LVL1038:
.L1010:
.LBE7771:
.LBE7770:
.LBE7769:
.LBE7768:
.LBB7772:
.LBB7773:
	.loc 11 1586 0
	movl	604(%ebx), %eax
.LBE7773:
.LBE7772:
.LBB7775:
.LBB7776:
	.loc 60 62 0
	shrl	$12, %ecx
.LVL1039:
	movl	%ecx, 12(%esp)
.LVL1040:
.LBE7776:
.LBE7775:
.LBB7777:
.LBB7774:
	.loc 11 1586 0
	andl	$7, %eax
.LBE7774:
.LBE7777:
	.loc 47 127 0
	cmpl	$2, %eax
	je	.L1012
	cmpl	$3, %eax
	je	.L1013
	cmpl	$1, %eax
	je	.L1034
.LVL1041:
.LBB7778:
.LBB7779:
	.loc 43 21 0
	cmpl	$5, %eax
	jne	.L1047
.LVL1042:
.L1034:
.LBE7779:
.LBE7778:
	.loc 47 189 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 47 187 0
	movl	$1, %eax
.LVL1043:
	.loc 47 189 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1044:
	.p2align 4,,10
	.p2align 3
.L1013:
	.cfi_restore_state
	.loc 47 136 0
	cmpl	$3, %esi
	cmova	%eax, %esi
.LVL1045:
.LBB7781:
.LBB7782:
	.loc 47 84 0
	movl	$2, %eax
	cmpl	$2, %esi
	cmovbe	%esi, %eax
	xorl	%edi, %edi
	testl	%eax, %eax
	je	.L1021
.LVL1046:
.LBB7783:
.LBB7784:
.LBB7785:
	.loc 15 30 0
	movl	532(%edx), %ecx
.LBE7785:
.LBE7784:
.LBE7783:
	.loc 47 84 0
	movl	$1, %edi
.LBB7790:
.LBB7788:
.LBB7786:
	.loc 15 30 0
	movl	%ecx, 556(%ebx)
.LVL1047:
.LBE7786:
.LBE7788:
.LBE7790:
	.loc 47 84 0
	cmpl	$2, %eax
	jne	.L1021
.LVL1048:
.LBB7791:
.LBB7789:
.LBB7787:
	.loc 15 30 0
	movl	536(%edx), %eax
	movl	$2, %edi
	movl	%eax, 580(%ebx)
.LVL1049:
.L1021:
.LBE7787:
.LBE7789:
.LBE7791:
	.loc 47 90 0
	cmpl	%edi, %esi
	jbe	.L1023
.LBB7792:
	.loc 47 91 0
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	%edx
	.cfi_def_cfa_offset 60
	pushl	$0
	.cfi_def_cfa_offset 64
	call	lookupIPCBuffer
.LVL1050:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.LVL1051:
	.loc 47 92 0
	testl	%eax, %eax
	je	.L1023
	leal	40(,%edi,4), %edx
	leal	-40(%eax,%edx), %ecx
	leal	fault_messages(%edx), %edi
	movl	%ecx, 8(%esp)
	leal	(%eax,%esi,4), %ebp
	jmp	.L1026
.LVL1052:
	.p2align 4,,10
	.p2align 3
.L1024:
.LBB7793:
.LBB7794:
.LBB7795:
	.loc 26 37 0
	cmpl	$16, %esi
	jne	.L1025
.LVL1053:
	andl	$3799, %eax
.LVL1054:
	.loc 26 45 0
	orl	$514, %eax
.LVL1055:
.L1025:
	addl	$4, 8(%esp)
.LBE7795:
.LBE7794:
.LBB7802:
.LBB7803:
	.loc 15 30 0
	movl	%eax, 512(%ebx,%esi,4)
.LVL1056:
	addl	$4, %edi
	movl	8(%esp), %eax
.LBE7803:
.LBE7802:
.LBE7793:
	.loc 47 93 0
	cmpl	%ebp, %eax
	je	.L1023
.LVL1057:
.L1026:
.LBB7806:
	.loc 47 94 0
	movl	(%edi), %esi
.LVL1058:
	.loc 47 95 0
	movl	8(%esp), %eax
.LBB7804:
.LBB7800:
.LBB7796:
.LBB7797:
	.loc 5 48 0
	leal	-9(%esi), %edx
.LBE7797:
.LBE7796:
.LBE7800:
.LBE7804:
	.loc 47 95 0
	movl	4(%eax), %eax
.LVL1059:
.LBB7805:
.LBB7801:
.LBB7799:
.LBB7798:
	.loc 5 48 0
	cmpl	$1, %edx
	ja	.L1024
	call	Mode_sanitiseRegister.part.55
.LVL1060:
	jmp	.L1025
.LVL1061:
	.p2align 4,,10
	.p2align 3
.L1012:
.LBE7798:
.LBE7799:
.LBE7801:
.LBE7805:
.LBE7806:
.LBE7792:
.LBE7782:
.LBE7781:
	.loc 47 132 0
	cmpl	$10, %esi
	movl	$10, %ecx
	cmova	%ecx, %esi
.LVL1062:
.LBB7807:
.LBB7808:
	.loc 47 84 0
	cmpl	$2, %esi
	cmovbe	%esi, %eax
	xorl	%edi, %edi
	testl	%eax, %eax
	je	.L1015
.LVL1063:
.LBB7809:
.LBB7810:
.LBB7811:
	.loc 15 30 0
	movl	532(%edx), %ecx
.LBE7811:
.LBE7810:
.LBE7809:
	.loc 47 84 0
	movl	$1, %edi
.LBB7816:
.LBB7814:
.LBB7812:
	.loc 15 30 0
	movl	%ecx, 512(%ebx)
.LVL1064:
.LBE7812:
.LBE7814:
.LBE7816:
	.loc 47 84 0
	cmpl	$2, %eax
	jne	.L1015
.LVL1065:
.LBB7817:
.LBB7815:
.LBB7813:
	.loc 15 30 0
	movl	536(%edx), %eax
	movl	$2, %edi
	movl	%eax, 516(%ebx)
.LVL1066:
.L1015:
.LBE7813:
.LBE7815:
.LBE7817:
	.loc 47 90 0
	cmpl	%edi, %esi
	ja	.L1048
.LVL1067:
.L1023:
.LBE7808:
.LBE7807:
	.loc 47 137 0
	movl	12(%esp), %edx
	xorl	%eax, %eax
	testl	%edx, %edx
	sete	%al
	.loc 47 189 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1068:
	.p2align 4,,10
	.p2align 3
.L1048:
	.cfi_restore_state
.LBB7830:
.LBB7829:
.LBB7818:
	.loc 47 91 0
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	%edx
	.cfi_def_cfa_offset 60
	pushl	$0
	.cfi_def_cfa_offset 64
	call	lookupIPCBuffer
.LVL1069:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.LVL1070:
	.loc 47 92 0
	testl	%eax, %eax
	je	.L1023
	leal	fault_messages(,%esi,4), %ebp
	sall	$2, %edi
	leal	fault_messages(%edi), %ecx
	movl	%ecx, 8(%esp)
	leal	4(%eax,%edi), %edi
	jmp	.L1020
.LVL1071:
	.p2align 4,,10
	.p2align 3
.L1018:
.LBB7819:
.LBB7820:
.LBB7821:
	.loc 26 37 0
	cmpl	$16, %esi
	jne	.L1019
.LVL1072:
	andl	$3799, %eax
.LVL1073:
	.loc 26 45 0
	orl	$514, %eax
.LVL1074:
.L1019:
	addl	$4, 8(%esp)
.LBE7821:
.LBE7820:
.LBB7825:
.LBB7826:
	.loc 15 30 0
	movl	%eax, 512(%ebx,%esi,4)
.LVL1075:
	addl	$4, %edi
	movl	8(%esp), %eax
.LBE7826:
.LBE7825:
.LBE7819:
	.loc 47 93 0
	cmpl	%ebp, %eax
	je	.L1023
.LVL1076:
.L1020:
.LBB7828:
	.loc 47 94 0
	movl	8(%esp), %eax
	movl	(%eax), %esi
.LVL1077:
	.loc 47 95 0
	movl	(%edi), %eax
.LVL1078:
.LBB7827:
.LBB7824:
.LBB7822:
.LBB7823:
	.loc 5 48 0
	leal	-9(%esi), %edx
	cmpl	$1, %edx
	ja	.L1018
	call	Mode_sanitiseRegister.part.55
.LVL1079:
	jmp	.L1019
.LVL1080:
.L1047:
.LBE7823:
.LBE7822:
.LBE7824:
.LBE7827:
.LBE7828:
.LBE7818:
.LBE7829:
.LBE7830:
.LBB7831:
.LBB7780:
	call	Arch_handleFaultReply.part.60
.LVL1081:
.LBE7780:
.LBE7831:
	.cfi_endproc
.LFE389:
	.size	handleFaultReply, .-handleFaultReply
	.section	.text.unlikely
.LCOLDE278:
	.text
.LHOTE278:
	.section	.rodata.str1.4
	.align 4
.LC279:
	.string	"(FSR & ~0x1fu) == ((0 && (FSR & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB280:
.LHOTB280:
	.type	seL4_Fault_VMFault_new.part.176, @function
seL4_Fault_VMFault_new.part.176:
.LFB1071:
	.loc 11 1728 0
	.cfi_startproc
.LVL1082:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1732 0
	pushl	$__FUNCTION__.2043
	.cfi_def_cfa_offset 20
	pushl	$1732
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC279
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1083:
	.cfi_endproc
.LFE1071:
	.size	seL4_Fault_VMFault_new.part.176, .-seL4_Fault_VMFault_new.part.176
.LCOLDE280:
.LHOTE280:
.LCOLDB281:
.LHOTB281:
	.type	pde_pde_pt_ptr_get_present.part.178, @function
pde_pde_pt_ptr_get_present.part.178:
.LFB1073:
	.loc 11 2026 0
	.cfi_startproc
.LVL1084:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2028 0
	pushl	$__FUNCTION__.2162
	.cfi_def_cfa_offset 20
	pushl	$2029
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC237
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1085:
	.cfi_endproc
.LFE1073:
	.size	pde_pde_pt_ptr_get_present.part.178, .-pde_pde_pt_ptr_get_present.part.178
.LCOLDE281:
.LHOTE281:
.LCOLDB282:
	.text
.LHOTB282:
	.p2align 4,,15
	.globl	lookupPTSlot
	.type	lookupPTSlot, @function
lookupPTSlot:
.LFB545:
	.loc 20 619 0
	.cfi_startproc
.LVL1086:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 20 619 0
	movl	24(%esp), %ecx
.LBB7858:
.LBB7859:
	.loc 11 1937 0
	movl	20(%esp), %edx
.LBE7859:
.LBE7858:
	.loc 20 619 0
	movl	16(%esp), %eax
.LVL1087:
.LBB7861:
.LBB7860:
	.loc 11 1937 0
	movl	%ecx, %ebx
	shrl	$22, %ebx
	movl	(%edx,%ebx,4), %edx
.LVL1088:
.LBE7860:
.LBE7861:
	.loc 20 629 0
	testb	$-128, %dl
	jne	.L1054
.LVL1089:
.LBB7862:
.LBB7863:
	.loc 11 2028 0 discriminator 1
	jne	.L1059
.LVL1090:
.LBE7863:
.LBE7862:
	.loc 20 629 0
	testb	$1, %dl
	je	.L1054
.LVL1091:
.LBB7865:
	.loc 20 646 0
	shrl	$10, %ecx
.LVL1092:
	andl	$-4096, %edx
.LVL1093:
	movl	$0, (%eax)
	andl	$4092, %ecx
	leal	-536870912(%edx,%ecx), %edx
	movl	%edx, 4(%eax)
.LVL1094:
.LBE7865:
	.loc 20 648 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL1095:
	ret	$4
.LVL1096:
	.p2align 4,,10
	.p2align 3
.L1054:
	.cfi_restore_state
.LBB7866:
.LBB7867:
	.loc 20 634 0
	movl	$2, (%eax)
	movl	$0, 4(%eax)
	.loc 20 631 0
	movl	$89, current_lookup_fault
	movl	$0, current_lookup_fault+4
.LVL1097:
.LBE7867:
.LBE7866:
	.loc 20 648 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret	$4
.LVL1098:
.L1059:
	.cfi_restore_state
.LBB7868:
.LBB7864:
	call	pde_pde_pt_ptr_get_present.part.178
.LVL1099:
.LBE7864:
.LBE7868:
	.cfi_endproc
.LFE545:
	.size	lookupPTSlot, .-lookupPTSlot
	.section	.text.unlikely
.LCOLDE282:
	.text
.LHOTE282:
	.section	.rodata.str1.4
	.align 4
.LC283:
	.string	"IS_ALIGNED(vptr, PT_INDEX_BITS + PAGE_BITS)"
	.section	.text.unlikely
.LCOLDB284:
	.text
.LHOTB284:
	.p2align 4,,15
	.globl	flushTable
	.type	flushTable, @function
flushTable:
.LFB548:
	.loc 20 688 0
	.cfi_startproc
.LVL1100:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$60, %esp
	.cfi_def_cfa_offset 80
	.loc 20 688 0
	movl	88(%esp), %ebx
	.loc 20 692 0
	testl	$4194303, 84(%esp)
	jne	.L1109
	.loc 20 695 0
	movl	ksCurThread, %eax
	andl	$-1024, %eax
	movl	16(%eax), %esi
.LVL1101:
	movl	20(%eax), %edi
.LVL1102:
.LBB7921:
.LBB7922:
.LBB7923:
.LBB7924:
	.loc 11 2202 0
	movl	%esi, %edx
	movl	%esi, %eax
	andl	$14, %edx
	.loc 11 2204 0
	movzbl	%al, %ecx
.LBE7924:
.LBE7923:
.LBB7928:
.LBB7929:
	.loc 55 287 0
	andl	$268435200, %eax
.LBE7929:
.LBE7928:
.LBB7954:
.LBB7925:
	.loc 11 2202 0
	movl	%edx, 4(%esp)
.LBE7925:
.LBE7954:
	.loc 54 389 0
	movl	%esi, %edx
.LBB7955:
.LBB7946:
	.loc 55 287 0
	sall	$4, %eax
.LBE7946:
.LBE7955:
	.loc 54 389 0
	andl	$-16, %edx
.LBB7956:
.LBB7926:
	.loc 11 2204 0
	movl	%ecx, 12(%esp)
	movl	%esi, %ecx
.LBE7926:
.LBE7956:
	.loc 54 389 0
	movl	%edx, 16(%esp)
	.loc 54 392 0
	movl	%edi, %edx
	andl	$15, %ecx
	andl	$-16, %edx
	movl	%ecx, 8(%esp)
.LBB7957:
.LBB7947:
	.loc 55 271 0
	movl	%esi, %ecx
.LBE7947:
.LBE7957:
	.loc 54 392 0
	movl	%edx, 20(%esp)
	.loc 54 398 0
	movl	%esi, %edx
.LBB7958:
.LBB7948:
	.loc 55 271 0
	andl	$16777200, %ecx
.LBE7948:
.LBE7958:
	.loc 54 398 0
	andl	$-32, %edx
.LBB7959:
.LBB7949:
	.loc 55 287 0
	movl	%eax, 44(%esp)
	.loc 55 271 0
	sall	$8, %ecx
.LBE7949:
.LBE7959:
	.loc 54 398 0
	movl	%edx, 24(%esp)
	.loc 54 401 0
	movl	%esi, %edx
	andl	$-1024, %edx
.LBB7960:
.LBB7950:
	.loc 55 271 0
	movl	%ecx, 36(%esp)
.LBE7950:
.LBE7960:
	.loc 54 401 0
	movl	%edx, 28(%esp)
.LBB7961:
.LBB7962:
.LBB7963:
.LBB7964:
.LBB7965:
.LBB7966:
	.loc 11 3437 0
	movl	%esi, %edx
	andl	$16128, %edx
	shrl	$8, %edx
.LBE7966:
.LBE7965:
.LBE7964:
.LBE7963:
.LBE7962:
.LBE7961:
	.loc 54 404 0
	movl	%edx, %eax
	andl	$31, %eax
	movl	%eax, %ecx
	movl	$-1, %eax
	addl	$1, %ecx
	sall	%cl, %eax
	cmpl	$32, %edx
	movl	$-32, %edx
	movl	8(%esp), %ecx
	cmove	%edx, %eax
	andl	%edi, %eax
	cmpl	$14, 4(%esp)
	cmove	12(%esp), %ecx
	movl	%eax, 40(%esp)
.LBE7922:
.LBE7921:
	.loc 20 697 0
	xorl	%ebp, %ebp
	movl	%ecx, 32(%esp)
.LVL1103:
	.p2align 4,,10
	.p2align 3
.L1085:
	.loc 20 698 0
	testb	$1, (%ebx,%ebp,4)
	je	.L1062
	.loc 20 699 0
	subl	$8, %esp
	.cfi_def_cfa_offset 88
	pushl	%edi
	.cfi_def_cfa_offset 92
.LVL1104:
	pushl	%esi
	.cfi_def_cfa_offset 96
	call	isValidNativeRoot
.LVL1105:
	addl	$16, %esp
	.cfi_def_cfa_offset 80
	testl	%eax, %eax
	je	.L1062
.LVL1106:
.LBB7993:
.LBB7989:
.LBB7967:
.LBB7927:
	.loc 11 2202 0 discriminator 1
	cmpl	$14, 4(%esp)
	je	.L1063
.LVL1107:
.LBE7927:
.LBE7967:
	.loc 54 387 0
	movl	8(%esp), %eax
	cmpl	$14, %eax
	ja	.L1064
	jmp	*.L1066(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L1066:
	.long	.L1064
	.long	.L1064
	.long	.L1090
	.long	.L1064
	.long	.L1067
	.long	.L1064
	.long	.L1090
	.long	.L1064
	.long	.L1093
	.long	.L1064
	.long	.L1069
	.long	.L1064
	.long	.L1070
	.long	.L1064
	.long	.L1093
	.text
.L1074:
.LVL1108:
.LBB7968:
.LBB7969:
	.loc 11 2576 0
	cmpl	$6, 8(%esp)
	jne	.L1110
.LVL1109:
	.p2align 4,,10
	.p2align 3
.L1090:
.LBE7969:
.LBE7968:
	.loc 54 395 0
	movl	16(%esp), %eax
.L1065:
.LVL1110:
.LBE7989:
.LBE7993:
	.loc 20 699 0
	cmpl	%eax, 80(%esp)
	je	.L1111
.LVL1111:
	.p2align 4,,10
	.p2align 3
.L1062:
	.loc 20 697 0 discriminator 2
	addl	$1, %ebp
.LVL1112:
	cmpl	$1024, %ebp
	jne	.L1085
	.loc 20 705 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL1113:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL1114:
	ret
.LVL1115:
	.p2align 4,,10
	.p2align 3
.L1093:
	.cfi_restore_state
.LBB7994:
.LBB7990:
.LBB7971:
.LBB7951:
	.loc 55 280 0
	xorl	%eax, %eax
.LVL1116:
.LBE7951:
.LBE7971:
.LBE7990:
.LBE7994:
	.loc 20 699 0
	cmpl	%eax, 80(%esp)
	jne	.L1062
	.p2align 4,,10
	.p2align 3
.L1111:
.LVL1117:
.LBB7995:
.LBB7996:
.LBB7997:
.LBB7998:
	.loc 50 45 0
	movl	%ebp, %eax
	sall	$12, %eax
	addl	84(%esp), %eax
#APP
# 45 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine.h" 1
	invlpg (%eax)
# 0 "" 2
.LVL1118:
#NO_APP
	jmp	.L1062
.LVL1119:
.L1077:
.LBE7998:
.LBE7997:
.LBE7996:
.LBE7995:
.LBB7999:
.LBB7991:
.LBB7972:
.LBB7973:
	.loc 11 2768 0
	cmpl	$12, 8(%esp)
	jne	.L1112
.LVL1120:
.L1070:
.LBE7973:
.LBE7972:
	.loc 54 401 0
	movl	28(%esp), %eax
	jmp	.L1065
.LVL1121:
.L1073:
.LBB7975:
.LBB7976:
	.loc 11 2358 0
	cmpl	$4, 8(%esp)
	jne	.L1113
.LVL1122:
.L1067:
.LBE7976:
.LBE7975:
	.loc 54 392 0
	movl	20(%esp), %eax
	jmp	.L1065
.LVL1123:
.L1076:
.LBB7978:
.LBB7979:
	.loc 11 2738 0
	cmpl	$10, 8(%esp)
	jne	.L1114
.LVL1124:
.L1069:
.LBE7979:
.LBE7978:
	.loc 54 398 0
	movl	24(%esp), %eax
	jmp	.L1065
.LVL1125:
	.p2align 4,,10
	.p2align 3
.L1064:
.LBB7981:
.LBB7952:
	.loc 55 268 0
	movl	32(%esp), %eax
	cmpl	$31, %eax
	ja	.L1078
	jmp	*.L1080(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L1080:
	.long	.L1078
	.long	.L1079
	.long	.L1078
	.long	.L1081
	.long	.L1078
	.long	.L1082
	.long	.L1078
	.long	.L1078
	.long	.L1078
	.long	.L1093
	.long	.L1078
	.long	.L1083
	.long	.L1078
	.long	.L1093
	.long	.L1078
	.long	.L1084
	.long	.L1078
	.long	.L1078
	.long	.L1078
	.long	.L1078
	.long	.L1078
	.long	.L1078
	.long	.L1078
	.long	.L1078
	.long	.L1078
	.long	.L1078
	.long	.L1078
	.long	.L1078
	.long	.L1078
	.long	.L1078
	.long	.L1078
	.long	.L1093
	.text
.LVL1126:
	.p2align 4,,10
	.p2align 3
.L1063:
.LBE7952:
.LBE7981:
	.loc 54 387 0
	movl	12(%esp), %eax
	cmpl	$62, %eax
	ja	.L1064
	jmp	*.L1072(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L1072:
	.long	.L1064
	.long	.L1064
	.long	.L1071
	.long	.L1064
	.long	.L1073
	.long	.L1064
	.long	.L1074
	.long	.L1064
	.long	.L1093
	.long	.L1064
	.long	.L1076
	.long	.L1064
	.long	.L1077
	.long	.L1064
	.long	.L1093
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1093
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1087
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1064
	.long	.L1093
	.text
.L1087:
	.loc 54 404 0
	movl	40(%esp), %eax
	jmp	.L1065
.L1071:
.LVL1127:
.LBB7982:
.LBB7983:
	.loc 11 2320 0
	cmpl	$2, 8(%esp)
	je	.L1090
	call	cap_untyped_cap_get_capPtr.isra.115.part.116
.LVL1128:
	.p2align 4,,10
	.p2align 3
.L1083:
.LBE7983:
.LBE7982:
.LBB7984:
.LBB7953:
.LBB7930:
.LBB7931:
	.loc 11 3287 0
	cmpl	$11, 8(%esp)
	jne	.L1115
.LVL1129:
.L1098:
.LBE7931:
.LBE7930:
	.loc 55 294 0
	movl	36(%esp), %eax
	jmp	.L1065
.L1084:
.LVL1130:
.LBB7933:
.LBB7934:
	.loc 11 3590 0
	cmpl	$15, 12(%esp)
	jne	.L1116
.LBE7934:
.LBE7933:
	.loc 55 287 0
	movl	44(%esp), %eax
	jmp	.L1065
.LVL1131:
.L1082:
.LBB7936:
.LBB7937:
	.loc 11 3227 0
	cmpl	$5, 8(%esp)
	je	.L1098
	call	cap_page_directory_cap_get_capPDBasePtr.isra.129.part.130
.LVL1132:
	.p2align 4,,10
	.p2align 3
.L1081:
.LBE7937:
.LBE7936:
.LBB7938:
.LBB7939:
	.loc 11 3123 0
	cmpl	$3, 8(%esp)
	je	.L1098
	call	cap_page_table_cap_get_capPTBasePtr.isra.127.part.128
.LVL1133:
	.p2align 4,,10
	.p2align 3
.L1079:
.LBE7939:
.LBE7938:
.LBB7940:
.LBB7941:
	.loc 11 2996 0
	cmpl	$1, 8(%esp)
	je	.L1098
	call	cap_frame_cap_get_capFBasePtr.isra.125.part.126
.LVL1134:
	.p2align 4,,10
	.p2align 3
.L1078:
.LBE7941:
.LBE7940:
.LBB7942:
.LBB7943:
	.loc 46 134 0
	pushl	$__func__.3040
	.cfi_remember_state
	.cfi_def_cfa_offset 84
	pushl	$134
	.cfi_def_cfa_offset 88
	pushl	$.LC145
	.cfi_def_cfa_offset 92
	pushl	$.LC226
	.cfi_def_cfa_offset 96
	call	_fail
.LVL1135:
.L1115:
	.cfi_restore_state
.LBE7943:
.LBE7942:
.LBB7944:
.LBB7932:
	call	cap_asid_pool_cap_get_capASIDPool.isra.134.part.135
.LVL1136:
.L1116:
.LBE7932:
.LBE7944:
.LBB7945:
.LBB7935:
	call	cap_io_page_table_cap_get_capIOPTBasePtr.isra.132.part.133
.LVL1137:
.L1109:
.LBE7935:
.LBE7945:
.LBE7953:
.LBE7984:
.LBE7991:
.LBE7999:
.LBB8000:
.LBB8001:
	.loc 20 692 0
	pushl	$__FUNCTION__.7102
	.cfi_remember_state
	.cfi_def_cfa_offset 84
.LVL1138:
	pushl	$692
	.cfi_def_cfa_offset 88
	pushl	$.LC138
	.cfi_def_cfa_offset 92
	pushl	$.LC283
	.cfi_def_cfa_offset 96
	call	_assert_fail
.LVL1139:
.L1113:
	.cfi_restore_state
.LBE8001:
.LBE8000:
.LBB8002:
.LBB7992:
.LBB7985:
.LBB7977:
	call	cap_endpoint_cap_get_capEPPtr.part.117
.LVL1140:
.L1110:
.LBE7977:
.LBE7985:
.LBB7986:
.LBB7970:
	call	cap_notification_cap_get_capNtfnPtr.isra.97.part.98
.LVL1141:
.L1114:
.LBE7970:
.LBE7986:
.LBB7987:
.LBB7980:
	call	cap_cnode_cap_get_capCNodePtr.isra.118.part.119
.LVL1142:
.L1112:
.LBE7980:
.LBE7987:
.LBB7988:
.LBB7974:
	call	cap_thread_cap_get_capTCBPtr.isra.89.part.90
.LVL1143:
.LBE7974:
.LBE7988:
.LBE7992:
.LBE8002:
	.cfi_endproc
.LFE548:
	.size	flushTable, .-flushTable
	.section	.text.unlikely
.LCOLDE284:
	.text
.LHOTE284:
	.section	.text.unlikely
.LCOLDB285:
.LHOTB285:
	.type	cap_frame_cap_set_capFMappedAddress.part.182, @function
cap_frame_cap_set_capFMappedAddress.part.182:
.LFB1077:
	.loc 11 2864 0
	.cfi_startproc
.LVL1144:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2865 0
	pushl	$__FUNCTION__.2490
	.cfi_def_cfa_offset 20
	pushl	$2866
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC216
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1145:
	.cfi_endproc
.LFE1077:
	.size	cap_frame_cap_set_capFMappedAddress.part.182, .-cap_frame_cap_set_capFMappedAddress.part.182
.LCOLDE285:
.LHOTE285:
	.section	.rodata.str1.4
	.align 4
.LC286:
	.string	"32/mode/api/shared_types_gen.h"
	.align 4
.LC287:
	.string	"(label & ~0xfffffu) == ((0 && (label & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB288:
.LHOTB288:
	.type	seL4_MessageInfo_new.part.184, @function
seL4_MessageInfo_new.part.184:
.LFB1079:
	.loc 60 41 0
	.cfi_startproc
.LVL1146:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 60 45 0
	pushl	$__FUNCTION__.1119
	.cfi_def_cfa_offset 20
	pushl	$45
	.cfi_def_cfa_offset 24
	pushl	$.LC286
	.cfi_def_cfa_offset 28
	pushl	$.LC287
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1147:
	.cfi_endproc
.LFE1079:
	.size	seL4_MessageInfo_new.part.184, .-seL4_MessageInfo_new.part.184
.LCOLDE288:
.LHOTE288:
.LCOLDB289:
.LHOTB289:
	.type	cap_page_table_cap_get_capPTMappedASID.part.185, @function
cap_page_table_cap_get_capPTMappedASID.part.185:
.LFB1080:
	.loc 11 3069 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 3071 0
	pushl	$__FUNCTION__.2568
	.cfi_def_cfa_offset 20
	pushl	$3072
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC218
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1148:
	.cfi_endproc
.LFE1080:
	.size	cap_page_table_cap_get_capPTMappedASID.part.185, .-cap_page_table_cap_get_capPTMappedASID.part.185
.LCOLDE289:
.LHOTE289:
.LCOLDB290:
	.text
.LHOTB290:
	.p2align 4,,15
	.type	cap_cnode_cap_get_capCNodeRadix.part.187, @function
cap_cnode_cap_get_capCNodeRadix.part.187:
.LFB1082:
	.loc 11 2696 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2698 0
	pushl	$__FUNCTION__.2428
	.cfi_def_cfa_offset 20
	pushl	$2699
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC211
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1149:
	.cfi_endproc
.LFE1082:
	.size	cap_cnode_cap_get_capCNodeRadix.part.187, .-cap_cnode_cap_get_capCNodeRadix.part.187
	.section	.text.unlikely
.LCOLDE290:
	.text
.LHOTE290:
	.section	.text.unlikely
.LCOLDB291:
.LHOTB291:
	.type	cap_untyped_cap_get_capIsDevice.part.188, @function
cap_untyped_cap_get_capIsDevice.part.188:
.LFB1083:
	.loc 11 2290 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2292 0
	pushl	$__FUNCTION__.2276
	.cfi_def_cfa_offset 20
	pushl	$2293
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC208
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1150:
	.cfi_endproc
.LFE1083:
	.size	cap_untyped_cap_get_capIsDevice.part.188, .-cap_untyped_cap_get_capIsDevice.part.188
.LCOLDE291:
.LHOTE291:
.LCOLDB292:
.LHOTB292:
	.type	cap_asid_pool_cap_get_capASIDBase.part.189, @function
cap_asid_pool_cap_get_capASIDBase.part.189:
.LFB1084:
	.loc 11 3271 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 3273 0
	pushl	$__FUNCTION__.2642
	.cfi_def_cfa_offset 20
	pushl	$3274
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC224
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1151:
	.cfi_endproc
.LFE1084:
	.size	cap_asid_pool_cap_get_capASIDBase.part.189, .-cap_asid_pool_cap_get_capASIDBase.part.189
.LCOLDE292:
.LHOTE292:
	.section	.rodata.str1.4
	.align 4
.LC293:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/machine/hardware.c"
	.section	.rodata.str1.1
.LC294:
	.string	"size_bits < seL4_WordBits"
	.section	.rodata.str1.4
	.align 4
.LC295:
	.string	"IS_ALIGNED((word_t)vaddr, size_bits)"
	.section	.text.unlikely
.LCOLDB296:
	.text
.LHOTB296:
	.p2align 4,,15
	.globl	flushCacheRange
	.type	flushCacheRange, @function
flushCacheRange:
.LFB596:
	.loc 25 75 0
	.cfi_startproc
.LVL1152:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	.loc 25 75 0
	movl	20(%esp), %ecx
	movl	16(%esp), %edx
	.loc 25 78 0
	cmpl	$31, %ecx
	ja	.L1139
	.loc 25 79 0
	movl	$1, %ebx
	sall	%cl, %ebx
	leal	-1(%ebx), %eax
	testl	%eax, %edx
	jne	.L1140
.LBB8017:
.LBB8018:
	.loc 10 300 0
#APP
# 300 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine.h" 1
	mfence
# 0 "" 2
#NO_APP
.LBE8018:
.LBE8017:
	.loc 25 83 0
	movl	x86KScacheLineSizeBits, %ecx
	movl	%edx, %eax
	.loc 25 84 0
	addl	%edx, %ebx
	.loc 25 85 0
	movl	$1, %esi
	.loc 25 83 0
	shrl	%cl, %eax
	sall	%cl, %eax
.LVL1153:
	cmpl	%ebx, %eax
	jnb	.L1134
	.p2align 4,,10
	.p2align 3
.L1135:
.LVL1154:
.LBB8019:
.LBB8020:
	.loc 59 102 0
#APP
# 102 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/hardware.h" 1
	clflush (%eax)
# 0 "" 2
.LVL1155:
#NO_APP
.LBE8020:
.LBE8019:
	.loc 25 85 0
	movl	x86KScacheLineSizeBits, %ecx
	movl	%esi, %edx
	sall	%cl, %edx
	addl	%edx, %eax
.LVL1156:
	.loc 25 83 0
	cmpl	%ebx, %eax
	jb	.L1135
.L1134:
.LBB8021:
.LBB8022:
	.loc 10 300 0
#APP
# 300 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine.h" 1
	mfence
# 0 "" 2
#NO_APP
.LBE8022:
.LBE8021:
	.loc 25 89 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL1157:
.L1139:
	.cfi_restore_state
.LBB8023:
.LBB8024:
	.loc 25 78 0
	pushl	$__FUNCTION__.7543
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$78
	.cfi_def_cfa_offset 24
	pushl	$.LC293
	.cfi_def_cfa_offset 28
	pushl	$.LC294
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1158:
.L1140:
	.cfi_restore_state
.LBE8024:
.LBE8023:
	.loc 25 79 0 discriminator 1
	pushl	$__FUNCTION__.7543
	.cfi_def_cfa_offset 20
	pushl	$79
	.cfi_def_cfa_offset 24
	pushl	$.LC293
	.cfi_def_cfa_offset 28
	pushl	$.LC295
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1159:
	.cfi_endproc
.LFE596:
	.size	flushCacheRange, .-flushCacheRange
	.section	.text.unlikely
.LCOLDE296:
	.text
.LHOTE296:
	.section	.rodata.str1.4
	.align 4
.LC297:
	.string	"((cap.words[0] >> 0) & 0xff) == cap_io_port_cap"
	.section	.text.unlikely
.LCOLDB298:
.LHOTB298:
	.type	cap_io_port_cap_get_capIOPortFirstPort.part.194, @function
cap_io_port_cap_get_capIOPortFirstPort.part.194:
.LFB1089:
	.loc 11 3620 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 3622 0
	pushl	$__FUNCTION__.2769
	.cfi_def_cfa_offset 20
	pushl	$3623
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC297
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1160:
	.cfi_endproc
.LFE1089:
	.size	cap_io_port_cap_get_capIOPortFirstPort.part.194, .-cap_io_port_cap_get_capIOPortFirstPort.part.194
.LCOLDE298:
.LHOTE298:
.LCOLDB299:
.LHOTB299:
	.type	cap_io_port_cap_get_capIOPortLastPort.part.195, @function
cap_io_port_cap_get_capIOPortLastPort.part.195:
.LFB1090:
	.loc 11 3634 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 3636 0
	pushl	$__FUNCTION__.2774
	.cfi_def_cfa_offset 20
	pushl	$3637
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC297
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1161:
	.cfi_endproc
.LFE1090:
	.size	cap_io_port_cap_get_capIOPortLastPort.part.195, .-cap_io_port_cap_get_capIOPortLastPort.part.195
.LCOLDE299:
.LHOTE299:
	.section	.rodata.str1.4
	.align 4
.LC300:
	.string	"((cap.words[0] >> 0) & 0xf) == cap_io_space_cap"
	.section	.text.unlikely
.LCOLDB301:
.LHOTB301:
	.type	cap_io_space_cap_get_capPCIDevice.part.197, @function
cap_io_space_cap_get_capPCIDevice.part.197:
.LFB1092:
	.loc 11 3331 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 3333 0
	pushl	$__FUNCTION__.2663
	.cfi_def_cfa_offset 20
	pushl	$3334
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC300
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1162:
	.cfi_endproc
.LFE1092:
	.size	cap_io_space_cap_get_capPCIDevice.part.197, .-cap_io_space_cap_get_capPCIDevice.part.197
.LCOLDE301:
.LHOTE301:
.LCOLDB302:
	.text
.LHOTB302:
	.p2align 4,,15
	.globl	Arch_sameRegionAs
	.type	Arch_sameRegionAs, @function
Arch_sameRegionAs:
.LFB626:
	.loc 28 307 0
	.cfi_startproc
.LVL1163:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	.loc 28 307 0
	movl	32(%esp), %ecx
	movl	36(%esp), %ebx
	movl	40(%esp), %edx
.LVL1164:
	movl	44(%esp), %esi
.LVL1165:
.LBB8089:
.LBB8090:
	.loc 11 2202 0
	movl	%ecx, %ebp
	.loc 11 2203 0
	movl	%ecx, %edi
	movzbl	%cl, %eax
.LVL1166:
	.loc 11 2202 0
	andl	$14, %ebp
	.loc 11 2203 0
	andl	$15, %edi
	cmpl	$14, %ebp
.LVL1167:
	cmovne	%edi, %eax
.LVL1168:
.LBE8090:
.LBE8089:
	.loc 28 308 0
	cmpl	$31, %eax
	ja	.L1191
	jmp	*.L1152(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L1152:
	.long	.L1191
	.long	.L1151
	.long	.L1191
	.long	.L1153
	.long	.L1191
	.long	.L1154
	.long	.L1191
	.long	.L1191
	.long	.L1191
	.long	.L1155
	.long	.L1191
	.long	.L1156
	.long	.L1191
	.long	.L1157
	.long	.L1191
	.long	.L1158
	.long	.L1191
	.long	.L1191
	.long	.L1191
	.long	.L1191
	.long	.L1191
	.long	.L1191
	.long	.L1191
	.long	.L1191
	.long	.L1191
	.long	.L1191
	.long	.L1191
	.long	.L1191
	.long	.L1191
	.long	.L1191
	.long	.L1191
	.long	.L1159
	.text
	.p2align 4,,10
	.p2align 3
.L1159:
.LVL1169:
.LBB8091:
.LBB8092:
	.loc 11 2202 0
	movl	%edx, %edi
.LBE8092:
.LBE8091:
	.loc 28 414 0
	xorl	%eax, %eax
.LBB8094:
.LBB8093:
	.loc 11 2202 0
	andl	$14, %edi
	cmpl	$14, %edi
	je	.L1205
.LVL1170:
.L1150:
.LBE8093:
.LBE8094:
	.loc 28 415 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL1171:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1172:
	.p2align 4,,10
	.p2align 3
.L1151:
	.cfi_restore_state
.LBB8095:
.LBB8096:
	.loc 11 2202 0
	movl	%edx, %eax
	.loc 11 2203 0
	movl	%edx, %ebp
	movzbl	%dl, %edi
.LVL1173:
	.loc 11 2202 0
	andl	$14, %eax
	.loc 11 2203 0
	andl	$15, %ebp
	cmpl	$14, %eax
	cmovne	%ebp, %edi
.LVL1174:
.LBE8096:
.LBE8095:
	.loc 28 414 0
	xorl	%eax, %eax
	.loc 28 310 0
	cmpl	$1, %edi
	jne	.L1150
.LVL1175:
.LBB8097:
.LBB8098:
.LBB8099:
	.loc 11 2996 0
	movl	%ecx, %eax
	andl	$15, %eax
	cmpl	$1, %eax
	jne	.L1163
.LVL1176:
.LBE8099:
.LBE8098:
.LBB8102:
.LBB8103:
	cmpl	$1, %ebp
	jne	.L1163
.LVL1177:
.LBE8103:
.LBE8102:
.LBB8105:
.LBB8106:
	.loc 59 57 0
	movl	$4096, %edi
	andl	$1073741824, %ebx
.LVL1178:
	movl	$4194304, %eax
	movl	%edi, %ebx
	cmovne	%eax, %ebx
.LBE8106:
.LBE8105:
.LBB8107:
.LBB8100:
	.loc 11 2999 0
	andl	$16777200, %ecx
.LVL1179:
	sall	$8, %ecx
.LBE8100:
.LBE8107:
.LBB8108:
.LBB8109:
	.loc 59 57 0
	andl	$1073741824, %esi
	cmove	%edi, %eax
.LVL1180:
.LBE8109:
.LBE8108:
.LBB8110:
.LBB8104:
	.loc 11 2999 0
	andl	$16777200, %edx
.LVL1181:
	sall	$8, %edx
.LBE8104:
.LBE8110:
	.loc 28 315 0
	leal	-1(%edx,%eax), %esi
	.loc 28 314 0
	leal	-1(%ecx,%ebx), %ebx
.LVL1182:
	.loc 28 316 0
	cmpl	%esi, %ebx
	setnb	%bl
.LVL1183:
	cmpl	%edx, %esi
	setnb	%al
	andl	%ebx, %eax
	cmpl	%ecx, %edx
	setnb	%dl
	movzbl	%dl, %edx
	andl	%edx, %eax
	jmp	.L1150
.LVL1184:
	.p2align 4,,10
	.p2align 3
.L1153:
.LBE8097:
.LBB8112:
.LBB8113:
	.loc 11 2202 0
	movl	%edx, %eax
	.loc 11 2203 0
	movl	%edx, %esi
.LVL1185:
	movzbl	%dl, %ebx
	.loc 11 2202 0
	andl	$14, %eax
	.loc 11 2203 0
	andl	$15, %esi
	cmpl	$14, %eax
	cmovne	%esi, %ebx
.LVL1186:
.LBE8113:
.LBE8112:
	.loc 28 414 0
	xorl	%eax, %eax
	.loc 28 321 0
	cmpl	$3, %ebx
	jne	.L1150
.LVL1187:
.LBB8114:
.LBB8115:
	.loc 11 3123 0
	movl	%ecx, %eax
	andl	$15, %eax
	cmpl	$3, %eax
	jne	.L1171
	.loc 11 3126 0
	andl	$16777200, %ecx
.LVL1188:
	sall	$8, %ecx
.LVL1189:
.LBE8115:
.LBE8114:
.LBB8117:
.LBB8118:
	.loc 11 3123 0
	cmpl	$3, %esi
	je	.L1204
.LVL1190:
.L1171:
.LBE8118:
.LBE8117:
.LBB8119:
.LBB8116:
	call	cap_page_table_cap_get_capPTBasePtr.isra.127.part.128
.LVL1191:
	.p2align 4,,10
	.p2align 3
.L1154:
.LBE8116:
.LBE8119:
.LBB8120:
.LBB8121:
	.loc 11 2202 0
	movl	%edx, %eax
	.loc 11 2203 0
	movl	%edx, %esi
.LVL1192:
	movzbl	%dl, %ebx
	.loc 11 2202 0
	andl	$14, %eax
	.loc 11 2203 0
	andl	$15, %esi
	cmpl	$14, %eax
	cmovne	%esi, %ebx
.LVL1193:
.LBE8121:
.LBE8120:
	.loc 28 414 0
	xorl	%eax, %eax
	.loc 28 328 0
	cmpl	$5, %ebx
	jne	.L1150
.LVL1194:
.LBB8122:
.LBB8123:
	.loc 11 3227 0
	movl	%ecx, %eax
	andl	$15, %eax
	cmpl	$5, %eax
	jne	.L1175
	.loc 11 3230 0
	andl	$16777200, %ecx
.LVL1195:
	sall	$8, %ecx
.LVL1196:
.LBE8123:
.LBE8122:
.LBB8125:
.LBB8126:
	.loc 11 3227 0
	cmpl	$5, %esi
	je	.L1204
.LVL1197:
.L1175:
.LBE8126:
.LBE8125:
.LBB8127:
.LBB8124:
	call	cap_page_directory_cap_get_capPDBasePtr.isra.129.part.130
.LVL1198:
	.p2align 4,,10
	.p2align 3
.L1155:
.LBE8124:
.LBE8127:
.LBB8128:
.LBB8129:
	.loc 11 2202 0
	movl	%edx, %ecx
	.loc 11 2203 0
	movl	%edx, %eax
	movzbl	%dl, %edx
	.loc 11 2202 0
	andl	$14, %ecx
	.loc 11 2203 0
	andl	$15, %eax
	cmpl	$14, %ecx
	cmovne	%eax, %edx
.LVL1199:
.LBE8129:
.LBE8128:
.LBB8130:
	.loc 28 316 0
	xorl	%eax, %eax
	cmpl	$9, %edx
	sete	%al
.LBE8130:
	.loc 28 415 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1200:
	.p2align 4,,10
	.p2align 3
.L1156:
	.cfi_restore_state
.LBB8131:
.LBB8132:
	.loc 11 2202 0
	movl	%edx, %eax
	.loc 11 2203 0
	movl	%edx, %esi
.LVL1201:
	movzbl	%dl, %ebx
	.loc 11 2202 0
	andl	$14, %eax
	.loc 11 2203 0
	andl	$15, %esi
	cmpl	$14, %eax
	cmovne	%esi, %ebx
.LVL1202:
.LBE8132:
.LBE8131:
	.loc 28 414 0
	xorl	%eax, %eax
	.loc 28 341 0
	cmpl	$11, %ebx
	jne	.L1150
.LVL1203:
.LBB8133:
.LBB8134:
	.loc 11 3287 0
	movl	%ecx, %eax
	andl	$15, %eax
	cmpl	$11, %eax
	jne	.L1181
	.loc 11 3290 0
	andl	$16777200, %ecx
.LVL1204:
	sall	$8, %ecx
.LVL1205:
.LBE8134:
.LBE8133:
.LBB8136:
.LBB8137:
	.loc 11 3287 0
	cmpl	$11, %esi
	jne	.L1181
.LVL1206:
.L1204:
.LBE8137:
.LBE8136:
	.loc 28 342 0
	andl	$16777200, %edx
	xorl	%eax, %eax
	sall	$8, %edx
	cmpl	%ecx, %edx
	sete	%al
	jmp	.L1150
.LVL1207:
	.p2align 4,,10
	.p2align 3
.L1157:
.LBB8138:
.LBB8139:
	.loc 11 2202 0
	movl	%edx, %eax
	.loc 11 2203 0
	movl	%edx, %edi
	movzbl	%dl, %edx
	.loc 11 2202 0
	andl	$14, %eax
	.loc 11 2203 0
	andl	$15, %edi
	cmpl	$14, %eax
	cmovne	%edi, %edx
.LVL1208:
.LBE8139:
.LBE8138:
	.loc 28 414 0
	xorl	%eax, %eax
	.loc 28 360 0
	cmpl	$13, %edx
	jne	.L1150
.LVL1209:
.LBB8140:
.LBB8141:
	.loc 11 3333 0
	andl	$15, %ecx
.LVL1210:
	cmpl	$13, %ecx
	jne	.L1186
	.loc 11 3336 0
	movzwl	%bx, %ebx
.LVL1211:
.LBE8141:
.LBE8140:
.LBB8143:
.LBB8144:
	.loc 11 3333 0
	cmpl	$13, %edi
	jne	.L1186
.LBE8144:
.LBE8143:
	.loc 28 361 0
	movzwl	%si, %esi
.LVL1212:
	xorl	%eax, %eax
	cmpl	%ebx, %esi
	sete	%al
	jmp	.L1150
.LVL1213:
	.p2align 4,,10
	.p2align 3
.L1158:
.LBB8145:
.LBB8146:
	.loc 11 2202 0
	movl	%edx, %eax
	.loc 11 2203 0
	movl	%edx, %ebx
	movzbl	%dl, %esi
.LVL1214:
	.loc 11 2202 0
	andl	$14, %eax
	.loc 11 2203 0
	andl	$15, %ebx
	cmpl	$14, %eax
	cmove	%esi, %ebx
.LVL1215:
.LBE8146:
.LBE8145:
	.loc 28 414 0
	xorl	%eax, %eax
	.loc 28 367 0
	cmpl	$15, %ebx
	jne	.L1150
.LVL1216:
.LBB8147:
.LBB8148:
	.loc 11 3590 0
	cmpb	$15, %cl
	jne	.L1190
	.loc 11 3593 0
	andl	$268435200, %ecx
.LVL1217:
	sall	$4, %ecx
.LVL1218:
.LBE8148:
.LBE8147:
.LBB8150:
.LBB8151:
	.loc 11 3590 0
	cmpl	$15, %esi
	jne	.L1190
.LVL1219:
.LBE8151:
.LBE8150:
	.loc 28 368 0
	andl	$268435200, %edx
	xorl	%eax, %eax
	sall	$4, %edx
	cmpl	%ecx, %edx
	sete	%al
	jmp	.L1150
.LVL1220:
	.p2align 4,,10
	.p2align 3
.L1191:
	.loc 28 414 0
	xorl	%eax, %eax
	jmp	.L1150
.LVL1221:
	.p2align 4,,10
	.p2align 3
.L1205:
	.loc 28 348 0
	cmpb	$31, %dl
	jne	.L1150
.LVL1222:
.LBB8152:
.LBB8153:
.LBB8154:
	.loc 11 3622 0
	cmpb	$31, %cl
	jne	.L1206
.LVL1223:
.LBE8154:
.LBE8153:
	.loc 28 354 0
	movl	%esi, %edx
.LVL1224:
	movl	%ebx, %eax
	shrl	$16, %edx
	shrl	$16, %eax
	cmpl	%eax, %edx
	setnb	%al
	xorl	%edx, %edx
	cmpw	%si, %bx
	setnb	%dl
	andl	%edx, %eax
	jmp	.L1150
.LVL1225:
.L1190:
.LBE8152:
.LBB8157:
.LBB8149:
	call	cap_io_page_table_cap_get_capIOPTBasePtr.isra.132.part.133
.LVL1226:
.L1181:
.LBE8149:
.LBE8157:
.LBB8158:
.LBB8135:
	call	cap_asid_pool_cap_get_capASIDPool.isra.134.part.135
.LVL1227:
.L1163:
.LBE8135:
.LBE8158:
.LBB8159:
.LBB8111:
.LBB8101:
	call	cap_frame_cap_get_capFBasePtr.isra.125.part.126
.LVL1228:
.L1186:
.LBE8101:
.LBE8111:
.LBE8159:
.LBB8160:
.LBB8142:
	call	cap_io_space_cap_get_capPCIDevice.part.197
.LVL1229:
.L1206:
.LBE8142:
.LBE8160:
.LBB8161:
.LBB8156:
.LBB8155:
	call	cap_io_port_cap_get_capIOPortFirstPort.part.194
.LVL1230:
.LBE8155:
.LBE8156:
.LBE8161:
	.cfi_endproc
.LFE626:
	.size	Arch_sameRegionAs, .-Arch_sameRegionAs
	.section	.text.unlikely
.LCOLDE302:
	.text
.LHOTE302:
	.section	.text.unlikely
.LCOLDB303:
	.text
.LHOTB303:
	.p2align 4,,15
	.globl	Arch_sameObjectAs
	.type	Arch_sameObjectAs, @function
Arch_sameObjectAs:
.LFB627:
	.loc 28 418 0
	.cfi_startproc
.LVL1231:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	.loc 28 418 0
	movl	32(%esp), %edx
	movl	36(%esp), %esi
	movl	40(%esp), %eax
.LVL1232:
	movl	44(%esp), %edi
.LVL1233:
.LBB8162:
.LBB8163:
	.loc 11 2202 0
	movl	%edx, %ebx
.LBE8163:
.LBE8162:
.LBB8167:
.LBB8168:
	.loc 11 2203 0
	movl	%edx, %ecx
.LBE8168:
.LBE8167:
.LBB8170:
.LBB8164:
	.loc 11 2202 0
	andl	$14, %ebx
.LBE8164:
.LBE8170:
.LBB8171:
.LBB8169:
	.loc 11 2203 0
	andl	$15, %ecx
.LBE8169:
.LBE8171:
.LBB8172:
.LBB8165:
	.loc 11 2202 0
	cmpl	$14, %ebx
	je	.L1221
.LVL1234:
.L1209:
.LBE8165:
.LBE8172:
	.loc 28 422 0
	cmpl	$1, %ecx
	je	.L1222
.L1213:
	.loc 28 430 0
	movl	%edi, 44(%esp)
	movl	%esi, 36(%esp)
	movl	%eax, 40(%esp)
	movl	%edx, 32(%esp)
	.loc 28 431 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL1235:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 28 430 0
	jmp	Arch_sameRegionAs
.LVL1236:
	.p2align 4,,10
	.p2align 3
.L1221:
	.cfi_restore_state
.LBB8173:
.LBB8166:
	.loc 11 2204 0
	movzbl	%dl, %ecx
.LVL1237:
.LBE8166:
.LBE8173:
	.loc 28 419 0
	cmpl	$31, %ecx
	jne	.L1209
.LVL1238:
.LBB8174:
.LBB8175:
	.loc 11 2202 0
	movl	%eax, %ecx
	.loc 11 2203 0
	movl	%eax, %edx
.LVL1239:
	movzbl	%al, %eax
	.loc 11 2202 0
	andl	$14, %ecx
	.loc 11 2203 0
	andl	$15, %edx
	cmpl	$14, %ecx
	cmovne	%edx, %eax
.LVL1240:
.LBE8175:
.LBE8174:
	.loc 28 420 0
	cmpl	$31, %eax
	sete	%al
	movzbl	%al, %eax
.L1212:
	.loc 28 431 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1241:
	.p2align 4,,10
	.p2align 3
.L1222:
	.cfi_restore_state
.LBB8176:
.LBB8177:
	.loc 11 2202 0
	movl	%eax, %ebp
	.loc 11 2203 0
	movl	%eax, %ebx
	movzbl	%al, %ecx
.LVL1242:
	.loc 11 2202 0
	andl	$14, %ebp
	.loc 11 2203 0
	andl	$15, %ebx
	cmpl	$14, %ebp
	cmovne	%ebx, %ecx
.LVL1243:
.LBE8177:
.LBE8176:
	.loc 28 423 0
	cmpl	$1, %ecx
	jne	.L1213
.LVL1244:
.LBB8178:
.LBB8179:
	.loc 11 2996 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$1, %ecx
	jne	.L1217
	.loc 11 2999 0
	andl	$16777200, %edx
.LVL1245:
	sall	$8, %edx
.LVL1246:
.LBE8179:
.LBE8178:
.LBB8181:
.LBB8182:
	.loc 11 2996 0
	cmpl	$1, %ebx
	jne	.L1217
.LVL1247:
.LBE8182:
.LBE8181:
	.loc 28 425 0
	andl	$16777200, %eax
.LVL1248:
	sall	$8, %eax
	movl	%eax, %ecx
	xorl	%eax, %eax
	cmpl	%edx, %ecx
	jne	.L1212
.LVL1249:
	andl	$1073741824, %edi
	andl	$1073741824, %esi
.LVL1250:
	xorl	%eax, %eax
	cmpl	%edi, %esi
	sete	%al
	jmp	.L1212
.LVL1251:
.L1217:
.LBB8183:
.LBB8180:
	call	cap_frame_cap_get_capFBasePtr.isra.125.part.126
.LVL1252:
.LBE8180:
.LBE8183:
	.cfi_endproc
.LFE627:
	.size	Arch_sameObjectAs, .-Arch_sameObjectAs
	.section	.text.unlikely
.LCOLDE303:
	.text
.LHOTE303:
	.section	.rodata.str1.4
	.align 4
.LC304:
	.string	"plat/32/plat_mode/machine/hardware_gen.h"
	.align 4
.LC305:
	.string	"(did & ~0xffffu) == ((0 && (did & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB306:
.LHOTB306:
	.type	vtd_cte_new.part.198, @function
vtd_cte_new.part.198:
.LFB1093:
	.file 61 "plat/32/plat_mode/machine/hardware_gen.h"
	.loc 61 70 0
	.cfi_startproc
.LVL1253:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 61 74 0
	pushl	$__FUNCTION__.3657
	.cfi_def_cfa_offset 20
	pushl	$74
	.cfi_def_cfa_offset 24
	pushl	$.LC304
	.cfi_def_cfa_offset 28
	pushl	$.LC305
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1254:
	.cfi_endproc
.LFE1093:
	.size	vtd_cte_new.part.198, .-vtd_cte_new.part.198
.LCOLDE306:
.LHOTE306:
.LCOLDB307:
.LHOTB307:
	.type	cap_io_page_table_cap_get_capIOPTIsMapped.part.199, @function
cap_io_page_table_cap_get_capIOPTIsMapped.part.199:
.LFB1094:
	.loc 11 3484 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 3486 0
	pushl	$__FUNCTION__.2718
	.cfi_def_cfa_offset 20
	pushl	$3487
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC222
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1255:
	.cfi_endproc
.LFE1094:
	.size	cap_io_page_table_cap_get_capIOPTIsMapped.part.199, .-cap_io_page_table_cap_get_capIOPTIsMapped.part.199
.LCOLDE307:
.LHOTE307:
	.section	.rodata.str1.4
	.align 4
.LC308:
	.string	"(addr & ~0xfffff000u) == ((0 && (addr & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB309:
.LHOTB309:
	.type	vtd_pte_new.part.200, @function
vtd_pte_new.part.200:
.LFB1095:
	.loc 61 14 0
	.cfi_startproc
.LVL1256:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 61 18 0
	pushl	$__FUNCTION__.3632
	.cfi_def_cfa_offset 20
	pushl	$18
	.cfi_def_cfa_offset 24
	pushl	$.LC304
	.cfi_def_cfa_offset 28
	pushl	$.LC308
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1257:
	.cfi_endproc
.LFE1095:
	.size	vtd_pte_new.part.200, .-vtd_pte_new.part.200
.LCOLDE309:
.LHOTE309:
	.section	.rodata.str1.4
	.align 4
.LC310:
	.string	"(write & ~0x1u) == ((0 && (write & (1u << 31))) ? 0x0 : 0)"
	.align 4
.LC311:
	.string	"(read & ~0x1u) == ((0 && (read & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB312:
.LHOTB312:
	.type	vtd_pte_new, @function
vtd_pte_new:
.LFB312:
	.loc 61 14 0
	.cfi_startproc
.LVL1258:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 61 14 0
	movl	16(%esp), %ebx
	.loc 61 18 0
	testl	$4095, %edx
	je	.L1230
	call	vtd_pte_new.part.200
.LVL1259:
.L1230:
	.loc 61 19 0
	testl	$-2, %ecx
	je	.L1231
	.loc 61 19 0 is_stmt 0 discriminator 1
	pushl	$__FUNCTION__.3632
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$19
	.cfi_def_cfa_offset 24
	pushl	$.LC304
	.cfi_def_cfa_offset 28
	pushl	$.LC310
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1260:
.L1231:
	.cfi_restore_state
	.loc 61 20 0 is_stmt 1
	testl	$-2, %ebx
	je	.L1232
	.loc 61 20 0 is_stmt 0 discriminator 1
	pushl	$__FUNCTION__.3632
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$20
	.cfi_def_cfa_offset 24
	pushl	$.LC304
	.cfi_def_cfa_offset 28
	pushl	$.LC311
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1261:
.L1232:
	.cfi_restore_state
	.loc 61 28 0 is_stmt 1
	addl	%ecx, %ecx
.LVL1262:
	andl	$-4096, %edx
.LVL1263:
	movl	$0, 4(%eax)
.LVL1264:
	orl	%ebx, %ecx
	orl	%ecx, %edx
	movl	%edx, (%eax)
	.loc 61 29 0
	addl	$8, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE312:
	.size	vtd_pte_new, .-vtd_pte_new
.LCOLDE312:
.LHOTE312:
.LCOLDB313:
.LHOTB313:
	.type	cap_io_page_table_cap_set_capIOPTIsMapped.part.201, @function
cap_io_page_table_cap_set_capIOPTIsMapped.part.201:
.LFB1096:
	.loc 11 3498 0
	.cfi_startproc
.LVL1265:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 3499 0
	pushl	$__FUNCTION__.2723
	.cfi_def_cfa_offset 20
	pushl	$3500
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC222
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1266:
	.cfi_endproc
.LFE1096:
	.size	cap_io_page_table_cap_set_capIOPTIsMapped.part.201, .-cap_io_page_table_cap_set_capIOPTIsMapped.part.201
.LCOLDE313:
.LHOTE313:
	.section	.rodata.str1.4
	.align 4
.LC314:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/object/objecttype.c"
	.section	.rodata.str1.1
.LC315:
	.string	"capFirstPort <= capLastPort"
	.section	.text.unlikely
.LCOLDB316:
	.text
.LHOTB316:
	.p2align 4,,15
	.globl	Arch_updateCapData
	.type	Arch_updateCapData, @function
Arch_updateCapData:
.LFB623:
	.loc 28 142 0
	.cfi_startproc
.LVL1267:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 28 142 0
	movl	28(%esp), %edx
.LVL1268:
	movl	16(%esp), %eax
.LVL1269:
	movl	32(%esp), %ebx
.LVL1270:
.LBB8216:
.LBB8217:
	.loc 11 2202 0
	movl	%edx, %ecx
	.loc 11 2203 0
	movl	%edx, %edi
	movzbl	%dl, %esi
.LVL1271:
	.loc 11 2202 0
	andl	$14, %ecx
	.loc 11 2203 0
	andl	$15, %edi
	cmpl	$14, %ecx
	movl	%edi, %ecx
	cmove	%esi, %ecx
.LVL1272:
.LBE8217:
.LBE8216:
	.loc 28 143 0
	cmpl	$13, %ecx
	je	.L1240
	cmpl	$31, %ecx
	jne	.L1262
.LVL1273:
.LBB8218:
.LBB8219:
.LBB8220:
	.loc 11 16 0
	movl	24(%esp), %edx
	shrl	$16, %edx
.LVL1274:
.LBE8220:
.LBE8219:
.LBB8221:
.LBB8222:
	.loc 11 3622 0
	cmpl	$31, %esi
	jne	.L1263
.LBE8222:
.LBE8221:
	.loc 28 163 0
	movl	%ebx, %ecx
	shrl	$16, %ecx
.LVL1275:
	.loc 28 165 0
	cmpw	%bx, %cx
	ja	.L1264
	.loc 28 168 0
	cmpw	24(%esp), %dx
	ja	.L1242
	.loc 28 174 0
	cmpw	%cx, %dx
	jb	.L1242
	cmpw	%bx, 24(%esp)
	ja	.L1242
.LVL1276:
.LBB8224:
.LBB8225:
	.loc 11 3616 0
	movzwl	24(%esp), %ecx
.LVL1277:
	sall	$16, %edx
.LVL1278:
	movl	$31, (%eax)
	orl	%ecx, %edx
	movl	%edx, 4(%eax)
.LVL1279:
.LBE8225:
.LBE8224:
.LBE8218:
	.loc 28 188 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL1280:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL1281:
	.p2align 4,,10
	.p2align 3
.L1262:
	.cfi_restore_state
	.loc 28 186 0
	movl	%edx, (%eax)
	movl	%ebx, 4(%eax)
.LVL1282:
.L1236:
	.loc 28 188 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL1283:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL1284:
	.p2align 4,,10
	.p2align 3
.L1240:
	.cfi_restore_state
.LBB8227:
	.loc 28 149 0
	movl	20(%esp), %edx
	testl	%edx, %edx
	jne	.L1242
.LVL1285:
.LBB8228:
.LBB8229:
	.loc 11 3333 0 discriminator 1
	cmpl	$13, %edi
	jne	.L1265
.LBE8229:
.LBE8228:
	.loc 28 149 0
	testw	%bx, %bx
	jne	.L1242
.LBB8231:
.LBB8232:
	.loc 11 931 0 discriminator 2
	movl	24(%esp), %edx
	shrl	$16, %edx
.LVL1286:
.LBE8232:
.LBE8231:
	.loc 28 150 0 discriminator 2
	cmpl	%edx, x86KSFirstValidIODomain
	ja	.L1242
	testl	%edx, %edx
	je	.L1242
	.loc 28 151 0
	movl	x86KSnumIODomainIDBits, %ecx
	movl	$1, %ebx
.LVL1287:
	sall	%cl, %ebx
	subl	$1, %ebx
	cmpl	%edx, %ebx
	jnb	.L1266
.LVL1288:
.L1242:
.LBB8233:
.LBB8234:
	.loc 11 2225 0
	movl	$0, (%eax)
	movl	$0, 4(%eax)
.LVL1289:
.LBE8234:
.LBE8233:
.LBE8227:
	.loc 28 188 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL1290:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL1291:
	.p2align 4,,10
	.p2align 3
.L1266:
	.cfi_restore_state
.LBB8238:
.LBB8235:
.LBB8236:
	.loc 11 3313 0
	movzwl	24(%esp), %ecx
	sall	$16, %edx
.LVL1292:
	movl	$13, (%eax)
	orl	%ecx, %edx
	movl	%edx, 4(%eax)
.LVL1293:
	jmp	.L1236
.LVL1294:
.L1263:
.LBE8236:
.LBE8235:
.LBE8238:
.LBB8239:
.LBB8226:
.LBB8223:
	call	cap_io_port_cap_get_capIOPortFirstPort.part.194
.LVL1295:
.L1264:
.LBE8223:
.LBE8226:
	.loc 28 165 0 discriminator 1
	pushl	$__FUNCTION__.7832
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$165
	.cfi_def_cfa_offset 24
	pushl	$.LC314
	.cfi_def_cfa_offset 28
	pushl	$.LC315
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1296:
.L1265:
	.cfi_restore_state
.LBE8239:
.LBB8240:
.LBB8237:
.LBB8230:
	call	cap_io_space_cap_get_capPCIDevice.part.197
.LVL1297:
.LBE8230:
.LBE8237:
.LBE8240:
	.cfi_endproc
.LFE623:
	.size	Arch_updateCapData, .-Arch_updateCapData
	.section	.text.unlikely
.LCOLDE316:
	.text
.LHOTE316:
	.section	.text.unlikely
.LCOLDB317:
	.text
.LHOTB317:
	.p2align 4,,15
	.globl	Arch_maskCapRights
	.type	Arch_maskCapRights, @function
Arch_maskCapRights:
.LFB624:
	.loc 28 191 0
	.cfi_startproc
.LVL1298:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 28 191 0
	movl	24(%esp), %edx
.LVL1299:
	movl	16(%esp), %eax
.LVL1300:
	movl	28(%esp), %edi
.LVL1301:
.LBB8256:
.LBB8257:
	.loc 11 2202 0
	movl	%edx, %esi
	.loc 11 2203 0
	movl	%edx, %ebx
	movzbl	%dl, %ecx
.LVL1302:
	.loc 11 2202 0
	andl	$14, %esi
	.loc 11 2203 0
	andl	$15, %ebx
	cmpl	$14, %esi
	cmovne	%ebx, %ecx
.LVL1303:
.LBE8257:
.LBE8256:
	.loc 28 192 0
	cmpl	$1, %ecx
	je	.L1285
.LVL1304:
	.loc 28 199 0
	movl	%edx, (%eax)
	movl	%edi, 4(%eax)
	.loc 28 201 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL1305:
	ret	$4
	.p2align 4,,10
	.p2align 3
.L1285:
	.cfi_restore_state
.LVL1306:
.LBB8258:
.LBB8259:
.LBB8260:
	.loc 11 2970 0
	cmpl	$1, %ebx
	jne	.L1286
.LVL1307:
	.loc 11 2973 0
	movl	%edx, %ecx
	andl	$50331648, %ecx
	shrl	$24, %ecx
.LVL1308:
.LBE8260:
.LBE8259:
.LBB8262:
.LBB8263:
	.loc 20 674 0
	cmpl	$2, %ecx
	je	.L1287
	.loc 20 677 0
	cmpl	$3, %ecx
	je	.L1288
.LVL1309:
	movl	$16777216, %ecx
.LVL1310:
.L1275:
.LBE8263:
.LBE8262:
.LBB8265:
.LBB8266:
	.loc 11 2988 0
	andl	$-50331649, %edx
.LVL1311:
	.loc 11 2990 0
	movl	%edi, 4(%eax)
	orl	%edx, %ecx
.LVL1312:
	movl	%ecx, (%eax)
.LBE8266:
.LBE8265:
.LBE8258:
	.loc 28 201 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL1313:
	.p2align 4,,10
	.p2align 3
.L1288:
	.cfi_restore_state
.LBB8269:
.LBB8267:
.LBB8264:
	.loc 20 677 0
	movl	$16777216, %ecx
	testb	$2, 20(%esp)
	je	.L1275
.LVL1314:
	.loc 20 678 0
	movl	20(%esp), %ecx
	andl	$1, %ecx
	cmpl	$1, %ecx
	sbbl	%ecx, %ecx
	andl	$-16777216, %ecx
	addl	$50331648, %ecx
	jmp	.L1275
.LVL1315:
	.p2align 4,,10
	.p2align 3
.L1287:
	.loc 20 674 0
	movl	20(%esp), %ecx
	andl	$2, %ecx
	shrl	%ecx
	cmpl	$1, %ecx
	sbbl	%ecx, %ecx
	andl	$-16777216, %ecx
	addl	$33554432, %ecx
	jmp	.L1275
.LVL1316:
.L1286:
.LBE8264:
.LBE8267:
.LBB8268:
.LBB8261:
	call	cap_frame_cap_get_capFVMRights.isra.174.part.175
.LVL1317:
.LBE8261:
.LBE8268:
.LBE8269:
	.cfi_endproc
.LFE624:
	.size	Arch_maskCapRights, .-Arch_maskCapRights
	.section	.text.unlikely
.LCOLDE317:
	.text
.LHOTE317:
	.section	.text.unlikely
.LCOLDB318:
	.text
.LHOTB318:
	.p2align 4,,15
	.type	cap_cnode_cap_get_capCNodeGuardSize.part.204, @function
cap_cnode_cap_get_capCNodeGuardSize.part.204:
.LFB1099:
	.loc 11 2670 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2672 0
	pushl	$__FUNCTION__.2418
	.cfi_def_cfa_offset 20
	pushl	$2673
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC211
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1318:
	.cfi_endproc
.LFE1099:
	.size	cap_cnode_cap_get_capCNodeGuardSize.part.204, .-cap_cnode_cap_get_capCNodeGuardSize.part.204
	.section	.text.unlikely
.LCOLDE318:
	.text
.LHOTE318:
	.section	.text.unlikely
.LCOLDB319:
	.text
.LHOTB319:
	.p2align 4,,15
	.type	cap_cnode_cap_get_capCNodeGuard.part.205, @function
cap_cnode_cap_get_capCNodeGuard.part.205:
.LFB1100:
	.loc 11 2710 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2712 0
	pushl	$__FUNCTION__.2433
	.cfi_def_cfa_offset 20
	pushl	$2713
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC211
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1319:
	.cfi_endproc
.LFE1100:
	.size	cap_cnode_cap_get_capCNodeGuard.part.205, .-cap_cnode_cap_get_capCNodeGuard.part.205
	.section	.text.unlikely
.LCOLDE319:
	.text
.LHOTE319:
	.section	.text.unlikely
.LCOLDB320:
	.text
.LHOTB320:
	.p2align 4,,15
	.type	cap_endpoint_cap_get_capCanSend.part.206, @function
cap_endpoint_cap_get_capCanSend.part.206:
.LFB1101:
	.loc 11 2422 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2424 0
	pushl	$__FUNCTION__.2325
	.cfi_def_cfa_offset 20
	pushl	$2425
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC182
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1320:
	.cfi_endproc
.LFE1101:
	.size	cap_endpoint_cap_get_capCanSend.part.206, .-cap_endpoint_cap_get_capCanSend.part.206
	.section	.text.unlikely
.LCOLDE320:
	.text
.LHOTE320:
	.section	.text.unlikely
.LCOLDB321:
	.text
.LHOTB321:
	.p2align 4,,15
	.type	cap_endpoint_cap_get_capCanGrant.part.207, @function
cap_endpoint_cap_get_capCanGrant.part.207:
.LFB1102:
	.loc 11 2370 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2372 0
	pushl	$__FUNCTION__.2305
	.cfi_def_cfa_offset 20
	pushl	$2373
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC182
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1321:
	.cfi_endproc
.LFE1102:
	.size	cap_endpoint_cap_get_capCanGrant.part.207, .-cap_endpoint_cap_get_capCanGrant.part.207
	.section	.text.unlikely
.LCOLDE321:
	.text
.LHOTE321:
	.section	.text.unlikely
.LCOLDB322:
	.text
.LHOTB322:
	.p2align 4,,15
	.globl	hasCancelSendRights
	.type	hasCancelSendRights, @function
hasCancelSendRights:
.LFB787:
	.loc 45 208 0
	.cfi_startproc
.LVL1322:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 45 208 0
	movl	16(%esp), %edx
	movl	20(%esp), %ebx
.LVL1323:
.LBB8270:
.LBB8271:
	.loc 11 2202 0
	movl	%edx, %eax
	.loc 11 2203 0
	movl	%edx, %ecx
	movzbl	%dl, %edx
.LVL1324:
	.loc 11 2202 0
	andl	$14, %eax
.LVL1325:
	.loc 11 2203 0
	andl	$15, %ecx
.LVL1326:
	cmpl	$14, %eax
.LVL1327:
	cmovne	%ecx, %edx
.LVL1328:
.LBE8271:
.LBE8270:
	.loc 45 209 0
	cmpl	$4, %edx
	jne	.L1309
.LVL1329:
.LBB8272:
.LBB8273:
	.loc 11 2424 0
	cmpl	$4, %ecx
	jne	.L1311
.LBE8273:
.LBE8272:
	xorl	%eax, %eax
	.loc 45 212 0
	testb	$1, %bl
	je	.L1300
.LVL1330:
	.loc 45 211 0
	testb	$2, %bl
	je	.L1300
.LVL1331:
.LBB8275:
.LBB8276:
	.loc 11 2375 0
	andl	$4, %ebx
.LVL1332:
.LBE8276:
.LBE8275:
	movl	%ebx, %eax
	shrl	$2, %eax
.LVL1333:
.L1300:
	.loc 45 218 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL1334:
	.p2align 4,,10
	.p2align 3
.L1309:
	.cfi_restore_state
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	.loc 45 216 0
	xorl	%eax, %eax
	.loc 45 218 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL1335:
.L1311:
	.cfi_restore_state
.LBB8277:
.LBB8274:
	call	cap_endpoint_cap_get_capCanSend.part.206
.LVL1336:
.LBE8274:
.LBE8277:
	.cfi_endproc
.LFE787:
	.size	hasCancelSendRights, .-hasCancelSendRights
	.section	.text.unlikely
.LCOLDE322:
	.text
.LHOTE322:
	.section	.text.unlikely
.LCOLDB323:
	.text
.LHOTB323:
	.p2align 4,,15
	.type	cap_endpoint_cap_get_capEPBadge.isra.208.part.209, @function
cap_endpoint_cap_get_capEPBadge.isra.208.part.209:
.LFB1104:
	.loc 11 2448 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2450 0
	pushl	$__FUNCTION__.2335
	.cfi_def_cfa_offset 20
	pushl	$2451
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC182
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1337:
	.cfi_endproc
.LFE1104:
	.size	cap_endpoint_cap_get_capEPBadge.isra.208.part.209, .-cap_endpoint_cap_get_capEPBadge.isra.208.part.209
	.section	.text.unlikely
.LCOLDE323:
	.text
.LHOTE323:
	.section	.rodata.str1.4
	.align 4
.LC324:
	.string	"(mdbNext & ~0xfffffff8u) == ((0 && (mdbNext & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB325:
.LHOTB325:
	.type	mdb_node_new.part.211, @function
mdb_node_new.part.211:
.LFB1106:
	.loc 11 642 0
	.cfi_startproc
.LVL1338:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 646 0
	pushl	$__FUNCTION__.1574
	.cfi_def_cfa_offset 20
	pushl	$646
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC324
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1339:
	.cfi_endproc
.LFE1106:
	.size	mdb_node_new.part.211, .-mdb_node_new.part.211
.LCOLDE325:
.LHOTE325:
	.section	.rodata.str1.4
	.align 4
.LC326:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/kernel/boot.c"
	.section	.rodata.str1.1
.LC327:
	.string	"reg.start <= reg.end"
	.section	.boot.text
.LCOLDB328:
.LHOTB328:
	.p2align 4,,15
	.globl	insert_region
	.type	insert_region, @function
insert_region:
.LFB645:
	.loc 30 30 0
	.cfi_startproc
.LVL1340:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	.loc 30 30 0
	movl	16(%esp), %ebx
	movl	20(%esp), %ecx
	.loc 30 33 0
	cmpl	%ebx, %ecx
	jb	.L1324
.LVL1341:
	.loc 30 34 0
	je	.L1321
	movl	$ndks_boot, %eax
	movl	$ndks_boot+128, %edx
	.p2align 4,,10
	.p2align 3
.L1320:
.LVL1342:
	.loc 30 38 0
	movl	4(%eax), %esi
	cmpl	%esi, (%eax)
	je	.L1325
.LVL1343:
	addl	$8, %eax
.LVL1344:
	.loc 30 37 0 discriminator 2
	cmpl	%eax, %edx
	jne	.L1320
	.loc 30 44 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 30 43 0
	xorl	%eax, %eax
.LVL1345:
	.loc 30 44 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL1346:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL1347:
	ret
.LVL1348:
	.p2align 4,,10
	.p2align 3
.L1325:
	.cfi_restore_state
	.loc 30 39 0
	movl	%ebx, (%eax)
.LVL1349:
	movl	%ecx, 4(%eax)
	.loc 30 44 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 30 40 0
	movl	$1, %eax
	.loc 30 44 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL1350:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL1351:
	ret
.LVL1352:
	.p2align 4,,10
	.p2align 3
.L1321:
	.cfi_restore_state
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 30 35 0
	movl	$1, %eax
	.loc 30 44 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL1353:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL1354:
.L1324:
	.cfi_restore_state
.LBB8284:
.LBB8285:
	.loc 30 33 0
	pushl	$__FUNCTION__.8013
	.cfi_def_cfa_offset 20
	pushl	$33
	.cfi_def_cfa_offset 24
	pushl	$.LC326
	.cfi_def_cfa_offset 28
	pushl	$.LC327
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1355:
.LBE8285:
.LBE8284:
	.cfi_endproc
.LFE645:
	.size	insert_region, .-insert_region
.LCOLDE328:
.LHOTE328:
	.section	.rodata.str1.4
	.align 4
.LC329:
	.string	"(capCNodeRadix & ~0x1fu) == ((0 && (capCNodeRadix & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB330:
.LHOTB330:
	.type	cap_cnode_cap_new.part.218, @function
cap_cnode_cap_new.part.218:
.LFB1113:
	.loc 11 2648 0
	.cfi_startproc
.LVL1356:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2652 0
	pushl	$__FUNCTION__.2413
	.cfi_def_cfa_offset 20
	pushl	$2652
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC329
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1357:
	.cfi_endproc
.LFE1113:
	.size	cap_cnode_cap_new.part.218, .-cap_cnode_cap_new.part.218
.LCOLDE330:
.LHOTE330:
	.section	.rodata.str1.4
	.align 4
.LC331:
	.string	"(capTCBPtr & ~0xfffffff0u) == ((0 && (capTCBPtr & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB332:
.LHOTB332:
	.type	cap_thread_cap_new.part.220, @function
cap_thread_cap_new.part.220:
.LFB1115:
	.loc 11 2750 0
	.cfi_startproc
.LVL1358:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2754 0
	pushl	$__FUNCTION__.2448
	.cfi_def_cfa_offset 20
	pushl	$2754
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC331
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1359:
	.cfi_endproc
.LFE1115:
	.size	cap_thread_cap_new.part.220, .-cap_thread_cap_new.part.220
.LCOLDE332:
.LHOTE332:
	.section	.rodata.str1.4
	.align 4
.LC333:
	.string	"(capFreeIndex & ~0x3ffffffu) == ((0 && (capFreeIndex & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB334:
.LHOTB334:
	.type	cap_untyped_cap_new.part.221, @function
cap_untyped_cap_new.part.221:
.LFB1116:
	.loc 11 2229 0
	.cfi_startproc
.LVL1360:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2233 0
	pushl	$__FUNCTION__.2256
	.cfi_def_cfa_offset 20
	pushl	$2233
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC333
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1361:
	.cfi_endproc
.LFE1116:
	.size	cap_untyped_cap_new.part.221, .-cap_untyped_cap_new.part.221
.LCOLDE334:
.LHOTE334:
	.section	.rodata.str1.4
	.align 4
.LC335:
	.string	"(bitsFound & ~0x3fu) == ((0 && (bitsFound & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB336:
.LHOTB336:
	.type	lookup_fault_depth_mismatch_new.part.222, @function
lookup_fault_depth_mismatch_new.part.222:
.LFB1117:
	.loc 11 1190 0
	.cfi_startproc
.LVL1362:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1194 0
	pushl	$__FUNCTION__.1822
	.cfi_def_cfa_offset 20
	pushl	$1194
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC335
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1363:
	.cfi_endproc
.LFE1117:
	.size	lookup_fault_depth_mismatch_new.part.222, .-lookup_fault_depth_mismatch_new.part.222
.LCOLDE336:
.LHOTE336:
	.section	.rodata.str1.4
	.align 4
.LC337:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/kernel/cspace.c"
	.section	.rodata.str1.1
.LC338:
	.string	"levelBits != 0"
	.section	.text.unlikely
.LCOLDB339:
	.text
.LHOTB339:
	.p2align 4,,15
	.globl	resolveAddressBits
	.type	resolveAddressBits, @function
resolveAddressBits:
.LFB674:
	.file 62 "/home/axjllt/Desktop/ori_refos/kernel/src/kernel/cspace.c"
	.loc 62 139 0
	.cfi_startproc
.LVL1364:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	52(%esp), %eax
	movl	56(%esp), %edi
.LVL1365:
	movl	64(%esp), %esi
.LBB8302:
.LBB8303:
	.loc 11 2202 0
	movl	%eax, %ebx
	.loc 11 2203 0
	movl	%eax, %edx
	movzbl	%al, %ecx
.LVL1366:
	.loc 11 2202 0
	andl	$14, %ebx
	.loc 11 2203 0
	andl	$15, %edx
	cmpl	$14, %ebx
	cmove	%ecx, %edx
.LVL1367:
.LBE8303:
.LBE8302:
	.loc 62 148 0
	cmpl	$10, %edx
	jne	.L1355
	movl	%eax, 8(%esp)
.LVL1368:
.L1351:
.LBB8304:
.LBB8305:
	.loc 11 2698 0
	movl	8(%esp), %eax
	andl	$15, %eax
	cmpl	$10, %eax
	jne	.L1356
.LBE8305:
.LBE8304:
.LBB8310:
.LBB8311:
	.loc 11 2675 0
	movl	%edi, %edx
.LBE8311:
.LBE8310:
.LBB8314:
.LBB8306:
	.loc 11 2701 0
	movl	%edi, %eax
.LBE8306:
.LBE8314:
.LBB8315:
.LBB8312:
	.loc 11 2675 0
	andl	$260046848, %edx
.LBE8312:
.LBE8315:
.LBB8316:
.LBB8307:
	.loc 11 2701 0
	andl	$8126464, %eax
.LBE8307:
.LBE8316:
.LBB8317:
.LBB8313:
	.loc 11 2675 0
	shrl	$23, %edx
.LBE8313:
.LBE8317:
.LBB8318:
.LBB8308:
	.loc 11 2701 0
	shrl	$18, %eax
.LVL1369:
.LBE8308:
.LBE8318:
	.loc 62 160 0
	movl	%edx, %ebp
	addl	%eax, %ebp
.LVL1370:
	je	.L1357
.LVL1371:
	.loc 62 169 0
	movl	60(%esp), %ebx
	movl	%esi, %ecx
.LVL1372:
.LBB8319:
.LBB8320:
	.loc 11 2715 0
	andl	$262143, %edi
.LVL1373:
.LBE8320:
.LBE8319:
	.loc 62 169 0
	subl	%edx, %ecx
	shrl	%cl, %ebx
.LVL1374:
	movl	%edx, %ecx
	movl	%ebx, 12(%esp)
	movl	$1, %ebx
	sall	%cl, %ebx
	movl	%ebx, %ecx
	movl	12(%esp), %ebx
	subl	$1, %ecx
	andl	%ecx, %ebx
	cmpl	%edi, %ebx
	jne	.L1350
	cmpl	%edx, %esi
	jb	.L1350
	.loc 62 176 0
	cmpl	%ebp, %esi
	jb	.L1358
	.loc 62 184 0
	movl	%eax, %ecx
	movl	60(%esp), %eax
	.loc 62 183 0
	movl	%esi, %ebx
	.loc 62 184 0
	movl	$1, %edx
.LVL1375:
	.loc 62 183 0
	subl	%ebp, %ebx
	.loc 62 184 0
	sall	%cl, %edx
	movl	%ebx, %ecx
	subl	$1, %edx
	shrl	%cl, %eax
	andl	%eax, %edx
	movl	8(%esp), %eax
	sall	$4, %edx
	andl	$-32, %eax
	addl	%eax, %edx
.LVL1376:
	.loc 62 186 0
	cmpl	%ebp, %esi
	ja	.L1345
.LVL1377:
	.loc 62 190 0
	movl	48(%esp), %eax
	movl	$0, (%eax)
	movl	%edx, 4(%eax)
	movl	$0, 8(%eax)
.LVL1378:
.L1334:
	.loc 62 208 0
	movl	48(%esp), %eax
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL1379:
	ret	$4
.LVL1380:
	.p2align 4,,10
	.p2align 3
.L1355:
	.cfi_restore_state
	.loc 62 149 0
	movl	$0, current_lookup_fault
	.loc 62 151 0
	movl	48(%esp), %eax
	.loc 62 149 0
	movl	$0, current_lookup_fault+4
.LVL1381:
	.loc 62 151 0
	movl	$2, (%eax)
	movl	$0, 4(%eax)
	movl	%esi, 8(%eax)
	.loc 62 208 0
	movl	48(%esp), %eax
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL1382:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret	$4
.LVL1383:
	.p2align 4,,10
	.p2align 3
.L1350:
	.cfi_restore_state
.LBB8321:
.LBB8322:
	.loc 11 1240 0
	testl	$-64, %esi
	jne	.L1359
.LVL1384:
.LBE8322:
.LBE8321:
	.loc 62 170 0
	sall	$8, %esi
.LVL1385:
	sall	$2, %edx
	movl	%edi, current_lookup_fault+4
.LVL1386:
	orl	%edx, %esi
	orl	$3, %esi
	movl	%esi, current_lookup_fault
.LVL1387:
.L1354:
	.loc 62 180 0
	movl	48(%esp), %eax
	movl	64(%esp), %edi
	movl	$2, (%eax)
	movl	$0, 4(%eax)
	movl	%edi, 8(%eax)
	.loc 62 208 0
	movl	48(%esp), %eax
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL1388:
	ret	$4
.LVL1389:
	.p2align 4,,10
	.p2align 3
.L1358:
	.cfi_restore_state
	.loc 62 177 0
	movl	$0, current_lookup_fault+4
	movl	%ebp, %eax
	sall	$2, %esi
.LVL1390:
	sall	$8, %eax
	orl	%eax, %esi
	orl	$2, %esi
	movl	%esi, current_lookup_fault
	jmp	.L1354
.LVL1391:
	.p2align 4,,10
	.p2align 3
.L1345:
	.loc 62 196 0
	movl	(%edx), %eax
	movl	4(%edx), %edi
.LBB8324:
.LBB8325:
	.loc 11 2202 0
	movl	%eax, %esi
	.loc 11 2203 0
	movl	%eax, %ecx
.LBE8325:
.LBE8324:
	.loc 62 196 0
	movl	%eax, 8(%esp)
.LVL1392:
.LBB8327:
.LBB8326:
	.loc 11 2203 0
	movzbl	%al, %eax
.LVL1393:
	.loc 11 2202 0
	andl	$14, %esi
	.loc 11 2203 0
	andl	$15, %ecx
.LVL1394:
	cmpl	$14, %esi
	cmovne	%ecx, %eax
.LVL1395:
.LBE8326:
.LBE8327:
	.loc 62 198 0
	cmpl	$10, %eax
	jne	.L1360
	.loc 62 183 0
	movl	%ebx, %esi
	jmp	.L1351
.L1360:
.LVL1396:
	.loc 62 202 0
	movl	48(%esp), %eax
	movl	$0, (%eax)
	movl	%edx, 4(%eax)
	movl	%ebx, 8(%eax)
.LVL1397:
	jmp	.L1334
.LVL1398:
.L1357:
	.loc 62 160 0 discriminator 1
	pushl	$__FUNCTION__.8240
	.cfi_remember_state
	.cfi_def_cfa_offset 52
	pushl	$160
	.cfi_def_cfa_offset 56
	pushl	$.LC337
	.cfi_def_cfa_offset 60
	pushl	$.LC338
	.cfi_def_cfa_offset 64
	call	_assert_fail
.LVL1399:
.L1356:
	.cfi_restore_state
.LBB8328:
.LBB8309:
	call	cap_cnode_cap_get_capCNodeRadix.part.187
.LVL1400:
.L1359:
.LBE8309:
.LBE8328:
.LBB8329:
.LBB8323:
	.loc 11 1240 0
	pushl	$__FUNCTION__.1839
	.cfi_def_cfa_offset 52
	pushl	$1240
	.cfi_def_cfa_offset 56
	pushl	$.LC154
	.cfi_def_cfa_offset 60
	pushl	$.LC187
	.cfi_def_cfa_offset 64
	call	_assert_fail
.LVL1401:
.LBE8323:
.LBE8329:
	.cfi_endproc
.LFE674:
	.size	resolveAddressBits, .-resolveAddressBits
	.section	.text.unlikely
.LCOLDE339:
	.text
.LHOTE339:
	.section	.text.unlikely
.LCOLDB340:
	.text
.LHOTB340:
	.p2align 4,,15
	.globl	lookupSlot
	.type	lookupSlot, @function
lookupSlot:
.LFB669:
	.loc 62 59 0
	.cfi_startproc
.LVL1402:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	.loc 62 64 0
	movl	36(%esp), %eax
	.loc 62 65 0
	leal	4(%esp), %edx
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	.loc 62 59 0
	movl	44(%esp), %ebx
	.loc 62 65 0
	pushl	$32
	.cfi_def_cfa_offset 48
	pushl	56(%esp)
	.cfi_def_cfa_offset 52
	.loc 62 64 0
	andl	$-1024, %eax
	.loc 62 65 0
	pushl	4(%eax)
	.cfi_def_cfa_offset 56
	pushl	(%eax)
	.cfi_def_cfa_offset 60
	pushl	%edx
	.cfi_def_cfa_offset 64
	call	resolveAddressBits
	.cfi_def_cfa_offset 60
.LVL1403:
	.loc 62 69 0
	movl	32(%esp), %eax
	movl	%eax, (%ebx)
	movl	36(%esp), %eax
	movl	%eax, 4(%ebx)
.LVL1404:
	.loc 62 70 0
	addl	$52, %esp
	.cfi_def_cfa_offset 8
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret	$4
	.cfi_endproc
.LFE669:
	.size	lookupSlot, .-lookupSlot
	.section	.text.unlikely
.LCOLDE340:
	.text
.LHOTE340:
	.section	.text.unlikely
.LCOLDB341:
	.text
.LHOTB341:
	.p2align 4,,15
	.globl	lookupCap
	.type	lookupCap, @function
lookupCap:
.LFB667:
	.loc 62 21 0
	.cfi_startproc
.LVL1405:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	.loc 62 21 0
	movl	32(%esp), %ebx
	.loc 62 25 0
	leal	8(%esp), %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	pushl	44(%esp)
	.cfi_def_cfa_offset 40
	pushl	44(%esp)
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	call	lookupSlot
	.cfi_def_cfa_offset 44
.LVL1406:
	movl	20(%esp), %edx
.LVL1407:
	movl	24(%esp), %eax
.LVL1408:
	.loc 62 26 0
	addl	$12, %esp
	.cfi_def_cfa_offset 32
	testl	%edx, %edx
	jne	.L1367
.LVL1409:
	.loc 62 33 0
	movl	(%eax), %edx
.LVL1410:
	.loc 62 34 0
	movl	$0, (%ebx)
	.loc 62 33 0
	movl	4(%eax), %eax
.LVL1411:
	.loc 62 34 0
	movl	%edx, 4(%ebx)
	movl	%eax, 8(%ebx)
.LVL1412:
	.loc 62 35 0
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret	$4
.LVL1413:
	.p2align 4,,10
	.p2align 3
.L1367:
	.cfi_restore_state
	.loc 62 29 0
	movl	%edx, (%ebx)
	.loc 62 35 0
	movl	%ebx, %eax
	.loc 62 29 0
	movl	$0, 4(%ebx)
	movl	$0, 8(%ebx)
	.loc 62 35 0
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret	$4
	.cfi_endproc
.LFE667:
	.size	lookupCap, .-lookupCap
	.section	.text.unlikely
.LCOLDE341:
	.text
.LHOTE341:
	.section	.text.unlikely
.LCOLDB342:
	.text
.LHOTB342:
	.p2align 4,,15
	.globl	lookupCapAndSlot
	.type	lookupCapAndSlot, @function
lookupCapAndSlot:
.LFB668:
	.loc 62 39 0
	.cfi_startproc
.LVL1414:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	.loc 62 39 0
	movl	32(%esp), %ebx
	.loc 62 43 0
	leal	8(%esp), %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	pushl	44(%esp)
	.cfi_def_cfa_offset 40
	pushl	44(%esp)
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	call	lookupSlot
	.cfi_def_cfa_offset 44
.LVL1415:
	movl	20(%esp), %edx
.LVL1416:
	movl	24(%esp), %eax
.LVL1417:
	.loc 62 44 0
	addl	$12, %esp
	.cfi_def_cfa_offset 32
	testl	%edx, %edx
	jne	.L1372
.LVL1418:
	.loc 62 53 0
	movl	(%eax), %ecx
.LVL1419:
	.loc 62 54 0
	movl	%eax, 12(%ebx)
	.loc 62 53 0
	movl	4(%eax), %edx
.LVL1420:
	.loc 62 54 0
	movl	$0, (%ebx)
	.loc 62 55 0
	movl	%ebx, %eax
.LVL1421:
	.loc 62 54 0
	movl	%ecx, 4(%ebx)
	movl	%edx, 8(%ebx)
	.loc 62 55 0
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret	$4
.LVL1422:
	.p2align 4,,10
	.p2align 3
.L1372:
	.cfi_restore_state
	.loc 62 48 0
	movl	%edx, (%ebx)
	.loc 62 55 0
	movl	%ebx, %eax
.LVL1423:
	.loc 62 48 0
	movl	$0, 4(%ebx)
	movl	$0, 8(%ebx)
	movl	$0, 12(%ebx)
	.loc 62 55 0
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret	$4
	.cfi_endproc
.LFE668:
	.size	lookupCapAndSlot, .-lookupCapAndSlot
	.section	.text.unlikely
.LCOLDE342:
	.text
.LHOTE342:
	.section	.text.unlikely
.LCOLDB343:
	.text
.LHOTB343:
	.p2align 4,,15
	.globl	lookupExtraCaps
	.type	lookupExtraCaps, @function
lookupExtraCaps:
.LFB812:
	.loc 31 290 0
	.cfi_startproc
.LVL1424:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 31 290 0
	movl	52(%esp), %esi
	.loc 31 295 0
	testl	%esi, %esi
	je	.L1386
.LVL1425:
.LBB8330:
.LBB8331:
	.loc 60 93 0
	movl	56(%esp), %eax
	andl	$384, %eax
.LBE8331:
.LBE8330:
	.loc 31 302 0
	shrl	$7, %eax
	movl	%eax, 4(%esp)
	je	.L1376
	leal	8(%esp), %ebp
	xorl	%ebx, %ebx
	jmp	.L1378
.LVL1426:
	.p2align 4,,10
	.p2align 3
.L1377:
	.loc 31 311 0 discriminator 2
	movl	%ecx, current_extra_caps(,%ebx,4)
	.loc 31 302 0 discriminator 2
	addl	$1, %ebx
.LVL1427:
	cmpl	4(%esp), %ebx
	je	.L1387
.LVL1428:
.L1378:
.LBB8332:
.LBB8333:
	.loc 31 245 0
	movl	488(%esi,%ebx,4), %edi
.LVL1429:
.LBE8333:
.LBE8332:
	.loc 31 305 0
	subl	$4, %esp
	.cfi_def_cfa_offset 52
	pushl	%edi
	.cfi_def_cfa_offset 56
	pushl	56(%esp)
	.cfi_def_cfa_offset 60
	pushl	%ebp
	.cfi_def_cfa_offset 64
	call	lookupSlot
	.cfi_def_cfa_offset 60
.LVL1430:
	movl	20(%esp), %eax
	movl	24(%esp), %ecx
.LVL1431:
	.loc 31 306 0
	addl	$12, %esp
	.cfi_def_cfa_offset 48
	testl	%eax, %eax
	je	.L1377
.LVL1432:
	.loc 31 307 0
	movl	$1, current_fault
	movl	%edi, current_fault+4
.LVL1433:
.L1375:
	.loc 31 318 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
.LVL1434:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL1435:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1436:
	.p2align 4,,10
	.p2align 3
.L1387:
	.cfi_restore_state
	.loc 31 317 0
	xorl	%eax, %eax
.LVL1437:
	.loc 31 313 0
	cmpl	$3, 4(%esp)
	je	.L1375
.LVL1438:
.L1376:
	.loc 31 314 0
	movl	4(%esp), %eax
	movl	$0, current_extra_caps(,%eax,4)
	.loc 31 318 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 31 317 0
	xorl	%eax, %eax
	.loc 31 318 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1439:
	.p2align 4,,10
	.p2align 3
.L1386:
	.cfi_restore_state
	.loc 31 296 0
	movl	$0, current_extra_caps
	.loc 31 318 0
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	.loc 31 297 0
	xorl	%eax, %eax
	.loc 31 318 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE812:
	.size	lookupExtraCaps, .-lookupExtraCaps
	.section	.text.unlikely
.LCOLDE343:
	.text
.LHOTE343:
	.section	.rodata.str1.4
	.align 4
.LC344:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/include/kernel/thread.h"
	.section	.rodata.str1.1
.LC345:
	.string	"dom == 0"
	.section	.text.unlikely
.LCOLDB346:
.LHOTB346:
	.type	ready_queues_index.part.224, @function
ready_queues_index.part.224:
.LFB1119:
	.file 63 "/home/axjllt/Desktop/ori_refos/kernel/include/kernel/thread.h"
	.loc 63 20 0
	.cfi_startproc
.LVL1440:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 63 25 0
	pushl	$__FUNCTION__.5025
	.cfi_def_cfa_offset 20
	pushl	$25
	.cfi_def_cfa_offset 24
	pushl	$.LC344
	.cfi_def_cfa_offset 28
	pushl	$.LC345
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1441:
	.cfi_endproc
.LFE1119:
	.size	ready_queues_index.part.224, .-ready_queues_index.part.224
.LCOLDE346:
.LHOTE346:
.LCOLDB347:
	.text
.LHOTB347:
	.p2align 4,,15
	.type	tcbSchedEnqueue.part.263, @function
tcbSchedEnqueue.part.263:
.LFB1158:
	.loc 31 78 0
	.cfi_startproc
.LVL1442:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
.LVL1443:
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
.LBB8334:
.LBB8335:
.LBB8336:
	.loc 63 25 0
	movl	620(%eax), %ecx
.LBE8336:
.LBE8335:
	.loc 31 87 0
	movl	628(%eax), %edx
.LVL1444:
.LBB8339:
.LBB8337:
	.loc 63 25 0
	testl	%ecx, %ecx
	jne	.L1395
.LVL1445:
.LBE8337:
.LBE8339:
	.loc 31 89 0
	leal	ksReadyQueues(,%edx,8), %ebx
	movl	ksReadyQueues(,%edx,8), %esi
.LVL1446:
	movl	4(%ebx), %ecx
.LVL1447:
	.loc 31 91 0
	testl	%ecx, %ecx
	je	.L1396
	.loc 31 95 0
	movl	%eax, 648(%esi)
.L1393:
	.loc 31 98 0
	movl	%esi, 644(%eax)
.LVL1448:
	.loc 31 97 0
	movl	$0, 648(%eax)
	.loc 31 101 0
	movl	%eax, ksReadyQueues(,%edx,8)
	movl	%ecx, 4(%ebx)
.LVL1449:
.LBB8340:
.LBB8341:
	.loc 11 397 0
	orl	$1, 592(%eax)
.LVL1450:
.LBE8341:
.LBE8340:
.LBE8334:
	.loc 31 105 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1451:
	.p2align 4,,10
	.p2align 3
.L1396:
	.cfi_restore_state
.LBB8349:
.LBB8342:
.LBB8343:
.LBB8344:
.LBB8345:
	.loc 63 33 0
	movl	%edx, %ebp
.LBE8345:
.LBE8344:
	.loc 31 60 0
	movl	$1, %edi
.LBB8347:
.LBB8346:
	.loc 63 33 0
	shrl	$5, %ebp
	movl	%ebp, %ecx
.LBE8346:
.LBE8347:
	.loc 31 60 0
	movl	%edi, %ebp
	movl	%ecx, 12(%esp)
	sall	%cl, %ebp
	.loc 31 61 0
	movl	%edx, %ecx
	.loc 31 60 0
	orl	%ebp, ksReadyQueuesL1Bitmap
	.loc 31 61 0
	sall	%cl, %edi
	movl	12(%esp), %ecx
	orl	%edi, ksReadyQueuesL2Bitmap(,%ecx,4)
	movl	%eax, %ecx
	jmp	.L1393
.LVL1452:
.L1395:
.LBE8343:
.LBE8342:
.LBB8348:
.LBB8338:
	call	ready_queues_index.part.224
.LVL1453:
.LBE8338:
.LBE8348:
.LBE8349:
	.cfi_endproc
.LFE1158:
	.size	tcbSchedEnqueue.part.263, .-tcbSchedEnqueue.part.263
	.section	.text.unlikely
.LCOLDE347:
	.text
.LHOTE347:
	.section	.text.unlikely
.LCOLDB348:
	.text
.LHOTB348:
	.p2align 4,,15
	.globl	tcbSchedEnqueue
	.type	tcbSchedEnqueue, @function
tcbSchedEnqueue:
.LFB801:
	.loc 31 79 0
	.cfi_startproc
.LVL1454:
	.loc 31 79 0
	movl	4(%esp), %eax
	.loc 31 80 0
	testb	$1, 592(%eax)
	jne	.L1397
	jmp	tcbSchedEnqueue.part.263
.LVL1455:
	.p2align 4,,10
	.p2align 3
.L1397:
	ret
	.cfi_endproc
.LFE801:
	.size	tcbSchedEnqueue, .-tcbSchedEnqueue
	.section	.text.unlikely
.LCOLDE348:
	.text
.LHOTE348:
	.section	.text.unlikely
.LCOLDB349:
	.text
.LHOTB349:
	.p2align 4,,15
	.globl	rescheduleRequired
	.type	rescheduleRequired, @function
rescheduleRequired:
.LFB704:
	.loc 32 459 0
	.cfi_startproc
	.loc 32 461 0
	movl	ksSchedulerAction, %eax
	.loc 32 460 0
	leal	-1(%eax), %edx
	cmpl	$-3, %edx
	ja	.L1402
.LVL1456:
.LBB8350:
.LBB8351:
	.loc 31 80 0
	testb	$1, 592(%eax)
	je	.L1403
.LVL1457:
.L1402:
.LBE8351:
.LBE8350:
	.loc 32 464 0
	movl	$-1, ksSchedulerAction
	ret
.LVL1458:
	.p2align 4,,10
	.p2align 3
.L1403:
	.loc 32 459 0
	subl	$12, %esp
	.cfi_def_cfa_offset 16
.LBB8353:
.LBB8352:
	call	tcbSchedEnqueue.part.263
.LVL1459:
.LBE8352:
.LBE8353:
	.loc 32 464 0
	movl	$-1, ksSchedulerAction
	.loc 32 465 0
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE704:
	.size	rescheduleRequired, .-rescheduleRequired
	.section	.text.unlikely
.LCOLDE349:
	.text
.LHOTE349:
	.section	.text.unlikely
.LCOLDB350:
	.text
.LHOTB350:
	.p2align 4,,15
	.type	scheduleTCB.part.264, @function
scheduleTCB.part.264:
.LFB1159:
	.loc 32 426 0
	.cfi_startproc
.LVL1460:
.LBB8354:
.LBB8355:
	.loc 63 45 0
	movl	588(%eax), %eax
.LVL1461:
	andl	$15, %eax
	subl	$1, %eax
	cmpl	$1, %eax
	jbe	.L1407
.LVL1462:
.LBE8355:
.LBE8354:
	.loc 32 431 0
	jmp	rescheduleRequired
.LVL1463:
	.p2align 4,,10
	.p2align 3
.L1407:
	ret
	.cfi_endproc
.LFE1159:
	.size	scheduleTCB.part.264, .-scheduleTCB.part.264
	.section	.text.unlikely
.LCOLDE350:
	.text
.LHOTE350:
	.section	.text.unlikely
.LCOLDB351:
	.text
.LHOTB351:
	.p2align 4,,15
	.globl	scheduleTCB
	.type	scheduleTCB, @function
scheduleTCB:
.LFB702:
	.loc 32 427 0
	.cfi_startproc
.LVL1464:
	.loc 32 428 0
	movl	ksCurThread, %eax
	cmpl	4(%esp), %eax
	je	.L1410
.L1408:
	ret
	.p2align 4,,10
	.p2align 3
.L1410:
	.loc 32 428 0 is_stmt 0 discriminator 1
	movl	ksSchedulerAction, %edx
	testl	%edx, %edx
	jne	.L1408
	jmp	scheduleTCB.part.264
.LVL1465:
	.cfi_endproc
.LFE702:
	.size	scheduleTCB, .-scheduleTCB
	.section	.text.unlikely
.LCOLDE351:
	.text
.LHOTE351:
	.section	.text.unlikely
.LCOLDB352:
	.text
.LHOTB352:
	.p2align 4,,15
	.type	possibleSwitchTo, @function
possibleSwitchTo:
.LFB698:
	.loc 32 379 0 is_stmt 1
	.cfi_startproc
.LVL1466:
	.loc 32 389 0
	movl	620(%eax), %ecx
	cmpl	%ecx, ksCurDomain
	je	.L1412
.LVL1467:
.LBB8356:
.LBB8357:
	.loc 31 80 0
	testb	$1, 592(%eax)
	je	.L1428
.LBE8357:
.LBE8356:
	.loc 32 404 0
	ret
	.p2align 4,,10
	.p2align 3
.L1428:
.LBB8359:
.LBB8358:
	jmp	tcbSchedEnqueue.part.263
.LVL1468:
	.p2align 4,,10
	.p2align 3
.L1412:
.LBE8358:
.LBE8359:
	.loc 32 379 0
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
.LVL1469:
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	.loc 32 392 0
	movl	ksCurThread, %ecx
.LVL1470:
	.loc 32 388 0
	movl	ksSchedulerAction, %ebx
	.loc 32 392 0
	movl	628(%eax), %esi
	cmpl	%esi, 628(%ecx)
	jb	.L1415
	.loc 32 392 0 is_stmt 0 discriminator 1
	jne	.L1416
	testl	%edx, %edx
	je	.L1416
.L1415:
	.loc 32 393 0 is_stmt 1
	testl	%ebx, %ebx
	je	.L1429
.L1416:
.LVL1471:
.LBB8360:
.LBB8361:
	.loc 31 80 0
	testb	$1, 592(%eax)
	je	.L1430
.LVL1472:
.L1417:
.LBE8361:
.LBE8360:
	.loc 32 399 0
	subl	$1, %ebx
	cmpl	$-3, %ebx
	jbe	.L1431
.LVL1473:
.L1411:
	.loc 32 404 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL1474:
	.p2align 4,,10
	.p2align 3
.L1431:
	.cfi_restore_state
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	.loc 32 401 0
	jmp	rescheduleRequired
.LVL1475:
	.p2align 4,,10
	.p2align 3
.L1430:
	.cfi_restore_state
.LBB8363:
.LBB8362:
	call	tcbSchedEnqueue.part.263
.LVL1476:
	jmp	.L1417
.LVL1477:
	.p2align 4,,10
	.p2align 3
.L1429:
.LBE8362:
.LBE8363:
	.loc 32 395 0
	movl	%eax, ksSchedulerAction
.LVL1478:
	jmp	.L1411
	.cfi_endproc
.LFE698:
	.size	possibleSwitchTo, .-possibleSwitchTo
	.section	.text.unlikely
.LCOLDE352:
	.text
.LHOTE352:
	.section	.text.unlikely
.LCOLDB353:
	.text
.LHOTB353:
	.p2align 4,,15
	.globl	attemptSwitchTo
	.type	attemptSwitchTo, @function
attemptSwitchTo:
.LFB699:
	.loc 32 408 0
	.cfi_startproc
.LVL1479:
	.loc 32 409 0
	movl	4(%esp), %eax
	movl	$1, %edx
	jmp	possibleSwitchTo
.LVL1480:
	.cfi_endproc
.LFE699:
	.size	attemptSwitchTo, .-attemptSwitchTo
	.section	.text.unlikely
.LCOLDE353:
	.text
.LHOTE353:
	.section	.text.unlikely
.LCOLDB354:
	.text
.LHOTB354:
	.p2align 4,,15
	.globl	switchIfRequiredTo
	.type	switchIfRequiredTo, @function
switchIfRequiredTo:
.LFB700:
	.loc 32 414 0
	.cfi_startproc
.LVL1481:
	.loc 32 415 0
	movl	4(%esp), %eax
	xorl	%edx, %edx
	jmp	possibleSwitchTo
.LVL1482:
	.cfi_endproc
.LFE700:
	.size	switchIfRequiredTo, .-switchIfRequiredTo
	.section	.text.unlikely
.LCOLDE354:
	.text
.LHOTE354:
	.section	.text.unlikely
.LCOLDB355:
	.text
.LHOTB355:
	.p2align 4,,15
	.type	tcbSchedAppend.part.270, @function
tcbSchedAppend.part.270:
.LFB1165:
	.loc 31 109 0
	.cfi_startproc
.LVL1483:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
.LVL1484:
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
.LBB8364:
.LBB8365:
.LBB8366:
	.loc 63 25 0
	movl	620(%eax), %ecx
.LBE8366:
.LBE8365:
	.loc 31 118 0
	movl	628(%eax), %edx
.LVL1485:
.LBB8369:
.LBB8367:
	.loc 63 25 0
	testl	%ecx, %ecx
	jne	.L1439
.LVL1486:
.LBE8367:
.LBE8369:
	.loc 31 120 0
	movl	ksReadyQueues(,%edx,8), %ecx
.LVL1487:
	leal	ksReadyQueues(,%edx,8), %ebx
	movl	4(%ebx), %esi
.LVL1488:
	.loc 31 122 0
	testl	%ecx, %ecx
	je	.L1440
	.loc 31 126 0
	movl	%eax, 644(%esi)
.L1437:
	.loc 31 128 0
	movl	%esi, 648(%eax)
	.loc 31 129 0
	movl	$0, 644(%eax)
.LVL1489:
	.loc 31 132 0
	movl	%ecx, ksReadyQueues(,%edx,8)
	movl	%eax, 4(%ebx)
.LVL1490:
.LBB8370:
.LBB8371:
	.loc 11 397 0
	orl	$1, 592(%eax)
.LVL1491:
.LBE8371:
.LBE8370:
.LBE8364:
	.loc 31 136 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1492:
	.p2align 4,,10
	.p2align 3
.L1440:
	.cfi_restore_state
.LBB8379:
.LBB8372:
.LBB8373:
.LBB8374:
.LBB8375:
	.loc 63 33 0
	movl	%edx, %ebp
.LBE8375:
.LBE8374:
	.loc 31 60 0
	movl	$1, %edi
.LBB8377:
.LBB8376:
	.loc 63 33 0
	shrl	$5, %ebp
	movl	%ebp, %ecx
.LBE8376:
.LBE8377:
	.loc 31 60 0
	movl	%edi, %ebp
	movl	%ecx, 12(%esp)
	sall	%cl, %ebp
	.loc 31 61 0
	movl	%edx, %ecx
	.loc 31 60 0
	orl	%ebp, ksReadyQueuesL1Bitmap
	.loc 31 61 0
	sall	%cl, %edi
	movl	12(%esp), %ecx
	orl	%edi, ksReadyQueuesL2Bitmap(,%ecx,4)
	movl	%eax, %ecx
	jmp	.L1437
.LVL1493:
.L1439:
.LBE8373:
.LBE8372:
.LBB8378:
.LBB8368:
	call	ready_queues_index.part.224
.LVL1494:
.LBE8368:
.LBE8378:
.LBE8379:
	.cfi_endproc
.LFE1165:
	.size	tcbSchedAppend.part.270, .-tcbSchedAppend.part.270
	.section	.text.unlikely
.LCOLDE355:
	.text
.LHOTE355:
	.section	.text.unlikely
.LCOLDB356:
	.text
.LHOTB356:
	.p2align 4,,15
	.globl	tcbSchedAppend
	.type	tcbSchedAppend, @function
tcbSchedAppend:
.LFB802:
	.loc 31 110 0
	.cfi_startproc
.LVL1495:
	.loc 31 110 0
	movl	4(%esp), %eax
	.loc 31 111 0
	testb	$1, 592(%eax)
	jne	.L1441
	jmp	tcbSchedAppend.part.270
.LVL1496:
	.p2align 4,,10
	.p2align 3
.L1441:
	ret
	.cfi_endproc
.LFE802:
	.size	tcbSchedAppend, .-tcbSchedAppend
	.section	.text.unlikely
.LCOLDE356:
	.text
.LHOTE356:
	.section	.text.unlikely
.LCOLDB357:
	.text
.LHOTB357:
	.p2align 4,,15
	.globl	timerTick
	.type	timerTick, @function
timerTick:
.LFB703:
	.loc 32 437 0
	.cfi_startproc
	.loc 32 438 0
	movl	ksCurThread, %eax
	movl	588(%eax), %edx
	andl	$15, %edx
	cmpl	$1, %edx
	jne	.L1449
	.loc 32 440 0
	movl	632(%eax), %edx
	cmpl	$1, %edx
	jbe	.L1445
	.loc 32 441 0
	subl	$1, %edx
	movl	%edx, 632(%eax)
	ret
	.p2align 4,,10
	.p2align 3
.L1449:
	ret
	.p2align 4,,10
	.p2align 3
.L1445:
	.loc 32 443 0
	movl	$5, 632(%eax)
.LVL1497:
.LBB8380:
.LBB8381:
	.loc 31 111 0
	testb	$1, 592(%eax)
	je	.L1450
.LVL1498:
.LBE8381:
.LBE8380:
	.loc 32 445 0
	jmp	rescheduleRequired
.LVL1499:
	.p2align 4,,10
	.p2align 3
.L1450:
	.loc 32 437 0
	subl	$12, %esp
	.cfi_def_cfa_offset 16
.LBB8383:
.LBB8382:
	call	tcbSchedAppend.part.270
.LVL1500:
.LBE8382:
.LBE8383:
	.loc 32 455 0
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	.loc 32 445 0
	jmp	rescheduleRequired
.LVL1501:
	.cfi_endproc
.LFE703:
	.size	timerTick, .-timerTick
	.section	.text.unlikely
.LCOLDE357:
	.text
.LHOTE357:
	.section	.text.unlikely
.LCOLDB358:
	.text
.LHOTB358:
	.p2align 4,,15
	.globl	tcbSchedDequeue
	.type	tcbSchedDequeue, @function
tcbSchedDequeue:
.LFB803:
	.loc 31 141 0
	.cfi_startproc
.LVL1502:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 31 141 0
	movl	48(%esp), %eax
	movl	592(%eax), %edx
	.loc 31 142 0
	testb	$1, %dl
	je	.L1451
.LVL1503:
.LBB8384:
.LBB8385:
.LBB8386:
	.loc 63 25 0
	movl	620(%eax), %ecx
.LBE8386:
.LBE8385:
	.loc 31 149 0
	movl	628(%eax), %ebx
.LVL1504:
.LBB8389:
.LBB8387:
	.loc 63 25 0
	testl	%ecx, %ecx
	jne	.L1463
.LVL1505:
.LBE8387:
.LBE8389:
	.loc 31 151 0
	movl	ksReadyQueues(,%ebx,8), %edi
	leal	ksReadyQueues(,%ebx,8), %esi
	.loc 31 153 0
	movl	648(%eax), %ecx
	.loc 31 151 0
	movl	4(%esi), %ebp
	movl	%edi, 8(%esp)
.LVL1506:
	.loc 31 154 0
	movl	644(%eax), %edi
.LVL1507:
	.loc 31 153 0
	testl	%ecx, %ecx
	je	.L1454
	.loc 31 154 0
	movl	%edi, 644(%ecx)
.LVL1508:
	.loc 31 162 0
	movl	644(%eax), %edi
	testl	%edi, %edi
	je	.L1464
.L1455:
	.loc 31 163 0
	movl	%ecx, 648(%edi)
.LVL1509:
.L1456:
	.loc 31 168 0
	movl	8(%esp), %ecx
.LBB8390:
.LBB8391:
	.loc 11 396 0
	andl	$-2, %edx
.LBE8391:
.LBE8390:
	.loc 31 168 0
	movl	%ecx, ksReadyQueues(,%ebx,8)
	movl	%ebp, 4(%esi)
.LVL1510:
.LBB8393:
.LBB8392:
	.loc 11 396 0
	movl	%edx, 592(%eax)
.LVL1511:
.L1451:
.LBE8392:
.LBE8393:
.LBE8384:
	.loc 31 172 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1512:
	.p2align 4,,10
	.p2align 3
.L1454:
	.cfi_restore_state
.LBB8403:
	.loc 31 156 0
	movl	%edi, 8(%esp)
.LVL1513:
	.loc 31 157 0
	testl	%edi, %edi
	jne	.L1458
.LVL1514:
.LBB8394:
.LBB8395:
.LBB8396:
.LBB8397:
	.loc 63 33 0
	movl	%ebx, %edi
.LVL1515:
.LBE8397:
.LBE8396:
	.loc 31 70 0
	movl	$1, %ebp
.LVL1516:
	movl	%ebx, %ecx
.LBB8399:
.LBB8398:
	.loc 63 33 0
	shrl	$5, %edi
	movl	%edi, 12(%esp)
.LBE8398:
.LBE8399:
	.loc 31 70 0
	movl	%ebp, %edi
	sall	%cl, %edi
	movl	%edi, %ecx
	movl	12(%esp), %edi
	notl	%ecx
	.loc 31 71 0
	andl	%ecx, ksReadyQueuesL2Bitmap(,%edi,4)
	je	.L1465
.LVL1517:
.LBE8395:
.LBE8394:
	.loc 31 153 0
	xorl	%ebp, %ebp
	jmp	.L1456
.LVL1518:
.L1465:
.LBB8401:
.LBB8400:
	.loc 31 72 0
	movzbl	12(%esp), %ecx
	sall	%cl, %ebp
	notl	%ebp
	andl	%ebp, ksReadyQueuesL1Bitmap
.LVL1519:
.LBE8400:
.LBE8401:
	.loc 31 153 0
	xorl	%ebp, %ebp
	jmp	.L1456
.LVL1520:
.L1458:
	movl	8(%esp), %edi
.LVL1521:
	jmp	.L1455
.LVL1522:
.L1464:
	movl	%ecx, %ebp
.LVL1523:
	jmp	.L1456
.LVL1524:
.L1463:
.LBB8402:
.LBB8388:
	call	ready_queues_index.part.224
.LVL1525:
.LBE8388:
.LBE8402:
.LBE8403:
	.cfi_endproc
.LFE803:
	.size	tcbSchedDequeue, .-tcbSchedDequeue
	.section	.text.unlikely
.LCOLDE358:
	.text
.LHOTE358:
	.section	.text.unlikely
.LCOLDB359:
	.text
.LHOTB359:
	.p2align 4,,15
	.globl	switchToThread
	.type	switchToThread, @function
switchToThread:
.LFB693:
	.loc 32 326 0
	.cfi_startproc
.LVL1526:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$20, %esp
	.cfi_def_cfa_offset 28
	.loc 32 326 0
	movl	28(%esp), %ebx
.LVL1527:
.LBB8404:
.LBB8405:
	.loc 14 22 0
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	setVMRoot
.LVL1528:
.LBE8405:
.LBE8404:
	.loc 32 331 0
	movl	%ebx, (%esp)
	call	tcbSchedDequeue
.LVL1529:
	.loc 32 332 0
	movl	%ebx, ksCurThread
	.loc 32 333 0
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE693:
	.size	switchToThread, .-switchToThread
	.section	.text.unlikely
.LCOLDE359:
	.text
.LHOTE359:
	.section	.text.unlikely
.LCOLDB360:
	.text
.LHOTB360:
	.p2align 4,,15
	.globl	setDomain
	.type	setDomain, @function
setDomain:
.LFB695:
	.loc 32 347 0
	.cfi_startproc
.LVL1530:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$16, %esp
	.cfi_def_cfa_offset 28
	.loc 32 347 0
	movl	28(%esp), %ebx
	movl	32(%esp), %esi
	.loc 32 348 0
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	tcbSchedDequeue
.LVL1531:
.LBB8406:
.LBB8407:
	.loc 63 45 0
	movl	588(%ebx), %eax
.LBE8407:
.LBE8406:
	.loc 32 349 0
	movl	%esi, 620(%ebx)
.LVL1532:
.LBB8409:
.LBB8408:
	.loc 63 45 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	andl	$15, %eax
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L1469
.LVL1533:
.LBE8408:
.LBE8409:
.LBB8410:
.LBB8411:
	.loc 31 80 0
	testb	$1, 592(%ebx)
	je	.L1477
.LVL1534:
.L1469:
.LBE8411:
.LBE8410:
	.loc 32 353 0
	cmpl	ksCurThread, %ebx
	je	.L1478
.L1468:
	.loc 32 356 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL1535:
	.p2align 4,,10
	.p2align 3
.L1477:
	.cfi_restore_state
.LBB8413:
.LBB8412:
	movl	%ebx, %eax
	call	tcbSchedEnqueue.part.263
.LVL1536:
.LBE8412:
.LBE8413:
	.loc 32 353 0
	cmpl	ksCurThread, %ebx
	jne	.L1468
.LVL1537:
.L1478:
	.loc 32 356 0
	addl	$4, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	.loc 32 354 0
	jmp	rescheduleRequired
.LVL1538:
	.cfi_endproc
.LFE695:
	.size	setDomain, .-setDomain
	.section	.text.unlikely
.LCOLDE360:
	.text
.LHOTE360:
	.section	.text.unlikely
.LCOLDB361:
	.text
.LHOTB361:
	.p2align 4,,15
	.globl	setPriority
	.type	setPriority, @function
setPriority:
.LFB697:
	.loc 32 366 0
	.cfi_startproc
.LVL1539:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$16, %esp
	.cfi_def_cfa_offset 28
	.loc 32 366 0
	movl	28(%esp), %ebx
	movl	32(%esp), %esi
	.loc 32 367 0
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	tcbSchedDequeue
.LVL1540:
.LBB8414:
.LBB8415:
	.loc 63 45 0
	movl	588(%ebx), %eax
.LBE8415:
.LBE8414:
	.loc 32 368 0
	movl	%esi, 628(%ebx)
.LVL1541:
.LBB8417:
.LBB8416:
	.loc 63 45 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	andl	$15, %eax
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L1480
.LVL1542:
.LBE8416:
.LBE8417:
.LBB8418:
.LBB8419:
	.loc 31 80 0
	testb	$1, 592(%ebx)
	je	.L1488
.LVL1543:
.L1480:
.LBE8419:
.LBE8418:
	.loc 32 372 0
	cmpl	ksCurThread, %ebx
	je	.L1489
.L1479:
	.loc 32 375 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL1544:
	.p2align 4,,10
	.p2align 3
.L1488:
	.cfi_restore_state
.LBB8421:
.LBB8420:
	movl	%ebx, %eax
	call	tcbSchedEnqueue.part.263
.LVL1545:
.LBE8420:
.LBE8421:
	.loc 32 372 0
	cmpl	ksCurThread, %ebx
	jne	.L1479
.LVL1546:
.L1489:
	.loc 32 375 0
	addl	$4, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	.loc 32 373 0
	jmp	rescheduleRequired
.LVL1547:
	.cfi_endproc
.LFE697:
	.size	setPriority, .-setPriority
	.section	.text.unlikely
.LCOLDE361:
	.text
.LHOTE361:
	.section	.rodata.str1.4
	.align 4
.LC362:
	.string	"(((~0xf >> 0) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB363:
	.text
.LHOTB363:
	.p2align 4,,15
	.globl	setThreadState
	.type	setThreadState, @function
setThreadState:
.LFB701:
	.loc 32 420 0
	.cfi_startproc
.LVL1548:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 32 420 0
	movl	20(%esp), %edx
	movl	16(%esp), %eax
.LVL1549:
.LBB8434:
.LBB8435:
	.loc 11 444 0
	testl	$-16, %edx
	jne	.L1494
	.loc 11 446 0
	movl	588(%eax), %ecx
	andl	$-16, %ecx
	orl	%ecx, %edx
.LVL1550:
	movl	%edx, 588(%eax)
.LVL1551:
.LBE8435:
.LBE8434:
.LBB8439:
.LBB8440:
	.loc 32 428 0
	cmpl	ksCurThread, %eax
	je	.L1495
.L1490:
.LBE8440:
.LBE8439:
	.loc 32 423 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L1495:
	.cfi_restore_state
.LVL1552:
.LBB8441:
.LBB8442:
.LBB8443:
	.loc 32 428 0
	movl	ksSchedulerAction, %edx
	testl	%edx, %edx
	jne	.L1490
.LBE8443:
.LBE8442:
.LBE8441:
	.loc 32 423 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
.LBB8446:
.LBB8445:
.LBB8444:
	jmp	scheduleTCB.part.264
.LVL1553:
.L1494:
	.cfi_restore_state
.LBE8444:
.LBE8445:
.LBE8446:
.LBB8447:
.LBB8438:
.LBB8436:
.LBB8437:
	.loc 11 444 0
	pushl	$__FUNCTION__.1482
	.cfi_def_cfa_offset 20
	pushl	$444
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC362
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1554:
.LBE8437:
.LBE8436:
.LBE8438:
.LBE8447:
	.cfi_endproc
.LFE701:
	.size	setThreadState, .-setThreadState
	.section	.text.unlikely
.LCOLDE363:
	.text
.LHOTE363:
	.section	.boot.text
.LCOLDB364:
.LHOTB364:
	.p2align 4,,15
	.globl	configureIdleThread
	.type	configureIdleThread, @function
configureIdleThread:
.LFB680:
	.loc 32 48 0
	.cfi_startproc
.LVL1555:
	subl	$20, %esp
	.cfi_def_cfa_offset 24
	.loc 32 48 0
	movl	24(%esp), %eax
.LVL1556:
.LBB8448:
.LBB8449:
.LBB8450:
.LBB8451:
	.loc 15 30 0
	movl	$514, 576(%eax)
.LVL1557:
.LBE8451:
.LBE8450:
.LBB8452:
.LBB8453:
	movl	$idle_thread, 568(%eax)
.LVL1558:
.LBE8453:
.LBE8452:
.LBB8454:
.LBB8455:
	movl	$8, 572(%eax)
.LVL1559:
.LBE8455:
.LBE8454:
.LBB8456:
.LBB8457:
	movl	$16, 540(%eax)
.LVL1560:
.LBE8457:
.LBE8456:
.LBB8458:
.LBB8459:
	movl	$16, 544(%eax)
.LVL1561:
.LBE8459:
.LBE8458:
.LBB8460:
.LBB8461:
	movl	$16, 548(%eax)
.LVL1562:
.LBE8461:
.LBE8460:
.LBB8462:
.LBB8463:
	movl	$16, 552(%eax)
.LVL1563:
.LBE8463:
.LBE8462:
.LBB8464:
.LBB8465:
	movl	$16, 584(%eax)
.LVL1564:
.LBE8465:
.LBE8464:
.LBE8449:
.LBE8448:
	.loc 32 50 0
	pushl	$7
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	setThreadState
.LVL1565:
	.loc 32 51 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE680:
	.size	configureIdleThread, .-configureIdleThread
.LCOLDE364:
.LHOTE364:
	.section	.rodata.str1.4
	.align 4
.LC365:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/kernel/thread.c"
	.section	.rodata.str1.1
.LC366:
	.string	"Current thread is blocked"
	.section	.text.unlikely
.LCOLDB367:
	.text
.LHOTB367:
	.p2align 4,,15
	.globl	activateThread
	.type	activateThread, @function
activateThread:
.LFB681:
	.loc 32 55 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 32 56 0
	movl	ksCurThread, %edx
	movl	588(%edx), %eax
	andl	$15, %eax
	cmpl	$2, %eax
	je	.L1500
	cmpl	$7, %eax
	je	.L1498
	cmpl	$1, %eax
	je	.L1498
.LBB8486:
.LBB8487:
	.loc 32 77 0
	pushl	$__func__.8297
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$77
	.cfi_def_cfa_offset 24
	pushl	$.LC365
	.cfi_def_cfa_offset 28
	pushl	$.LC366
	.cfi_def_cfa_offset 32
	call	_fail
.LVL1566:
	.p2align 4,,10
	.p2align 3
.L1500:
	.cfi_restore_state
.LBE8487:
.LBE8486:
.LBB8488:
.LBB8489:
.LBB8490:
.LBB8491:
	.loc 15 30 0
	movl	556(%edx), %eax
.LBE8491:
.LBE8490:
.LBE8489:
	.loc 32 68 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
.LBB8494:
.LBB8493:
.LBB8492:
	.loc 15 30 0
	movl	%eax, 568(%edx)
.LVL1567:
.LBE8492:
.LBE8493:
.LBE8494:
	.loc 32 68 0
	pushl	$1
	.cfi_def_cfa_offset 28
	pushl	%edx
	.cfi_def_cfa_offset 32
	call	setThreadState
.LVL1568:
	.loc 32 69 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L1498:
.LBE8488:
	.loc 32 79 0
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE681:
	.size	activateThread, .-activateThread
	.section	.text.unlikely
.LCOLDE367:
	.text
.LHOTE367:
	.section	.text.unlikely
.LCOLDB368:
	.text
.LHOTB368:
	.p2align 4,,15
	.globl	cancelAllIPC
	.type	cancelAllIPC, @function
cancelAllIPC:
.LFB759:
	.file 64 "/home/axjllt/Desktop/ori_refos/kernel/src/object/endpoint.c"
	.loc 64 280 0
	.cfi_startproc
.LVL1569:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 64 280 0
	movl	16(%esp), %eax
	movl	(%eax), %edx
.LVL1570:
	.loc 64 281 0
	testb	$3, %dl
	je	.L1510
	movl	4(%eax), %ebx
.LVL1571:
.LBB8495:
.LBB8496:
.LBB8497:
	.loc 11 900 0
	andl	$12, %edx
	movl	%edx, (%eax)
.LBE8497:
.LBE8496:
.LBB8498:
.LBB8499:
	.loc 11 881 0
	movl	%ebx, %ecx
	andl	$15, %ecx
.LBE8499:
.LBE8498:
	.loc 64 294 0
	andl	$-16, %ebx
.LVL1572:
.LBB8501:
.LBB8500:
	.loc 11 881 0
	movl	%ecx, 4(%eax)
.LVL1573:
.LBE8500:
.LBE8501:
	.loc 64 294 0
	jne	.L1517
	jmp	.L1516
.LVL1574:
	.p2align 4,,10
	.p2align 3
.L1514:
	.loc 64 294 0 is_stmt 0 discriminator 2
	movl	652(%ebx), %ebx
.LVL1575:
	testl	%ebx, %ebx
	je	.L1516
.LVL1576:
.L1517:
	.loc 64 295 0 is_stmt 1 discriminator 2
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	pushl	$2
	.cfi_def_cfa_offset 28
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	setThreadState
.LVL1577:
.LBB8502:
.LBB8503:
	.loc 31 80 0 discriminator 2
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testb	$1, 592(%ebx)
	jne	.L1514
	movl	%ebx, %eax
	call	tcbSchedEnqueue.part.263
.LVL1578:
.LBE8503:
.LBE8502:
	.loc 64 294 0
	movl	652(%ebx), %ebx
.LVL1579:
	testl	%ebx, %ebx
	jne	.L1517
.LVL1580:
.L1516:
.LBE8495:
	.loc 64 303 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LBB8504:
	.loc 64 299 0
	jmp	rescheduleRequired
.LVL1581:
	.p2align 4,,10
	.p2align 3
.L1510:
	.cfi_restore_state
.LBE8504:
	.loc 64 303 0
	addl	$8, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE759:
	.size	cancelAllIPC, .-cancelAllIPC
	.section	.text.unlikely
.LCOLDE368:
	.text
.LHOTE368:
	.section	.text.unlikely
.LCOLDB369:
	.text
.LHOTB369:
	.p2align 4,,15
	.globl	cancelAllSignals
	.type	cancelAllSignals, @function
cancelAllSignals:
.LFB777:
	.loc 36 167 0
	.cfi_startproc
.LVL1582:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 36 167 0
	movl	16(%esp), %eax
	movl	(%eax), %edx
.LVL1583:
	.loc 36 168 0
	movl	%edx, %ecx
	andl	$3, %ecx
	cmpl	$1, %ecx
	je	.L1529
	.loc 36 182 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L1529:
	.cfi_restore_state
	movl	4(%eax), %ebx
.LVL1584:
.LBB8505:
.LBB8506:
.LBB8507:
	.loc 11 1104 0
	andl	$12, %edx
	movl	%edx, (%eax)
.LBE8507:
.LBE8506:
.LBB8508:
.LBB8509:
	.loc 11 1085 0
	movl	%ebx, %ecx
	andl	$15, %ecx
.LBE8509:
.LBE8508:
	.loc 36 176 0
	andl	$-16, %ebx
.LVL1585:
.LBB8511:
.LBB8510:
	.loc 11 1085 0
	movl	%ecx, 4(%eax)
.LVL1586:
.LBE8510:
.LBE8511:
	.loc 36 176 0
	jne	.L1526
	jmp	.L1525
.LVL1587:
	.p2align 4,,10
	.p2align 3
.L1523:
	.loc 36 176 0 is_stmt 0 discriminator 2
	movl	652(%ebx), %ebx
.LVL1588:
	testl	%ebx, %ebx
	je	.L1525
.LVL1589:
.L1526:
	.loc 36 177 0 is_stmt 1 discriminator 2
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	pushl	$2
	.cfi_def_cfa_offset 28
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	setThreadState
.LVL1590:
.LBB8512:
.LBB8513:
	.loc 31 80 0 discriminator 2
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testb	$1, 592(%ebx)
	jne	.L1523
	movl	%ebx, %eax
	call	tcbSchedEnqueue.part.263
.LVL1591:
.LBE8513:
.LBE8512:
	.loc 36 176 0
	movl	652(%ebx), %ebx
.LVL1592:
	testl	%ebx, %ebx
	jne	.L1526
.LVL1593:
.L1525:
.LBE8505:
	.loc 36 182 0
	addl	$8, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LBB8514:
	.loc 36 180 0
	jmp	rescheduleRequired
.LVL1594:
.LBE8514:
	.cfi_endproc
.LFE777:
	.size	cancelAllSignals, .-cancelAllSignals
	.section	.text.unlikely
.LCOLDE369:
	.text
.LHOTE369:
	.section	.rodata.str1.4
	.align 4
.LC370:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/machine/fpu.c"
	.align 4
.LC371:
	.string	"!nativeThreadUsingFPU(NODE_STATE(ksCurThread))"
	.section	.text.unlikely
.LCOLDB372:
	.text
.LHOTB372:
	.p2align 4,,15
	.globl	handleFPUFault
	.type	handleFPUFault, @function
handleFPUFault:
.LFB707:
	.loc 6 55 0
	.cfi_startproc
.LVL1595:
.LBB8549:
.LBB8550:
	.loc 53 37 0
	movl	ksCurThread, %eax
	movl	ksActiveFPUState, %edx
.LVL1596:
.LBE8550:
.LBE8549:
	.loc 6 59 0
	cmpl	%eax, %edx
	je	.L1539
.LVL1597:
.LBB8551:
.LBB8552:
.LBB8553:
.LBB8554:
	.loc 24 108 0
#APP
# 108 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h" 1
	clts
# 0 "" 2
#NO_APP
.LBE8554:
.LBE8553:
	.loc 6 24 0
	testl	%edx, %edx
	je	.L1532
.LVL1598:
.LBB8555:
.LBB8556:
	.loc 24 70 0
#APP
# 70 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h" 1
	fxsave (%edx)
# 0 "" 2
.LVL1599:
#NO_APP
.L1532:
.LBE8556:
.LBE8555:
	.loc 6 27 0
	testl	%eax, %eax
	je	.L1533
	.loc 6 28 0
	movl	$0, ksFPURestoresSinceSwitch
.LVL1600:
.LBB8557:
.LBB8558:
	.loc 24 86 0
#APP
# 86 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h" 1
	fxrstor (%eax)
# 0 "" 2
#NO_APP
.LBE8558:
.LBE8557:
	.loc 6 33 0
	movl	%eax, ksActiveFPUState
.LVL1601:
.LBE8552:
.LBE8551:
	.loc 6 65 0
	xorl	%eax, %eax
	ret
.LVL1602:
	.p2align 4,,10
	.p2align 3
.L1533:
.LBB8566:
.LBB8565:
.LBB8559:
.LBB8560:
.LBB8561:
.LBB8562:
	.loc 7 29 0
#APP
# 29 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h" 1
	movl %cr0, %edx
# 0 "" 2
.LVL1603:
#NO_APP
.LBE8562:
.LBE8561:
.LBB8563:
.LBB8564:
	.loc 7 35 0
	orl	$8, %edx
.LVL1604:
#APP
# 35 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h" 1
	movl %edx, %cr0
# 0 "" 2
.LVL1605:
#NO_APP
.LBE8564:
.LBE8563:
.LBE8560:
.LBE8559:
	.loc 6 33 0
	movl	%eax, ksActiveFPUState
.LVL1606:
.LBE8565:
.LBE8566:
	.loc 6 65 0
	xorl	%eax, %eax
	ret
.L1539:
	.loc 6 55 0
	subl	$12, %esp
	.cfi_def_cfa_offset 16
.LBB8567:
.LBB8568:
	.loc 6 59 0
	pushl	$__FUNCTION__.8431
	.cfi_def_cfa_offset 20
	pushl	$59
	.cfi_def_cfa_offset 24
	pushl	$.LC370
	.cfi_def_cfa_offset 28
	pushl	$.LC371
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1607:
.LBE8568:
.LBE8567:
	.cfi_endproc
.LFE707:
	.size	handleFPUFault, .-handleFPUFault
	.section	.text.unlikely
.LCOLDE372:
	.text
.LHOTE372:
	.section	.text.unlikely
.LCOLDB373:
.LHOTB373:
	.type	cap_notification_cap_get_capNtfnBadge.part.228, @function
cap_notification_cap_get_capNtfnBadge.part.228:
.LFB1123:
	.loc 11 2496 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2498 0
	pushl	$__FUNCTION__.2353
	.cfi_def_cfa_offset 20
	pushl	$2499
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC184
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1608:
	.cfi_endproc
.LFE1123:
	.size	cap_notification_cap_get_capNtfnBadge.part.228, .-cap_notification_cap_get_capNtfnBadge.part.228
.LCOLDE373:
.LHOTE373:
	.section	.rodata.str1.4
	.align 4
.LC374:
	.string	"(((~0xfffffff8 << 0) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB375:
.LHOTB375:
	.type	mdb_node_ptr_set_mdbNext.isra.229.part.230, @function
mdb_node_ptr_set_mdbNext.isra.229.part.230:
.LFB1125:
	.loc 11 673 0
	.cfi_startproc
.LVL1609:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 675 0
	pushl	$__FUNCTION__.1583
	.cfi_def_cfa_offset 20
	pushl	$675
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC374
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1610:
	.cfi_endproc
.LFE1125:
	.size	mdb_node_ptr_set_mdbNext.isra.229.part.230, .-mdb_node_ptr_set_mdbNext.isra.229.part.230
.LCOLDE375:
.LHOTE375:
.LCOLDB376:
.LHOTB376:
	.type	mdb_node_ptr_set_mdbPrev.isra.231.part.232, @function
mdb_node_ptr_set_mdbPrev.isra.231.part.232:
.LFB1127:
	.loc 11 757 0
	.cfi_startproc
.LVL1611:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 759 0
	pushl	$__FUNCTION__.1625
	.cfi_def_cfa_offset 20
	pushl	$759
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC374
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1612:
	.cfi_endproc
.LFE1127:
	.size	mdb_node_ptr_set_mdbPrev.isra.231.part.232, .-mdb_node_ptr_set_mdbPrev.isra.231.part.232
.LCOLDE376:
.LHOTE376:
.LCOLDB377:
	.text
.LHOTB377:
	.p2align 4,,15
	.globl	cteSwap
	.type	cteSwap, @function
cteSwap:
.LFB734:
	.loc 33 521 0
	.cfi_startproc
.LVL1613:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	.loc 33 521 0
	movl	40(%esp), %eax
	.loc 33 525 0
	movl	44(%esp), %edi
	.loc 33 521 0
	movl	52(%esp), %edx
	.loc 33 526 0
	movl	32(%esp), %esi
	.loc 33 525 0
	movl	48(%esp), %ebp
	movl	%edi, (%eax)
	.loc 33 526 0
	movl	36(%esp), %edi
	.loc 33 525 0
	movl	%ebp, 4(%eax)
	.loc 33 526 0
	movl	%esi, (%edx)
	movl	%edi, 4(%edx)
	.loc 33 528 0
	movl	8(%eax), %esi
.LVL1614:
	movl	12(%eax), %edi
.LVL1615:
	.loc 33 531 0
	movl	%esi, %ebx
	andl	$-8, %ebx
	je	.L1547
.LVL1616:
.LBB8569:
.LBB8570:
	.loc 11 675 0
	testb	$7, %dl
	jne	.L1554
	.loc 11 677 0
	movl	12(%ebx), %ecx
	movl	%edx, %ebp
	andl	$-8, %ebp
	andl	$7, %ecx
	orl	%ebp, %ecx
	movl	%ecx, 12(%ebx)
.LBE8570:
.LBE8569:
	.loc 33 537 0
	movl	%edi, %ecx
	andl	$-8, %ecx
	je	.L1550
.LVL1617:
.L1559:
.LBB8572:
.LBB8573:
	.loc 11 761 0
	movl	8(%ecx), %ebx
	andl	$7, %ebx
	orl	%ebp, %ebx
	movl	%ebx, 8(%ecx)
.LVL1618:
.L1550:
.LBE8573:
.LBE8572:
	.loc 33 542 0
	movl	8(%edx), %ebx
.LVL1619:
	movl	12(%edx), %ecx
.LVL1620:
	.loc 33 543 0
	movl	%ebx, 8(%eax)
	.loc 33 547 0
	andl	$-8, %ebx
.LVL1621:
	.loc 33 543 0
	movl	%ecx, 12(%eax)
	.loc 33 544 0
	movl	%esi, 8(%edx)
.LVL1622:
	movl	%edi, 12(%edx)
	.loc 33 547 0
	jne	.L1568
	.loc 33 553 0
	andl	$-8, %ecx
.LVL1623:
	je	.L1546
.LVL1624:
.LBB8576:
.LBB8577:
	.loc 11 759 0
	testb	$7, %al
	jne	.L1558
	andl	$-8, %eax
.LVL1625:
.L1560:
	.loc 11 761 0
	movl	8(%ecx), %edx
	andl	$7, %edx
	orl	%edx, %eax
	movl	%eax, 8(%ecx)
.LVL1626:
.L1546:
.LBE8577:
.LBE8576:
	.loc 33 557 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1627:
	.p2align 4,,10
	.p2align 3
.L1547:
	.cfi_restore_state
	.loc 33 537 0
	movl	%edi, %ecx
	andl	$-8, %ecx
	je	.L1550
.LVL1628:
.LBB8578:
.LBB8574:
	.loc 11 759 0
	testb	$7, %dl
	jne	.L1558
	movl	%edx, %ebp
	andl	$-8, %ebp
	jmp	.L1559
.LVL1629:
	.p2align 4,,10
	.p2align 3
.L1568:
.LBE8574:
.LBE8578:
.LBB8579:
.LBB8580:
	.loc 11 675 0
	testb	$7, %al
	jne	.L1554
	.loc 11 677 0
	movl	12(%ebx), %edx
	andl	$-8, %eax
.LVL1630:
	andl	$7, %edx
	orl	%eax, %edx
.LBE8580:
.LBE8579:
	.loc 33 553 0
	andl	$-8, %ecx
.LVL1631:
.LBB8582:
.LBB8581:
	.loc 11 677 0
	movl	%edx, 12(%ebx)
.LBE8581:
.LBE8582:
	.loc 33 553 0
	jne	.L1560
	.loc 33 557 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL1632:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL1633:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL1634:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1635:
.L1554:
	.cfi_restore_state
.LBB8583:
.LBB8571:
	call	mdb_node_ptr_set_mdbNext.isra.229.part.230
.LVL1636:
.L1558:
.LBE8571:
.LBE8583:
.LBB8584:
.LBB8575:
	call	mdb_node_ptr_set_mdbPrev.isra.231.part.232
.LVL1637:
.LBE8575:
.LBE8584:
	.cfi_endproc
.LFE734:
	.size	cteSwap, .-cteSwap
	.section	.text.unlikely
.LCOLDE377:
	.text
.LHOTE377:
	.section	.text.unlikely
.LCOLDB378:
	.text
.LHOTB378:
	.p2align 4,,15
	.type	capSwapForDelete.part.233, @function
capSwapForDelete.part.233:
.LFB1128:
	.loc 33 505 0
	.cfi_startproc
.LVL1638:
	subl	$20, %esp
	.cfi_def_cfa_offset 24
	.loc 33 516 0
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	4(%edx)
	.cfi_def_cfa_offset 32
	pushl	(%edx)
	.cfi_def_cfa_offset 36
	pushl	%eax
	.cfi_def_cfa_offset 40
	pushl	4(%eax)
	.cfi_def_cfa_offset 44
	pushl	(%eax)
	.cfi_def_cfa_offset 48
	call	cteSwap
.LVL1639:
	.loc 33 517 0
	addl	$44, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE1128:
	.size	capSwapForDelete.part.233, .-capSwapForDelete.part.233
	.section	.text.unlikely
.LCOLDE378:
	.text
.LHOTE378:
	.section	.text.unlikely
.LCOLDB379:
	.text
.LHOTB379:
	.p2align 4,,15
	.globl	capSwapForDelete
	.type	capSwapForDelete, @function
capSwapForDelete:
.LFB733:
	.loc 33 506 0
	.cfi_startproc
.LVL1640:
	.loc 33 506 0
	movl	4(%esp), %eax
	movl	8(%esp), %edx
	.loc 33 509 0
	cmpl	%edx, %eax
	je	.L1571
	jmp	capSwapForDelete.part.233
.LVL1641:
	.p2align 4,,10
	.p2align 3
.L1571:
	ret
	.cfi_endproc
.LFE733:
	.size	capSwapForDelete, .-capSwapForDelete
	.section	.text.unlikely
.LCOLDE379:
	.text
.LHOTE379:
	.section	.rodata.str1.4
	.align 4
.LC380:
	.string	"(((~0xfffffff8 << 0 ) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0)"
	.align 4
.LC381:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/object/cnode.c"
	.align 4
.LC382:
	.string	"cap_get_capType(destSlot->cap) == cap_null_cap"
	.align 4
.LC383:
	.string	"(cte_t*)mdb_node_get_mdbNext(destSlot->cteMDBNode) == NULL && (cte_t*)mdb_node_get_mdbPrev(destSlot->cteMDBNode) == NULL"
	.section	.text.unlikely
.LCOLDB384:
	.text
.LHOTB384:
	.p2align 4,,15
	.globl	cteInsert
	.type	cteInsert, @function
cteInsert:
.LFB731:
	.loc 33 415 0
	.cfi_startproc
.LVL1642:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 33 415 0
	movl	72(%esp), %ebx
	movl	64(%esp), %esi
	movl	68(%esp), %eax
	.loc 33 420 0
	movl	12(%ebx), %edx
.LVL1643:
.LBB8633:
.LBB8634:
	.loc 11 2202 0
	movl	%esi, %edi
	.loc 11 2203 0
	movl	%esi, %ecx
.LBE8634:
.LBE8633:
	.loc 33 420 0
	movl	8(%ebx), %ebp
.LBB8638:
.LBB8635:
	.loc 11 2202 0
	andl	$14, %edi
	.loc 11 2203 0
	movzbl	%cl, %ecx
.LVL1644:
.LBE8635:
.LBE8638:
	.loc 33 415 0
	movl	%eax, 12(%esp)
	movl	76(%esp), %eax
.LBB8639:
.LBB8636:
	.loc 11 2202 0
	movl	%edi, 24(%esp)
.LBE8636:
.LBE8639:
	.loc 33 420 0
	movl	%edx, 16(%esp)
	.loc 33 421 0
	movl	(%ebx), %edx
	movl	%edx, 8(%esp)
.LVL1645:
	movl	4(%ebx), %edx
.LVL1646:
	movl	%edx, 28(%esp)
.LVL1647:
.LBB8640:
.LBB8637:
	.loc 11 2203 0
	movl	%esi, %edx
.LVL1648:
	andl	$15, %edx
	cmpl	$14, %edi
	cmovne	%edx, %ecx
.LVL1649:
.LBE8637:
.LBE8640:
	.loc 33 423 0
	cmpl	$4, %ecx
	je	.L1577
	jbe	.L1609
	cmpl	$6, %ecx
	je	.L1580
	cmpl	$30, %ecx
	jne	.L1603
.LVL1650:
.LBB8641:
.LBB8642:
	.loc 11 2202 0
	movl	8(%esp), %edx
	movl	%edx, %edi
	.loc 11 2203 0
	movl	%edx, %ecx
	movzbl	%dl, %edx
	.loc 11 2202 0
	andl	$14, %edi
	.loc 11 2203 0
	andl	$15, %ecx
	cmpl	$14, %edi
	cmovne	%ecx, %edx
.LVL1651:
.LBE8642:
.LBE8641:
	.loc 33 436 0
	cmpl	$14, %edx
	sete	%dl
	movzbl	%dl, %edx
.LVL1652:
.L1576:
.LBB8643:
.LBB8644:
	.loc 11 750 0
	testb	$7, %bl
	jne	.L1610
.LVL1653:
.LBE8644:
.LBE8643:
.LBB8648:
.LBB8649:
	.loc 11 723 0
	leal	(%edx,%edx), %edi
.LBE8649:
.LBE8648:
.LBB8652:
.LBB8645:
	.loc 11 752 0
	movl	%ebx, %ecx
	andl	$7, %ebp
.LVL1654:
	andl	$-8, %ecx
	orl	%ecx, %ebp
.LVL1655:
.LBE8645:
.LBE8652:
.LBB8653:
.LBB8650:
	.loc 11 723 0
	movl	16(%esp), %ecx
.LBE8650:
.LBE8653:
.LBB8654:
.LBB8646:
	.loc 11 752 0
	movl	%ebp, 20(%esp)
.LVL1656:
.LBE8646:
.LBE8654:
.LBB8655:
.LBB8651:
	.loc 11 723 0
	andl	$-4, %ecx
.LVL1657:
	orl	%edi, %ecx
.LVL1658:
	.loc 11 724 0
	orl	%ecx, %edx
.LVL1659:
	movl	(%eax), %ecx
.LVL1660:
.LBE8651:
.LBE8655:
.LBB8656:
.LBB8657:
	.loc 11 2202 0
	movl	%ecx, %ebp
.LVL1661:
	.loc 11 2203 0
	movl	%ecx, %edi
	movzbl	%cl, %ecx
.LVL1662:
	.loc 11 2202 0
	andl	$14, %ebp
	.loc 11 2203 0
	andl	$15, %edi
.LVL1663:
	cmpl	$14, %ebp
	cmovne	%edi, %ecx
.LVL1664:
.LBE8657:
.LBE8656:
	.loc 33 454 0
	testl	%ecx, %ecx
	jne	.L1611
	.loc 33 456 0
	testl	$-8, 12(%eax)
	jne	.L1592
	.loc 33 456 0 is_stmt 0 discriminator 2
	testl	$-8, 8(%eax)
	jne	.L1592
.LVL1665:
.LBB8658:
.LBB8659:
.LBB8660:
.LBB8661:
	.loc 11 2202 0 is_stmt 1
	movl	8(%esp), %ecx
	movl	%ecx, %ebp
	.loc 11 2203 0
	movl	%ecx, %edi
	movzbl	%cl, %ecx
	.loc 11 2202 0
	andl	$14, %ebp
	.loc 11 2203 0
	andl	$15, %edi
	cmpl	$14, %ebp
	cmovne	%edi, %ecx
.LVL1666:
.LBE8661:
.LBE8660:
	.loc 33 401 0
	cmpl	$2, %ecx
	je	.L1612
.LVL1667:
.L1596:
.LBE8659:
.LBE8658:
	.loc 33 463 0
	movl	%esi, (%eax)
.LVL1668:
	movl	12(%esp), %esi
.LVL1669:
	.loc 33 464 0
	movl	%edx, 12(%eax)
.LVL1670:
	.loc 33 463 0
	movl	%esi, 4(%eax)
	.loc 33 464 0
	movl	20(%esp), %esi
	movl	%esi, 8(%eax)
.LBB8678:
.LBB8679:
	.loc 11 675 0
	testb	$7, %al
	jne	.L1613
.LVL1671:
	.loc 11 677 0
	movl	12(%ebx), %ecx
	andl	$-8, %eax
.LVL1672:
	andl	$7, %ecx
	orl	%eax, %ecx
.LBE8679:
.LBE8678:
	.loc 33 466 0
	andl	$-8, %edx
.LVL1673:
.LBB8682:
.LBB8680:
	.loc 11 677 0
	movl	%ecx, 12(%ebx)
.LVL1674:
.LBE8680:
.LBE8682:
	.loc 33 466 0
	je	.L1573
.LVL1675:
.LBB8683:
.LBB8684:
	.loc 11 761 0
	movl	8(%edx), %ecx
	andl	$7, %ecx
	orl	%ecx, %eax
	movl	%eax, 8(%edx)
.LVL1676:
.L1573:
.LBE8684:
.LBE8683:
	.loc 33 471 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL1677:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1678:
	.p2align 4,,10
	.p2align 3
.L1580:
	.cfi_restore_state
.LBB8685:
.LBB8686:
	.loc 11 2498 0
	cmpl	$6, %edx
	jne	.L1585
.LBE8686:
.LBE8685:
.LBB8690:
.LBB8691:
	movl	8(%esp), %ecx
.LBE8691:
.LBE8690:
.LBB8694:
.LBB8687:
	.loc 11 2501 0
	movl	12(%esp), %edx
.LBE8687:
.LBE8694:
.LBB8695:
.LBB8692:
	.loc 11 2498 0
	andl	$15, %ecx
.LBE8692:
.LBE8695:
.LBB8696:
.LBB8688:
	.loc 11 2501 0
	shrl	$4, %edx
.LVL1679:
.LBE8688:
.LBE8696:
.LBB8697:
.LBB8693:
	.loc 11 2498 0
	cmpl	$6, %ecx
	jne	.L1585
.LBE8693:
.LBE8697:
	.loc 33 430 0
	movl	28(%esp), %ecx
	shrl	$4, %ecx
	cmpl	%edx, %ecx
	setne	%dl
	movzbl	%dl, %edx
.LVL1680:
	.loc 33 433 0
	jmp	.L1576
.LVL1681:
	.p2align 4,,10
	.p2align 3
.L1612:
.LBB8698:
.LBB8676:
.LBB8662:
.LBB8663:
	.loc 11 2203 0
	movl	%esi, %ebp
	movl	%esi, %ecx
	andl	$15, %ebp
	cmpl	$14, 24(%esp)
	movzbl	%cl, %ecx
.LVL1682:
	cmovne	%ebp, %ecx
.LVL1683:
.LBE8663:
.LBE8662:
	.loc 33 402 0
	cmpl	$2, %ecx
	jne	.L1596
.LVL1684:
.LBB8664:
.LBB8665:
	.loc 11 2320 0
	cmpl	$2, %edi
	jne	.L1600
	.loc 11 2323 0
	movl	8(%esp), %ecx
	andl	$-16, %ecx
.LVL1685:
.LBE8665:
.LBE8664:
.LBB8667:
.LBB8668:
	.loc 11 2320 0
	cmpl	$2, %ebp
	jne	.L1600
.LVL1686:
.LBE8668:
.LBE8667:
	.loc 33 403 0
	movl	%esi, %edi
	andl	$-16, %edi
	cmpl	%edi, %ecx
	jne	.L1596
.LVL1687:
.LBB8669:
.LBB8670:
	.loc 11 2309 0
	movl	12(%esp), %edi
.LBE8670:
.LBE8669:
	.loc 33 405 0
	movl	28(%esp), %ecx
.LBB8672:
.LBB8671:
	.loc 11 2309 0
	andl	$31, %edi
.LVL1688:
.LBE8671:
.LBE8672:
	.loc 33 405 0
	andl	$31, %ecx
.LVL1689:
	cmpl	%ecx, %edi
	jne	.L1596
.LVL1690:
.LBB8673:
.LBB8674:
	.loc 11 2286 0
	leal	-4(%edi), %ecx
	movl	$64, %edi
.LVL1691:
	sall	%cl, %edi
	movl	%edi, %ecx
.LVL1692:
	movl	28(%esp), %edi
	andl	$63, %edi
	orl	%ecx, %edi
	movl	%edi, 4(%ebx)
.LVL1693:
	jmp	.L1596
.LVL1694:
	.p2align 4,,10
	.p2align 3
.L1609:
.LBE8674:
.LBE8673:
.LBE8676:
.LBE8698:
	.loc 33 441 0
	movl	$1, %edx
	.loc 33 423 0
	cmpl	$2, %ecx
	je	.L1576
.L1603:
	.loc 33 445 0
	xorl	%edx, %edx
	jmp	.L1576
	.p2align 4,,10
	.p2align 3
.L1577:
.LVL1695:
.LBB8699:
.LBB8700:
	.loc 11 2450 0
	cmpl	$4, %edx
	jne	.L1583
.LBE8700:
.LBE8699:
.LBB8703:
.LBB8704:
	movl	8(%esp), %edi
.LBE8704:
.LBE8703:
.LBB8706:
.LBB8701:
	.loc 11 2453 0
	movl	%esi, %edx
	shrl	$4, %edx
.LVL1696:
.LBE8701:
.LBE8706:
.LBB8707:
.LBB8705:
	.loc 11 2450 0
	movl	%edi, %ecx
	andl	$15, %ecx
	cmpl	$4, %ecx
	jne	.L1583
.LVL1697:
.LBE8705:
.LBE8707:
	.loc 33 425 0
	movl	%edi, %ecx
	shrl	$4, %ecx
	cmpl	%edx, %ecx
	setne	%dl
	movzbl	%dl, %edx
.LVL1698:
	.loc 33 427 0
	jmp	.L1576
.LVL1699:
.L1583:
.LBB8708:
.LBB8702:
	call	cap_endpoint_cap_get_capEPBadge.isra.208.part.209
.LVL1700:
.L1585:
.LBE8702:
.LBE8708:
.LBB8709:
.LBB8689:
	call	cap_notification_cap_get_capNtfnBadge.part.228
.LVL1701:
.L1592:
.LBE8689:
.LBE8709:
	.loc 33 456 0 discriminator 3
	pushl	$__FUNCTION__.8685
	.cfi_remember_state
	.cfi_def_cfa_offset 68
	pushl	$457
	.cfi_def_cfa_offset 72
.LVL1702:
	pushl	$.LC381
	.cfi_def_cfa_offset 76
	pushl	$.LC383
	.cfi_def_cfa_offset 80
	call	_assert_fail
.LVL1703:
.L1613:
	.cfi_restore_state
.LBB8710:
.LBB8681:
	call	mdb_node_ptr_set_mdbNext.isra.229.part.230
.LVL1704:
.L1610:
.LBE8681:
.LBE8710:
.LBB8711:
.LBB8647:
	.loc 11 750 0
	pushl	$__FUNCTION__.1620
	.cfi_remember_state
	.cfi_def_cfa_offset 68
	pushl	$750
	.cfi_def_cfa_offset 72
.LVL1705:
	pushl	$.LC154
	.cfi_def_cfa_offset 76
	pushl	$.LC380
	.cfi_def_cfa_offset 80
	call	_assert_fail
.LVL1706:
.L1611:
	.cfi_restore_state
.LBE8647:
.LBE8711:
	.loc 33 454 0 discriminator 1
	pushl	$__FUNCTION__.8685
	.cfi_remember_state
	.cfi_def_cfa_offset 68
	pushl	$454
	.cfi_def_cfa_offset 72
.LVL1707:
	pushl	$.LC381
	.cfi_def_cfa_offset 76
	pushl	$.LC382
	.cfi_def_cfa_offset 80
	call	_assert_fail
.LVL1708:
.L1600:
	.cfi_restore_state
.LBB8712:
.LBB8677:
.LBB8675:
.LBB8666:
	call	cap_untyped_cap_get_capPtr.isra.115.part.116
.LVL1709:
.LBE8666:
.LBE8675:
.LBE8677:
.LBE8712:
	.cfi_endproc
.LFE731:
	.size	cteInsert, .-cteInsert
	.section	.text.unlikely
.LCOLDE384:
	.text
.LHOTE384:
	.section	.text.unlikely
.LCOLDB385:
	.text
.LHOTB385:
	.p2align 4,,15
	.globl	invokeCNodeInsert
	.type	invokeCNodeInsert, @function
invokeCNodeInsert:
.LFB726:
	.loc 33 338 0
	.cfi_startproc
.LVL1710:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 33 339 0
	pushl	28(%esp)
	.cfi_def_cfa_offset 20
	pushl	28(%esp)
	.cfi_def_cfa_offset 24
	pushl	28(%esp)
	.cfi_def_cfa_offset 28
	pushl	28(%esp)
	.cfi_def_cfa_offset 32
	call	cteInsert
.LVL1711:
	.loc 33 342 0
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE726:
	.size	invokeCNodeInsert, .-invokeCNodeInsert
	.section	.text.unlikely
.LCOLDE385:
	.text
.LHOTE385:
	.section	.rodata.str1.4
	.align 4
.LC386:
	.string	"(capReplyMaster & ~0x1u) == ((0 && (capReplyMaster & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB387:
.LHOTB387:
	.type	cap_reply_cap_new.part.234, @function
cap_reply_cap_new.part.234:
.LFB1129:
	.loc 11 2588 0
	.cfi_startproc
.LVL1712:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2592 0
	pushl	$__FUNCTION__.2389
	.cfi_def_cfa_offset 20
	pushl	$2592
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC386
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1713:
	.cfi_endproc
.LFE1129:
	.size	cap_reply_cap_new.part.234, .-cap_reply_cap_new.part.234
.LCOLDE387:
.LHOTE387:
	.section	.rodata.str1.4
	.align 4
.LC388:
	.string	"(((~0xfffffff0 << 0) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB389:
.LHOTB389:
	.type	endpoint_ptr_set_epQueue_head.isra.239.part.240, @function
endpoint_ptr_set_epQueue_head.isra.239.part.240:
.LFB1135:
	.loc 11 878 0
	.cfi_startproc
.LVL1714:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 880 0
	pushl	$__FUNCTION__.1678
	.cfi_def_cfa_offset 20
	pushl	$880
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC388
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1715:
	.cfi_endproc
.LFE1135:
	.size	endpoint_ptr_set_epQueue_head.isra.239.part.240, .-endpoint_ptr_set_epQueue_head.isra.239.part.240
.LCOLDE389:
.LHOTE389:
.LCOLDB390:
.LHOTB390:
	.type	endpoint_ptr_set_epQueue_tail.isra.241.part.242, @function
endpoint_ptr_set_epQueue_tail.isra.241.part.242:
.LFB1137:
	.loc 11 897 0
	.cfi_startproc
.LVL1716:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 899 0
	pushl	$__FUNCTION__.1687
	.cfi_def_cfa_offset 20
	pushl	$899
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC388
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1717:
	.cfi_endproc
.LFE1137:
	.size	endpoint_ptr_set_epQueue_tail.isra.241.part.242, .-endpoint_ptr_set_epQueue_tail.isra.241.part.242
.LCOLDE390:
.LHOTE390:
	.section	.rodata.str1.4
	.align 4
.LC391:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/object/endpoint.c"
	.section	.rodata.str1.1
.LC392:
	.string	"invalid EP state"
	.section	.text.unlikely
.LCOLDB393:
	.text
.LHOTB393:
	.p2align 4,,15
	.globl	cancelBadgedSends
	.type	cancelBadgedSends, @function
cancelBadgedSends:
.LFB760:
	.loc 64 307 0
	.cfi_startproc
.LVL1718:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 64 307 0
	movl	48(%esp), %edx
	movl	52(%esp), %edi
	movl	(%edx), %eax
.LVL1719:
	.loc 64 308 0
	movl	%eax, %ecx
	andl	$3, %ecx
	cmpl	$1, %ecx
	je	.L1624
	jb	.L1622
	cmpl	$2, %ecx
	je	.L1622
	.loc 64 346 0
	pushl	$__func__.8923
	.cfi_remember_state
	.cfi_def_cfa_offset 52
	pushl	$346
	.cfi_def_cfa_offset 56
	pushl	$.LC391
	.cfi_def_cfa_offset 60
	pushl	$.LC392
	.cfi_def_cfa_offset 64
	call	_fail
.LVL1720:
	.p2align 4,,10
	.p2align 3
.L1622:
	.cfi_restore_state
	.loc 64 348 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L1624:
	.cfi_restore_state
.LVL1721:
	movl	4(%edx), %ebx
.LVL1722:
.LBB8745:
.LBB8746:
.LBB8747:
	.loc 64 27 0
	movl	%eax, %ebp
.LBE8747:
.LBE8746:
.LBB8750:
.LBB8751:
	.loc 11 900 0
	andl	$12, %eax
.LBE8751:
.LBE8750:
.LBB8753:
.LBB8748:
	.loc 64 27 0
	andl	$-16, %ebp
.LVL1723:
.LBE8748:
.LBE8753:
.LBB8754:
.LBB8752:
	.loc 11 900 0
	movl	%eax, (%edx)
.LBE8752:
.LBE8754:
.LBB8755:
.LBB8756:
	.loc 11 881 0
	movl	%ebx, %esi
	andl	$15, %esi
.LBE8756:
.LBE8755:
	.loc 64 324 0
	andl	$-16, %ebx
.LVL1724:
.LBB8758:
.LBB8757:
	.loc 11 881 0
	movl	%esi, 4(%edx)
.LVL1725:
.LBE8757:
.LBE8758:
	.loc 64 324 0
	je	.L1636
	movl	%ebx, %esi
	movl	%ebp, 8(%esp)
	movl	%edx, 12(%esp)
	jmp	.L1631
.LVL1726:
	.p2align 4,,10
	.p2align 3
.L1627:
	movl	%ebp, %ebx
	.loc 64 324 0 is_stmt 0 discriminator 1
	testl	%ebp, %ebp
	je	.L1645
.LVL1727:
.L1631:
.LBB8759:
	.loc 64 328 0 is_stmt 1
	movl	596(%ebx), %eax
	.loc 64 327 0
	movl	652(%ebx), %ebp
.LVL1728:
	.loc 64 328 0
	shrl	$4, %eax
	cmpl	%eax, %edi
	jne	.L1627
	.loc 64 329 0
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	$2
	.cfi_def_cfa_offset 60
	pushl	%ebx
	.cfi_def_cfa_offset 64
	call	setThreadState
.LVL1729:
.LBB8760:
.LBB8761:
	.loc 31 80 0
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	testb	$1, 592(%ebx)
	je	.L1646
.L1628:
.LVL1730:
.LBE8761:
.LBE8760:
.LBB8763:
.LBB8764:
	.loc 31 227 0
	movl	656(%ebx), %eax
	testl	%eax, %eax
	je	.L1629
	.loc 31 228 0
	movl	652(%ebx), %edx
	movl	%edx, 652(%eax)
	movl	652(%ebx), %ebx
.LVL1731:
.L1630:
	.loc 31 233 0
	testl	%ebx, %ebx
	je	.L1637
	.loc 31 234 0
	movl	%eax, 656(%ebx)
.LVL1732:
	movl	%ebp, %ebx
.LBE8764:
.LBE8763:
.LBE8759:
	.loc 64 324 0
	testl	%ebp, %ebp
	jne	.L1631
.LVL1733:
	.p2align 4,,10
	.p2align 3
.L1645:
	movl	%esi, %ecx
	movl	8(%esp), %ebp
	movl	12(%esp), %edx
.LVL1734:
.LBB8768:
.LBB8769:
.LBB8770:
.LBB8771:
	.loc 11 880 0
	testb	$15, %cl
	jne	.L1632
.LVL1735:
	movl	4(%edx), %esi
	movl	%ecx, %eax
	andl	$-16, %eax
.LVL1736:
.L1626:
	.loc 11 882 0
	andl	$15, %esi
	orl	%eax, %esi
	movl	%esi, 4(%edx)
.LVL1737:
.LBE8771:
.LBE8770:
.LBB8773:
.LBB8774:
	.loc 11 899 0
	testl	$15, %ebp
	jne	.L1647
	.loc 11 901 0
	movl	(%edx), %eax
	andl	$-16, %ebp
.LVL1738:
	andl	$15, %eax
	orl	%eax, %ebp
.LVL1739:
.LBE8774:
.LBE8773:
.LBE8769:
.LBE8768:
	.loc 64 336 0
	testl	%ecx, %ecx
	je	.L1644
.LVL1740:
.LBB8779:
.LBB8780:
	.loc 11 920 0
	andl	$-4, %ebp
	orl	$1, %ebp
.LVL1741:
.L1644:
	movl	%ebp, (%edx)
.LBE8780:
.LBE8779:
.LBE8745:
	.loc 64 348 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LBB8784:
	.loc 64 340 0
	jmp	rescheduleRequired
.LVL1742:
	.p2align 4,,10
	.p2align 3
.L1646:
	.cfi_restore_state
.LBB8781:
.LBB8766:
.LBB8762:
	movl	%ebx, %eax
	call	tcbSchedEnqueue.part.263
.LVL1743:
	jmp	.L1628
.LVL1744:
	.p2align 4,,10
	.p2align 3
.L1637:
.LBE8762:
.LBE8766:
.LBB8767:
.LBB8765:
	.loc 31 227 0
	movl	%eax, 8(%esp)
.LVL1745:
	jmp	.L1627
.LVL1746:
	.p2align 4,,10
	.p2align 3
.L1629:
	.loc 31 230 0
	movl	652(%ebx), %esi
.LVL1747:
	movl	%esi, %ebx
.LVL1748:
	jmp	.L1630
.LVL1749:
.L1636:
.LBE8765:
.LBE8767:
.LBE8781:
	.loc 64 324 0
	xorl	%eax, %eax
.LBB8782:
.LBB8749:
	.loc 64 29 0
	xorl	%ecx, %ecx
	jmp	.L1626
.LVL1750:
.L1632:
.LBE8749:
.LBE8782:
.LBB8783:
.LBB8778:
.LBB8776:
.LBB8772:
	call	endpoint_ptr_set_epQueue_head.isra.239.part.240
.LVL1751:
.L1647:
.LBE8772:
.LBE8776:
.LBB8777:
.LBB8775:
	call	endpoint_ptr_set_epQueue_tail.isra.241.part.242
.LVL1752:
.LBE8775:
.LBE8777:
.LBE8778:
.LBE8783:
.LBE8784:
	.cfi_endproc
.LFE760:
	.size	cancelBadgedSends, .-cancelBadgedSends
	.section	.text.unlikely
.LCOLDE393:
	.text
.LHOTE393:
	.section	.text.unlikely
.LCOLDB394:
	.text
.LHOTB394:
	.p2align 4,,15
	.globl	invokeCNodeCancelBadgedSends
	.type	invokeCNodeCancelBadgedSends, @function
invokeCNodeCancelBadgedSends:
.LFB725:
	.loc 33 326 0
	.cfi_startproc
.LVL1753:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 33 326 0
	movl	16(%esp), %eax
	movl	20(%esp), %edx
.LVL1754:
.LBB8785:
.LBB8786:
	.loc 11 2450 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$4, %ecx
	jne	.L1655
.LVL1755:
.LBE8786:
.LBE8785:
	.loc 33 328 0
	shrl	$4, %eax
	je	.L1650
.LVL1756:
.LBB8788:
	.loc 33 331 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	andl	$-16, %edx
.LVL1757:
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	%edx
	.cfi_def_cfa_offset 32
	call	cancelBadgedSends
.LVL1758:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.LVL1759:
.L1650:
.LBE8788:
	.loc 33 334 0
	xorl	%eax, %eax
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL1760:
.L1655:
	.cfi_restore_state
.LBB8789:
.LBB8787:
	call	cap_endpoint_cap_get_capEPBadge.isra.208.part.209
.LVL1761:
.LBE8787:
.LBE8789:
	.cfi_endproc
.LFE725:
	.size	invokeCNodeCancelBadgedSends, .-invokeCNodeCancelBadgedSends
	.section	.text.unlikely
.LCOLDE394:
	.text
.LHOTE394:
	.section	.text.unlikely
.LCOLDB395:
.LHOTB395:
	.type	cap_notification_cap_get_capNtfnCanSend.part.245, @function
cap_notification_cap_get_capNtfnCanSend.part.245:
.LFB1140:
	.loc 11 2548 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2550 0
	pushl	$__FUNCTION__.2373
	.cfi_def_cfa_offset 20
	pushl	$2551
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC184
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1762:
	.cfi_endproc
.LFE1140:
	.size	cap_notification_cap_get_capNtfnCanSend.part.245, .-cap_notification_cap_get_capNtfnCanSend.part.245
.LCOLDE395:
.LHOTE395:
.LCOLDB396:
.LHOTB396:
	.type	notification_ptr_set_ntfnQueue_head.isra.248.part.249, @function
notification_ptr_set_ntfnQueue_head.isra.248.part.249:
.LFB1144:
	.loc 11 1082 0
	.cfi_startproc
.LVL1763:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1084 0
	pushl	$__FUNCTION__.1771
	.cfi_def_cfa_offset 20
	pushl	$1084
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC388
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1764:
	.cfi_endproc
.LFE1144:
	.size	notification_ptr_set_ntfnQueue_head.isra.248.part.249, .-notification_ptr_set_ntfnQueue_head.isra.248.part.249
.LCOLDE396:
.LHOTE396:
.LCOLDB397:
.LHOTB397:
	.type	notification_ptr_set_ntfnQueue_tail.isra.250.part.251, @function
notification_ptr_set_ntfnQueue_tail.isra.250.part.251:
.LFB1146:
	.loc 11 1101 0
	.cfi_startproc
.LVL1765:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1103 0
	pushl	$__FUNCTION__.1780
	.cfi_def_cfa_offset 20
	pushl	$1103
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC388
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1766:
	.cfi_endproc
.LFE1146:
	.size	notification_ptr_set_ntfnQueue_tail.isra.250.part.251, .-notification_ptr_set_ntfnQueue_tail.isra.250.part.251
.LCOLDE397:
.LHOTE397:
.LCOLDB398:
	.text
.LHOTB398:
	.p2align 4,,15
	.globl	receiveSignal
	.type	receiveSignal, @function
receiveSignal:
.LFB776:
	.loc 36 125 0
	.cfi_startproc
.LVL1767:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 36 125 0
	movl	20(%esp), %ebx
.LVL1768:
	movl	16(%esp), %esi
.LBB8826:
.LBB8827:
	.loc 11 2576 0
	movl	%ebx, %eax
	andl	$15, %eax
	cmpl	$6, %eax
	jne	.L1674
	.loc 11 2579 0
	andl	$-16, %ebx
.LVL1769:
	movl	(%ebx), %eax
.LVL1770:
.LBE8827:
.LBE8826:
	.loc 36 130 0
	movl	%eax, %edx
	andl	$3, %edx
	cmpl	$1, %edx
	jbe	.L1665
	cmpl	$2, %edx
	jne	.L1662
.LVL1771:
.LBB8829:
.LBB8830:
	.loc 15 30 0
	movl	8(%ebx), %edx
.LBE8830:
.LBE8829:
.LBB8832:
.LBB8833:
	.loc 11 1123 0
	andl	$-4, %eax
.LBE8833:
.LBE8832:
.LBB8835:
.LBB8831:
	.loc 15 30 0
	movl	%edx, 516(%esi)
.LVL1772:
.LBE8831:
.LBE8835:
.LBB8836:
.LBB8834:
	.loc 11 1123 0
	movl	%eax, (%ebx)
.LVL1773:
.L1662:
.LBE8834:
.LBE8836:
	.loc 36 163 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL1774:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL1775:
	.p2align 4,,10
	.p2align 3
.L1665:
	.cfi_restore_state
.LBB8837:
	.loc 36 135 0
	movl	28(%esp), %edx
	testl	%edx, %edx
	je	.L1667
.LVL1776:
.LBB8838:
.LBB8839:
	.loc 11 416 0
	movl	%ebx, %eax
	orl	$6, %eax
	movl	%eax, 588(%esi)
.LVL1777:
.LBE8839:
.LBE8838:
.LBB8840:
.LBB8841:
	.loc 32 428 0
	cmpl	ksCurThread, %esi
	je	.L1675
.LVL1778:
.L1668:
	movl	4(%ebx), %ecx
.LVL1779:
	movl	(%ebx), %edx
.LVL1780:
.LBE8841:
.LBE8840:
.LBB8843:
.LBB8844:
	.loc 31 211 0
	movl	%ecx, %eax
.LBE8844:
.LBE8843:
.LBB8848:
.LBB8849:
	.loc 36 29 0
	movl	%edx, %edi
	andl	$-16, %edi
.LVL1781:
.LBE8849:
.LBE8848:
.LBB8850:
.LBB8845:
	.loc 31 211 0
	andl	$-16, %eax
.LVL1782:
	je	.L1672
	.loc 31 214 0
	movl	%esi, 652(%edi)
.LVL1783:
.L1669:
	.loc 31 216 0
	movl	%edi, 656(%esi)
.LBE8845:
.LBE8850:
.LBB8851:
.LBB8852:
	.loc 11 1124 0
	movl	%edx, %edi
.LVL1784:
.LBE8852:
.LBE8851:
.LBB8854:
.LBB8846:
	.loc 31 217 0
	movl	$0, 652(%esi)
.LVL1785:
.LBE8846:
.LBE8854:
.LBB8855:
.LBB8853:
	.loc 11 1124 0
	andl	$-4, %edi
	orl	$1, %edi
	movl	%edi, (%ebx)
.LVL1786:
.LBE8853:
.LBE8855:
.LBB8856:
.LBB8857:
.LBB8858:
.LBB8859:
	.loc 11 1084 0
	testb	$15, %al
	jne	.L1676
.LVL1787:
	.loc 11 1086 0
	andl	$15, %ecx
.LVL1788:
	andl	$-16, %eax
.LVL1789:
	orl	%ecx, %eax
	movl	%eax, 4(%ebx)
.LVL1790:
.LBE8859:
.LBE8858:
.LBB8861:
.LBB8862:
	.loc 11 1103 0
	testl	$15, %esi
	jne	.L1677
	.loc 11 1105 0
	andl	$12, %edx
	andl	$-16, %esi
.LVL1791:
	orl	%edx, %esi
	orl	$1, %esi
	movl	%esi, (%ebx)
.LVL1792:
.LBE8862:
.LBE8861:
.LBE8857:
.LBE8856:
.LBE8837:
	.loc 36 163 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL1793:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL1794:
	.p2align 4,,10
	.p2align 3
.L1667:
	.cfi_restore_state
.LBB8873:
.LBB8867:
.LBB8868:
.LBB8869:
	.loc 15 30 0
	movl	$0, 516(%esi)
.LVL1795:
.LBE8869:
.LBE8868:
.LBE8867:
.LBE8873:
	.loc 36 163 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL1796:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL1797:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL1798:
	.p2align 4,,10
	.p2align 3
.L1675:
	.cfi_restore_state
.LBB8874:
.LBB8870:
.LBB8842:
	.loc 32 428 0
	movl	ksSchedulerAction, %eax
	testl	%eax, %eax
	jne	.L1668
	movl	%esi, %eax
	call	scheduleTCB.part.264
.LVL1799:
	jmp	.L1668
.LVL1800:
	.p2align 4,,10
	.p2align 3
.L1672:
.LBE8842:
.LBE8870:
.LBB8871:
.LBB8847:
	.loc 31 211 0
	movl	%esi, %eax
.LVL1801:
	jmp	.L1669
.LVL1802:
.L1674:
.LBE8847:
.LBE8871:
.LBE8874:
.LBB8875:
.LBB8828:
	call	cap_notification_cap_get_capNtfnPtr.isra.97.part.98
.LVL1803:
.L1677:
.LBE8828:
.LBE8875:
.LBB8876:
.LBB8872:
.LBB8866:
.LBB8864:
.LBB8863:
	call	notification_ptr_set_ntfnQueue_tail.isra.250.part.251
.LVL1804:
.L1676:
.LBE8863:
.LBE8864:
.LBB8865:
.LBB8860:
	call	notification_ptr_set_ntfnQueue_head.isra.248.part.249
.LVL1805:
.LBE8860:
.LBE8865:
.LBE8866:
.LBE8872:
.LBE8876:
	.cfi_endproc
.LFE776:
	.size	receiveSignal, .-receiveSignal
	.section	.text.unlikely
.LCOLDE398:
	.text
.LHOTE398:
	.section	.text.unlikely
.LCOLDB399:
.LHOTB399:
	.type	notification_ptr_set_ntfnBoundTCB.isra.255.part.256, @function
notification_ptr_set_ntfnBoundTCB.isra.255.part.256:
.LFB1151:
	.loc 11 1044 0
	.cfi_startproc
.LVL1806:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1046 0
	pushl	$__FUNCTION__.1753
	.cfi_def_cfa_offset 20
	pushl	$1046
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC388
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1807:
	.cfi_endproc
.LFE1151:
	.size	notification_ptr_set_ntfnBoundTCB.isra.255.part.256, .-notification_ptr_set_ntfnBoundTCB.isra.255.part.256
.LCOLDE399:
.LHOTE399:
.LCOLDB400:
	.text
.LHOTB400:
	.p2align 4,,15
	.globl	bindNotification
	.type	bindNotification, @function
bindNotification:
.LFB783:
	.loc 36 251 0
	.cfi_startproc
.LVL1808:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 36 251 0
	movl	16(%esp), %eax
	movl	20(%esp), %edx
.LVL1809:
.LBB8877:
.LBB8878:
	.loc 11 1046 0
	testb	$15, %al
	jne	.L1683
	.loc 11 1048 0
	movl	12(%edx), %ebx
	movl	%eax, %ecx
	andl	$-16, %ecx
	andl	$15, %ebx
	orl	%ebx, %ecx
	movl	%ecx, 12(%edx)
.LVL1810:
.LBE8878:
.LBE8877:
	.loc 36 253 0
	movl	%edx, 600(%eax)
	.loc 36 254 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL1811:
.L1683:
	.cfi_restore_state
.LBB8880:
.LBB8879:
	call	notification_ptr_set_ntfnBoundTCB.isra.255.part.256
.LVL1812:
.LBE8879:
.LBE8880:
	.cfi_endproc
.LFE783:
	.size	bindNotification, .-bindNotification
	.section	.text.unlikely
.LCOLDE400:
	.text
.LHOTE400:
	.section	.text.unlikely
.LCOLDB401:
	.text
.LHOTB401:
	.p2align 4,,15
	.globl	invokeTCB_NotificationControl
	.type	invokeTCB_NotificationControl, @function
invokeTCB_NotificationControl:
.LFB832:
	.loc 31 1567 0
	.cfi_startproc
.LVL1813:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 31 1567 0
	movl	20(%esp), %eax
	movl	16(%esp), %edx
	.loc 31 1568 0
	testl	%eax, %eax
	je	.L1685
.LVL1814:
.LBB8897:
.LBB8898:
.LBB8899:
.LBB8900:
	.loc 11 1046 0
	testb	$15, %dl
	jne	.L1692
	.loc 11 1048 0
	movl	12(%eax), %ebx
	movl	%edx, %ecx
	andl	$-16, %ecx
	andl	$15, %ebx
	orl	%ebx, %ecx
	movl	%ecx, 12(%eax)
.LVL1815:
.LBE8900:
.LBE8899:
	.loc 36 253 0
	movl	%eax, 600(%edx)
.LVL1816:
.L1687:
.LBE8898:
.LBE8897:
	.loc 31 1575 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L1685:
	.cfi_restore_state
.LVL1817:
.LBB8904:
.LBB8905:
.LBB8906:
	.loc 36 242 0
	movl	600(%edx), %eax
.LVL1818:
	.loc 36 244 0
	testl	%eax, %eax
	je	.L1687
.LVL1819:
.LBB8907:
.LBB8908:
.LBB8909:
.LBB8910:
	.loc 11 1047 0
	andl	$15, 12(%eax)
.LVL1820:
.LBE8910:
.LBE8909:
.LBE8908:
.LBE8907:
.LBE8906:
.LBE8905:
.LBE8904:
	.loc 31 1575 0
	xorl	%eax, %eax
.LVL1821:
.LBB8915:
.LBB8914:
.LBB8913:
.LBB8912:
.LBB8911:
	.loc 36 224 0
	movl	$0, 600(%edx)
.LVL1822:
.LBE8911:
.LBE8912:
.LBE8913:
.LBE8914:
.LBE8915:
	.loc 31 1575 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL1823:
.L1692:
	.cfi_restore_state
.LBB8916:
.LBB8903:
.LBB8902:
.LBB8901:
	call	notification_ptr_set_ntfnBoundTCB.isra.255.part.256
.LVL1824:
.LBE8901:
.LBE8902:
.LBE8903:
.LBE8916:
	.cfi_endproc
.LFE832:
	.size	invokeTCB_NotificationControl, .-invokeTCB_NotificationControl
	.section	.text.unlikely
.LCOLDE401:
	.text
.LHOTE401:
	.section	.rodata.str1.4
	.align 4
.LC402:
	.string	"((cap.words[0] >> 0) & 0xff) == cap_irq_handler_cap"
	.section	.text.unlikely
.LCOLDB403:
.LHOTB403:
	.type	cap_irq_handler_cap_get_capIRQ.part.259, @function
cap_irq_handler_cap_get_capIRQ.part.259:
.LFB1154:
	.loc 11 3375 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 3377 0
	pushl	$__FUNCTION__.2678
	.cfi_def_cfa_offset 20
	pushl	$3378
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC402
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL1825:
	.cfi_endproc
.LFE1154:
	.size	cap_irq_handler_cap_get_capIRQ.part.259, .-cap_irq_handler_cap_get_capIRQ.part.259
.LCOLDE403:
.LHOTE403:
.LCOLDB404:
	.text
.LHOTB404:
	.p2align 4,,15
	.globl	sameRegionAs
	.type	sameRegionAs, @function
sameRegionAs:
.LFB788:
	.loc 45 222 0
	.cfi_startproc
.LVL1826:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 45 222 0
	movl	48(%esp), %edx
	movl	52(%esp), %ecx
	movl	56(%esp), %ebx
.LVL1827:
	movl	60(%esp), %edi
.LVL1828:
.LBB9009:
.LBB9010:
	.loc 11 2202 0
	movl	%edx, %eax
	andl	$14, %eax
	cmpl	$14, %eax
	je	.L1696
	.loc 11 2203 0
	movl	%edx, %eax
	andl	$15, %eax
.LVL1829:
.LBE9010:
.LBE9009:
	.loc 45 223 0
	cmpl	$14, %eax
	ja	.L1697
	jmp	*.L1699(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L1699:
	.long	.L1697
	.long	.L1697
	.long	.L1698
	.long	.L1697
	.long	.L1700
	.long	.L1697
	.long	.L1701
	.long	.L1697
	.long	.L1702
	.long	.L1697
	.long	.L1703
	.long	.L1697
	.long	.L1704
	.long	.L1697
	.long	.L1705
	.text
.LVL1830:
	.p2align 4,,10
	.p2align 3
.L1696:
.LBB9012:
.LBB9011:
	.loc 11 2204 0
	movzbl	%dl, %esi
	movl	%esi, %eax
.LVL1831:
.LBE9011:
.LBE9012:
	.loc 45 223 0
	cmpl	$62, %esi
	ja	.L1697
	jmp	*.L1706(,%esi,4)
	.section	.rodata
	.align 4
	.align 4
.L1706:
	.long	.L1697
	.long	.L1697
	.long	.L1698
	.long	.L1697
	.long	.L1700
	.long	.L1697
	.long	.L1701
	.long	.L1697
	.long	.L1702
	.long	.L1697
	.long	.L1703
	.long	.L1697
	.long	.L1704
	.long	.L1697
	.long	.L1705
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1707
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1697
	.long	.L1708
	.text
	.p2align 4,,10
	.p2align 3
.L1705:
.LVL1832:
.LBB9013:
.LBB9014:
	.loc 11 2202 0
	movl	%ebx, %edx
	.loc 11 2203 0
	movl	%ebx, %eax
	movzbl	%bl, %ebx
	.loc 11 2202 0
	andl	$14, %edx
	.loc 11 2203 0
	andl	$15, %eax
	cmpl	$14, %edx
	cmovne	%eax, %ebx
.LVL1833:
.LBE9014:
.LBE9013:
.LBB9015:
	.loc 45 234 0
	xorl	%eax, %eax
	andl	$-17, %ebx
	cmpl	$14, %ebx
	sete	%al
.LVL1834:
.L1787:
.LBE9015:
	.loc 45 304 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL1835:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1836:
	.p2align 4,,10
	.p2align 3
.L1698:
	.cfi_restore_state
.LBB9059:
.LBB9060:
.LBB9061:
.LBB9062:
	.loc 11 2202 0
	movl	%ebx, %ebp
	andl	$14, %ebp
	cmpl	$14, %ebp
	je	.L1709
	.loc 11 2203 0
	movl	%ebx, %eax
	andl	$15, %eax
.LVL1837:
.LBE9062:
.LBE9061:
	.loc 54 344 0
	cmpl	$14, %eax
	ja	.L1710
	jmp	*.L1712(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L1712:
	.long	.L1710
	.long	.L1710
	.long	.L1711
	.long	.L1710
	.long	.L1711
	.long	.L1710
	.long	.L1711
	.long	.L1710
	.long	.L1769
	.long	.L1710
	.long	.L1711
	.long	.L1710
	.long	.L1711
	.long	.L1710
	.long	.L1769
	.text
.LVL1838:
	.p2align 4,,10
	.p2align 3
.L1700:
.LBE9060:
.LBE9059:
.LBB9074:
.LBB9075:
	.loc 11 2202 0
	movl	%ebx, %eax
	.loc 11 2203 0
	movl	%ebx, %ebp
	movzbl	%bl, %ebx
	.loc 11 2202 0
	andl	$14, %eax
	.loc 11 2203 0
	andl	$15, %ebp
	cmpl	$14, %eax
	cmovne	%ebp, %ebx
.LVL1839:
.LBE9075:
.LBE9074:
	.loc 45 303 0
	xorl	%eax, %eax
	.loc 45 239 0
	cmpl	$4, %ebx
	jne	.L1787
.LVL1840:
.LBB9076:
.LBB9077:
	.loc 11 2358 0
	movl	%edx, %esi
	andl	$15, %esi
	cmpl	$4, %esi
	jne	.L1741
	.loc 11 2361 0
	andl	$-16, %ecx
.LVL1841:
.LBE9077:
.LBE9076:
.LBB9079:
.LBB9080:
	.loc 11 2358 0
	cmpl	$4, %ebp
	jne	.L1741
.LBE9080:
.LBE9079:
	.loc 45 240 0
	andl	$-16, %edi
.LVL1842:
	xorl	%eax, %eax
	cmpl	%ecx, %edi
	sete	%al
	jmp	.L1787
.LVL1843:
	.p2align 4,,10
	.p2align 3
.L1701:
.LBB9081:
.LBB9082:
	.loc 11 2202 0
	movl	%ebx, %eax
	.loc 11 2203 0
	movl	%ebx, %edi
.LVL1844:
	movzbl	%bl, %ecx
.LVL1845:
	.loc 11 2202 0
	andl	$14, %eax
	.loc 11 2203 0
	andl	$15, %edi
	cmpl	$14, %eax
	cmovne	%edi, %ecx
.LVL1846:
.LBE9082:
.LBE9081:
	.loc 45 303 0
	xorl	%eax, %eax
	.loc 45 246 0
	cmpl	$6, %ecx
	jne	.L1787
.LVL1847:
.LBB9083:
.LBB9084:
	.loc 11 2576 0
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$6, %eax
	jne	.L1745
	.loc 11 2579 0
	movl	%edx, %esi
	andl	$-16, %esi
.LVL1848:
.LBE9084:
.LBE9083:
.LBB9086:
.LBB9087:
	.loc 11 2576 0
	cmpl	$6, %edi
	je	.L1798
.LVL1849:
.L1745:
.LBE9087:
.LBE9086:
.LBB9088:
.LBB9085:
	call	cap_notification_cap_get_capNtfnPtr.isra.97.part.98
.LVL1850:
	.p2align 4,,10
	.p2align 3
.L1702:
.LBE9085:
.LBE9088:
.LBB9089:
.LBB9090:
	.loc 11 2202 0
	movl	%ebx, %eax
	.loc 11 2203 0
	movl	%ebx, %edi
.LVL1851:
	movzbl	%bl, %ecx
.LVL1852:
	.loc 11 2202 0
	andl	$14, %eax
	.loc 11 2203 0
	andl	$15, %edi
	cmpl	$14, %eax
	cmovne	%edi, %ecx
.LVL1853:
.LBE9090:
.LBE9089:
	.loc 45 303 0
	xorl	%eax, %eax
	.loc 45 269 0
	cmpl	$8, %ecx
	jne	.L1787
.LVL1854:
.LBB9091:
.LBB9092:
	.loc 11 2622 0
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$8, %eax
	jne	.L1758
	.loc 11 2625 0
	movl	%edx, %esi
	andl	$-32, %esi
.LVL1855:
.LBE9092:
.LBE9091:
.LBB9094:
.LBB9095:
	.loc 11 2622 0
	cmpl	$8, %edi
	jne	.L1758
.LVL1856:
.LBE9095:
.LBE9094:
	.loc 45 270 0
	andl	$-32, %ebx
	xorl	%eax, %eax
	cmpl	%esi, %ebx
	sete	%al
	jmp	.L1787
.LVL1857:
	.p2align 4,,10
	.p2align 3
.L1703:
.LBB9096:
.LBB9097:
	.loc 11 2202 0
	movl	%ebx, %eax
	.loc 11 2203 0
	movl	%ebx, %ebp
	movzbl	%bl, %esi
.LVL1858:
	.loc 11 2202 0
	andl	$14, %eax
	.loc 11 2203 0
	andl	$15, %ebp
	cmpl	$14, %eax
	cmovne	%ebp, %esi
.LVL1859:
.LBE9097:
.LBE9096:
	.loc 45 303 0
	xorl	%eax, %eax
	.loc 45 253 0
	cmpl	$10, %esi
	jne	.L1787
.LVL1860:
.LBB9098:
.LBB9099:
	.loc 11 2738 0
	movl	%edx, %esi
	andl	$15, %esi
	cmpl	$10, %esi
	jne	.L1749
	.loc 11 2741 0
	movl	%edx, %esi
	andl	$-32, %esi
.LVL1861:
.LBE9099:
.LBE9098:
.LBB9101:
.LBB9102:
	.loc 11 2738 0
	cmpl	$10, %ebp
	jne	.L1749
.LVL1862:
.LBE9102:
.LBE9101:
	.loc 45 255 0
	andl	$-32, %ebx
.LVL1863:
	cmpl	%esi, %ebx
	jne	.L1787
.LVL1864:
	andl	$8126464, %edi
.LVL1865:
	andl	$8126464, %ecx
.LVL1866:
	xorl	%eax, %eax
	cmpl	%edi, %ecx
	sete	%al
	jmp	.L1787
.LVL1867:
	.p2align 4,,10
	.p2align 3
.L1704:
.LBB9103:
.LBB9104:
	.loc 11 2202 0
	movl	%ebx, %eax
	.loc 11 2203 0
	movl	%ebx, %edi
.LVL1868:
	movzbl	%bl, %ecx
.LVL1869:
	.loc 11 2202 0
	andl	$14, %eax
	.loc 11 2203 0
	andl	$15, %edi
	cmpl	$14, %eax
	cmovne	%edi, %ecx
.LVL1870:
.LBE9104:
.LBE9103:
	.loc 45 303 0
	xorl	%eax, %eax
	.loc 45 262 0
	cmpl	$12, %ecx
	jne	.L1787
.LVL1871:
.LBB9105:
.LBB9106:
	.loc 11 2768 0
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$12, %eax
	jne	.L1754
	.loc 11 2771 0
	movl	%edx, %esi
	andl	$-16, %esi
.LVL1872:
.LBE9106:
.LBE9105:
.LBB9108:
.LBB9109:
	.loc 11 2768 0
	cmpl	$12, %edi
	jne	.L1754
.LVL1873:
.L1798:
.LBE9109:
.LBE9108:
	.loc 45 263 0
	andl	$-16, %ebx
	xorl	%eax, %eax
	cmpl	%esi, %ebx
	sete	%al
	jmp	.L1787
.LVL1874:
	.p2align 4,,10
	.p2align 3
.L1769:
	.loc 45 303 0
	xorl	%eax, %eax
	jmp	.L1787
.LVL1875:
	.p2align 4,,10
	.p2align 3
.L1697:
	.loc 45 296 0
	andl	$1, %eax
	je	.L1787
	.loc 45 296 0 is_stmt 0 discriminator 1
	movl	%ebx, %eax
	andl	$1, %eax
	je	.L1787
	.loc 45 298 0 is_stmt 1
	movl	%ebx, 56(%esp)
	movl	%edi, 60(%esp)
	movl	%edx, 48(%esp)
	movl	%ecx, 52(%esp)
	.loc 45 304 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL1876:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 45 298 0
	jmp	Arch_sameRegionAs
.LVL1877:
	.p2align 4,,10
	.p2align 3
.L1708:
	.cfi_restore_state
.LBB9110:
.LBB9111:
	.loc 11 2202 0
	movl	%ebx, %edx
.LVL1878:
.LBE9111:
.LBE9110:
	.loc 45 303 0
	xorl	%eax, %eax
.LBB9113:
.LBB9112:
	.loc 11 2202 0
	andl	$14, %edx
	cmpl	$14, %edx
	jne	.L1787
.LVL1879:
.LBE9112:
.LBE9113:
.LBB9114:
	.loc 45 234 0
	xorl	%eax, %eax
	cmpb	$62, %bl
	sete	%al
.LBE9114:
	jmp	.L1787
.LVL1880:
	.p2align 4,,10
	.p2align 3
.L1707:
.LBB9115:
.LBB9116:
	.loc 11 2202 0
	movl	%ebx, %edx
.LVL1881:
.LBE9116:
.LBE9115:
	.loc 45 303 0
	xorl	%eax, %eax
.LBB9118:
.LBB9117:
	.loc 11 2202 0
	andl	$14, %edx
	cmpl	$14, %edx
	jne	.L1787
.LVL1882:
.LBE9117:
.LBE9118:
	.loc 45 289 0
	cmpb	$30, %bl
	jne	.L1787
.LVL1883:
.LBB9119:
.LBB9120:
	.loc 11 3377 0
	cmpl	$30, %esi
	jne	.L1801
.LVL1884:
.LBE9120:
.LBE9119:
	.loc 45 290 0
	movl	%edi, %eax
	cmpb	%al, %cl
	sete	%al
	movzbl	%al, %eax
	jmp	.L1787
.LVL1885:
	.p2align 4,,10
	.p2align 3
.L1711:
.LBB9122:
.LBB9016:
.LBB9017:
	.loc 11 2320 0
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$2, %eax
	jne	.L1802
	.loc 11 2323 0
	movl	%edx, %esi
.LBE9017:
.LBE9016:
	.loc 45 229 0
	movl	%ebx, %eax
	movl	%edi, %edx
.LVL1886:
	movl	%ecx, 12(%esp)
	call	cap_get_capPtr
.LVL1887:
	.loc 45 231 0
	movl	12(%esp), %ecx
.LVL1888:
	movl	$1, %edx
.LBB9020:
.LBB9018:
	.loc 11 2323 0
	andl	$-16, %esi
.LVL1889:
.LBE9018:
.LBE9020:
	.loc 45 231 0
	sall	%cl, %edx
	leal	-1(%esi,%edx), %edx
.LVL1890:
.LBB9021:
.LBB9022:
.LBB9023:
.LBB9024:
	.loc 11 2202 0
	cmpl	$14, %ebp
	je	.L1717
	.loc 11 2203 0
	movl	%ebx, %ecx
.LVL1891:
	andl	$15, %ecx
.LVL1892:
.LBE9024:
.LBE9023:
	.loc 54 289 0
	cmpl	$14, %ecx
	ja	.L1718
	jmp	*.L1720(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L1720:
	.long	.L1772
	.long	.L1718
	.long	.L1721
	.long	.L1718
	.long	.L1722
	.long	.L1718
	.long	.L1722
	.long	.L1718
	.long	.L1772
	.long	.L1718
	.long	.L1723
	.long	.L1718
	.long	.L1729
	.long	.L1718
	.long	.L1772
	.text
	.p2align 4,,10
	.p2align 3
.L1772:
.LBB9026:
.LBB9027:
	.loc 55 162 0
	movl	$1, %ecx
.LVL1893:
.L1719:
.LBE9027:
.LBE9026:
.LBE9022:
.LBE9021:
	.loc 45 232 0
	leal	-1(%eax,%ecx), %ecx
.LVL1894:
	.loc 45 234 0
	cmpl	%ecx, %edx
	setnb	%bl
.LVL1895:
	cmpl	%ecx, %eax
	setbe	%dl
.LVL1896:
	andl	%ebx, %edx
	cmpl	%esi, %eax
	setnb	%al
.LVL1897:
	movzbl	%al, %eax
	andl	%edx, %eax
	jmp	.L1787
.LVL1898:
	.p2align 4,,10
	.p2align 3
.L1710:
.LBE9122:
.LBB9123:
.LBB9071:
.LBB9064:
.LBB9065:
	.loc 55 214 0
	cmpl	$31, %eax
	ja	.L1715
	jmp	*.L1716(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L1716:
	.long	.L1715
	.long	.L1711
	.long	.L1715
	.long	.L1711
	.long	.L1715
	.long	.L1711
	.long	.L1715
	.long	.L1715
	.long	.L1715
	.long	.L1769
	.long	.L1715
	.long	.L1711
	.long	.L1715
	.long	.L1769
	.long	.L1715
	.long	.L1711
	.long	.L1715
	.long	.L1715
	.long	.L1715
	.long	.L1715
	.long	.L1715
	.long	.L1715
	.long	.L1715
	.long	.L1715
	.long	.L1715
	.long	.L1715
	.long	.L1715
	.long	.L1715
	.long	.L1715
	.long	.L1715
	.long	.L1715
	.long	.L1769
	.text
.LVL1899:
.L1729:
.LBE9065:
.LBE9064:
.LBE9071:
.LBE9123:
.LBB9124:
.LBB9055:
.LBB9052:
	.loc 54 289 0
	movl	$1024, %ecx
	jmp	.L1719
.L1722:
	movl	$16, %ecx
	jmp	.L1719
.L1721:
.LVL1900:
	movl	%edi, %ecx
	movl	$1, %ebx
.LVL1901:
	sall	%cl, %ebx
	movl	%ebx, %ecx
	jmp	.L1719
.LVL1902:
.L1723:
	andl	$8126464, %edi
.LVL1903:
	movl	$1, %ebx
	shrl	$18, %edi
	leal	4(%edi), %ecx
	sall	%cl, %ebx
	movl	%ebx, %ecx
	jmp	.L1719
.LVL1904:
.L1718:
.LBB9039:
.LBB9036:
	.loc 55 162 0
	cmpl	$31, %ecx
	ja	.L1732
	jmp	*.L1734(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L1734:
	.long	.L1732
	.long	.L1733
	.long	.L1732
	.long	.L1735
	.long	.L1732
	.long	.L1735
	.long	.L1732
	.long	.L1732
	.long	.L1732
	.long	.L1772
	.long	.L1732
	.long	.L1735
	.long	.L1732
	.long	.L1772
	.long	.L1732
	.long	.L1735
	.long	.L1732
	.long	.L1732
	.long	.L1732
	.long	.L1732
	.long	.L1732
	.long	.L1732
	.long	.L1732
	.long	.L1732
	.long	.L1732
	.long	.L1732
	.long	.L1732
	.long	.L1732
	.long	.L1732
	.long	.L1732
	.long	.L1732
	.long	.L1772
	.text
.LVL1905:
.L1715:
.LBE9036:
.LBE9039:
.LBE9052:
.LBE9055:
.LBE9124:
.LBB9125:
.LBB9072:
.LBB9069:
.LBB9068:
.LBB9066:
.LBB9067:
	.loc 46 128 0
	pushl	$__func__.3036
	.cfi_remember_state
	.cfi_def_cfa_offset 52
.LVL1906:
	pushl	$128
	.cfi_def_cfa_offset 56
.LVL1907:
	pushl	$.LC145
	.cfi_def_cfa_offset 60
.LVL1908:
	pushl	$.LC226
	.cfi_def_cfa_offset 64
.LVL1909:
	call	_fail
.LVL1910:
.L1735:
	.cfi_restore_state
.LBE9067:
.LBE9066:
.LBE9068:
.LBE9069:
.LBE9072:
.LBE9125:
.LBB9126:
.LBB9056:
.LBB9053:
.LBB9040:
.LBB9037:
	.loc 55 162 0
	movl	$4096, %ecx
	jmp	.L1719
.L1733:
.LVL1911:
.LBB9028:
.LBB9029:
	.loc 11 2812 0
	andl	$15, %ebx
.LVL1912:
	subl	$1, %ebx
	jne	.L1803
.LBE9029:
.LBE9028:
.LBB9031:
.LBB9032:
	.loc 59 57 0
	andl	$1073741824, %edi
.LVL1913:
	movl	$4096, %ebx
	movl	$4194304, %ecx
	cmove	%ebx, %ecx
	jmp	.L1719
.LVL1914:
.L1732:
.LBE9032:
.LBE9031:
.LBB9033:
.LBB9034:
	.loc 46 122 0
	pushl	$__func__.3032
	.cfi_remember_state
	.cfi_def_cfa_offset 52
.LVL1915:
	pushl	$122
	.cfi_def_cfa_offset 56
.LVL1916:
	pushl	$.LC145
	.cfi_def_cfa_offset 60
.LVL1917:
	pushl	$.LC226
	.cfi_def_cfa_offset 64
.LVL1918:
	call	_fail
.LVL1919:
	.p2align 4,,10
	.p2align 3
.L1709:
	.cfi_restore_state
.LBE9034:
.LBE9033:
.LBE9037:
.LBE9040:
.LBE9053:
.LBE9056:
.LBE9126:
.LBB9127:
.LBB9073:
.LBB9070:
.LBB9063:
	.loc 11 2204 0
	movzbl	%bl, %eax
.LVL1920:
.LBE9063:
.LBE9070:
	.loc 54 344 0
	cmpl	$62, %eax
	ja	.L1710
	jmp	*.L1714(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L1714:
	.long	.L1710
	.long	.L1710
	.long	.L1711
	.long	.L1710
	.long	.L1711
	.long	.L1710
	.long	.L1711
	.long	.L1710
	.long	.L1769
	.long	.L1710
	.long	.L1711
	.long	.L1710
	.long	.L1711
	.long	.L1710
	.long	.L1769
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1769
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1711
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1710
	.long	.L1769
	.text
.LVL1921:
	.p2align 4,,10
	.p2align 3
.L1717:
.LBE9073:
.LBE9127:
.LBB9128:
.LBB9057:
.LBB9054:
.LBB9041:
.LBB9025:
	.loc 11 2204 0
	movzbl	%bl, %ecx
.LVL1922:
.LBE9025:
.LBE9041:
	.loc 54 289 0
	cmpl	$62, %ecx
	ja	.L1718
	jmp	*.L1725(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L1725:
	.long	.L1772
	.long	.L1718
	.long	.L1726
	.long	.L1718
	.long	.L1722
	.long	.L1718
	.long	.L1722
	.long	.L1718
	.long	.L1772
	.long	.L1718
	.long	.L1728
	.long	.L1718
	.long	.L1729
	.long	.L1718
	.long	.L1772
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1772
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1730
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1718
	.long	.L1772
	.text
.L1730:
.LVL1923:
.LBB9042:
.LBB9043:
.LBB9044:
	.loc 11 3437 0
	andl	$16128, %ebx
.LVL1924:
.LBE9044:
.LBE9043:
	.loc 54 307 0
	movl	$1024, %ecx
.LBB9046:
.LBB9045:
	.loc 11 3437 0
	shrl	$8, %ebx
.LVL1925:
.LBE9045:
.LBE9046:
	.loc 54 307 0
	cmpl	$32, %ebx
	je	.L1719
	andl	$31, %ebx
	leal	4(%ebx), %ecx
	movl	$1, %ebx
	sall	%cl, %ebx
	movl	%ebx, %ecx
	jmp	.L1719
.LVL1926:
.L1726:
.LBE9042:
.LBB9047:
.LBB9048:
	.loc 11 2306 0
	andl	$15, %ebx
.LVL1927:
	cmpl	$2, %ebx
	je	.L1721
	call	cap_untyped_cap_get_capBlockSize.part.171
.LVL1928:
	.p2align 4,,10
	.p2align 3
.L1728:
.LBE9048:
.LBE9047:
.LBB9049:
.LBB9050:
	.loc 11 2698 0
	andl	$15, %ebx
.LVL1929:
	cmpl	$10, %ebx
	je	.L1723
	call	cap_cnode_cap_get_capCNodeRadix.part.187
.LVL1930:
.L1803:
.LBE9050:
.LBE9049:
.LBB9051:
.LBB9038:
.LBB9035:
.LBB9030:
	call	cap_frame_cap_get_capFSize.part.160
.LVL1931:
.L1802:
.LBE9030:
.LBE9035:
.LBE9038:
.LBE9051:
.LBE9054:
.LBE9057:
.LBB9058:
.LBB9019:
	call	cap_untyped_cap_get_capPtr.isra.115.part.116
.LVL1932:
.L1758:
.LBE9019:
.LBE9058:
.LBE9128:
.LBB9129:
.LBB9093:
	call	cap_reply_cap_get_capTCBPtr.isra.94.part.95
.LVL1933:
.L1754:
.LBE9093:
.LBE9129:
.LBB9130:
.LBB9107:
	call	cap_thread_cap_get_capTCBPtr.isra.89.part.90
.LVL1934:
.L1801:
.LBE9107:
.LBE9130:
.LBB9131:
.LBB9121:
	call	cap_irq_handler_cap_get_capIRQ.part.259
.LVL1935:
.L1749:
.LBE9121:
.LBE9131:
.LBB9132:
.LBB9100:
	call	cap_cnode_cap_get_capCNodePtr.isra.118.part.119
.LVL1936:
.L1741:
.LBE9100:
.LBE9132:
.LBB9133:
.LBB9078:
	call	cap_endpoint_cap_get_capEPPtr.part.117
.LVL1937:
.LBE9078:
.LBE9133:
	.cfi_endproc
.LFE788:
	.size	sameRegionAs, .-sameRegionAs
	.section	.text.unlikely
.LCOLDE404:
	.text
.LHOTE404:
	.section	.text.unlikely
.LCOLDB405:
	.text
.LHOTB405:
	.p2align 4,,15
	.globl	isMDBParentOf
	.type	isMDBParentOf, @function
isMDBParentOf:
.LFB745:
	.loc 33 818 0
	.cfi_startproc
.LVL1938:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 33 818 0
	movl	32(%esp), %ebx
	.loc 33 819 0
	testb	$2, 12(%ebx)
	je	.L1816
	.loc 33 822 0
	movl	36(%esp), %eax
	pushl	4(%eax)
	.cfi_def_cfa_offset 36
	pushl	(%eax)
	.cfi_def_cfa_offset 40
	pushl	4(%ebx)
	.cfi_def_cfa_offset 44
	pushl	(%ebx)
	.cfi_def_cfa_offset 48
	call	sameRegionAs
.LVL1939:
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	je	.L1805
.LVL1940:
	movl	(%ebx), %eax
.LVL1941:
.LBB9156:
.LBB9157:
.LBB9158:
.LBB9159:
	.loc 11 2202 0
	movl	%eax, %esi
	.loc 11 2203 0
	movl	%eax, %ecx
	movzbl	%al, %edx
	.loc 11 2202 0
	andl	$14, %esi
	.loc 11 2203 0
	andl	$15, %ecx
	cmpl	$14, %esi
	cmovne	%ecx, %edx
.LVL1942:
.LBE9159:
.LBE9158:
	.loc 33 825 0
	cmpl	$4, %edx
	je	.L1808
	cmpl	$6, %edx
	jne	.L1820
.LVL1943:
	movl	4(%ebx), %eax
.LVL1944:
.LBB9160:
.LBB9161:
.LBB9162:
	.loc 11 2498 0
	cmpl	$6, %ecx
	jne	.L1814
.LBE9162:
.LBE9161:
	.loc 33 842 0
	shrl	$4, %eax
.LVL1945:
	movl	%eax, %edx
	je	.L1820
.LVL1946:
	movl	36(%esp), %eax
	movl	4(%eax), %ecx
.LVL1947:
.LBB9164:
.LBB9165:
	.loc 11 2498 0
	movl	(%eax), %eax
	movl	%eax, 12(%esp)
	andl	$15, %eax
	cmpl	$6, %eax
	jne	.L1814
.LBE9165:
.LBE9164:
	.loc 33 846 0
	shrl	$4, %ecx
.LVL1948:
	xorl	%eax, %eax
	cmpl	%ecx, %edx
	je	.L1827
.LVL1949:
.L1805:
.LBE9160:
.LBE9157:
.LBE9156:
	.loc 33 855 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL1950:
	.p2align 4,,10
	.p2align 3
.L1820:
	.cfi_restore_state
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
.LBB9179:
.LBB9177:
.LBB9167:
	.loc 33 831 0
	movl	$1, %eax
.LBE9167:
.LBE9177:
.LBE9179:
	.loc 33 855 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL1951:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL1952:
	.p2align 4,,10
	.p2align 3
.L1816:
	.cfi_restore_state
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	.loc 33 820 0
	xorl	%eax, %eax
	.loc 33 855 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL1953:
	.p2align 4,,10
	.p2align 3
.L1808:
	.cfi_restore_state
.LBB9180:
.LBB9178:
.LBB9174:
.LBB9168:
.LBB9169:
	.loc 11 2450 0
	cmpl	$4, %ecx
	jne	.L1811
.LVL1954:
.LBE9169:
.LBE9168:
	.loc 33 830 0
	shrl	$4, %eax
	movl	%eax, %edx
	je	.L1820
	movl	36(%esp), %eax
	movl	(%eax), %eax
.LVL1955:
.LBB9171:
.LBB9172:
	.loc 11 2450 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$4, %ecx
	jne	.L1811
.LVL1956:
.LBE9172:
.LBE9171:
	.loc 33 833 0
	shrl	$4, %eax
	movl	%eax, %ecx
	xorl	%eax, %eax
	cmpl	%ecx, %edx
	jne	.L1805
.L1827:
	movl	36(%esp), %eax
	movl	12(%eax), %eax
	xorl	$1, %eax
	andl	$1, %eax
	jmp	.L1805
.LVL1957:
.L1814:
.LBE9174:
.LBB9175:
.LBB9166:
.LBB9163:
	call	cap_notification_cap_get_capNtfnBadge.part.228
.LVL1958:
.L1811:
.LBE9163:
.LBE9166:
.LBE9175:
.LBB9176:
.LBB9173:
.LBB9170:
	call	cap_endpoint_cap_get_capEPBadge.isra.208.part.209
.LVL1959:
.LBE9170:
.LBE9173:
.LBE9176:
.LBE9178:
.LBE9180:
	.cfi_endproc
.LFE745:
	.size	isMDBParentOf, .-isMDBParentOf
	.section	.text.unlikely
.LCOLDE405:
	.text
.LHOTE405:
	.section	.text.unlikely
.LCOLDB406:
	.text
.LHOTB406:
	.p2align 4,,15
	.globl	ensureNoChildren
	.type	ensureNoChildren, @function
ensureNoChildren:
.LFB746:
	.loc 33 859 0
	.cfi_startproc
.LVL1960:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 33 870 0
	xorl	%eax, %eax
	.loc 33 859 0
	movl	16(%esp), %ecx
	.loc 33 860 0
	movl	12(%ecx), %edx
	andl	$-8, %edx
	je	.L1829
.LVL1961:
.LBB9181:
	.loc 33 864 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%ecx
	.cfi_def_cfa_offset 32
	call	isMDBParentOf
.LVL1962:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	je	.L1829
	.loc 33 865 0
	movl	$9, current_syscall_error+24
	.loc 33 866 0
	movl	$3, %eax
.L1829:
.LBE9181:
	.loc 33 871 0
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE746:
	.size	ensureNoChildren, .-ensureNoChildren
	.section	.text.unlikely
.LCOLDE406:
	.text
.LHOTE406:
	.section	.text.unlikely
.LCOLDB407:
	.text
.LHOTB407:
	.p2align 4,,15
	.globl	sameObjectAs
	.type	sameObjectAs, @function
sameObjectAs:
.LFB789:
	.loc 45 308 0
	.cfi_startproc
.LVL1963:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	.loc 45 308 0
	movl	20(%esp), %eax
	movl	24(%esp), %esi
	movl	28(%esp), %ecx
.LVL1964:
	movl	32(%esp), %edi
.LVL1965:
.LBB9182:
.LBB9183:
	.loc 11 2202 0
	movl	%eax, %ebx
	andl	$14, %ebx
	cmpl	$14, %ebx
	je	.L1837
	.loc 11 2203 0
	movl	%eax, %edx
	andl	$15, %edx
.LVL1966:
.LBE9183:
.LBE9182:
	.loc 45 309 0
	cmpl	$2, %edx
	je	.L1859
	.loc 45 312 0
	cmpl	$14, %edx
	je	.L1869
.L1846:
	.loc 45 316 0
	andl	$1, %edx
	.loc 45 317 0
	movl	%ecx, 28(%esp)
	movl	%edi, 32(%esp)
	movl	%eax, 20(%esp)
	movl	%esi, 24(%esp)
	.loc 45 316 0
	je	.L1847
	.loc 45 316 0 is_stmt 0 discriminator 1
	andl	$1, %ecx
	jne	.L1870
.L1847:
	.loc 45 320 0 is_stmt 1
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL1967:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 45 319 0
	jmp	sameRegionAs
.LVL1968:
	.p2align 4,,10
	.p2align 3
.L1837:
	.cfi_restore_state
.LBB9185:
.LBB9184:
	.loc 11 2204 0
	movzbl	%al, %ebp
	movl	%ebp, %edx
.LVL1969:
.LBE9184:
.LBE9185:
	.loc 45 309 0
	cmpl	$2, %ebp
	je	.L1859
	.loc 45 312 0
	cmpl	$14, %ebp
	jne	.L1846
.LVL1970:
.LBB9186:
.LBB9187:
	.loc 11 2202 0
	movl	%ecx, %edx
	andl	$14, %edx
	cmpl	$14, %edx
	je	.L1851
.LVL1971:
	movl	%ebp, %edx
	jmp	.L1846
.LVL1972:
	.p2align 4,,10
	.p2align 3
.L1851:
.LBE9187:
.LBE9186:
	.loc 45 312 0
	cmpb	$30, %cl
	jne	.L1871
.L1859:
	.loc 45 320 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
.LVL1973:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL1974:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL1975:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL1976:
	.p2align 4,,10
	.p2align 3
.L1870:
	.cfi_restore_state
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL1977:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL1978:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 45 317 0
	jmp	Arch_sameObjectAs
.LVL1979:
	.p2align 4,,10
	.p2align 3
.L1871:
	.cfi_restore_state
.LBB9189:
.LBB9190:
.LBB9191:
.LBB9192:
	.loc 11 2202 0
	cmpl	$14, %ebx
	jne	.L1845
	movzbl	%al, %ebp
	movl	%ebp, %edx
	jmp	.L1846
.LVL1980:
	.p2align 4,,10
	.p2align 3
.L1869:
.LBE9192:
.LBE9191:
.LBE9190:
.LBE9189:
.LBB9193:
.LBB9188:
	movl	%ecx, %edx
	andl	$14, %edx
	cmpl	$14, %edx
	je	.L1851
.LVL1981:
.L1845:
	movl	%eax, %edx
	andl	$15, %edx
	jmp	.L1846
.LBE9188:
.LBE9193:
	.cfi_endproc
.LFE789:
	.size	sameObjectAs, .-sameObjectAs
	.section	.text.unlikely
.LCOLDE407:
	.text
.LHOTE407:
	.section	.text.unlikely
.LCOLDB408:
	.text
.LHOTB408:
	.p2align 4,,15
	.globl	isFinalCapability
	.type	isFinalCapability, @function
isFinalCapability:
.LFB748:
	.loc 33 886 0
	.cfi_startproc
.LVL1982:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 33 886 0
	movl	16(%esp), %ebx
.LVL1983:
	.loc 33 892 0
	movl	8(%ebx), %eax
	andl	$-8, %eax
	je	.L1873
.LVL1984:
.LBB9194:
	.loc 33 898 0
	pushl	4(%ebx)
	.cfi_def_cfa_offset 20
.LVL1985:
	pushl	(%ebx)
	.cfi_def_cfa_offset 24
	pushl	4(%eax)
	.cfi_def_cfa_offset 28
	pushl	(%eax)
	.cfi_def_cfa_offset 32
	call	sameObjectAs
.LVL1986:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	%eax, %edx
.LVL1987:
.LBE9194:
	.loc 33 902 0
	xorl	%eax, %eax
.LVL1988:
	.loc 33 901 0
	testl	%edx, %edx
	je	.L1873
.LVL1989:
.L1874:
	.loc 33 913 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L1873:
	.cfi_restore_state
	.loc 33 904 0
	movl	12(%ebx), %edx
	.loc 33 905 0
	movl	$1, %eax
	.loc 33 904 0
	andl	$-8, %edx
	je	.L1874
.LVL1990:
.LBB9195:
	.loc 33 910 0
	pushl	4(%edx)
	.cfi_def_cfa_offset 20
	pushl	(%edx)
	.cfi_def_cfa_offset 24
	pushl	4(%ebx)
	.cfi_def_cfa_offset 28
	pushl	(%ebx)
	.cfi_def_cfa_offset 32
	call	sameObjectAs
.LVL1991:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	sete	%al
.LBE9195:
	.loc 33 913 0
	addl	$8, %esp
	.cfi_def_cfa_offset 8
.LBB9196:
	.loc 33 910 0
	movzbl	%al, %eax
.LBE9196:
	.loc 33 913 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE748:
	.size	isFinalCapability, .-isFinalCapability
	.section	.text.unlikely
.LCOLDE408:
	.text
.LHOTE408:
	.section	.text.unlikely
.LCOLDB409:
	.text
.LHOTB409:
	.p2align 4,,15
	.globl	slotCapLongRunningDelete
	.type	slotCapLongRunningDelete, @function
slotCapLongRunningDelete:
.LFB749:
	.loc 33 917 0
	.cfi_startproc
.LVL1992:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 33 917 0
	movl	16(%esp), %edx
	movl	(%edx), %eax
.LVL1993:
.LBB9197:
.LBB9198:
	.loc 11 2202 0
	movl	%eax, %edi
	.loc 11 2203 0
	movl	%eax, %esi
	movzbl	%al, %ebx
	andl	$15, %esi
	.loc 11 2202 0
	andl	$14, %edi
	.loc 11 2203 0
	cmpl	$14, %edi
	movl	%esi, %ecx
	cmove	%ebx, %ecx
.LVL1994:
.LBE9198:
.LBE9197:
	.loc 33 919 0
	xorl	%eax, %eax
	.loc 33 918 0
	testl	%ecx, %ecx
	je	.L1885
	.loc 33 920 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	%edx
	.cfi_def_cfa_offset 32
	call	isFinalCapability
.LVL1995:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	je	.L1885
.LBB9199:
.LBB9200:
	.loc 11 2203 0
	cmpl	$14, %edi
	movl	%esi, %eax
	cmove	%ebx, %eax
.LBE9200:
.LBE9199:
	.loc 33 923 0
	cmpl	$12, %eax
	je	.L1890
	cmpl	$46, %eax
	je	.L1890
	cmpl	$10, %eax
	je	.L1890
	.loc 33 929 0
	xorl	%eax, %eax
.L1885:
	.loc 33 931 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L1890:
	.cfi_restore_state
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	.loc 33 927 0
	movl	$1, %eax
	.loc 33 931 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE749:
	.size	slotCapLongRunningDelete, .-slotCapLongRunningDelete
	.section	.text.unlikely
.LCOLDE409:
	.text
.LHOTE409:
	.section	.text.unlikely
.LCOLDB410:
	.text
.LHOTB410:
	.p2align 4,,15
	.globl	updateCapData
	.type	updateCapData, @function
updateCapData:
.LFB790:
	.loc 45 324 0
	.cfi_startproc
.LVL1996:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	movl	44(%esp), %edx
.LVL1997:
	.loc 45 324 0
	movl	32(%esp), %ebx
.LBB9233:
.LBB9234:
.LBB9235:
.LBB9236:
	.loc 11 2202 0
	movl	%edx, %eax
	andl	$14, %eax
	cmpl	$14, %eax
	je	.L1906
.LVL1998:
.LBE9236:
.LBE9235:
.LBE9234:
.LBE9233:
.LBB9237:
.LBB9238:
	.loc 11 2203 0
	movl	%edx, %eax
	andl	$15, %eax
.LBE9238:
.LBE9237:
	.loc 45 325 0
	testb	$1, %dl
	jne	.L1907
.L1911:
	movl	48(%esp), %edi
	.loc 45 329 0
	cmpl	$6, %eax
	je	.L1913
	cmpl	$10, %eax
	je	.L1914
	cmpl	$4, %eax
	je	.L1924
	.loc 45 365 0
	movl	%edx, (%ebx)
	.loc 45 367 0
	movl	%ebx, %eax
	.loc 45 365 0
	movl	%edi, 4(%ebx)
	.loc 45 367 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret	$4
.LVL1999:
	.p2align 4,,10
	.p2align 3
.L1906:
	.cfi_restore_state
.LBB9240:
.LBB9239:
	.loc 11 2204 0
	movzbl	%dl, %eax
.LBE9239:
.LBE9240:
	.loc 45 325 0
	testb	$1, %dl
	je	.L1911
.L1907:
	.loc 45 326 0
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	60(%esp)
	.cfi_def_cfa_offset 48
	pushl	60(%esp)
	.cfi_def_cfa_offset 52
	pushl	60(%esp)
	.cfi_def_cfa_offset 56
	pushl	60(%esp)
	.cfi_def_cfa_offset 60
	pushl	%ebx
	.cfi_def_cfa_offset 64
	call	Arch_updateCapData
	.cfi_def_cfa_offset 60
.LVL2000:
	addl	$28, %esp
	.cfi_def_cfa_offset 32
.LVL2001:
.L1905:
	.loc 45 367 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret	$4
	.p2align 4,,10
	.p2align 3
.L1913:
	.cfi_restore_state
	.loc 45 338 0
	movl	36(%esp), %eax
	testl	%eax, %eax
	jne	.L1916
.LVL2002:
.LBB9241:
.LBB9242:
	.loc 11 2498 0 discriminator 1
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$6, %eax
	jne	.L1925
.LBE9242:
.LBE9241:
	.loc 45 338 0
	movl	%edi, %eax
	shrl	$4, %eax
	jne	.L1916
.LVL2003:
.LBB9244:
.LBB9245:
	.loc 11 2518 0
	movl	40(%esp), %eax
	movl	%edx, (%ebx)
	sall	$4, %eax
	orl	%eax, %edi
	movl	%edi, 4(%ebx)
	jmp	.L1905
.LVL2004:
	.p2align 4,,10
	.p2align 3
.L1924:
.LBE9245:
.LBE9244:
	.loc 45 331 0
	movl	36(%esp), %ecx
	testl	%ecx, %ecx
	jne	.L1916
.LVL2005:
.LBB9246:
.LBB9247:
	.loc 11 2450 0 discriminator 1
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$4, %eax
	jne	.L1926
.LVL2006:
.LBE9247:
.LBE9246:
	.loc 45 331 0
	shrl	$4, %edx
	je	.L1927
.L1916:
.LVL2007:
.LBB9249:
.LBB9250:
	.loc 11 2225 0
	movl	$0, (%ebx)
.LBE9250:
.LBE9249:
	.loc 45 367 0
	movl	%ebx, %eax
.LBB9252:
.LBB9251:
	.loc 11 2225 0
	movl	$0, 4(%ebx)
.LVL2008:
.LBE9251:
.LBE9252:
	.loc 45 367 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret	$4
	.p2align 4,,10
	.p2align 3
.L1914:
	.cfi_restore_state
.LVL2009:
.LBB9253:
.LBB9254:
.LBB9255:
	.loc 11 815 0
	movl	40(%esp), %ebp
.LBE9255:
.LBE9254:
.LBB9257:
.LBB9258:
	.loc 11 2698 0
	movl	%edx, %eax
	andl	$15, %eax
.LBE9258:
.LBE9257:
.LBB9261:
.LBB9256:
	.loc 11 815 0
	andl	$248, %ebp
	shrl	$3, %ebp
.LVL2010:
.LBE9256:
.LBE9261:
.LBB9262:
.LBB9259:
	.loc 11 2698 0
	cmpl	$10, %eax
	jne	.L1928
.LBE9259:
.LBE9262:
	.loc 45 350 0
	movl	%edi, %eax
	andl	$8126464, %eax
	shrl	$18, %eax
	addl	%ebp, %eax
	cmpl	$32, %eax
	ja	.L1916
.LVL2011:
.LBB9263:
.LBB9264:
.LBB9265:
	.loc 11 2690 0
	movl	40(%esp), %esi
	movl	%ebp, %ecx
	movl	$1, %eax
.LBE9265:
.LBE9264:
	.loc 45 360 0
	movl	%edx, (%ebx)
.LBB9268:
.LBB9266:
	.loc 11 2690 0
	sall	%cl, %eax
	movl	%edi, %ecx
	subl	$1, %eax
	andl	$-260308992, %ecx
	andl	$67108608, %esi
	shrl	$8, %esi
	andl	%eax, %esi
	movl	%ecx, %eax
.LBE9266:
.LBE9268:
	.loc 45 360 0
	movl	%ebp, %ecx
.LBB9269:
.LBB9267:
	.loc 11 2690 0
	orl	%esi, %eax
.LVL2012:
.LBE9267:
.LBE9269:
	.loc 45 360 0
	sall	$23, %ecx
	orl	%eax, %ecx
	movl	%ecx, 4(%ebx)
.LVL2013:
	jmp	.L1905
.LVL2014:
	.p2align 4,,10
	.p2align 3
.L1927:
.LBE9263:
.LBE9253:
.LBB9271:
.LBB9272:
	.loc 11 2470 0
	movl	40(%esp), %eax
	movl	%edi, 4(%ebx)
	sall	$4, %eax
	orl	$4, %eax
.LVL2015:
	movl	%eax, (%ebx)
	jmp	.L1905
.LVL2016:
.L1928:
.LBE9272:
.LBE9271:
.LBB9273:
.LBB9270:
.LBB9260:
	call	cap_cnode_cap_get_capCNodeRadix.part.187
.LVL2017:
.L1926:
.LBE9260:
.LBE9270:
.LBE9273:
.LBB9274:
.LBB9248:
	call	cap_endpoint_cap_get_capEPBadge.isra.208.part.209
.LVL2018:
.L1925:
.LBE9248:
.LBE9274:
.LBB9275:
.LBB9243:
	call	cap_notification_cap_get_capNtfnBadge.part.228
.LVL2019:
.LBE9243:
.LBE9275:
	.cfi_endproc
.LFE790:
	.size	updateCapData, .-updateCapData
	.section	.text.unlikely
.LCOLDE410:
	.text
.LHOTE410:
	.section	.rodata.str1.4
	.align 4
.LC411:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/object/objecttype.c"
	.section	.rodata.str1.1
.LC412:
	.string	"Invalid cap type"
	.section	.text.unlikely
.LCOLDB413:
	.text
.LHOTB413:
	.p2align 4,,15
	.globl	maskCapRights
	.type	maskCapRights, @function
maskCapRights:
.LFB791:
	.loc 45 371 0
	.cfi_startproc
.LVL2020:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	movl	24(%esp), %edx
.LVL2021:
	.loc 45 371 0
	movl	16(%esp), %ebx
.LBB9310:
.LBB9311:
.LBB9312:
.LBB9313:
	.loc 11 2202 0
	movl	%edx, %eax
	andl	$14, %eax
	cmpl	$14, %eax
	je	.L1930
.LVL2022:
.LBE9313:
.LBE9312:
.LBE9311:
.LBE9310:
.LBB9314:
.LBB9315:
	.loc 11 2203 0
	movl	%edx, %ecx
	andl	$15, %ecx
.LBE9315:
.LBE9314:
	.loc 45 372 0
	testb	$1, %dl
	jne	.L1931
.L1935:
	movl	28(%esp), %eax
	.loc 45 376 0
	cmpl	$62, %ecx
	ja	.L1936
	jmp	*.L1938(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L1938:
	.long	.L1937
	.long	.L1936
	.long	.L1937
	.long	.L1936
	.long	.L1939
	.long	.L1936
	.long	.L1940
	.long	.L1936
	.long	.L1937
	.long	.L1936
	.long	.L1937
	.long	.L1936
	.long	.L1937
	.long	.L1936
	.long	.L1937
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1937
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1937
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1936
	.long	.L1937
	.text
.LVL2023:
	.p2align 4,,10
	.p2align 3
.L1930:
.LBB9317:
.LBB9316:
	.loc 11 2204 0
	movzbl	%dl, %ecx
.LBE9316:
.LBE9317:
	.loc 45 372 0
	testb	$1, %dl
	je	.L1935
.L1931:
	.loc 45 373 0
	pushl	28(%esp)
	.cfi_def_cfa_offset 20
	pushl	28(%esp)
	.cfi_def_cfa_offset 24
	pushl	28(%esp)
	.cfi_def_cfa_offset 28
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	Arch_maskCapRights
	.cfi_def_cfa_offset 28
.LVL2024:
	.loc 45 420 0
	movl	%ebx, %eax
	.loc 45 373 0
	addl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 45 420 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret	$4
.LVL2025:
	.p2align 4,,10
	.p2align 3
.L1940:
	.cfi_restore_state
.LBB9318:
.LBB9319:
.LBB9320:
	.loc 11 2550 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$6, %ecx
	jne	.L1946
.LVL2026:
.LBE9320:
.LBE9319:
.LBB9322:
.LBB9323:
	.loc 11 2542 0
	movl	20(%esp), %ecx
	movl	%eax, %esi
.LBE9323:
.LBE9322:
	.loc 45 414 0
	movl	%edx, (%ebx)
.LBB9326:
.LBB9324:
	.loc 11 2542 0
	andl	$-4, %esi
	andl	%eax, %ecx
.LBE9324:
.LBE9326:
	.loc 45 414 0
	andl	$2, %eax
	andl	20(%esp), %eax
.LBB9327:
.LBB9325:
	.loc 11 2542 0
	andl	$1, %ecx
	orl	%esi, %ecx
.LVL2027:
.LBE9325:
.LBE9327:
	.loc 45 414 0
	orl	%ecx, %eax
	movl	%eax, 4(%ebx)
.LVL2028:
.LBE9318:
	.loc 45 420 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret	$4
.LVL2029:
	.p2align 4,,10
	.p2align 3
.L1937:
	.cfi_restore_state
	.loc 45 386 0
	movl	%eax, 4(%ebx)
	.loc 45 420 0
	movl	%ebx, %eax
	.loc 45 386 0
	movl	%edx, (%ebx)
	.loc 45 420 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret	$4
	.p2align 4,,10
	.p2align 3
.L1939:
	.cfi_restore_state
.LVL2030:
.LBB9329:
.LBB9330:
.LBB9331:
	.loc 11 2424 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$4, %ecx
	jne	.L1947
.LVL2031:
.LBE9331:
.LBE9330:
.LBB9333:
.LBB9334:
	.loc 11 2416 0
	movl	20(%esp), %ecx
	movl	%eax, %esi
.LBE9334:
.LBE9333:
	.loc 45 401 0
	movl	%edx, (%ebx)
.LBB9336:
.LBB9335:
	.loc 11 2416 0
	andl	$-4, %esi
	andl	%eax, %ecx
	andl	$1, %ecx
	orl	%ecx, %esi
.LVL2032:
.LBE9335:
.LBE9336:
.LBB9337:
.LBB9338:
	.loc 11 2390 0
	movl	%eax, %ecx
.LBE9338:
.LBE9337:
	.loc 45 401 0
	andl	$4, %eax
	andl	20(%esp), %eax
.LBB9340:
.LBB9339:
	.loc 11 2390 0
	andl	$2, %ecx
	andl	20(%esp), %ecx
	orl	%esi, %ecx
	andl	$-5, %ecx
.LVL2033:
.LBE9339:
.LBE9340:
	.loc 45 401 0
	orl	%ecx, %eax
	movl	%eax, 4(%ebx)
.LVL2034:
.LBE9329:
	.loc 45 420 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL2035:
	ret	$4
.LVL2036:
	.p2align 4,,10
	.p2align 3
.L1936:
	.cfi_restore_state
	.loc 45 418 0
	pushl	$__func__.9172
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$418
	.cfi_def_cfa_offset 24
	pushl	$.LC411
	.cfi_def_cfa_offset 28
	pushl	$.LC412
	.cfi_def_cfa_offset 32
	call	_fail
.LVL2037:
.L1946:
	.cfi_restore_state
.LBB9342:
.LBB9328:
.LBB9321:
	call	cap_notification_cap_get_capNtfnCanSend.part.245
.LVL2038:
.L1947:
.LBE9321:
.LBE9328:
.LBE9342:
.LBB9343:
.LBB9341:
.LBB9332:
	call	cap_endpoint_cap_get_capCanSend.part.206
.LVL2039:
.LBE9332:
.LBE9341:
.LBE9343:
	.cfi_endproc
.LFE791:
	.size	maskCapRights, .-maskCapRights
	.section	.text.unlikely
.LCOLDE413:
	.text
.LHOTE413:
	.section	.rodata.str1.4
	.align 4
.LC414:
	.string	"notification_ptr_get_state(ntfnPtr) == NtfnState_Waiting"
	.section	.text.unlikely
.LCOLDB415:
	.text
.LHOTB415:
	.p2align 4,,15
	.globl	cancelSignal
	.type	cancelSignal, @function
cancelSignal:
.LFB778:
	.loc 36 186 0
	.cfi_startproc
.LVL2040:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 36 186 0
	movl	52(%esp), %edx
	movl	48(%esp), %ebx
	movl	(%edx), %eax
.LVL2041:
	.loc 36 190 0
	movl	%eax, %ecx
	andl	$3, %ecx
	cmpl	$1, %ecx
	jne	.L1960
.LVL2042:
.LBB9376:
.LBB9377:
	.loc 36 29 0
	movl	%eax, %edi
	movl	4(%edx), %ecx
.LVL2043:
	andl	$-16, %edi
	movl	%edi, 12(%esp)
.LBE9377:
.LBE9376:
.LBB9379:
.LBB9380:
	.loc 31 227 0
	movl	656(%ebx), %edi
.LBE9380:
.LBE9379:
.LBB9383:
.LBB9378:
	.loc 36 28 0
	movl	%ecx, %esi
	andl	$-16, %esi
.LVL2044:
.LBE9378:
.LBE9383:
.LBB9384:
.LBB9381:
	.loc 31 227 0
	testl	%edi, %edi
	je	.L1950
	.loc 31 228 0
	movl	652(%ebx), %ebp
	movl	%ebp, 652(%edi)
	movl	652(%ebx), %ebp
.LVL2045:
.L1951:
	.loc 31 233 0
	testl	%ebp, %ebp
	je	.L1957
	.loc 31 234 0
	movl	%edi, 656(%ebp)
.LVL2046:
.L1952:
.LBE9381:
.LBE9384:
.LBB9385:
.LBB9386:
.LBB9387:
.LBB9388:
	.loc 11 1084 0
	testl	$15, %esi
	jne	.L1961
	.loc 11 1086 0
	movl	%esi, %edi
	andl	$15, %ecx
.LVL2047:
	andl	$-16, %edi
	orl	%edi, %ecx
	movl	%ecx, 4(%edx)
.LVL2048:
.LBE9388:
.LBE9387:
.LBB9390:
.LBB9391:
	.loc 11 1103 0
	testb	$15, 12(%esp)
	jne	.L1962
	.loc 11 1105 0
	movl	12(%esp), %ecx
	andl	$15, %eax
.LVL2049:
	andl	$-16, %ecx
	orl	%ecx, %eax
.LVL2050:
.LBE9391:
.LBE9390:
.LBE9386:
.LBE9385:
	.loc 36 198 0
	testl	%esi, %esi
	je	.L1963
.L1959:
.LBB9396:
.LBB9397:
	.loc 11 1123 0
	movl	%eax, (%edx)
.LVL2051:
.LBE9397:
.LBE9396:
	.loc 36 203 0
	movl	%ebx, 48(%esp)
.LVL2052:
	movl	$0, 52(%esp)
.LVL2053:
	.loc 36 204 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL2054:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 36 203 0
	jmp	setThreadState
.LVL2055:
	.p2align 4,,10
	.p2align 3
.L1963:
	.cfi_restore_state
.LBB9399:
.LBB9398:
	.loc 11 1123 0
	andl	$-4, %eax
	jmp	.L1959
.LVL2056:
	.p2align 4,,10
	.p2align 3
.L1957:
.LBE9398:
.LBE9399:
.LBB9400:
.LBB9382:
	.loc 31 227 0
	movl	%edi, 12(%esp)
.LVL2057:
	jmp	.L1952
.LVL2058:
	.p2align 4,,10
	.p2align 3
.L1950:
	.loc 31 230 0
	movl	652(%ebx), %esi
.LVL2059:
	movl	%esi, %ebp
	jmp	.L1951
.LVL2060:
.L1960:
.LBE9382:
.LBE9400:
.LBB9401:
.LBB9402:
	.loc 36 190 0
	pushl	$__FUNCTION__.9047
	.cfi_remember_state
	.cfi_def_cfa_offset 52
	pushl	$190
	.cfi_def_cfa_offset 56
	pushl	$.LC148
	.cfi_def_cfa_offset 60
	pushl	$.LC414
	.cfi_def_cfa_offset 64
	call	_assert_fail
.LVL2061:
.L1962:
	.cfi_restore_state
.LBE9402:
.LBE9401:
.LBB9403:
.LBB9395:
.LBB9393:
.LBB9392:
	call	notification_ptr_set_ntfnQueue_tail.isra.250.part.251
.LVL2062:
.L1961:
.LBE9392:
.LBE9393:
.LBB9394:
.LBB9389:
	call	notification_ptr_set_ntfnQueue_head.isra.248.part.249
.LVL2063:
.LBE9389:
.LBE9394:
.LBE9395:
.LBE9403:
	.cfi_endproc
.LFE778:
	.size	cancelSignal, .-cancelSignal
	.section	.text.unlikely
.LCOLDE415:
	.text
.LHOTE415:
	.section	.rodata.str1.1
.LC416:
	.string	"thread"
.LC417:
	.string	"isRunnable(thread)"
	.section	.text.unlikely
.LCOLDB418:
	.text
.LHOTB418:
	.p2align 4,,15
	.globl	chooseThread
	.type	chooseThread, @function
chooseThread:
.LFB692:
	.loc 32 300 0
	.cfi_startproc
.LVL2064:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 32 311 0
	movl	ksReadyQueuesL1Bitmap, %eax
	testl	%eax, %eax
	je	.L1965
.LVL2065:
.LBB9404:
	.loc 32 312 0
	movl	$31, %edx
.LBB9405:
.LBB9406:
	.file 65 "/home/axjllt/Desktop/ori_refos/kernel/include/util.h"
	.loc 65 105 0
	bsrl	%eax, %eax
.LVL2066:
	xorl	$31, %eax
.LVL2067:
.LBE9406:
.LBE9405:
	.loc 32 312 0
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
.LVL2068:
.LBB9407:
.LBB9408:
	.loc 65 105 0
	bsrl	ksReadyQueuesL2Bitmap(,%ecx,4), %ecx
.LBE9408:
.LBE9407:
	.loc 32 315 0
	sall	$5, %eax
.LVL2069:
.LBB9410:
.LBB9409:
	.loc 65 105 0
	xorl	$31, %ecx
.LVL2070:
.LBE9409:
.LBE9410:
	.loc 32 315 0
	subl	%ecx, %edx
.LVL2071:
	orl	%edx, %eax
	movl	ksReadyQueues(,%eax,8), %ebx
.LVL2072:
	.loc 32 316 0
	testl	%ebx, %ebx
	je	.L1973
.LVL2073:
.LBB9411:
.LBB9412:
	.loc 63 45 0
	movl	588(%ebx), %eax
	andl	$15, %eax
	subl	$1, %eax
	cmpl	$1, %eax
	ja	.L1967
.LVL2074:
.LBE9412:
.LBE9411:
.LBB9413:
.LBB9414:
.LBB9415:
.LBB9416:
	.loc 14 22 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	setVMRoot
.LVL2075:
.LBE9416:
.LBE9415:
	.loc 32 331 0
	movl	%ebx, (%esp)
	call	tcbSchedDequeue
.LVL2076:
	.loc 32 332 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	%ebx, ksCurThread
.LBE9414:
.LBE9413:
.LBE9404:
	.loc 32 322 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL2077:
	ret
.LVL2078:
	.p2align 4,,10
	.p2align 3
.L1967:
	.cfi_restore_state
.LBB9417:
	.loc 32 317 0
	pushl	$__FUNCTION__.8374
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$317
	.cfi_def_cfa_offset 24
	pushl	$.LC365
	.cfi_def_cfa_offset 28
	pushl	$.LC417
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2079:
	.p2align 4,,10
	.p2align 3
.L1965:
	.cfi_restore_state
.LBE9417:
.LBB9418:
.LBB9419:
.LBB9420:
.LBB9421:
	.loc 14 42 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	ksIdleThread
	.cfi_def_cfa_offset 32
	call	setVMRoot
.LVL2080:
.LBE9421:
.LBE9420:
	.loc 32 342 0
	movl	ksIdleThread, %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	%eax, ksCurThread
.LBE9419:
.LBE9418:
	.loc 32 322 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL2081:
.L1973:
	.cfi_restore_state
.LBB9422:
	.loc 32 316 0 discriminator 1
	pushl	$__FUNCTION__.8374
	.cfi_def_cfa_offset 20
	pushl	$316
	.cfi_def_cfa_offset 24
	pushl	$.LC365
	.cfi_def_cfa_offset 28
	pushl	$.LC416
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2082:
.LBE9422:
	.cfi_endproc
.LFE692:
	.size	chooseThread, .-chooseThread
	.section	.text.unlikely
.LCOLDE418:
	.text
.LHOTE418:
	.section	.text.unlikely
.LCOLDB419:
	.text
.LHOTB419:
	.p2align 4,,15
	.globl	schedule
	.type	schedule, @function
schedule:
.LFB691:
	.loc 32 270 0
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 32 273 0
	movl	ksSchedulerAction, %ebx
.LVL2083:
	.loc 32 274 0
	cmpl	$-1, %ebx
	je	.L1997
	.loc 32 283 0
	testl	%ebx, %ebx
	je	.L1974
	.loc 32 284 0
	movl	ksCurThread, %eax
.LVL2084:
.LBB9459:
.LBB9460:
	.loc 63 45 0
	movl	588(%eax), %edx
	andl	$15, %edx
	subl	$1, %edx
	cmpl	$1, %edx
	ja	.L1981
.LVL2085:
.LBE9460:
.LBE9459:
.LBB9461:
.LBB9462:
	.loc 31 80 0
	testb	$1, 592(%eax)
	je	.L1998
.LVL2086:
.L1981:
.LBE9462:
.LBE9461:
.LBB9464:
.LBB9465:
.LBB9466:
.LBB9467:
	.loc 14 22 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	setVMRoot
.LVL2087:
.LBE9467:
.LBE9466:
	.loc 32 331 0
	movl	%ebx, (%esp)
	call	tcbSchedDequeue
.LVL2088:
	.loc 32 332 0
	movl	%ebx, ksCurThread
.LBE9465:
.LBE9464:
	.loc 32 289 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	$0, ksSchedulerAction
.L1974:
	.loc 32 296 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL2089:
	.p2align 4,,10
	.p2align 3
.L1997:
	.cfi_restore_state
.LBB9468:
.LBB9469:
	.loc 32 275 0
	movl	ksCurThread, %eax
.LVL2090:
.LBB9470:
.LBB9471:
	.loc 63 45 0
	movl	588(%eax), %edx
	andl	$15, %edx
	subl	$1, %edx
	cmpl	$1, %edx
	jbe	.L1999
.LVL2091:
.L1976:
.LBE9471:
.LBE9470:
	.loc 32 278 0
	movl	ksDomainTime, %eax
	testl	%eax, %eax
	jne	.L1978
.LBB9472:
.LBB9473:
	.loc 32 261 0
	movl	$0, ksDomScheduleIdx
	.loc 32 263 0
	movl	$0, ksWorkUnitsCompleted
	.loc 32 264 0
	movl	$0, ksCurDomain
	.loc 32 265 0
	movl	$1, ksDomainTime
.L1978:
.LBE9473:
.LBE9472:
	.loc 32 281 0
	call	chooseThread
.LVL2092:
	.loc 32 282 0
	movl	$0, ksSchedulerAction
.LBE9469:
.LBE9468:
	.loc 32 296 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL2093:
	ret
.LVL2094:
	.p2align 4,,10
	.p2align 3
.L1999:
	.cfi_restore_state
.LBB9477:
.LBB9476:
.LBB9474:
.LBB9475:
	.loc 31 80 0
	testb	$1, 592(%eax)
	jne	.L1976
	call	tcbSchedEnqueue.part.263
.LVL2095:
	jmp	.L1976
.LVL2096:
	.p2align 4,,10
	.p2align 3
.L1998:
.LBE9475:
.LBE9474:
.LBE9476:
.LBE9477:
.LBB9478:
.LBB9463:
	call	tcbSchedEnqueue.part.263
.LVL2097:
	movl	ksSchedulerAction, %ebx
.LVL2098:
	jmp	.L1981
.LBE9463:
.LBE9478:
	.cfi_endproc
.LFE691:
	.size	schedule, .-schedule
	.section	.text.unlikely
.LCOLDE419:
	.text
.LHOTE419:
	.section	.rodata.str1.4
	.align 4
.LC420:
	.string	"NODE_STATE_ON_CORE(ksDebugTCBs, tcb->tcbAffinity) != NULL"
	.section	.rodata.str1.1
.LC421:
	.string	"tcb->tcbDebugPrev"
	.section	.text.unlikely
.LCOLDB422:
	.text
.LHOTB422:
	.p2align 4,,15
	.globl	tcbDebugRemove
	.type	tcbDebugRemove, @function
tcbDebugRemove:
.LFB805:
	.loc 31 189 0
	.cfi_startproc
.LVL2099:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 31 190 0
	movl	ksDebugTCBs, %edx
	.loc 31 189 0
	movl	16(%esp), %eax
	.loc 31 190 0
	testl	%edx, %edx
	je	.L2010
	.loc 31 191 0
	cmpl	%eax, %edx
	je	.L2011
	.loc 31 194 0
	movl	664(%eax), %edx
	testl	%edx, %edx
	je	.L2012
	.loc 31 195 0
	movl	660(%eax), %ecx
	movl	%ecx, 660(%edx)
.L2003:
	.loc 31 198 0
	movl	660(%eax), %edx
	testl	%edx, %edx
	je	.L2005
	.loc 31 199 0
	movl	664(%eax), %ecx
	movl	%ecx, 664(%edx)
.L2005:
	.loc 31 202 0
	movl	$0, 664(%eax)
	.loc 31 203 0
	movl	$0, 660(%eax)
	.loc 31 204 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L2011:
	.cfi_restore_state
	.loc 31 192 0
	movl	660(%eax), %edx
	movl	%edx, ksDebugTCBs
	jmp	.L2003
.L2010:
	.loc 31 190 0 discriminator 1
	pushl	$__FUNCTION__.9286
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$190
	.cfi_def_cfa_offset 24
	pushl	$.LC164
	.cfi_def_cfa_offset 28
	pushl	$.LC420
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2100:
.L2012:
	.cfi_restore_state
.LBB9481:
.LBB9482:
	.loc 31 194 0
	pushl	$__FUNCTION__.9286
	.cfi_def_cfa_offset 20
	pushl	$194
	.cfi_def_cfa_offset 24
	pushl	$.LC164
	.cfi_def_cfa_offset 28
	pushl	$.LC421
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2101:
.LBE9482:
.LBE9481:
	.cfi_endproc
.LFE805:
	.size	tcbDebugRemove, .-tcbDebugRemove
	.section	.text.unlikely
.LCOLDE422:
	.text
.LHOTE422:
	.section	.rodata.str1.4
	.align 4
.LC423:
	.string	"cap_get_capType(masterCap) == cap_reply_cap"
	.align 4
.LC424:
	.string	"cap_reply_cap_get_capReplyMaster(masterCap)"
	.align 4
.LC425:
	.string	"TCB_PTR(cap_reply_cap_get_capTCBPtr(masterCap)) == sender"
	.align 4
.LC426:
	.string	"cap_get_capType(callerCap) == cap_null_cap"
	.align 4
.LC427:
	.string	"(capTCBPtr & ~0xffffffe0u) == ((0 && (capTCBPtr & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB428:
	.text
.LHOTB428:
	.p2align 4,,15
	.globl	setupCallerCap
	.type	setupCallerCap, @function
setupCallerCap:
.LFB810:
	.loc 31 257 0
	.cfi_startproc
.LVL2102:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 31 257 0
	movl	16(%esp), %ebx
	.loc 31 261 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	pushl	$5
	.cfi_def_cfa_offset 28
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	setThreadState
.LVL2103:
	.loc 31 262 0
	movl	%ebx, %eax
.LBB9493:
.LBB9494:
	.loc 11 2202 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.LBE9494:
.LBE9493:
	.loc 31 262 0
	andl	$-1024, %eax
	leal	32(%eax), %edx
.LVL2104:
	.loc 31 263 0
	movl	32(%eax), %eax
.LVL2105:
.LBB9496:
.LBB9495:
	.loc 11 2202 0
	movl	%eax, %edi
	.loc 11 2203 0
	movl	%eax, %esi
	movzbl	%al, %ecx
	.loc 11 2202 0
	andl	$14, %edi
	.loc 11 2203 0
	andl	$15, %esi
	cmpl	$14, %edi
	cmovne	%esi, %ecx
.LVL2106:
.LBE9495:
.LBE9496:
	.loc 31 265 0
	cmpl	$8, %ecx
	jne	.L2025
.LVL2107:
.LBB9497:
.LBB9498:
	.loc 11 2636 0
	cmpl	$8, %esi
	jne	.L2026
.LVL2108:
.LBE9498:
.LBE9497:
	.loc 31 266 0
	testb	$16, %al
	je	.L2027
	.loc 31 267 0
	andl	$-32, %eax
.LVL2109:
	cmpl	%eax, %ebx
	jne	.L2028
	.loc 31 268 0
	movl	20(%esp), %eax
	andl	$-1024, %eax
	leal	48(%eax), %ecx
.LVL2110:
	.loc 31 269 0
	movl	48(%eax), %eax
.LVL2111:
.LBB9500:
.LBB9501:
	.loc 11 2202 0
	movl	%eax, %edi
	.loc 11 2203 0
	movl	%eax, %esi
	movzbl	%al, %eax
.LVL2112:
	.loc 11 2202 0
	andl	$14, %edi
	.loc 11 2203 0
	andl	$15, %esi
.LVL2113:
	cmpl	$14, %edi
	cmovne	%esi, %eax
.LVL2114:
.LBE9501:
.LBE9500:
	.loc 31 271 0
	testl	%eax, %eax
	jne	.L2029
.LVL2115:
.LBB9502:
.LBB9503:
	.loc 11 2602 0
	orl	$8, %ebx
	xorl	%edi, %edi
.LVL2116:
.LBE9503:
.LBE9502:
	.loc 31 272 0
	pushl	%ecx
	.cfi_def_cfa_offset 20
	pushl	%edx
	.cfi_def_cfa_offset 24
	pushl	%edi
	.cfi_def_cfa_offset 28
.LVL2117:
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	cteInsert
.LVL2118:
	.loc 31 274 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2119:
.L2025:
	.cfi_restore_state
	.loc 31 265 0 discriminator 1
	pushl	$__FUNCTION__.9312
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$265
	.cfi_def_cfa_offset 24
	pushl	$.LC164
	.cfi_def_cfa_offset 28
	pushl	$.LC423
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2120:
.L2029:
	.cfi_restore_state
	.loc 31 271 0 discriminator 1
	pushl	$__FUNCTION__.9312
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$271
	.cfi_def_cfa_offset 24
.LVL2121:
	pushl	$.LC164
	.cfi_def_cfa_offset 28
	pushl	$.LC426
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2122:
.L2028:
	.cfi_restore_state
	.loc 31 267 0 discriminator 1
	pushl	$__FUNCTION__.9312
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$267
	.cfi_def_cfa_offset 24
.LVL2123:
	pushl	$.LC164
	.cfi_def_cfa_offset 28
	pushl	$.LC425
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2124:
.L2027:
	.cfi_restore_state
	.loc 31 266 0 discriminator 1
	pushl	$__FUNCTION__.9312
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$266
	.cfi_def_cfa_offset 24
	pushl	$.LC164
	.cfi_def_cfa_offset 28
	pushl	$.LC424
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2125:
.L2026:
	.cfi_restore_state
.LBB9504:
.LBB9499:
	call	cap_reply_cap_get_capReplyMaster.isra.92.part.93
.LVL2126:
.LBE9499:
.LBE9504:
	.cfi_endproc
.LFE810:
	.size	setupCallerCap, .-setupCallerCap
	.section	.text.unlikely
.LCOLDE428:
	.text
.LHOTE428:
	.section	.rodata.str1.1
.LC429:
	.string	"mcp <= seL4_MaxPrio"
	.section	.text.unlikely
.LCOLDB430:
.LHOTB430:
	.type	checkPrio.part.273, @function
checkPrio.part.273:
.LFB1168:
	.loc 31 34 0
	.cfi_startproc
.LVL2127:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 31 41 0
	pushl	$__FUNCTION__.9246
	.cfi_def_cfa_offset 20
	pushl	$41
	.cfi_def_cfa_offset 24
	pushl	$.LC164
	.cfi_def_cfa_offset 28
	pushl	$.LC429
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2128:
	.cfi_endproc
.LFE1168:
	.size	checkPrio.part.273, .-checkPrio.part.273
.LCOLDE430:
.LHOTE430:
.LCOLDB431:
.LHOTB431:
	.type	cap_untyped_cap_get_capFreeIndex.part.274, @function
cap_untyped_cap_get_capFreeIndex.part.274:
.LFB1169:
	.loc 11 2251 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2253 0
	pushl	$__FUNCTION__.2261
	.cfi_def_cfa_offset 20
	pushl	$2254
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC208
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2129:
	.cfi_endproc
.LFE1169:
	.size	cap_untyped_cap_get_capFreeIndex.part.274, .-cap_untyped_cap_get_capFreeIndex.part.274
.LCOLDE431:
.LHOTE431:
.LCOLDB432:
.LHOTB432:
	.type	cap_untyped_cap_set_capFreeIndex.part.275, @function
cap_untyped_cap_set_capFreeIndex.part.275:
.LFB1170:
	.loc 11 2265 0
	.cfi_startproc
.LVL2130:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 11 2266 0
	pushl	$__FUNCTION__.2266
	.cfi_def_cfa_offset 20
	pushl	$2267
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC208
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2131:
	.cfi_endproc
.LFE1170:
	.size	cap_untyped_cap_set_capFreeIndex.part.275, .-cap_untyped_cap_set_capFreeIndex.part.275
.LCOLDE432:
.LHOTE432:
	.section	.rodata.str1.1
.LC433:
	.string	"irq <= maxIRQ"
	.section	.text.unlikely
.LCOLDB434:
.LHOTB434:
	.type	maskInterrupt.part.281, @function
maskInterrupt.part.281:
.LFB1176:
	.loc 49 122 0
	.cfi_startproc
.LVL2132:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
.LBB9505:
.LBB9506:
.LBB9507:
.LBB9508:
	.loc 49 117 0
	pushl	$__FUNCTION__.4682
	.cfi_def_cfa_offset 20
	pushl	$117
	.cfi_def_cfa_offset 24
	pushl	$.LC172
	.cfi_def_cfa_offset 28
	pushl	$.LC433
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2133:
.LBE9508:
.LBE9507:
.LBE9506:
.LBE9505:
	.cfi_endproc
.LFE1176:
	.size	maskInterrupt.part.281, .-maskInterrupt.part.281
.LCOLDE434:
.LHOTE434:
	.section	.rodata.str1.4
	.align 4
.LC435:
	.string	"cap_get_capType(vspaceCapSlot->cap) == cap_page_directory_cap"
	.align 4
.LC436:
	.string	"((cap_ptr->words[0] >> 0) & 0xf) == cap_page_directory_cap"
	.align 4
.LC437:
	.string	"(((~0x3ffcu >> 2) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB438:
	.text
.LHOTB438:
	.p2align 4,,15
	.globl	performASIDPoolInvocation
	.type	performASIDPoolInvocation, @function
performASIDPoolInvocation:
.LFB478:
	.loc 17 207 0
	.cfi_startproc
.LVL2134:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 17 207 0
	movl	24(%esp), %ebx
	movl	16(%esp), %ecx
	movl	(%ebx), %eax
.LVL2135:
.LBB9527:
.LBB9528:
	.loc 11 2202 0
	movl	%eax, %edi
	.loc 11 2203 0
	movl	%eax, %esi
	movzbl	%al, %edx
	.loc 11 2202 0
	andl	$14, %edi
	.loc 11 2203 0
	andl	$15, %esi
	cmpl	$14, %edi
	cmovne	%esi, %edx
.LVL2136:
.LBE9528:
.LBE9527:
	.loc 17 217 0
	cmpl	$5, %edx
	jne	.L2045
.LVL2137:
.LBB9529:
.LBB9530:
	.loc 11 3200 0
	cmpl	$5, %esi
	jne	.L2046
	.loc 11 3204 0
	testl	$1073737728, %ecx
	jne	.L2047
.LVL2138:
.LBE9530:
.LBE9529:
.LBB9532:
.LBB9533:
	.loc 11 3180 0
	movl	4(%ebx), %esi
	leal	0(,%ecx,4), %edx
.LBE9533:
.LBE9532:
	.loc 17 222 0
	andl	$16777200, %eax
	andl	$1023, %ecx
.LBB9536:
.LBB9534:
	.loc 11 3180 0
	andl	$16380, %edx
.LBE9534:
.LBE9536:
	.loc 17 222 0
	sall	$8, %eax
	orl	$1, %eax
.LBB9537:
.LBB9535:
	.loc 11 3180 0
	andl	$-32765, %esi
	orl	%esi, %edx
	orb	$64, %dh
	movl	%edx, 4(%ebx)
.LVL2139:
.LBE9535:
.LBE9537:
	.loc 17 222 0
	movl	20(%esp), %edx
	movl	%eax, (%edx,%ecx,4)
.LVL2140:
	.loc 17 225 0
	xorl	%eax, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2141:
.L2045:
	.cfi_restore_state
.LBB9538:
.LBB9539:
	.loc 17 217 0
	pushl	$__FUNCTION__.6367
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$217
	.cfi_def_cfa_offset 24
	pushl	$.LC127
	.cfi_def_cfa_offset 28
	pushl	$.LC435
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2142:
.L2047:
	.cfi_restore_state
.LBE9539:
.LBE9538:
.LBB9540:
.LBB9531:
	.loc 11 3204 0
	pushl	$__FUNCTION__.2616
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$3204
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC437
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2143:
.L2046:
	.cfi_restore_state
	.loc 11 3200 0
	pushl	$__FUNCTION__.2616
	.cfi_def_cfa_offset 20
	pushl	$3201
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC436
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2144:
.LBE9531:
.LBE9540:
	.cfi_endproc
.LFE478:
	.size	performASIDPoolInvocation, .-performASIDPoolInvocation
	.section	.text.unlikely
.LCOLDE438:
	.text
.LHOTE438:
	.section	.text.unlikely
.LCOLDB439:
	.text
.LHOTB439:
	.p2align 4,,15
	.globl	makeUserPDELargePage
	.type	makeUserPDELargePage, @function
makeUserPDELargePage:
.LFB456:
	.loc 16 530 0
	.cfi_startproc
.LVL2145:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
.LVL2146:
	.loc 16 530 0
	movl	28(%esp), %eax
.LBB9553:
.LBB9554:
	.loc 20 590 0
	cmpl	$2, %eax
	je	.L2054
	cmpl	$3, %eax
	je	.L2051
	cmpl	$1, %eax
	je	.L2051
	call	WritableFromVMRights.part.62
.LVL2147:
	.p2align 4,,10
	.p2align 3
.L2051:
.LBE9554:
.LBE9553:
.LBB9558:
.LBB9559:
	.loc 20 605 0
	subl	$2, %eax
.LVL2148:
	cmpl	$1, %eax
	jbe	.L2066
.LBE9559:
.LBE9558:
.LBB9562:
.LBB9555:
	.loc 20 596 0
	movl	$1, %ebx
.LBE9555:
.LBE9562:
.LBB9563:
.LBB9560:
	.loc 20 607 0
	xorl	%esi, %esi
	jmp	.L2052
.LVL2149:
	.p2align 4,,10
	.p2align 3
.L2054:
.LBE9560:
.LBE9563:
.LBB9564:
.LBB9556:
	.loc 20 592 0
	xorl	%ebx, %ebx
.LVL2150:
.L2050:
.LBE9556:
.LBE9564:
.LBB9565:
.LBB9561:
	.loc 20 611 0
	movl	$1, %esi
.L2052:
.LVL2151:
.LBE9561:
.LBE9565:
.LBB9566:
.LBB9567:
	.loc 11 842 0
	movl	24(%esp), %edx
.LBE9567:
.LBE9566:
.LBB9570:
.LBB9571:
	.loc 11 831 0
	movl	24(%esp), %ecx
.LBE9571:
.LBE9570:
.LBB9574:
.LBB9568:
	.loc 11 842 0
	andl	$2, %edx
.LBE9568:
.LBE9574:
.LBB9575:
.LBB9572:
	.loc 11 831 0
	andl	$4, %ecx
.LBE9572:
.LBE9575:
.LBB9576:
.LBB9569:
	.loc 11 842 0
	shrl	%edx
.LVL2152:
.LBE9569:
.LBE9576:
.LBB9577:
.LBB9573:
	.loc 11 831 0
	shrl	$2, %ecx
.LVL2153:
.LBE9573:
.LBE9577:
.LBB9578:
.LBB9579:
	.loc 11 2044 0
	testl	$2097151, 20(%esp)
	jne	.L2067
.LVL2154:
	.loc 11 2071 0
	movl	24(%esp), %eax
	sall	$12, %ecx
.LVL2155:
	movl	20(%esp), %edi
	sall	$4, %edx
.LVL2156:
	sall	$2, %esi
	andl	$1, %eax
.LVL2157:
	sall	$3, %eax
.LVL2158:
	andl	$-2097152, %edi
	orb	$-127, %al
	orl	%edi, %eax
	leal	(%ebx,%ebx), %edi
	orl	%ecx, %eax
	orl	%edx, %eax
	orl	%esi, %eax
	orl	%edi, %eax
	movl	%eax, %ebx
	movl	16(%esp), %eax
	movl	%ebx, (%eax)
.LVL2159:
.LBE9579:
.LBE9578:
	.loc 16 544 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL2160:
.L2066:
	.cfi_restore_state
.LBB9581:
.LBB9557:
	.loc 20 596 0
	movl	$1, %ebx
	jmp	.L2050
.LVL2161:
.L2067:
.LBE9557:
.LBE9581:
.LBB9582:
.LBB9580:
	call	pde_pde_large_new.part.108
.LVL2162:
.LBE9580:
.LBE9582:
	.cfi_endproc
.LFE456:
	.size	makeUserPDELargePage, .-makeUserPDELargePage
	.section	.text.unlikely
.LCOLDE439:
	.text
.LHOTE439:
	.section	.rodata.str1.4
	.align 4
.LC440:
	.string	"(offset_high & ~0xffffu) == ((0 && (offset_high & (1u << 31))) ? 0x0 : 0)"
	.align 4
.LC441:
	.string	"(dpl & ~0x3u) == ((0 && (dpl & (1u << 31))) ? 0x0 : 0)"
	.align 4
.LC442:
	.string	"(offset_low & ~0xffffu) == ((0 && (offset_low & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB443:
	.text
.LHOTB443:
	.p2align 4,,15
	.type	idt_entry_interrupt_gate_new.constprop.322, @function
idt_entry_interrupt_gate_new.constprop.322:
.LFB1206:
	.loc 11 1367 0
	.cfi_startproc
.LVL2163:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 11 1367 0
	movl	16(%esp), %ebx
	.loc 11 1371 0
	testl	$-65536, %edx
	jne	.L2073
	.loc 11 1373 0
	testl	$-4, %ecx
	jne	.L2074
	.loc 11 1377 0
	testl	$-65536, %ebx
	jne	.L2075
.LVL2164:
	.loc 11 1389 0
	sall	$13, %ecx
.LVL2165:
	sall	$16, %edx
.LVL2166:
	orl	$524288, %ebx
.LVL2167:
	orb	$142, %ch
	movl	%ebx, (%eax)
	orl	%ecx, %edx
	movl	%edx, 4(%eax)
.LVL2168:
	.loc 11 1390 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL2169:
.L2073:
	.cfi_restore_state
	.loc 11 1371 0
	pushl	$__FUNCTION__.1897
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$1371
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC440
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2170:
.L2075:
	.cfi_restore_state
	.loc 11 1377 0
	pushl	$__FUNCTION__.1897
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$1377
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC442
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2171:
.L2074:
	.cfi_restore_state
	.loc 11 1373 0
	pushl	$__FUNCTION__.1897
	.cfi_def_cfa_offset 20
	pushl	$1373
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC441
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2172:
	.cfi_endproc
.LFE1206:
	.size	idt_entry_interrupt_gate_new.constprop.322, .-idt_entry_interrupt_gate_new.constprop.322
	.section	.text.unlikely
.LCOLDE443:
	.text
.LHOTE443:
	.section	.boot.text
.LCOLDB444:
.LHOTB444:
	.p2align 4,,15
	.globl	init_tss
	.type	init_tss, @function
init_tss:
.LFB444:
	.loc 16 32 0
	.cfi_startproc
.LVL2173:
	.loc 16 32 0
	movl	4(%esp), %eax
	.loc 16 33 0
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	$16, 8(%eax)
	movl	$0, 12(%eax)
	movl	$0, 16(%eax)
	movl	$0, 20(%eax)
	movl	$0, 24(%eax)
	movl	$0, 28(%eax)
	movl	$0, 32(%eax)
	movl	$0, 36(%eax)
	movl	$0, 40(%eax)
	movl	$0, 44(%eax)
	movl	$0, 48(%eax)
	movl	$0, 52(%eax)
	movl	$0, 56(%eax)
	movl	$0, 60(%eax)
	movl	$0, 64(%eax)
	movl	$0, 68(%eax)
	movl	$0, 72(%eax)
	movl	$0, 76(%eax)
	movl	$0, 80(%eax)
	movl	$0, 84(%eax)
	movl	$0, 88(%eax)
	movl	$0, 92(%eax)
	movl	$0, 96(%eax)
	movl	$6815744, 100(%eax)
.LVL2174:
	movl	$x86KStss+104, %eax
.LVL2175:
	.p2align 4,,10
	.p2align 3
.L2077:
.LBB9587:
.LBB9588:
	.file 66 "/home/axjllt/Desktop/ori_refos/kernel/src/util.c"
	.loc 66 62 0
	movb	$-1, (%eax)
.LVL2176:
	.loc 66 61 0
	addl	$1, %eax
.LVL2177:
	cmpl	$x86KStss+8300, %eax
	jne	.L2077
.LBE9588:
.LBE9587:
	.loc 16 63 0
	ret
	.cfi_endproc
.LFE444:
	.size	init_tss, .-init_tss
.LCOLDE444:
.LHOTE444:
	.section	.rodata.str1.4
	.align 4
.LC445:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/kernel/xapic.c"
	.align 4
.LC446:
	.string	"IS_ALIGNED(startup_addr, PAGE_BITS)"
	.section	.rodata.str1.1
.LC447:
	.string	"startup_addr < 0xa0000"
	.section	.boot.text
.LCOLDB448:
.LHOTB448:
	.p2align 4,,15
	.globl	apic_send_startup_ipi
	.type	apic_send_startup_ipi, @function
apic_send_startup_ipi:
.LFB565:
	.loc 21 106 0
	.cfi_startproc
.LVL2178:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 21 106 0
	movl	20(%esp), %eax
	movl	16(%esp), %edx
	.loc 21 108 0
	testl	$4095, %eax
	jne	.L2084
	.loc 21 110 0
	cmpl	$655359, %eax
	ja	.L2085
.LVL2179:
.LBB9598:
.LBB9599:
	.loc 11 225 0
	shrl	$12, %eax
.LVL2180:
	orb	$6, %ah
.LVL2181:
.LBE9599:
.LBE9598:
.LBB9600:
.LBB9601:
	.loc 11 251 0
	testl	$-256, %edx
	jne	.L2086
	.loc 11 254 0
	sall	$24, %edx
.LVL2182:
.LBE9601:
.LBE9600:
.LBB9603:
.LBB9604:
.LBB9605:
	.loc 19 59 0
	movl	%edx, -64752
.LVL2183:
.LBE9605:
.LBE9604:
.LBB9606:
.LBB9607:
	movl	%eax, -64768
.LVL2184:
.LBE9607:
.LBE9606:
.LBE9603:
	.loc 21 127 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL2185:
.L2084:
	.cfi_restore_state
	.loc 21 108 0 discriminator 1
	pushl	$__FUNCTION__.7306
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$108
	.cfi_def_cfa_offset 24
	pushl	$.LC445
	.cfi_def_cfa_offset 28
	pushl	$.LC446
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2186:
.L2086:
	.cfi_restore_state
.LBB9608:
.LBB9602:
	call	apic_icr2_new.part.70
.LVL2187:
.L2085:
.LBE9602:
.LBE9608:
	.loc 21 110 0 discriminator 1
	pushl	$__FUNCTION__.7306
	.cfi_def_cfa_offset 20
	pushl	$110
	.cfi_def_cfa_offset 24
	pushl	$.LC445
	.cfi_def_cfa_offset 28
	pushl	$.LC447
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2188:
	.cfi_endproc
.LFE565:
	.size	apic_send_startup_ipi, .-apic_send_startup_ipi
.LCOLDE448:
.LHOTE448:
	.section	.rodata.str1.1
.LC449:
	.string	"Invalid VM fault type"
	.section	.text.unlikely
.LCOLDB450:
	.text
.LHOTB450:
	.p2align 4,,15
	.globl	handleVMFault
	.type	handleVMFault, @function
handleVMFault:
.LFB542:
	.loc 20 567 0
	.cfi_startproc
.LVL2189:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 20 567 0
	movl	20(%esp), %edx
.LBB9625:
.LBB9626:
.LBB9627:
	.loc 7 41 0
#APP
# 41 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine/cpu_registers.h" 1
	movl %cr2, %ecx
# 0 "" 2
.LVL2190:
#NO_APP
.LBE9627:
.LBE9626:
.LBE9625:
.LBB9628:
.LBB9629:
	.loc 15 36 0
	movl	16(%esp), %eax
	movl	564(%eax), %eax
.LVL2191:
.LBE9629:
.LBE9628:
	.loc 20 574 0
	testl	%edx, %edx
	je	.L2089
	cmpl	$1, %edx
	jne	.L2097
.LVL2192:
.LBB9630:
.LBB9631:
	.loc 11 1732 0
	testl	$-32, %eax
	jne	.L2093
.LVL2193:
.LBE9631:
.LBE9630:
	.loc 20 580 0
	sall	$27, %eax
	movl	%ecx, current_fault+4
	orl	$524293, %eax
	movl	%eax, current_fault
	.loc 20 586 0
	movl	$1, %eax
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L2097:
	.cfi_restore_state
.LVL2194:
.LBB9632:
.LBB9633:
	.loc 20 584 0
	pushl	$__func__.7059
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$584
	.cfi_def_cfa_offset 24
	pushl	$.LC138
	.cfi_def_cfa_offset 28
	pushl	$.LC449
	.cfi_def_cfa_offset 32
	call	_fail
.LVL2195:
	.p2align 4,,10
	.p2align 3
.L2089:
	.cfi_restore_state
.LBE9633:
.LBE9632:
.LBB9634:
.LBB9635:
	.loc 11 1732 0
	testl	$-32, %eax
	jne	.L2093
.LVL2196:
.LBE9635:
.LBE9634:
	.loc 20 576 0
	sall	$27, %eax
	movl	%ecx, current_fault+4
	orl	$5, %eax
	movl	%eax, current_fault
	.loc 20 586 0
	movl	$1, %eax
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.L2093:
	.cfi_restore_state
.LBB9637:
.LBB9636:
	call	seL4_Fault_VMFault_new.part.176
.LVL2197:
.LBE9636:
.LBE9637:
	.cfi_endproc
.LFE542:
	.size	handleVMFault, .-handleVMFault
	.section	.text.unlikely
.LCOLDE450:
	.text
.LHOTE450:
	.section	.text.unlikely
.LCOLDB451:
	.text
.LHOTB451:
	.p2align 4,,15
	.globl	lookupSlotForCNodeOp
	.type	lookupSlotForCNodeOp, @function
lookupSlotForCNodeOp:
.LFB670:
	.loc 62 75 0
	.cfi_startproc
.LVL2198:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 62 75 0
	movl	56(%esp), %ecx
.LVL2199:
	movl	48(%esp), %esi
.LVL2200:
	movl	60(%esp), %ebx
.LVL2201:
	movl	68(%esp), %eax
.LBB9642:
.LBB9643:
	.loc 11 2202 0
	movl	%ecx, %ebp
	.loc 11 2203 0
	movl	%ecx, %edi
	movzbl	%cl, %edx
	.loc 11 2202 0
	andl	$14, %ebp
	.loc 11 2203 0
	andl	$15, %edi
	cmpl	$14, %ebp
	cmovne	%edi, %edx
.LVL2202:
.LBE9643:
.LBE9642:
	.loc 62 81 0
	cmpl	$10, %edx
	jne	.L2108
	.loc 62 89 0
	leal	-1(%eax), %edx
	cmpl	$31, %edx
	ja	.L2109
	.loc 62 96 0
	leal	4(%esp), %edx
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	%eax
	.cfi_def_cfa_offset 64
	pushl	80(%esp)
	.cfi_def_cfa_offset 68
	pushl	%ebx
	.cfi_def_cfa_offset 72
	pushl	%ecx
	.cfi_def_cfa_offset 76
	pushl	%edx
	.cfi_def_cfa_offset 80
	call	resolveAddressBits
	.cfi_def_cfa_offset 76
.LVL2203:
	movl	40(%esp), %eax
.LVL2204:
	.loc 62 97 0
	addl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	4(%esp), %edx
	testl	%edx, %edx
	jne	.L2110
	.loc 62 105 0
	testl	%eax, %eax
	jne	.L2111
.LVL2205:
	.loc 62 116 0
	movl	8(%esp), %eax
.LVL2206:
	movl	$0, (%esi)
	movl	%eax, 4(%esi)
.LVL2207:
.L2098:
	.loc 62 117 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%esi, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL2208:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret	$4
.LVL2209:
	.p2align 4,,10
	.p2align 3
.L2108:
	.cfi_restore_state
	.loc 62 83 0
	movl	52(%esp), %eax
	.loc 62 86 0
	movl	$3, (%esi)
	movl	$0, 4(%esi)
	.loc 62 82 0
	movl	$6, current_syscall_error+24
	.loc 62 84 0
	movl	$0, current_lookup_fault
	.loc 62 83 0
	movl	%eax, current_syscall_error+20
.LVL2210:
	.loc 62 117 0
	movl	%esi, %eax
	.loc 62 84 0
	movl	$0, current_lookup_fault+4
.LVL2211:
	.loc 62 117 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL2212:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret	$4
.LVL2213:
	.p2align 4,,10
	.p2align 3
.L2109:
	.cfi_restore_state
	.loc 62 90 0
	movl	$4, current_syscall_error+24
	.loc 62 91 0
	movl	$1, current_syscall_error+8
	.loc 62 92 0
	movl	$32, current_syscall_error+12
.LVL2214:
	.loc 62 94 0
	movl	$3, (%esi)
	movl	$0, 4(%esi)
	jmp	.L2098
.LVL2215:
	.p2align 4,,10
	.p2align 3
.L2110:
	.loc 62 99 0
	movl	52(%esp), %eax
.LVL2216:
	.loc 62 102 0
	movl	$3, (%esi)
	.loc 62 98 0
	movl	$6, current_syscall_error+24
	.loc 62 102 0
	movl	$0, 4(%esi)
	.loc 62 99 0
	movl	%eax, current_syscall_error+20
.LVL2217:
	.loc 62 102 0
	jmp	.L2098
.LVL2218:
	.p2align 4,,10
	.p2align 3
.L2111:
	.loc 62 106 0
	movl	$6, current_syscall_error+24
	.loc 62 107 0
	movl	52(%esp), %ebx
	movl	%ebx, current_syscall_error+20
.LVL2219:
.LBB9644:
.LBB9645:
	.loc 11 1195 0
	testl	$-64, %eax
	jne	.L2112
.LVL2220:
.LBE9645:
.LBE9644:
	.loc 62 108 0
	leal	2(,%eax,4), %eax
.LVL2221:
	.loc 62 111 0
	movl	$3, (%esi)
	.loc 62 108 0
	movl	%eax, current_lookup_fault
	movl	$0, current_lookup_fault+4
.LVL2222:
	.loc 62 111 0
	movl	$0, 4(%esi)
	jmp	.L2098
.LVL2223:
.L2112:
.LBB9647:
.LBB9646:
	.loc 11 1195 0
	pushl	$__FUNCTION__.1822
	.cfi_def_cfa_offset 52
	pushl	$1195
	.cfi_def_cfa_offset 56
	pushl	$.LC154
	.cfi_def_cfa_offset 60
	pushl	$.LC187
	.cfi_def_cfa_offset 64
	call	_assert_fail
.LVL2224:
.LBE9646:
.LBE9647:
	.cfi_endproc
.LFE670:
	.size	lookupSlotForCNodeOp, .-lookupSlotForCNodeOp
	.section	.text.unlikely
.LCOLDE451:
	.text
.LHOTE451:
	.section	.text.unlikely
.LCOLDB452:
	.text
.LHOTB452:
	.p2align 4,,15
	.globl	lookupTargetSlot
	.type	lookupTargetSlot, @function
lookupTargetSlot:
.LFB672:
	.loc 62 127 0
	.cfi_startproc
.LVL2225:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$16, %esp
	.cfi_def_cfa_offset 24
	.loc 62 127 0
	movl	24(%esp), %ebx
	.loc 62 128 0
	pushl	40(%esp)
	.cfi_def_cfa_offset 28
	pushl	40(%esp)
	.cfi_def_cfa_offset 32
	pushl	40(%esp)
	.cfi_def_cfa_offset 36
	pushl	40(%esp)
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	%ebx
	.cfi_def_cfa_offset 48
	call	lookupSlotForCNodeOp
	.cfi_def_cfa_offset 44
.LVL2226:
	.loc 62 129 0
	movl	%ebx, %eax
	addl	$36, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret	$4
	.cfi_endproc
.LFE672:
	.size	lookupTargetSlot, .-lookupTargetSlot
	.section	.text.unlikely
.LCOLDE452:
	.text
.LHOTE452:
	.section	.text.unlikely
.LCOLDB453:
	.text
.LHOTB453:
	.p2align 4,,15
	.globl	getReceiveSlots
	.type	getReceiveSlots, @function
getReceiveSlots:
.LFB750:
	.loc 33 937 0
	.cfi_startproc
.LVL2227:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$36, %esp
	.cfi_def_cfa_offset 48
	.loc 33 937 0
	movl	52(%esp), %eax
	.loc 33 945 0
	testl	%eax, %eax
	je	.L2118
.LVL2228:
	.loc 33 952 0
	leal	20(%esp), %edx
	subl	$4, %esp
	.cfi_def_cfa_offset 52
.LBB9648:
.LBB9649:
.LBB9650:
.LBB9651:
	.loc 34 66 0
	movl	504(%eax), %ebx
.LVL2229:
	.loc 34 67 0
	movl	508(%eax), %esi
.LVL2230:
.LBE9651:
.LBE9650:
.LBE9649:
.LBE9648:
	.loc 33 952 0
	pushl	500(%eax)
	.cfi_def_cfa_offset 56
.LVL2231:
	pushl	56(%esp)
	.cfi_def_cfa_offset 60
.LVL2232:
	pushl	%edx
	.cfi_def_cfa_offset 64
	call	lookupCap
	.cfi_def_cfa_offset 60
.LVL2233:
	.loc 33 953 0
	addl	$12, %esp
	.cfi_def_cfa_offset 48
	movl	20(%esp), %ecx
	testl	%ecx, %ecx
	jne	.L2118
.LVL2234:
.LBB9652:
.LBB9653:
	.loc 62 128 0
	leal	8(%esp), %eax
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	%esi
	.cfi_def_cfa_offset 60
	pushl	%ebx
	.cfi_def_cfa_offset 64
	pushl	44(%esp)
	.cfi_def_cfa_offset 68
	pushl	44(%esp)
	.cfi_def_cfa_offset 72
	pushl	$0
	.cfi_def_cfa_offset 76
	pushl	%eax
	.cfi_def_cfa_offset 80
	call	lookupSlotForCNodeOp
	.cfi_def_cfa_offset 76
.LVL2235:
	movl	40(%esp), %eax
.LVL2236:
.LBE9653:
.LBE9652:
	.loc 33 959 0
	addl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	8(%esp), %edx
	testl	%edx, %edx
	jne	.L2118
.LVL2237:
	movl	(%eax), %edx
.LVL2238:
.LBB9654:
.LBB9655:
	.loc 11 2202 0
	movl	%edx, %ebx
.LVL2239:
	.loc 11 2203 0
	movl	%edx, %ecx
	movzbl	%dl, %edx
.LVL2240:
	.loc 11 2202 0
	andl	$14, %ebx
	.loc 11 2203 0
	andl	$15, %ecx
.LVL2241:
	cmpl	$14, %ebx
	cmovne	%ecx, %edx
.LVL2242:
.LBE9655:
.LBE9654:
	.loc 33 964 0
	testl	%edx, %edx
	jne	.L2118
	.loc 33 969 0
	addl	$36, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL2243:
	ret
.LVL2244:
	.p2align 4,,10
	.p2align 3
.L2118:
	.cfi_restore_state
	addl	$36, %esp
	.cfi_def_cfa_offset 12
	.loc 33 946 0
	xorl	%eax, %eax
	.loc 33 969 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE750:
	.size	getReceiveSlots, .-getReceiveSlots
	.section	.text.unlikely
.LCOLDE453:
	.text
.LHOTE453:
	.section	.text.unlikely
.LCOLDB454:
	.text
.LHOTB454:
	.p2align 4,,15
	.globl	lookupPivotSlot
	.type	lookupPivotSlot, @function
lookupPivotSlot:
.LFB673:
	.loc 62 133 0
	.cfi_startproc
.LVL2245:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$16, %esp
	.cfi_def_cfa_offset 24
	.loc 62 133 0
	movl	24(%esp), %ebx
	.loc 62 134 0
	pushl	40(%esp)
	.cfi_def_cfa_offset 28
	pushl	40(%esp)
	.cfi_def_cfa_offset 32
	pushl	40(%esp)
	.cfi_def_cfa_offset 36
	pushl	40(%esp)
	.cfi_def_cfa_offset 40
	pushl	$1
	.cfi_def_cfa_offset 44
	pushl	%ebx
	.cfi_def_cfa_offset 48
	call	lookupSlotForCNodeOp
	.cfi_def_cfa_offset 44
.LVL2246:
	.loc 62 135 0
	movl	%ebx, %eax
	addl	$36, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret	$4
	.cfi_endproc
.LFE673:
	.size	lookupPivotSlot, .-lookupPivotSlot
	.section	.text.unlikely
.LCOLDE454:
	.text
.LHOTE454:
	.section	.text.unlikely
.LCOLDB455:
	.text
.LHOTB455:
	.p2align 4,,15
	.globl	lookupSourceSlot
	.type	lookupSourceSlot, @function
lookupSourceSlot:
.LFB1194:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$20, %esp
	.cfi_def_cfa_offset 28
	movl	28(%esp), %ebx
	pushl	44(%esp)
	.cfi_def_cfa_offset 32
	pushl	44(%esp)
	.cfi_def_cfa_offset 36
	pushl	44(%esp)
	.cfi_def_cfa_offset 40
	pushl	44(%esp)
	.cfi_def_cfa_offset 44
	pushl	%ebx
	.cfi_def_cfa_offset 48
	call	lookupPivotSlot
	.cfi_def_cfa_offset 44
	movl	%ebx, %eax
	addl	$36, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret	$4
	.cfi_endproc
.LFE1194:
	.size	lookupSourceSlot, .-lookupSourceSlot
	.section	.text.unlikely
.LCOLDE455:
	.text
.LHOTE455:
	.section	.boot.text
.LCOLDB456:
.LHOTB456:
	.p2align 4,,15
	.globl	write_slot
	.type	write_slot, @function
write_slot:
.LFB648:
	.loc 30 121 0
	.cfi_startproc
.LVL2247:
	.loc 30 121 0
	movl	4(%esp), %eax
	.loc 30 122 0
	movl	8(%esp), %edx
	movl	12(%esp), %ecx
	.loc 30 124 0
	movl	$0, 8(%eax)
	.loc 30 122 0
	movl	%edx, (%eax)
	movl	%ecx, 4(%eax)
.LVL2248:
.LBB9662:
.LBB9663:
	.loc 11 733 0
	movl	$3, 12(%eax)
.LVL2249:
	ret
.LBE9663:
.LBE9662:
	.cfi_endproc
.LFE648:
	.size	write_slot, .-write_slot
.LCOLDE456:
.LHOTE456:
.LCOLDB457:
.LHOTB457:
	.p2align 4,,15
	.globl	create_domain_cap
	.type	create_domain_cap, @function
create_domain_cap:
.LFB651:
	.loc 30 191 0
	.cfi_startproc
.LVL2250:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 30 191 0
	movl	16(%esp), %eax
.LVL2251:
	movl	20(%esp), %edx
.LVL2252:
.LBB9708:
.LBB9709:
.LBB9710:
.LBB9711:
	.loc 11 2202 0
	movl	%eax, %ecx
	andl	$14, %ecx
	cmpl	$14, %ecx
	je	.L2128
	.loc 11 2203 0
	movl	%eax, %ecx
	andl	$15, %ecx
.LVL2253:
.LBE9711:
.LBE9710:
	.loc 54 387 0
	cmpl	$14, %ecx
	ja	.L2129
	jmp	*.L2131(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L2131:
	.long	.L2129
	.long	.L2129
	.long	.L2133
	.long	.L2129
	.long	.L2132
	.long	.L2129
	.long	.L2133
	.long	.L2129
	.long	.L2164
	.long	.L2129
	.long	.L2135
	.long	.L2129
	.long	.L2136
	.long	.L2129
	.long	.L2164
	.section	.boot.text
.LVL2254:
	.p2align 4,,10
	.p2align 3
.L2133:
	andl	$-16, %eax
.LVL2255:
	addl	$176, %eax
.L2134:
.LVL2256:
.LBE9709:
.LBE9708:
	.loc 30 203 0
	subl	$4, %esp
	.cfi_def_cfa_offset 20
.LVL2257:
	pushl	$0
	.cfi_def_cfa_offset 24
.LVL2258:
	pushl	$62
	.cfi_def_cfa_offset 28
.LVL2259:
	pushl	%eax
	.cfi_def_cfa_offset 32
.LVL2260:
	call	write_slot
.LVL2261:
	.loc 30 204 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.LVL2262:
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
.LVL2263:
	ret
.LVL2264:
	.p2align 4,,10
	.p2align 3
.L2128:
	.cfi_restore_state
.LBB9753:
.LBB9752:
.LBB9713:
.LBB9712:
	.loc 11 2204 0
	movzbl	%al, %ecx
.LVL2265:
.LBE9712:
.LBE9713:
	.loc 54 387 0
	cmpl	$62, %ecx
	ja	.L2129
	jmp	*.L2138(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L2138:
	.long	.L2129
	.long	.L2129
	.long	.L2137
	.long	.L2129
	.long	.L2139
	.long	.L2129
	.long	.L2140
	.long	.L2129
	.long	.L2164
	.long	.L2129
	.long	.L2141
	.long	.L2129
	.long	.L2142
	.long	.L2129
	.long	.L2164
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2164
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2143
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2129
	.long	.L2164
	.section	.boot.text
	.p2align 4,,10
	.p2align 3
.L2164:
.LBB9714:
.LBB9715:
	.loc 55 268 0
	movl	$176, %eax
.LVL2266:
	jmp	.L2134
.LVL2267:
	.p2align 4,,10
	.p2align 3
.L2136:
	andl	$-1024, %eax
.LVL2268:
	addl	$176, %eax
	jmp	.L2134
.LVL2269:
	.p2align 4,,10
	.p2align 3
.L2132:
	andl	$-16, %edx
.LVL2270:
	leal	176(%edx), %eax
	jmp	.L2134
.LVL2271:
	.p2align 4,,10
	.p2align 3
.L2135:
	andl	$-32, %eax
.LVL2272:
	addl	$176, %eax
	jmp	.L2134
.LVL2273:
	.p2align 4,,10
	.p2align 3
.L2129:
	cmpl	$31, %ecx
	ja	.L2148
	jmp	*.L2150(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L2150:
	.long	.L2148
	.long	.L2149
	.long	.L2148
	.long	.L2151
	.long	.L2148
	.long	.L2152
	.long	.L2148
	.long	.L2148
	.long	.L2148
	.long	.L2164
	.long	.L2148
	.long	.L2153
	.long	.L2148
	.long	.L2164
	.long	.L2148
	.long	.L2154
	.long	.L2148
	.long	.L2148
	.long	.L2148
	.long	.L2148
	.long	.L2148
	.long	.L2148
	.long	.L2148
	.long	.L2148
	.long	.L2148
	.long	.L2148
	.long	.L2148
	.long	.L2148
	.long	.L2148
	.long	.L2148
	.long	.L2148
	.long	.L2164
	.section	.boot.text
	.p2align 4,,10
	.p2align 3
.L2143:
.LVL2274:
.LBE9715:
.LBE9714:
.LBB9733:
.LBB9734:
.LBB9735:
.LBB9736:
.LBB9737:
.LBB9738:
	.loc 11 3437 0
	andl	$16128, %eax
.LVL2275:
.LBE9738:
.LBE9737:
	.loc 54 103 0
	movl	$-32, %ecx
.LBB9740:
.LBB9739:
	.loc 11 3437 0
	shrl	$8, %eax
.LVL2276:
.LBE9739:
.LBE9740:
	.loc 54 103 0
	cmpl	$32, %eax
	je	.L2160
	andl	$31, %eax
	leal	1(%eax), %ecx
	movl	$-1, %eax
	sall	%cl, %eax
	movl	%eax, %ecx
.L2160:
.LVL2277:
	andl	%ecx, %edx
.LVL2278:
	leal	176(%edx), %eax
	jmp	.L2134
.LVL2279:
	.p2align 4,,10
	.p2align 3
.L2142:
.LBE9736:
.LBE9735:
.LBE9734:
.LBE9733:
.LBB9741:
.LBB9742:
	.loc 11 2768 0
	movl	%eax, %edx
.LVL2280:
	andl	$15, %edx
	cmpl	$12, %edx
	je	.L2136
	call	cap_thread_cap_get_capTCBPtr.isra.89.part.90
.LVL2281:
	.p2align 4,,10
	.p2align 3
.L2137:
.LBE9742:
.LBE9741:
.LBB9743:
.LBB9744:
	.loc 11 2320 0
	movl	%eax, %edx
.LVL2282:
	andl	$15, %edx
	cmpl	$2, %edx
	je	.L2133
	call	cap_untyped_cap_get_capPtr.isra.115.part.116
.LVL2283:
	.p2align 4,,10
	.p2align 3
.L2139:
.LBE9744:
.LBE9743:
.LBB9745:
.LBB9746:
	.loc 11 2358 0
	andl	$15, %eax
.LVL2284:
	cmpl	$4, %eax
	je	.L2132
	call	cap_endpoint_cap_get_capEPPtr.part.117
.LVL2285:
	.p2align 4,,10
	.p2align 3
.L2140:
.LBE9746:
.LBE9745:
.LBB9747:
.LBB9748:
	.loc 11 2576 0
	movl	%eax, %edx
.LVL2286:
	andl	$15, %edx
	cmpl	$6, %edx
	je	.L2133
	call	cap_notification_cap_get_capNtfnPtr.isra.97.part.98
.LVL2287:
	.p2align 4,,10
	.p2align 3
.L2141:
.LBE9748:
.LBE9747:
.LBB9749:
.LBB9750:
	.loc 11 2738 0
	movl	%eax, %edx
.LVL2288:
	andl	$15, %edx
	cmpl	$10, %edx
	je	.L2135
	call	cap_cnode_cap_get_capCNodePtr.isra.118.part.119
.LVL2289:
	.p2align 4,,10
	.p2align 3
.L2153:
.LBE9750:
.LBE9749:
.LBB9751:
.LBB9732:
.LBB9716:
.LBB9717:
	.loc 11 3287 0
	movl	%eax, %edx
.LVL2290:
	andl	$15, %edx
	cmpl	$11, %edx
	jne	.L2177
.LVL2291:
.L2159:
	andl	$16777200, %eax
.LVL2292:
	sall	$8, %eax
	addl	$176, %eax
	jmp	.L2134
.LVL2293:
	.p2align 4,,10
	.p2align 3
.L2154:
.LBE9717:
.LBE9716:
.LBB9719:
.LBB9720:
	.loc 11 3590 0
	cmpb	$15, %al
	jne	.L2178
.LVL2294:
	andl	$268435200, %eax
.LVL2295:
	sall	$4, %eax
	addl	$176, %eax
	jmp	.L2134
.LVL2296:
	.p2align 4,,10
	.p2align 3
.L2152:
.LBE9720:
.LBE9719:
.LBB9722:
.LBB9723:
	.loc 11 3227 0
	movl	%eax, %edx
.LVL2297:
	andl	$15, %edx
	cmpl	$5, %edx
	je	.L2159
	call	cap_page_directory_cap_get_capPDBasePtr.isra.129.part.130
.LVL2298:
	.p2align 4,,10
	.p2align 3
.L2149:
.LBE9723:
.LBE9722:
.LBB9724:
.LBB9725:
	.loc 11 2996 0
	movl	%eax, %edx
.LVL2299:
	andl	$15, %edx
	cmpl	$1, %edx
	je	.L2159
	call	cap_frame_cap_get_capFBasePtr.isra.125.part.126
.LVL2300:
	.p2align 4,,10
	.p2align 3
.L2151:
.LBE9725:
.LBE9724:
.LBB9726:
.LBB9727:
	.loc 11 3123 0
	movl	%eax, %edx
.LVL2301:
	andl	$15, %edx
	cmpl	$3, %edx
	je	.L2159
	call	cap_page_table_cap_get_capPTBasePtr.isra.127.part.128
.LVL2302:
	.p2align 4,,10
	.p2align 3
.L2148:
.LBE9727:
.LBE9726:
.LBB9728:
.LBB9729:
	.loc 46 134 0
	pushl	$__func__.3040
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$134
	.cfi_def_cfa_offset 24
	pushl	$.LC145
	.cfi_def_cfa_offset 28
	pushl	$.LC226
	.cfi_def_cfa_offset 32
	call	_fail
.LVL2303:
.L2178:
	.cfi_restore_state
.LBE9729:
.LBE9728:
.LBB9730:
.LBB9721:
	call	cap_io_page_table_cap_get_capIOPTBasePtr.isra.132.part.133
.LVL2304:
.L2177:
.LBE9721:
.LBE9730:
.LBB9731:
.LBB9718:
	call	cap_asid_pool_cap_get_capASIDPool.isra.134.part.135
.LVL2305:
.LBE9718:
.LBE9731:
.LBE9732:
.LBE9751:
.LBE9752:
.LBE9753:
	.cfi_endproc
.LFE651:
	.size	create_domain_cap, .-create_domain_cap
.LCOLDE457:
.LHOTE457:
	.section	.text.unlikely
.LCOLDB458:
	.text
.LHOTB458:
	.p2align 4,,15
	.globl	setupReplyMaster
	.type	setupReplyMaster, @function
setupReplyMaster:
.LFB744:
	.loc 33 802 0
	.cfi_startproc
.LVL2306:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 33 802 0
	movl	16(%esp), %edx
	.loc 33 805 0
	movl	%edx, %ecx
	andl	$-1024, %ecx
.LVL2307:
	movl	32(%ecx), %eax
.LVL2308:
.LBB9764:
.LBB9765:
	.loc 11 2202 0
	movl	%eax, %edi
	.loc 11 2203 0
	movl	%eax, %esi
	movzbl	%al, %eax
.LVL2309:
	.loc 11 2202 0
	andl	$14, %edi
	.loc 11 2203 0
	andl	$15, %esi
.LVL2310:
	cmpl	$14, %edi
	cmovne	%esi, %eax
.LVL2311:
.LBE9765:
.LBE9764:
	.loc 33 806 0
	testl	%eax, %eax
	jne	.L2179
.LVL2312:
.LBB9766:
.LBB9767:
	.loc 11 2593 0
	testb	$31, %dl
	jne	.L2185
	leal	32(%ecx), %ebx
.LVL2313:
.LBE9767:
.LBE9766:
	.loc 33 809 0
	andl	$-32, %edx
	orl	$24, %edx
	movl	%edx, 32(%ecx)
	movl	$0, 4(%ebx)
.LVL2314:
	.loc 33 810 0
	movl	$0, 8(%ebx)
.LVL2315:
.LBB9769:
.LBB9770:
	.loc 11 733 0
	movl	$3, 12(%ebx)
.LVL2316:
.L2179:
.LBE9770:
.LBE9769:
	.loc 33 814 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2317:
.L2185:
	.cfi_restore_state
.LBB9771:
.LBB9768:
	.loc 11 2593 0
	pushl	$__FUNCTION__.2389
	.cfi_def_cfa_offset 20
	pushl	$2593
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC427
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2318:
.LBE9768:
.LBE9771:
	.cfi_endproc
.LFE744:
	.size	setupReplyMaster, .-setupReplyMaster
	.section	.text.unlikely
.LCOLDE458:
	.text
.LHOTE458:
	.section	.text.unlikely
.LCOLDB459:
	.text
.LHOTB459:
	.p2align 4,,15
	.globl	cteMove
	.type	cteMove, @function
cteMove:
.LFB732:
	.loc 33 475 0
	.cfi_startproc
.LVL2319:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 33 475 0
	movl	28(%esp), %eax
	movl	24(%esp), %ecx
	movl	(%eax), %edx
.LVL2320:
.LBB9788:
.LBB9789:
	.loc 11 2202 0
	movl	%edx, %esi
	.loc 11 2203 0
	movl	%edx, %ebx
	movzbl	%dl, %edx
.LVL2321:
	.loc 11 2202 0
	andl	$14, %esi
	.loc 11 2203 0
	andl	$15, %ebx
.LVL2322:
	cmpl	$14, %esi
	cmovne	%ebx, %edx
.LVL2323:
.LBE9789:
.LBE9788:
	.loc 33 480 0
	testl	%edx, %edx
	jne	.L2203
	.loc 33 482 0
	testl	$-8, 12(%eax)
	jne	.L2190
	.loc 33 482 0 is_stmt 0 discriminator 2
	testl	$-8, 8(%eax)
	jne	.L2190
	.loc 33 485 0 is_stmt 1
	movl	8(%ecx), %ebx
.LVL2324:
	.loc 33 486 0
	movl	16(%esp), %esi
	movl	20(%esp), %edi
	.loc 33 485 0
	movl	12(%ecx), %edx
.LVL2325:
	.loc 33 486 0
	movl	%esi, (%eax)
	movl	%edi, 4(%eax)
.LVL2326:
	.loc 33 487 0
	movl	$0, (%ecx)
	movl	$0, 4(%ecx)
	.loc 33 488 0
	movl	%ebx, 8(%eax)
	.loc 33 492 0
	andl	$-8, %ebx
.LVL2327:
	.loc 33 488 0
	movl	%edx, 12(%eax)
.LVL2328:
	.loc 33 489 0
	movl	$0, 8(%ecx)
.LVL2329:
	movl	$0, 12(%ecx)
	.loc 33 492 0
	jne	.L2204
	.loc 33 498 0
	andl	$-8, %edx
.LVL2330:
	je	.L2186
.LVL2331:
.LBB9790:
.LBB9791:
	.loc 11 759 0
	testb	$7, %al
	jne	.L2205
	andl	$-8, %eax
.LVL2332:
.L2198:
	.loc 11 761 0
	movl	8(%edx), %ecx
	andl	$7, %ecx
	orl	%ecx, %eax
	movl	%eax, 8(%edx)
.LVL2333:
.L2186:
.LBE9791:
.LBE9790:
	.loc 33 502 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2334:
	.p2align 4,,10
	.p2align 3
.L2204:
	.cfi_restore_state
.LBB9793:
.LBB9794:
	.loc 11 675 0
	testb	$7, %al
	jne	.L2206
	.loc 11 677 0
	movl	12(%ebx), %ecx
.LVL2335:
	andl	$-8, %eax
.LVL2336:
	andl	$7, %ecx
	orl	%eax, %ecx
.LBE9794:
.LBE9793:
	.loc 33 498 0
	andl	$-8, %edx
.LVL2337:
.LBB9797:
.LBB9795:
	.loc 11 677 0
	movl	%ecx, 12(%ebx)
.LBE9795:
.LBE9797:
	.loc 33 498 0
	jne	.L2198
	.loc 33 502 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL2338:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2339:
.L2190:
	.cfi_restore_state
	.loc 33 482 0 discriminator 3
	pushl	$__FUNCTION__.8694
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$483
	.cfi_def_cfa_offset 24
	pushl	$.LC381
	.cfi_def_cfa_offset 28
	pushl	$.LC383
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2340:
.L2203:
	.cfi_restore_state
	.loc 33 480 0 discriminator 1
	pushl	$__FUNCTION__.8694
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$480
	.cfi_def_cfa_offset 24
	pushl	$.LC381
	.cfi_def_cfa_offset 28
	pushl	$.LC382
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2341:
.L2205:
	.cfi_restore_state
.LBB9798:
.LBB9792:
	call	mdb_node_ptr_set_mdbPrev.isra.231.part.232
.LVL2342:
.L2206:
.LBE9792:
.LBE9798:
.LBB9799:
.LBB9796:
	call	mdb_node_ptr_set_mdbNext.isra.229.part.230
.LVL2343:
.LBE9796:
.LBE9799:
	.cfi_endproc
.LFE732:
	.size	cteMove, .-cteMove
	.section	.text.unlikely
.LCOLDE459:
	.text
.LHOTE459:
	.section	.text.unlikely
.LCOLDB460:
	.text
.LHOTB460:
	.p2align 4,,15
	.globl	invokeCNodeMove
	.type	invokeCNodeMove, @function
invokeCNodeMove:
.LFB727:
	.loc 33 346 0
	.cfi_startproc
.LVL2344:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 33 347 0
	pushl	28(%esp)
	.cfi_def_cfa_offset 20
	pushl	28(%esp)
	.cfi_def_cfa_offset 24
	pushl	28(%esp)
	.cfi_def_cfa_offset 28
	pushl	28(%esp)
	.cfi_def_cfa_offset 32
	call	cteMove
.LVL2345:
	.loc 33 350 0
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE727:
	.size	invokeCNodeMove, .-invokeCNodeMove
	.section	.text.unlikely
.LCOLDE460:
	.text
.LHOTE460:
	.section	.text.unlikely
.LCOLDB461:
	.text
.LHOTB461:
	.p2align 4,,15
	.globl	invokeCNodeRotate
	.type	invokeCNodeRotate, @function
invokeCNodeRotate:
.LFB728:
	.loc 33 355 0
	.cfi_startproc
.LVL2346:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	.loc 33 355 0
	movl	32(%esp), %ebx
	movl	40(%esp), %eax
	movl	36(%esp), %esi
	.loc 33 356 0
	cmpl	%eax, %ebx
	je	.L2213
	.loc 33 359 0
	pushl	%eax
	.cfi_def_cfa_offset 20
	pushl	%esi
	.cfi_def_cfa_offset 24
	pushl	36(%esp)
	.cfi_def_cfa_offset 28
	pushl	36(%esp)
	.cfi_def_cfa_offset 32
	call	cteMove
.LVL2347:
	.loc 33 360 0
	pushl	%esi
	.cfi_def_cfa_offset 36
	pushl	%ebx
	.cfi_def_cfa_offset 40
	pushl	44(%esp)
	.cfi_def_cfa_offset 44
	pushl	44(%esp)
	.cfi_def_cfa_offset 48
	call	cteMove
.LVL2348:
	addl	$32, %esp
	.cfi_def_cfa_offset 16
	.loc 33 364 0
	xorl	%eax, %eax
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L2213:
	.cfi_restore_state
	.loc 33 357 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	pushl	%esi
	.cfi_def_cfa_offset 28
	pushl	40(%esp)
	.cfi_def_cfa_offset 32
	pushl	40(%esp)
	.cfi_def_cfa_offset 36
	pushl	%ebx
	.cfi_def_cfa_offset 40
	pushl	44(%esp)
	.cfi_def_cfa_offset 44
	pushl	44(%esp)
	.cfi_def_cfa_offset 48
	call	cteSwap
.LVL2349:
	addl	$32, %esp
	.cfi_def_cfa_offset 16
	.loc 33 364 0
	xorl	%eax, %eax
	addl	$4, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE728:
	.size	invokeCNodeRotate, .-invokeCNodeRotate
	.section	.text.unlikely
.LCOLDE461:
	.text
.LHOTE461:
	.section	.rodata.str1.4
	.align 4
.LC462:
	.string	"(mdbPrev & ~0xfffffff8u) == ((0 && (mdbPrev & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB463:
	.text
.LHOTB463:
	.p2align 4,,15
	.globl	insertNewCap
	.type	insertNewCap, @function
insertNewCap:
.LFB743:
	.loc 33 788 0
	.cfi_startproc
.LVL2350:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	.loc 33 788 0
	movl	16(%esp), %ecx
	movl	20(%esp), %eax
	.loc 33 792 0
	movl	24(%esp), %ebx
	movl	28(%esp), %esi
.LBB9808:
.LBB9809:
	.loc 11 664 0
	movl	12(%ecx), %edx
.LBE9809:
.LBE9808:
	.loc 33 792 0
	movl	%ebx, (%eax)
	movl	%esi, 4(%eax)
.LBB9811:
.LBB9810:
	.loc 11 664 0
	andl	$-8, %edx
.LVL2351:
.LBE9810:
.LBE9811:
.LBB9812:
.LBB9813:
	.loc 11 649 0
	testb	$7, %cl
	jne	.L2221
.LVL2352:
.LBE9813:
.LBE9812:
	.loc 33 793 0
	movl	%ecx, %ebx
	andl	$-8, %ebx
	movl	%ebx, 8(%eax)
	movl	%edx, %ebx
	orl	$3, %ebx
	movl	%ebx, 12(%eax)
	.loc 33 794 0
	testl	%edx, %edx
	je	.L2216
.LVL2353:
.LBB9815:
.LBB9816:
	.loc 11 759 0
	testb	$7, %al
	jne	.L2222
	.loc 11 761 0
	movl	8(%edx), %ebx
	andl	$-8, %eax
.LVL2354:
	andl	$7, %ebx
	orl	%eax, %ebx
	movl	%ebx, 8(%edx)
.LVL2355:
.L2218:
.LBE9816:
.LBE9815:
.LBB9818:
.LBB9819:
	.loc 11 677 0
	movl	12(%ecx), %edx
.LVL2356:
	andl	$7, %edx
	orl	%edx, %eax
	movl	%eax, 12(%ecx)
.LBE9819:
.LBE9818:
	.loc 33 798 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL2357:
	.p2align 4,,10
	.p2align 3
.L2216:
	.cfi_restore_state
.LBB9821:
.LBB9820:
	.loc 11 675 0
	testb	$7, %al
	jne	.L2223
	andl	$-8, %eax
.LVL2358:
	jmp	.L2218
.LVL2359:
.L2223:
	call	mdb_node_ptr_set_mdbNext.isra.229.part.230
.LVL2360:
.L2221:
.LBE9820:
.LBE9821:
.LBB9822:
.LBB9814:
	.loc 11 649 0
	pushl	$__FUNCTION__.1574
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$649
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC462
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2361:
.L2222:
	.cfi_restore_state
.LBE9814:
.LBE9822:
.LBB9823:
.LBB9817:
	call	mdb_node_ptr_set_mdbPrev.isra.231.part.232
.LVL2362:
.LBE9817:
.LBE9823:
	.cfi_endproc
.LFE743:
	.size	insertNewCap, .-insertNewCap
	.section	.text.unlikely
.LCOLDE463:
	.text
.LHOTE463:
	.section	.text.unlikely
.LCOLDB464:
	.text
.LHOTB464:
	.p2align 4,,15
	.globl	setMRs_fault
	.type	setMRs_fault, @function
setMRs_fault:
.LFB390:
	.loc 47 193 0
	.cfi_startproc
.LVL2363:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 47 193 0
	movl	16(%esp), %eax
	movl	20(%esp), %ecx
	movl	24(%esp), %ebx
.LBB9913:
.LBB9914:
	.loc 11 1586 0
	movl	604(%eax), %edx
	andl	$7, %edx
.LBE9914:
.LBE9913:
	.loc 47 194 0
	cmpl	$2, %edx
	je	.L2226
	cmpl	$3, %edx
	je	.L2227
	cmpl	$1, %edx
	je	.L2262
	.loc 47 245 0
	pushl	%edx
	.cfi_def_cfa_offset 20
	pushl	%ebx
	.cfi_def_cfa_offset 24
	pushl	%ecx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	Arch_setMRs_fault
.LVL2364:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L2251:
	.loc 47 248 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2365:
	.p2align 4,,10
	.p2align 3
.L2262:
	.cfi_restore_state
.LBB9915:
.LBB9916:
.LBB9917:
	.loc 15 30 0
	movl	556(%eax), %edx
	movl	%edx, 532(%ecx)
.LVL2366:
.LBE9917:
.LBE9916:
.LBE9915:
.LBB9918:
.LBB9919:
	.loc 11 1628 0
	movl	604(%eax), %edx
	movl	608(%eax), %esi
.LVL2367:
	andl	$7, %edx
	cmpl	$1, %edx
	jne	.L2263
.LVL2368:
.LBE9919:
.LBE9918:
.LBB9921:
.LBB9922:
.LBB9923:
	.loc 15 30 0
	movl	%esi, 536(%ecx)
.LVL2369:
	movl	604(%eax), %edx
.LVL2370:
.LBE9923:
.LBE9922:
.LBE9921:
.LBB9924:
.LBB9925:
	.loc 11 1642 0
	movl	%edx, %ecx
.LVL2371:
	andl	$7, %ecx
	cmpl	$1, %ecx
	jne	.L2264
	.loc 11 1645 0
	shrl	$31, %edx
.LVL2372:
.LBE9925:
.LBE9924:
.LBB9927:
.LBB9928:
	.loc 48 38 0
	testl	%ebx, %ebx
	je	.L2235
	.loc 48 39 0
	movl	%edx, 12(%ebx)
.LVL2373:
	movl	612(%eax), %edx
.LVL2374:
	movl	616(%eax), %esi
.LVL2375:
.LBE9928:
.LBE9927:
.LBB9929:
.LBB9930:
.LBB9931:
.LBB9932:
	.loc 11 1142 0
	movl	%edx, %eax
.LVL2376:
	andl	$3, %eax
.LVL2377:
.LBE9932:
.LBE9931:
.LBB9933:
.LBB9934:
	.loc 48 39 0
	leal	1(%eax), %ecx
.LVL2378:
	movl	%ecx, 16(%ebx)
.LVL2379:
.LBE9934:
.LBE9933:
	.loc 47 49 0
	cmpl	$2, %eax
	je	.L2237
	cmpl	$3, %eax
	je	.L2238
	cmpl	$1, %eax
	je	.L2265
.LBB9937:
.LBB9935:
	.loc 48 40 0
	movl	$4, %eax
	jmp	.L2251
.LVL2380:
	.p2align 4,,10
	.p2align 3
.L2227:
.LBE9935:
.LBE9937:
.LBE9930:
.LBE9929:
.LBB9980:
.LBB9981:
.LBB9982:
.LBB9983:
	.loc 15 30 0
	movl	556(%eax), %edx
	movl	%edx, 532(%ecx)
.LVL2381:
	movl	580(%eax), %edx
	movl	%edx, 536(%ecx)
.LVL2382:
.LBE9983:
.LBE9982:
	.loc 47 111 0
	testl	%ebx, %ebx
	je	.L2266
.LVL2383:
.LBB9984:
.LBB9985:
	.loc 15 36 0
	movl	576(%eax), %edx
.LVL2384:
.LBE9985:
.LBE9984:
	.loc 47 113 0
	movl	%edx, 12(%ebx)
.LVL2385:
.LBE9981:
.LBE9980:
.LBB9986:
.LBB9987:
	.loc 11 1702 0
	movl	604(%eax), %edx
	movl	608(%eax), %ecx
.LVL2386:
	andl	$7, %edx
	cmpl	$3, %edx
	jne	.L2242
.LVL2387:
.LBE9987:
.LBE9986:
.LBB9989:
.LBB9990:
	.loc 48 39 0
	movl	%ecx, 16(%ebx)
.LVL2388:
	movl	604(%eax), %eax
.LVL2389:
.LBE9990:
.LBE9989:
.LBB9991:
.LBB9992:
	.loc 11 1716 0
	movl	%eax, %edx
	andl	$7, %edx
	cmpl	$3, %edx
	jne	.L2267
.LVL2390:
.LBE9992:
.LBE9991:
.LBB9994:
.LBB9995:
	.loc 48 39 0
	shrl	$3, %eax
	movl	%eax, 20(%ebx)
	.loc 48 40 0
	movl	$5, %eax
.LBE9995:
.LBE9994:
	.loc 47 248 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL2391:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2392:
	.p2align 4,,10
	.p2align 3
.L2226:
	.cfi_restore_state
.LBB9996:
.LBB9997:
.LBB9998:
.LBB9999:
	.loc 15 30 0
	movl	512(%eax), %edx
	movl	%edx, 532(%ecx)
.LVL2393:
	movl	516(%eax), %edx
	movl	%edx, 536(%ecx)
.LVL2394:
.LBE9999:
.LBE9998:
	.loc 47 111 0
	testl	%ebx, %ebx
	je	.L2231
	leal	12(%ebx), %ecx
.LVL2395:
	movl	$fault_messages+12, %edx
	movl	$fault_messages+40, %edi
	movl	$2, %esi
	jmp	.L2232
.LVL2396:
	.p2align 4,,10
	.p2align 3
.L2268:
	movl	(%edx), %esi
	addl	$4, %edx
.L2232:
.LVL2397:
.LBB10000:
.LBB10001:
	.loc 15 36 0
	movl	512(%eax,%esi,4), %esi
.LVL2398:
	addl	$4, %ecx
.LBE10001:
.LBE10000:
	.loc 47 113 0
	movl	%esi, -4(%ecx)
	.loc 47 112 0
	cmpl	%edx, %edi
	jne	.L2268
.LVL2399:
	movl	608(%eax), %edx
.LVL2400:
.LBE9997:
.LBE9996:
.LBB10002:
.LBB10003:
	.loc 11 1671 0
	movl	604(%eax), %eax
.LVL2401:
	andl	$7, %eax
	cmpl	$2, %eax
	jne	.L2245
.LVL2402:
.LBE10003:
.LBE10002:
.LBB10006:
.LBB10007:
	.loc 48 39 0
	movl	%edx, 44(%ebx)
.LVL2403:
	.loc 48 40 0
	movl	$11, %eax
.LBE10007:
.LBE10006:
	.loc 47 248 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL2404:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2405:
	.p2align 4,,10
	.p2align 3
.L2237:
	.cfi_restore_state
.LBB10008:
.LBB9977:
.LBB9938:
.LBB9939:
	.loc 48 39 0
	movl	%edx, %eax
.LBE9939:
.LBE9938:
.LBB9943:
.LBB9944:
	andl	$16128, %edx
.LVL2406:
.LBE9944:
.LBE9943:
.LBB9948:
.LBB9940:
	andl	$252, %eax
.LVL2407:
.LBE9940:
.LBE9948:
.LBB9949:
.LBB9945:
	shrl	$8, %edx
.LBE9945:
.LBE9949:
.LBB9950:
.LBB9941:
	shrl	$2, %eax
.LBE9941:
.LBE9950:
.LBB9951:
.LBB9946:
	movl	%edx, 24(%ebx)
.LBE9946:
.LBE9951:
.LBB9952:
.LBB9942:
	movl	%eax, 20(%ebx)
.LVL2408:
.LBE9942:
.LBE9952:
.LBB9953:
.LBB9947:
	.loc 48 40 0
	movl	$6, %eax
	jmp	.L2251
.LVL2409:
	.p2align 4,,10
	.p2align 3
.L2265:
.LBE9947:
.LBE9953:
.LBB9954:
.LBB9955:
	.loc 48 39 0
	andl	$252, %edx
.LVL2410:
	.loc 48 40 0
	movl	$5, %eax
	.loc 48 39 0
	shrl	$2, %edx
	movl	%edx, 20(%ebx)
	jmp	.L2251
.LVL2411:
	.p2align 4,,10
	.p2align 3
.L2238:
.LBE9955:
.LBE9954:
.LBB9957:
.LBB9958:
	movl	%edx, %eax
.LBE9958:
.LBE9957:
.LBB9962:
.LBB9963:
	andl	$252, %edx
.LVL2412:
.LBE9963:
.LBE9962:
.LBB9967:
.LBB9968:
	movl	%esi, 24(%ebx)
.LBE9968:
.LBE9967:
.LBB9969:
.LBB9959:
	andl	$16128, %eax
.LVL2413:
.LBE9959:
.LBE9969:
.LBB9970:
.LBB9964:
	shrl	$2, %edx
.LBE9964:
.LBE9970:
.LBB9971:
.LBB9960:
	shrl	$8, %eax
.LBE9960:
.LBE9971:
.LBB9972:
.LBB9965:
	movl	%edx, 28(%ebx)
.LBE9965:
.LBE9972:
.LBB9973:
.LBB9961:
	movl	%eax, 20(%ebx)
.LVL2414:
.LBE9961:
.LBE9973:
.LBB9974:
.LBB9966:
	.loc 48 40 0
	movl	$7, %eax
	jmp	.L2251
.LVL2415:
	.p2align 4,,10
	.p2align 3
.L2231:
.LBE9966:
.LBE9974:
.LBE9977:
.LBE10008:
.LBB10009:
.LBB10004:
	.loc 11 1671 0
	movl	604(%eax), %eax
.LVL2416:
	andl	$7, %eax
	cmpl	$2, %eax
	jne	.L2245
.LVL2417:
.L2240:
.LBE10004:
.LBE10009:
.LBB10010:
.LBB9978:
.LBB9975:
.LBB9956:
	.loc 48 42 0
	movl	$2, %eax
	jmp	.L2251
.LVL2418:
	.p2align 4,,10
	.p2align 3
.L2266:
.LBE9956:
.LBE9975:
.LBE9978:
.LBE10010:
.LBB10011:
.LBB9988:
	.loc 11 1702 0
	movl	604(%eax), %eax
.LVL2419:
	andl	$7, %eax
	cmpl	$3, %eax
	je	.L2240
.LVL2420:
.L2242:
	call	seL4_Fault_UserException_get_number.part.84
.LVL2421:
	.p2align 4,,10
	.p2align 3
.L2235:
.LBE9988:
.LBE10011:
.LBB10012:
.LBB9979:
	.loc 47 49 0
	movl	612(%eax), %edx
.LBB9976:
.LBB9936:
	.loc 48 42 0
	movl	$2, %eax
.LVL2422:
.LBE9936:
.LBE9976:
	.loc 47 49 0
	andl	$3, %edx
	subl	$1, %edx
	cmpl	$2, %edx
	ja	.L2251
	jmp	.L2240
.LVL2423:
.L2245:
.LBE9979:
.LBE10012:
.LBB10013:
.LBB10005:
	call	seL4_Fault_UnknownSyscall_get_syscallNumber.part.83
.LVL2424:
.L2263:
.LBE10005:
.LBE10013:
.LBB10014:
.LBB9920:
	call	seL4_Fault_CapFault_get_address.part.73
.LVL2425:
.L2267:
.LBE9920:
.LBE10014:
.LBB10015:
.LBB9993:
	call	seL4_Fault_UserException_get_code.isra.85.part.86
.LVL2426:
.L2264:
.LBE9993:
.LBE10015:
.LBB10016:
.LBB9926:
	call	seL4_Fault_CapFault_get_inReceivePhase.isra.74.part.75
.LVL2427:
.LBE9926:
.LBE10016:
	.cfi_endproc
.LFE390:
	.size	setMRs_fault, .-setMRs_fault
	.section	.text.unlikely
.LCOLDE464:
	.text
.LHOTE464:
	.section	.text.unlikely
.LCOLDB465:
	.text
.LHOTB465:
	.p2align 4,,15
	.globl	Mode_deriveCap
	.type	Mode_deriveCap, @function
Mode_deriveCap:
.LFB487:
	.loc 18 42 0
	.cfi_startproc
.LVL2428:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 18 42 0
	movl	24(%esp), %edx
.LVL2429:
	movl	16(%esp), %eax
.LVL2430:
	movl	28(%esp), %ebx
.LVL2431:
.LBB10031:
.LBB10032:
	.loc 11 2202 0
	movl	%edx, %edi
	.loc 11 2203 0
	movl	%edx, %esi
	movzbl	%dl, %ecx
.LVL2432:
	.loc 11 2202 0
	andl	$14, %edi
	.loc 11 2203 0
	andl	$15, %esi
	cmpl	$14, %edi
	cmovne	%esi, %ecx
.LVL2433:
.LBE10032:
.LBE10031:
	.loc 18 45 0
	cmpl	$1, %ecx
	jne	.L2275
.LVL2434:
.LBB10033:
.LBB10034:
	.loc 11 2904 0
	cmpl	$1, %esi
	jne	.L2278
.LVL2435:
.LBE10034:
.LBE10033:
.LBB10036:
.LBB10037:
.LBB10038:
	.loc 11 2844 0
	andl	$-1072693249, %ebx
.LVL2436:
.LBE10038:
.LBE10037:
.LBE10036:
	.loc 18 50 0
	andl	$-1811939329, %edx
.LVL2437:
	movl	$0, (%eax)
	movl	%edx, 4(%eax)
	movl	%ebx, 8(%eax)
.LVL2438:
	.loc 18 57 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL2439:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL2440:
.L2275:
	.cfi_restore_state
.LBB10039:
.LBB10040:
	.loc 18 55 0
	pushl	$__func__.6455
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$55
	.cfi_def_cfa_offset 24
	pushl	$.LC130
	.cfi_def_cfa_offset 28
	pushl	$.LC146
	.cfi_def_cfa_offset 32
	call	_fail
.LVL2441:
.L2278:
	.cfi_restore_state
.LBE10040:
.LBE10039:
.LBB10041:
.LBB10035:
	call	cap_frame_cap_set_capFMapType.part.156
.LVL2442:
.LBE10035:
.LBE10041:
	.cfi_endproc
.LFE487:
	.size	Mode_deriveCap, .-Mode_deriveCap
	.section	.text.unlikely
.LCOLDE465:
	.text
.LHOTE465:
	.section	.text.unlikely
.LCOLDB466:
	.text
.LHOTB466:
	.p2align 4,,15
	.globl	replyFromKernel_success_empty
	.type	replyFromKernel_success_empty, @function
replyFromKernel_success_empty:
.LFB757:
	.loc 64 217 0
	.cfi_startproc
.LVL2443:
	.loc 64 217 0
	movl	4(%esp), %eax
.LVL2444:
.LBB10048:
.LBB10049:
	.loc 15 30 0
	movl	$0, 516(%eax)
.LVL2445:
.LBE10049:
.LBE10048:
.LBB10050:
.LBB10051:
	movl	$0, 528(%eax)
.LVL2446:
	ret
.LBE10051:
.LBE10050:
	.cfi_endproc
.LFE757:
	.size	replyFromKernel_success_empty, .-replyFromKernel_success_empty
	.section	.text.unlikely
.LCOLDE466:
	.text
.LHOTE466:
	.section	.text.unlikely
.LCOLDB467:
	.text
.LHOTB467:
	.p2align 4,,15
	.globl	makeUserPDEPageTableInvalid
	.type	makeUserPDEPageTableInvalid, @function
makeUserPDEPageTableInvalid:
.LFB459:
	.loc 16 578 0
	.cfi_startproc
.LVL2447:
	.loc 16 578 0
	movl	4(%esp), %eax
.LBB10054:
.LBB10055:
	.loc 11 1966 0
	movl	$0, (%eax)
.LVL2448:
.LBE10055:
.LBE10054:
	.loc 16 589 0
	ret	$4
	.cfi_endproc
.LFE459:
	.size	makeUserPDEPageTableInvalid, .-makeUserPDEPageTableInvalid
	.section	.text.unlikely
.LCOLDE467:
	.text
.LHOTE467:
	.section	.text.unlikely
.LCOLDB468:
	.text
.LHOTB468:
	.p2align 4,,15
	.globl	unmapPageTable
	.type	unmapPageTable, @function
unmapPageTable:
.LFB550:
	.loc 20 764 0
	.cfi_startproc
.LVL2449:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 20 764 0
	movl	32(%esp), %ebx
	.loc 20 768 0
	leal	8(%esp), %eax
	pushl	%ebx
	.cfi_def_cfa_offset 36
	pushl	%eax
	.cfi_def_cfa_offset 40
	call	findVSpaceForASID
	.cfi_def_cfa_offset 36
.LVL2450:
	movl	16(%esp), %edx
.LVL2451:
	.loc 20 769 0
	popl	%eax
	.cfi_def_cfa_offset 32
	movl	8(%esp), %ecx
	testl	%ecx, %ecx
	jne	.L2281
.LVL2452:
.LBB10056:
.LBB10057:
	.loc 17 173 0
	movl	36(%esp), %eax
	shrl	$22, %eax
.LVL2453:
	leal	(%edx,%eax,4), %esi
.LVL2454:
.LBE10057:
.LBE10056:
.LBB10058:
.LBB10059:
	.loc 11 1937 0
	movl	(%esi), %eax
.LVL2455:
.LBE10059:
.LBE10058:
	.loc 20 779 0
	testb	$-128, %al
	jne	.L2281
.LVL2456:
.LBB10060:
.LBB10061:
	.loc 11 2028 0 discriminator 1
	jne	.L2289
.LVL2457:
.LBE10061:
.LBE10060:
	.loc 20 779 0
	testb	$1, %al
	jne	.L2290
.LVL2458:
.L2281:
	.loc 20 791 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL2459:
	.p2align 4,,10
	.p2align 3
.L2290:
	.cfi_restore_state
	.loc 20 779 0
	movl	40(%esp), %ecx
	andl	$-4096, %eax
	addl	$536870912, %ecx
	cmpl	%eax, %ecx
	jne	.L2281
	.loc 20 785 0
	pushl	%ebx
	.cfi_def_cfa_offset 36
	pushl	44(%esp)
	.cfi_def_cfa_offset 40
	pushl	44(%esp)
	.cfi_def_cfa_offset 44
	pushl	%edx
	.cfi_def_cfa_offset 48
	call	flushTable
.LVL2460:
	.loc 20 787 0
	movl	%esi, (%esp)
	call	makeUserPDEPageTableInvalid
	.cfi_def_cfa_offset 44
.LVL2461:
.LBB10063:
.LBB10064:
.LBB10065:
.LBB10066:
.LBB10067:
	.loc 50 45 0
	xorl	%eax, %eax
#APP
# 45 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine.h" 1
	invlpg (%eax)
# 0 "" 2
.LVL2462:
#NO_APP
.LBE10067:
.LBE10066:
.LBE10065:
.LBE10064:
.LBE10063:
	addl	$12, %esp
	.cfi_def_cfa_offset 32
	jmp	.L2281
.LVL2463:
.L2289:
.LBB10068:
.LBB10062:
	call	pde_pde_pt_ptr_get_present.part.178
.LVL2464:
.LBE10062:
.LBE10068:
	.cfi_endproc
.LFE550:
	.size	unmapPageTable, .-unmapPageTable
	.section	.text.unlikely
.LCOLDE468:
	.text
.LHOTE468:
	.section	.boot.text
.LCOLDB469:
.LHOTB469:
	.p2align 4,,15
	.globl	apic_send_init_ipi
	.type	apic_send_init_ipi, @function
apic_send_init_ipi:
.LFB564:
	.loc 21 73 0
	.cfi_startproc
.LVL2465:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
.LVL2466:
	.loc 21 73 0
	movl	16(%esp), %eax
.LBB10087:
.LBB10088:
	.loc 11 251 0
	testl	$-256, %eax
	jne	.L2294
	.loc 11 254 0
	sall	$24, %eax
.LVL2467:
.LBE10088:
.LBE10087:
.LBB10090:
.LBB10091:
.LBB10092:
	.loc 19 59 0
	movl	%eax, -64752
.LVL2468:
.LBE10092:
.LBE10091:
.LBB10093:
.LBB10094:
	movl	$50432, -64768
.LVL2469:
.LBE10094:
.LBE10093:
.LBE10090:
.LBB10095:
.LBB10096:
.LBB10097:
	movl	%eax, -64752
.LVL2470:
.LBE10097:
.LBE10096:
.LBB10098:
.LBB10099:
	movl	$34048, -64768
.LVL2471:
.LBE10099:
.LBE10098:
.LBE10095:
	.loc 21 102 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL2472:
.L2294:
	.cfi_restore_state
.LBB10100:
.LBB10089:
	call	apic_icr2_new.part.70
.LVL2473:
.LBE10089:
.LBE10100:
	.cfi_endproc
.LFE564:
	.size	apic_send_init_ipi, .-apic_send_init_ipi
.LCOLDE469:
.LHOTE469:
.LCOLDB470:
.LHOTB470:
	.p2align 4,,15
	.globl	map_temp_boot_page
	.type	map_temp_boot_page, @function
map_temp_boot_page:
.LFB448:
	.loc 16 343 0
	.cfi_startproc
.LVL2474:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	.loc 16 350 0
	movl	$-536870912, %eax
	.loc 16 343 0
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	.loc 16 349 0
	movl	$896, %edi
	.loc 16 343 0
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$4, %esp
	.cfi_def_cfa_offset 24
	.loc 16 343 0
	movl	28(%esp), %esi
	.loc 16 348 0
	movl	24(%esp), %ebp
	.loc 16 350 0
	movl	%esi, %edx
	.loc 16 349 0
	subl	%esi, %edi
	.loc 16 350 0
	sall	$22, %edx
	.loc 16 348 0
	andl	$-4194304, %ebp
.LVL2475:
	.loc 16 350 0
	subl	%edx, %eax
	movl	%eax, (%esp)
.LVL2476:
	.loc 16 352 0
	testl	%esi, %esi
	je	.L2298
	xorl	%eax, %eax
.LVL2477:
	.p2align 4,,10
	.p2align 3
.L2299:
.LBB10111:
	.loc 16 355 0 discriminator 3
	leal	(%edi,%eax), %ebx
	.loc 16 353 0 discriminator 3
	movl	%eax, %edx
	sall	$22, %edx
.LVL2478:
	.loc 16 355 0 discriminator 3
	leal	0(%ebp,%edx), %ecx
.LBB10112:
.LBB10113:
.LBB10114:
	.loc 50 45 0 discriminator 3
	addl	(%esp), %edx
.LVL2479:
.LBE10114:
.LBE10113:
.LBE10112:
	.loc 16 355 0 discriminator 3
	orl	$387, %ecx
	movl	%ecx, _boot_pd(,%ebx,4)
.LBB10117:
.LBB10116:
.LBB10115:
	.loc 50 45 0 discriminator 3
#APP
# 45 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine.h" 1
	invlpg (%edx)
# 0 "" 2
#NO_APP
.LBE10115:
.LBE10116:
.LBE10117:
.LBE10111:
	.loc 16 352 0 discriminator 3
	addl	$1, %eax
.LVL2480:
	cmpl	%eax, %esi
	jne	.L2299
.LVL2481:
.L2298:
.LBB10118:
.LBB10119:
.LBB10120:
	.loc 50 45 0
	xorl	%eax, %eax
#APP
# 45 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine.h" 1
	invlpg (%eax)
# 0 "" 2
.LVL2482:
#NO_APP
.LBE10120:
.LBE10119:
.LBE10118:
	.loc 16 377 0
	movl	24(%esp), %eax
	andl	$4194303, %eax
.LVL2483:
	addl	(%esp), %eax
.LVL2484:
	.loc 16 378 0
	addl	$4, %esp
	.cfi_def_cfa_offset 20
.LVL2485:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL2486:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL2487:
	ret
	.cfi_endproc
.LFE448:
	.size	map_temp_boot_page, .-map_temp_boot_page
.LCOLDE470:
.LHOTE470:
	.section	.text.unlikely
.LCOLDB471:
	.text
.LHOTB471:
	.p2align 4,,15
	.globl	apic_send_ipi_core
	.type	apic_send_ipi_core, @function
apic_send_ipi_core:
.LFB566:
	.loc 21 130 0
	.cfi_startproc
.LVL2488:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	movl	16(%esp), %ecx
	movl	20(%esp), %edx
	.p2align 4,,10
	.p2align 3
.L2305:
.LVL2489:
.LBB10134:
.LBB10135:
	.loc 19 53 0 discriminator 1
	movl	-64768, %eax
.LVL2490:
.LBE10135:
.LBE10134:
	.loc 21 135 0 discriminator 1
	testb	$16, %ah
	jne	.L2305
	.loc 21 141 0
	movzbl	%cl, %ecx
.LVL2491:
.LBB10136:
.LBB10137:
	.loc 11 251 0
	testl	$-256, %edx
	jne	.L2309
	.loc 11 254 0
	sall	$24, %edx
.LVL2492:
.LBE10137:
.LBE10136:
.LBB10139:
.LBB10140:
.LBB10141:
	.loc 19 59 0
	movl	%edx, -64752
.LVL2493:
.LBE10141:
.LBE10140:
.LBB10142:
.LBB10143:
	movl	%ecx, -64768
.LVL2494:
.LBE10143:
.LBE10142:
.LBE10139:
	.loc 21 151 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL2495:
.L2309:
	.cfi_restore_state
.LBB10144:
.LBB10138:
	call	apic_icr2_new.part.70
.LVL2496:
.LBE10138:
.LBE10144:
	.cfi_endproc
.LFE566:
	.size	apic_send_ipi_core, .-apic_send_ipi_core
	.section	.text.unlikely
.LCOLDE471:
	.text
.LHOTE471:
	.section	.text.unlikely
.LCOLDB472:
	.text
.LHOTB472:
	.p2align 4,,15
	.globl	apic_send_ipi_cluster
	.type	apic_send_ipi_cluster, @function
apic_send_ipi_cluster:
.LFB567:
	.loc 21 154 0
	.cfi_startproc
.LVL2497:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	movl	16(%esp), %edx
	movl	20(%esp), %ecx
	.p2align 4,,10
	.p2align 3
.L2311:
.LVL2498:
.LBB10158:
.LBB10159:
	.loc 19 53 0 discriminator 1
	movl	-64768, %eax
.LVL2499:
.LBE10159:
.LBE10158:
	.loc 21 159 0 discriminator 1
	testb	$16, %ah
	jne	.L2311
.LVL2500:
.LBB10160:
.LBB10161:
	.loc 11 225 0
	movzbl	%dl, %eax
.LVL2501:
	orb	$8, %ah
.LVL2502:
.LBE10161:
.LBE10160:
.LBB10162:
.LBB10163:
	.loc 11 251 0
	testl	$-256, %ecx
	jne	.L2315
	.loc 11 254 0
	sall	$24, %ecx
.LVL2503:
.LBE10163:
.LBE10162:
.LBB10165:
.LBB10166:
.LBB10167:
	.loc 19 59 0
	movl	%ecx, -64752
.LVL2504:
.LBE10167:
.LBE10166:
.LBB10168:
.LBB10169:
	movl	%eax, -64768
.LVL2505:
.LBE10169:
.LBE10168:
.LBE10165:
	.loc 21 175 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL2506:
.L2315:
	.cfi_restore_state
.LBB10170:
.LBB10164:
	call	apic_icr2_new.part.70
.LVL2507:
.LBE10164:
.LBE10170:
	.cfi_endproc
.LFE567:
	.size	apic_send_ipi_cluster, .-apic_send_ipi_cluster
	.section	.text.unlikely
.LCOLDE472:
	.text
.LHOTE472:
	.section	.rodata.str1.4
	.align 4
.LC473:
	.string	"IS_ALIGNED(asid_base, asidLowBits)"
	.section	.text.unlikely
.LCOLDB474:
	.text
.LHOTB474:
	.p2align 4,,15
	.globl	deleteASIDPool
	.type	deleteASIDPool, @function
deleteASIDPool:
.LFB530:
	.loc 20 40 0
	.cfi_startproc
.LVL2508:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 20 40 0
	movl	16(%esp), %eax
	movl	20(%esp), %edx
	.loc 20 42 0
	testl	$1023, %eax
	jne	.L2320
	.loc 20 44 0
	shrl	$10, %eax
	cmpl	%edx, x86KSASIDTable(,%eax,4)
	je	.L2321
	.loc 20 55 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L2321:
	.cfi_restore_state
.LVL2509:
	.loc 20 52 0
	movl	$0, x86KSASIDTable(,%eax,4)
	.loc 20 53 0
	movl	ksCurThread, %eax
	movl	%eax, 16(%esp)
.LVL2510:
	.loc 20 55 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	.loc 20 53 0
	jmp	setVMRoot
.LVL2511:
.L2320:
	.cfi_restore_state
.LBB10189:
.LBB10190:
	.loc 20 42 0
	pushl	$__FUNCTION__.6966
	.cfi_def_cfa_offset 20
	pushl	$42
	.cfi_def_cfa_offset 24
	pushl	$.LC138
	.cfi_def_cfa_offset 28
	pushl	$.LC473
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2512:
.LBE10190:
.LBE10189:
	.cfi_endproc
.LFE530:
	.size	deleteASIDPool, .-deleteASIDPool
	.section	.text.unlikely
.LCOLDE474:
	.text
.LHOTE474:
	.section	.rodata.str1.4
	.align 4
.LC475:
	.string	"(length & ~0x7fu) == ((0 && (length & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB476:
	.text
.LHOTB476:
	.p2align 4,,15
	.globl	doFaultTransfer
	.type	doFaultTransfer, @function
doFaultTransfer:
.LFB687:
	.loc 32 182 0
	.cfi_startproc
.LVL2513:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$8, %esp
	.cfi_def_cfa_offset 20
	.loc 32 182 0
	movl	24(%esp), %esi
	movl	28(%esp), %ebx
	.loc 32 186 0
	pushl	32(%esp)
	.cfi_def_cfa_offset 24
	pushl	%ebx
	.cfi_def_cfa_offset 28
	pushl	%esi
	.cfi_def_cfa_offset 32
	call	setMRs_fault
.LVL2514:
.LBB10199:
.LBB10200:
	.loc 11 1586 0
	movl	604(%esi), %edx
.LBE10200:
.LBE10199:
.LBB10202:
.LBB10203:
	.loc 60 48 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.LBE10203:
.LBE10202:
.LBB10206:
.LBB10201:
	.loc 11 1586 0
	andl	$7, %edx
.LVL2515:
.LBE10201:
.LBE10206:
.LBB10207:
.LBB10204:
	.loc 60 48 0
	testl	$-128, %eax
	jne	.L2325
.LVL2516:
.LBE10204:
.LBE10207:
.LBB10208:
.LBB10209:
	.loc 15 30 0
	sall	$12, %edx
.LVL2517:
	orl	%eax, %edx
.LVL2518:
.LBE10209:
.LBE10208:
.LBB10211:
.LBB10212:
	movl	16(%esp), %eax
.LVL2519:
.LBE10212:
.LBE10211:
.LBB10214:
.LBB10210:
	movl	%edx, 528(%ebx)
.LVL2520:
.LBE10210:
.LBE10214:
.LBB10215:
.LBB10213:
	movl	%eax, 516(%ebx)
.LVL2521:
.LBE10213:
.LBE10215:
	.loc 32 191 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL2522:
.L2325:
	.cfi_restore_state
.LBB10216:
.LBB10205:
	.loc 60 48 0
	pushl	$__FUNCTION__.1119
	.cfi_def_cfa_offset 20
	pushl	$48
	.cfi_def_cfa_offset 24
	pushl	$.LC286
	.cfi_def_cfa_offset 28
	pushl	$.LC475
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2523:
.LBE10205:
.LBE10216:
	.cfi_endproc
.LFE687:
	.size	doFaultTransfer, .-doFaultTransfer
	.section	.text.unlikely
.LCOLDE476:
	.text
.LHOTE476:
	.section	.text.unlikely
.LCOLDB477:
	.text
.LHOTB477:
	.p2align 4,,15
	.globl	replyFromKernel_error
	.type	replyFromKernel_error, @function
replyFromKernel_error:
.LFB756:
	.loc 64 204 0
	.cfi_startproc
.LVL2524:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$16, %esp
	.cfi_def_cfa_offset 24
	.loc 64 204 0
	movl	24(%esp), %ebx
	.loc 64 208 0
	pushl	%ebx
	.cfi_def_cfa_offset 28
	pushl	$1
	.cfi_def_cfa_offset 32
	call	lookupIPCBuffer
.LVL2525:
	popl	%edx
	.cfi_def_cfa_offset 28
	popl	%ecx
	.cfi_def_cfa_offset 24
.LVL2526:
.LBB10223:
.LBB10224:
	.loc 15 30 0
	movl	$0, 516(%ebx)
.LVL2527:
.LBE10224:
.LBE10223:
	.loc 64 210 0
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	setMRs_syscall_error
.LVL2528:
	.loc 64 212 0
	movl	current_syscall_error+24, %edx
.LVL2529:
.LBB10225:
.LBB10226:
	.loc 60 45 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testl	$-1048576, %edx
	jne	.L2330
	.loc 60 48 0
	testl	$-128, %eax
	jne	.L2331
.LVL2530:
.LBE10226:
.LBE10225:
.LBB10228:
.LBB10229:
	.loc 15 30 0
	sall	$12, %edx
.LVL2531:
	orl	%eax, %edx
	movl	%edx, 528(%ebx)
.LVL2532:
.LBE10229:
.LBE10228:
	.loc 64 213 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL2533:
.L2330:
	.cfi_restore_state
.LBB10230:
.LBB10227:
	call	seL4_MessageInfo_new.part.184
.LVL2534:
.L2331:
	.loc 60 48 0
	pushl	$__FUNCTION__.1119
	.cfi_def_cfa_offset 20
	pushl	$48
	.cfi_def_cfa_offset 24
	pushl	$.LC286
	.cfi_def_cfa_offset 28
	pushl	$.LC475
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2535:
.LBE10227:
.LBE10230:
	.cfi_endproc
.LFE756:
	.size	replyFromKernel_error, .-replyFromKernel_error
	.section	.text.unlikely
.LCOLDE477:
	.text
.LHOTE477:
	.section	.rodata.str1.4
	.align 4
.LC478:
	.string	"cap_page_table_cap_get_capPTIsMapped(pt_cap)"
	.section	.boot.text
.LCOLDB479:
.LHOTB479:
	.p2align 4,,15
	.globl	map_it_pt_cap
	.type	map_it_pt_cap, @function
map_it_pt_cap:
.LFB470:
	.loc 17 110 0
	.cfi_startproc
.LVL2536:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	.loc 17 110 0
	movl	16(%esp), %edx
	movl	20(%esp), %esi
.LVL2537:
	movl	24(%esp), %eax
.LVL2538:
	movl	28(%esp), %ebx
.LVL2539:
.LBB10282:
.LBB10283:
.LBB10284:
.LBB10285:
	.loc 11 2202 0
	movl	%edx, %ecx
	andl	$14, %ecx
	cmpl	$14, %ecx
	je	.L2333
	.loc 11 2203 0
	movl	%edx, %ecx
	andl	$15, %ecx
.LVL2540:
.LBE10285:
.LBE10284:
	.loc 54 387 0
	cmpl	$14, %ecx
	ja	.L2334
	jmp	*.L2336(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L2336:
	.long	.L2334
	.long	.L2334
	.long	.L2338
	.long	.L2334
	.long	.L2337
	.long	.L2334
	.long	.L2338
	.long	.L2334
	.long	.L2373
	.long	.L2334
	.long	.L2340
	.long	.L2334
	.long	.L2341
	.long	.L2334
	.long	.L2373
	.section	.boot.text
	.p2align 4,,10
	.p2align 3
.L2338:
	.loc 54 395 0
	andl	$-16, %edx
.LVL2541:
.L2339:
.LBE10283:
.LBE10282:
.LBB10332:
.LBB10333:
	.loc 11 3123 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$3, %ecx
	jne	.L2367
	.loc 11 3126 0
	andl	$16777200, %eax
.LVL2542:
.LBE10333:
.LBE10332:
.LBB10335:
.LBB10336:
	.loc 11 3100 0
	movl	%ebx, %ecx
.LBE10336:
.LBE10335:
.LBB10338:
.LBB10334:
	.loc 11 3126 0
	sall	$8, %eax
.LVL2543:
.LBE10334:
.LBE10338:
.LBB10339:
.LBB10337:
	.loc 11 3100 0
	sall	$21, %ecx
.LVL2544:
.LBE10337:
.LBE10339:
	.loc 17 115 0
	andl	$8388608, %ebx
.LVL2545:
	je	.L2389
.LVL2546:
	.loc 17 116 0
	addl	$536870912, %eax
.LVL2547:
	shrl	$22, %ecx
	orl	$7, %eax
.LVL2548:
	movl	%eax, (%edx,%ecx,4)
.LVL2549:
.LBB10340:
.LBB10341:
.LBB10342:
	.loc 50 45 0
	xorl	%eax, %eax
#APP
# 45 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine.h" 1
	invlpg (%eax)
# 0 "" 2
.LVL2550:
#NO_APP
.LBE10342:
.LBE10341:
.LBE10340:
	.loc 17 127 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
.LVL2551:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL2552:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL2553:
	ret
.LVL2554:
	.p2align 4,,10
	.p2align 3
.L2333:
	.cfi_restore_state
.LBB10343:
.LBB10330:
.LBB10287:
.LBB10286:
	.loc 11 2204 0
	movzbl	%dl, %ecx
.LVL2555:
.LBE10286:
.LBE10287:
	.loc 54 387 0
	cmpl	$62, %ecx
	ja	.L2334
	jmp	*.L2343(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L2343:
	.long	.L2334
	.long	.L2334
	.long	.L2342
	.long	.L2334
	.long	.L2344
	.long	.L2334
	.long	.L2345
	.long	.L2334
	.long	.L2373
	.long	.L2334
	.long	.L2346
	.long	.L2334
	.long	.L2347
	.long	.L2334
	.long	.L2373
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2373
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2348
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2334
	.long	.L2373
	.section	.boot.text
	.p2align 4,,10
	.p2align 3
.L2373:
.LBB10288:
.LBB10289:
	.loc 55 280 0
	xorl	%edx, %edx
.LVL2556:
	jmp	.L2339
.LVL2557:
	.p2align 4,,10
	.p2align 3
.L2341:
.LBE10289:
.LBE10288:
	.loc 54 401 0
	andl	$-1024, %edx
.LVL2558:
	jmp	.L2339
	.p2align 4,,10
	.p2align 3
.L2337:
.LVL2559:
	.loc 54 392 0
	andl	$-16, %esi
.LVL2560:
	movl	%esi, %edx
	jmp	.L2339
.LVL2561:
	.p2align 4,,10
	.p2align 3
.L2340:
	.loc 54 398 0
	andl	$-32, %edx
.LVL2562:
	jmp	.L2339
.LVL2563:
	.p2align 4,,10
	.p2align 3
.L2334:
.LBB10309:
.LBB10306:
	.loc 55 268 0
	cmpl	$31, %ecx
	ja	.L2353
	jmp	*.L2355(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L2355:
	.long	.L2353
	.long	.L2354
	.long	.L2353
	.long	.L2356
	.long	.L2353
	.long	.L2357
	.long	.L2353
	.long	.L2353
	.long	.L2353
	.long	.L2373
	.long	.L2353
	.long	.L2358
	.long	.L2353
	.long	.L2373
	.long	.L2353
	.long	.L2359
	.long	.L2353
	.long	.L2353
	.long	.L2353
	.long	.L2353
	.long	.L2353
	.long	.L2353
	.long	.L2353
	.long	.L2353
	.long	.L2353
	.long	.L2353
	.long	.L2353
	.long	.L2353
	.long	.L2353
	.long	.L2353
	.long	.L2353
	.long	.L2373
	.section	.boot.text
	.p2align 4,,10
	.p2align 3
.L2348:
.LVL2564:
.LBE10306:
.LBE10309:
.LBB10310:
.LBB10311:
.LBB10312:
.LBB10313:
.LBB10314:
.LBB10315:
	.loc 11 3437 0
	andl	$16128, %edx
.LVL2565:
	movl	%edx, %ecx
.LBE10315:
.LBE10314:
	.loc 54 103 0
	movl	$-32, %edx
.LBB10317:
.LBB10316:
	.loc 11 3437 0
	shrl	$8, %ecx
.LVL2566:
.LBE10316:
.LBE10317:
	.loc 54 103 0
	cmpl	$32, %ecx
	je	.L2369
	andl	$31, %ecx
	movl	$-1, %edx
	addl	$1, %ecx
	sall	%cl, %edx
.L2369:
.LVL2567:
.LBE10313:
.LBE10312:
.LBE10311:
.LBE10310:
	.loc 54 404 0
	andl	%esi, %edx
	jmp	.L2339
.LVL2568:
	.p2align 4,,10
	.p2align 3
.L2347:
.LBB10318:
.LBB10319:
	.loc 11 2768 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$12, %ecx
	je	.L2341
	call	cap_thread_cap_get_capTCBPtr.isra.89.part.90
.LVL2569:
	.p2align 4,,10
	.p2align 3
.L2342:
.LBE10319:
.LBE10318:
.LBB10320:
.LBB10321:
	.loc 11 2320 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$2, %ecx
	je	.L2338
	call	cap_untyped_cap_get_capPtr.isra.115.part.116
.LVL2570:
	.p2align 4,,10
	.p2align 3
.L2344:
.LBE10321:
.LBE10320:
.LBB10322:
.LBB10323:
	.loc 11 2358 0
	andl	$15, %edx
.LVL2571:
	cmpl	$4, %edx
	je	.L2337
	call	cap_endpoint_cap_get_capEPPtr.part.117
.LVL2572:
	.p2align 4,,10
	.p2align 3
.L2345:
.LBE10323:
.LBE10322:
.LBB10324:
.LBB10325:
	.loc 11 2576 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$6, %ecx
	je	.L2338
	call	cap_notification_cap_get_capNtfnPtr.isra.97.part.98
.LVL2573:
	.p2align 4,,10
	.p2align 3
.L2346:
.LBE10325:
.LBE10324:
.LBB10326:
.LBB10327:
	.loc 11 2738 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$10, %ecx
	je	.L2340
	call	cap_cnode_cap_get_capCNodePtr.isra.118.part.119
.LVL2574:
	.p2align 4,,10
	.p2align 3
.L2358:
.LBE10327:
.LBE10326:
.LBB10328:
.LBB10307:
.LBB10290:
.LBB10291:
	.loc 11 3287 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$11, %ecx
	jne	.L2390
.LVL2575:
.L2364:
.LBE10291:
.LBE10290:
	.loc 55 294 0
	andl	$16777200, %edx
.LVL2576:
	sall	$8, %edx
	jmp	.L2339
.LVL2577:
	.p2align 4,,10
	.p2align 3
.L2359:
.LBB10293:
.LBB10294:
	.loc 11 3590 0
	cmpb	$15, %dl
	jne	.L2391
.LVL2578:
.LBE10294:
.LBE10293:
	.loc 55 287 0
	andl	$268435200, %edx
.LVL2579:
	sall	$4, %edx
	jmp	.L2339
.LVL2580:
	.p2align 4,,10
	.p2align 3
.L2357:
.LBB10296:
.LBB10297:
	.loc 11 3227 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$5, %ecx
	je	.L2364
	call	cap_page_directory_cap_get_capPDBasePtr.isra.129.part.130
.LVL2581:
	.p2align 4,,10
	.p2align 3
.L2356:
.LBE10297:
.LBE10296:
.LBB10298:
.LBB10299:
	.loc 11 3123 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$3, %ecx
	je	.L2364
.LVL2582:
.L2367:
	call	cap_page_table_cap_get_capPTBasePtr.isra.127.part.128
.LVL2583:
	.p2align 4,,10
	.p2align 3
.L2354:
.LBE10299:
.LBE10298:
.LBB10300:
.LBB10301:
	.loc 11 2996 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$1, %ecx
	je	.L2364
	call	cap_frame_cap_get_capFBasePtr.isra.125.part.126
.LVL2584:
	.p2align 4,,10
	.p2align 3
.L2353:
.LBE10301:
.LBE10300:
.LBB10302:
.LBB10303:
	.loc 46 134 0
	pushl	$__func__.3040
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$134
	.cfi_def_cfa_offset 24
	pushl	$.LC145
	.cfi_def_cfa_offset 28
	pushl	$.LC226
	.cfi_def_cfa_offset 32
	call	_fail
.LVL2585:
.L2389:
	.cfi_restore_state
.LBE10303:
.LBE10302:
.LBE10307:
.LBE10328:
.LBE10330:
.LBE10343:
	.loc 17 115 0 discriminator 1
	pushl	$__FUNCTION__.6322
	.cfi_remember_state
	.cfi_def_cfa_offset 20
.LVL2586:
	pushl	$115
	.cfi_def_cfa_offset 24
.LVL2587:
	pushl	$.LC127
	.cfi_def_cfa_offset 28
.LVL2588:
	pushl	$.LC478
	.cfi_def_cfa_offset 32
.LVL2589:
	call	_assert_fail
.LVL2590:
.L2390:
	.cfi_restore_state
.LBB10344:
.LBB10331:
.LBB10329:
.LBB10308:
.LBB10304:
.LBB10292:
	call	cap_asid_pool_cap_get_capASIDPool.isra.134.part.135
.LVL2591:
.L2391:
.LBE10292:
.LBE10304:
.LBB10305:
.LBB10295:
	call	cap_io_page_table_cap_get_capIOPTBasePtr.isra.132.part.133
.LVL2592:
.LBE10295:
.LBE10305:
.LBE10308:
.LBE10329:
.LBE10331:
.LBE10344:
	.cfi_endproc
.LFE470:
	.size	map_it_pt_cap, .-map_it_pt_cap
.LCOLDE479:
.LHOTE479:
	.section	.text.unlikely
.LCOLDB480:
	.text
.LHOTB480:
	.p2align 4,,15
	.globl	makeUserPDELargePageInvalid
	.type	makeUserPDELargePageInvalid, @function
makeUserPDELargePageInvalid:
.LFB458:
	.loc 16 561 0
	.cfi_startproc
.LVL2593:
	.loc 16 561 0
	movl	4(%esp), %eax
.LBB10347:
.LBB10348:
	.loc 11 2071 0
	movl	$128, (%eax)
.LVL2594:
.LBE10348:
.LBE10347:
	.loc 16 575 0
	ret	$4
	.cfi_endproc
.LFE458:
	.size	makeUserPDELargePageInvalid, .-makeUserPDELargePageInvalid
	.section	.text.unlikely
.LCOLDE480:
	.text
.LHOTE480:
	.section	.text.unlikely
.LCOLDB481:
	.text
.LHOTB481:
	.p2align 4,,15
	.globl	makeUserPDEPageTable
	.type	makeUserPDEPageTable, @function
makeUserPDEPageTable:
.LFB457:
	.loc 16 547 0
	.cfi_startproc
.LVL2595:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 16 547 0
	movl	24(%esp), %edx
.LVL2596:
	movl	20(%esp), %ebx
	movl	16(%esp), %eax
.LVL2597:
.LBB10355:
.LBB10356:
	.loc 11 842 0
	movl	%edx, %ecx
	andl	$2, %ecx
	shrl	%ecx
.LVL2598:
.LBE10356:
.LBE10355:
.LBB10357:
.LBB10358:
	.loc 11 1945 0
	testl	$4095, %ebx
	jne	.L2396
.LVL2599:
	.loc 11 1966 0
	andl	$1, %edx
.LVL2600:
	andl	$-4096, %ebx
.LVL2601:
	sall	$4, %ecx
.LVL2602:
	sall	$3, %edx
.LVL2603:
	orl	$7, %edx
	orl	%ebx, %edx
	orl	%ecx, %edx
	movl	%edx, (%eax)
.LVL2604:
.LBE10358:
.LBE10357:
	.loc 16 558 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret	$4
.LVL2605:
.L2396:
	.cfi_restore_state
.LBB10360:
.LBB10359:
	call	pde_pde_pt_new.part.111
.LVL2606:
.LBE10359:
.LBE10360:
	.cfi_endproc
.LFE457:
	.size	makeUserPDEPageTable, .-makeUserPDEPageTable
	.section	.text.unlikely
.LCOLDE481:
	.text
.LHOTE481:
	.section	.rodata.str1.4
	.align 4
.LC482:
	.string	"(capFBasePtr & ~0xfffff000u) == ((0 && (capFBasePtr & (1u << 31))) ? 0x0 : 0)"
	.section	.boot.text
.LCOLDB483:
.LHOTB483:
	.p2align 4,,15
	.globl	create_unmapped_it_frame_cap
	.type	create_unmapped_it_frame_cap, @function
create_unmapped_it_frame_cap:
.LFB454:
	.loc 16 515 0
	.cfi_startproc
.LVL2607:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
.LBB10365:
.LBB10366:
	.loc 16 495 0
	movl	24(%esp), %ecx
.LBE10366:
.LBE10365:
	.loc 16 515 0
	movl	20(%esp), %edx
.LVL2608:
	movl	16(%esp), %eax
.LBB10373:
.LBB10371:
	.loc 16 495 0
	testl	%ecx, %ecx
	setne	%cl
.LVL2609:
.LBB10367:
.LBB10368:
	.loc 11 2791 0
	testl	$4095, %edx
	jne	.L2400
	.loc 11 2806 0
	andl	$-4096, %edx
.LVL2610:
	movzbl	%cl, %ecx
.LVL2611:
	shrl	$8, %edx
	sall	$30, %ecx
.LVL2612:
	orl	$50331649, %edx
	movl	%ecx, 4(%eax)
.LVL2613:
	movl	%edx, (%eax)
.LBE10368:
.LBE10367:
.LBE10371:
.LBE10373:
	.loc 16 517 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret	$4
.LVL2614:
.L2400:
	.cfi_restore_state
.LBB10374:
.LBB10372:
.LBB10370:
.LBB10369:
	.loc 11 2791 0
	pushl	$__FUNCTION__.2465
	.cfi_def_cfa_offset 20
	pushl	$2791
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC482
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2615:
.LBE10369:
.LBE10370:
.LBE10372:
.LBE10374:
	.cfi_endproc
.LFE454:
	.size	create_unmapped_it_frame_cap, .-create_unmapped_it_frame_cap
.LCOLDE483:
.LHOTE483:
	.section	.text.unlikely
.LCOLDB484:
	.text
.LHOTB484:
	.p2align 4,,15
	.globl	makeUserPTEInvalid
	.type	makeUserPTEInvalid, @function
makeUserPTEInvalid:
.LFB461:
	.loc 16 610 0
	.cfi_startproc
.LVL2616:
	.loc 16 610 0
	movl	4(%esp), %eax
.LBB10377:
.LBB10378:
	.loc 11 70 0
	movl	$0, (%eax)
.LVL2617:
.LBE10378:
.LBE10377:
	.loc 16 624 0
	ret	$4
	.cfi_endproc
.LFE461:
	.size	makeUserPTEInvalid, .-makeUserPTEInvalid
	.section	.text.unlikely
.LCOLDE484:
	.text
.LHOTE484:
	.section	.text.unlikely
.LCOLDB485:
	.text
.LHOTB485:
	.p2align 4,,15
	.globl	unmapPage
	.type	unmapPage, @function
unmapPage:
.LFB549:
	.loc 20 709 0
	.cfi_startproc
.LVL2618:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 20 716 0
	leal	8(%esp), %eax
	pushl	36(%esp)
	.cfi_def_cfa_offset 36
	pushl	%eax
	.cfi_def_cfa_offset 40
	call	findVSpaceForASID
	.cfi_def_cfa_offset 36
.LVL2619:
	movl	16(%esp), %ebx
.LVL2620:
	.loc 20 717 0
	popl	%ecx
	.cfi_def_cfa_offset 32
	movl	8(%esp), %esi
	testl	%esi, %esi
	jne	.L2402
	.loc 20 721 0
	movl	32(%esp), %edx
	testl	%edx, %edx
	je	.L2405
	cmpl	$1, 32(%esp)
	jne	.L2423
.LVL2621:
.LBB10379:
.LBB10380:
	.loc 17 173 0
	movl	40(%esp), %eax
	shrl	$22, %eax
	leal	(%ebx,%eax,4), %ecx
.LVL2622:
.LBE10380:
.LBE10379:
.LBB10381:
.LBB10382:
	.loc 11 1937 0
	movl	(%ecx), %edx
.LVL2623:
.LBE10382:
.LBE10381:
	.loc 20 741 0
	testb	$-128, %dl
	jne	.L2424
.LVL2624:
.L2402:
	.loc 20 761 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL2625:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL2626:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL2627:
	.p2align 4,,10
	.p2align 3
.L2423:
	.cfi_restore_state
.LBB10383:
.LBB10384:
	.loc 16 688 0
	pushl	$__func__.6275
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	pushl	$688
	.cfi_def_cfa_offset 40
	pushl	$.LC122
	.cfi_def_cfa_offset 44
	pushl	$.LC123
	.cfi_def_cfa_offset 48
	call	_fail
.LVL2628:
	.p2align 4,,10
	.p2align 3
.L2405:
	.cfi_restore_state
.LBE10384:
.LBE10383:
	.loc 20 723 0
	movl	%esp, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	pushl	44(%esp)
	.cfi_def_cfa_offset 40
	pushl	%ebx
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	call	lookupPTSlot
	.cfi_def_cfa_offset 44
.LVL2629:
	movl	16(%esp), %edx
.LVL2630:
	.loc 20 724 0
	addl	$12, %esp
	.cfi_def_cfa_offset 32
	movl	(%esp), %eax
	testl	%eax, %eax
	jne	.L2402
.LVL2631:
.LBB10385:
.LBB10386:
	.loc 11 142 0
	movl	(%edx), %eax
.LVL2632:
.LBE10386:
.LBE10385:
	.loc 20 727 0
	testb	$1, %al
	je	.L2402
	.loc 20 727 0 is_stmt 0 discriminator 1
	movl	44(%esp), %edi
	andl	$-4096, %eax
	leal	536870912(%edi), %ecx
	cmpl	%eax, %ecx
	jne	.L2402
	.loc 20 732 0 is_stmt 1
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	%edx
	.cfi_def_cfa_offset 48
	call	makeUserPTEInvalid
	.cfi_def_cfa_offset 44
.LVL2633:
	.loc 20 733 0
	addl	$12, %esp
	.cfi_def_cfa_offset 32
	jmp	.L2407
.LVL2634:
	.p2align 4,,10
	.p2align 3
.L2424:
.LBB10387:
.LBB10388:
	.loc 11 2161 0
	je	.L2425
.LVL2635:
.LBE10388:
.LBE10387:
	.loc 20 742 0
	testb	$1, %dl
	je	.L2402
	.loc 20 741 0
	movl	44(%esp), %eax
.LVL2636:
	andl	$-2097152, %edx
	addl	$536870912, %eax
	cmpl	%edx, %eax
	jne	.L2402
	.loc 20 747 0
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	%ecx
	.cfi_def_cfa_offset 48
	call	makeUserPDELargePageInvalid
	.cfi_def_cfa_offset 44
.LVL2637:
	.loc 20 748 0
	addl	$12, %esp
	.cfi_def_cfa_offset 32
.LVL2638:
.L2407:
	.loc 20 756 0
	movl	ksCurThread, %eax
	.loc 20 757 0
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	.loc 20 756 0
	andl	$-1024, %eax
	movl	16(%eax), %esi
	movl	20(%eax), %edi
	.loc 20 757 0
	pushl	%edi
	.cfi_def_cfa_offset 44
.LVL2639:
	pushl	%esi
	.cfi_def_cfa_offset 48
	call	isValidNativeRoot
.LVL2640:
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	je	.L2402
	.loc 20 757 0 is_stmt 0 discriminator 1
	movl	%esi, %eax
	movl	%edi, %edx
	call	cap_get_capPtr
.LVL2641:
	cmpl	%ebx, %eax
	jne	.L2402
.LVL2642:
.LBB10390:
.LBB10391:
.LBB10392:
.LBB10393:
	.loc 50 45 0 is_stmt 1
	movl	40(%esp), %eax
#APP
# 45 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine.h" 1
	invlpg (%eax)
# 0 "" 2
.LVL2643:
#NO_APP
	jmp	.L2402
.LVL2644:
.L2425:
.LBE10393:
.LBE10392:
.LBE10391:
.LBE10390:
.LBB10394:
.LBB10389:
	call	pde_pde_large_ptr_get_present.part.153
.LVL2645:
.LBE10389:
.LBE10394:
	.cfi_endproc
.LFE549:
	.size	unmapPage, .-unmapPage
	.section	.text.unlikely
.LCOLDE485:
	.text
.LHOTE485:
	.section	.boot.text
.LCOLDB486:
.LHOTB486:
	.p2align 4,,15
	.globl	init_gdt
	.type	init_gdt, @function
init_gdt:
.LFB445:
	.loc 16 68 0
	.cfi_startproc
.LVL2646:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.loc 16 68 0
	movl	12(%esp), %edx
.LVL2647:
	movl	8(%esp), %eax
	.loc 16 139 0
	movl	%edx, %ecx
	movl	%edx, %ebx
	sall	$16, %ecx
	andl	$-16777216, %ebx
	.loc 16 72 0
	movl	$0, (%eax)
	.loc 16 139 0
	orl	$8299, %ecx
	.loc 16 72 0
	movl	$0, 4(%eax)
.LVL2648:
	.loc 16 139 0
	movl	%ecx, 40(%eax)
	movl	%edx, %ecx
	shrl	$16, %ecx
	.loc 16 75 0
	movl	$65535, 8(%eax)
	.loc 16 139 0
	movzbl	%cl, %edx
	.loc 16 75 0
	movl	$13605632, 12(%eax)
.LVL2649:
	.loc 16 139 0
	orl	%ebx, %edx
	.loc 16 91 0
	movl	$65535, 16(%eax)
	.loc 16 139 0
	orb	$137, %dh
	.loc 16 91 0
	movl	$13603584, 20(%eax)
	.loc 16 107 0
	movl	$65535, 24(%eax)
	movl	$13630208, 28(%eax)
	.loc 16 123 0
	movl	$65535, 32(%eax)
	movl	$13628160, 36(%eax)
.LVL2650:
	.loc 16 139 0
	movl	%edx, 44(%eax)
	.loc 16 154 0
	movl	$65535, 48(%eax)
	movl	$13628160, 52(%eax)
	.loc 16 170 0
	movl	$65535, 56(%eax)
	movl	$13628160, 60(%eax)
	.loc 16 184 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE445:
	.size	init_gdt, .-init_gdt
.LCOLDE486:
.LHOTE486:
	.section	.rodata.str1.4
	.align 4
.LC487:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/object/iospace.c"
	.section	.text.unlikely
.LCOLDB488:
	.text
.LHOTB488:
	.p2align 4,,15
	.type	lookup_vtd_context_slot, @function
lookup_vtd_context_slot:
.LFB608:
	.loc 3 47 0
	.cfi_startproc
.LVL2651:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
.LBB10425:
.LBB10426:
	.loc 11 2202 0
	movl	%eax, %ecx
	.loc 11 2203 0
	movzbl	%al, %esi
.LVL2652:
.LBE10426:
.LBE10425:
	.loc 3 47 0
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
.LVL2653:
.LBB10429:
.LBB10427:
	.loc 11 2203 0
	movl	%eax, %ebx
	.loc 11 2202 0
	andl	$14, %ecx
	.loc 11 2203 0
	andl	$15, %ebx
.LBE10427:
.LBE10429:
	.loc 3 47 0
	subl	$4, %esp
	.cfi_def_cfa_offset 16
.LBB10430:
.LBB10428:
	.loc 11 2203 0
	cmpl	$14, %ecx
	movl	%ebx, %ecx
	cmove	%esi, %ecx
.LVL2654:
.LBE10428:
.LBE10430:
	.loc 3 55 0
	cmpl	$13, %ecx
	je	.L2432
	cmpl	$15, %ecx
	je	.L2433
	cmpl	$1, %ecx
	je	.L2442
	.loc 3 69 0
	pushl	$__func__.7697
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$69
	.cfi_def_cfa_offset 24
	pushl	$.LC487
	.cfi_def_cfa_offset 28
	pushl	$.LC412
	.cfi_def_cfa_offset 32
	call	_fail
.LVL2655:
	.p2align 4,,10
	.p2align 3
.L2442:
	.cfi_restore_state
.LBB10431:
.LBB10432:
.LBB10433:
.LBB10434:
	.loc 11 2944 0
	cmpl	$1, %ebx
	jne	.L2443
.LVL2656:
.LBE10434:
.LBE10433:
	.loc 46 75 0
	andl	$201326592, %eax
.LVL2657:
	andl	$1072693248, %edx
.LVL2658:
	shrl	$16, %eax
	shrl	$20, %edx
	addl	%eax, %edx
.L2436:
.LVL2659:
	movl	%edx, %eax
.LBE10432:
.LBE10431:
	.loc 3 79 0
	movzbl	%dl, %edx
.LVL2660:
	shrl	$8, %eax
.LVL2661:
	sall	$4, %edx
	sall	$4, %eax
.LVL2662:
	addl	x86KSvtdRootTable, %eax
	movl	(%eax), %eax
	.loc 3 80 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	.loc 3 79 0
	andl	$-4096, %eax
	leal	-536870912(%eax,%edx), %eax
	.loc 3 80 0
	ret
.LVL2663:
	.p2align 4,,10
	.p2align 3
.L2433:
	.cfi_restore_state
.LBB10436:
.LBB10437:
	.loc 11 3564 0
	cmpl	$15, %esi
	jne	.L2444
.LVL2664:
.L2437:
	.loc 11 3567 0
	movzwl	%dx, %edx
.LVL2665:
.LBE10437:
.LBE10436:
	.loc 3 62 0
	jmp	.L2436
.LVL2666:
	.p2align 4,,10
	.p2align 3
.L2432:
.LBB10439:
.LBB10440:
	.loc 11 3333 0
	cmpl	$13, %ebx
	je	.L2437
	call	cap_io_space_cap_get_capPCIDevice.part.197
.LVL2667:
.L2443:
.LBE10440:
.LBE10439:
.LBB10441:
.LBB10435:
	call	cap_frame_cap_get_capFMappedASID.part.145
.LVL2668:
.L2444:
.LBE10435:
.LBE10441:
.LBB10442:
.LBB10438:
	.loc 11 3564 0
	pushl	$__FUNCTION__.2748
	.cfi_def_cfa_offset 20
	pushl	$3565
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC222
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2669:
.LBE10438:
.LBE10442:
	.cfi_endproc
.LFE608:
	.size	lookup_vtd_context_slot, .-lookup_vtd_context_slot
	.section	.text.unlikely
.LCOLDE488:
	.text
.LHOTE488:
	.section	.rodata.str1.1
.LC489:
	.string	"cte != 0"
	.section	.text.unlikely
.LCOLDB490:
	.text
.LHOTB490:
	.p2align 4,,15
	.globl	unmapVTDContextEntry
	.type	unmapVTDContextEntry, @function
unmapVTDContextEntry:
.LFB611:
	.loc 3 131 0
	.cfi_startproc
.LVL2670:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 3 132 0
	movl	16(%esp), %eax
	movl	20(%esp), %edx
	call	lookup_vtd_context_slot
.LVL2671:
	.loc 3 133 0
	testl	%eax, %eax
	je	.L2448
.LVL2672:
	.loc 3 143 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	.loc 3 134 0
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	$0, 8(%eax)
	movl	$0, 12(%eax)
	.loc 3 143 0
	pushl	$3
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	flushCacheRange
.LVL2673:
	.loc 3 144 0
	call	invalidate_iotlb
.LVL2674:
	.loc 3 145 0
	movl	ksCurThread, %eax
	movl	$2, 36(%esp)
	movl	%eax, 32(%esp)
	.loc 3 147 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	.loc 3 145 0
	jmp	setThreadState
.LVL2675:
.L2448:
	.cfi_def_cfa_offset 16
.LBB10447:
.LBB10448:
	.loc 3 133 0
	pushl	$__FUNCTION__.7717
	.cfi_def_cfa_offset 20
	pushl	$133
	.cfi_def_cfa_offset 24
	pushl	$.LC487
	.cfi_def_cfa_offset 28
	pushl	$.LC489
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2676:
.LBE10448:
.LBE10447:
	.cfi_endproc
.LFE611:
	.size	unmapVTDContextEntry, .-unmapVTDContextEntry
	.section	.text.unlikely
.LCOLDE490:
	.text
.LHOTE490:
	.section	.text.unlikely
.LCOLDB491:
	.text
.LHOTB491:
	.p2align 4,,15
	.globl	unmapIOPage
	.type	unmapIOPage, @function
unmapIOPage:
.LFB619:
	.loc 3 468 0
	.cfi_startproc
.LVL2677:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 3 468 0
	movl	32(%esp), %ebx
.LVL2678:
	movl	36(%esp), %esi
.LBB10469:
.LBB10470:
	.loc 11 2852 0
	movl	%ebx, %eax
	andl	$15, %eax
	cmpl	$1, %eax
	jne	.L2459
.LVL2679:
.LBE10470:
.LBE10469:
	.loc 3 475 0
	movl	%esi, %edx
	movl	%ebx, %eax
	call	lookup_vtd_context_slot
.LVL2680:
	movl	(%eax), %edx
.LVL2681:
	.loc 3 478 0
	testb	$1, %dl
	jne	.L2460
.LVL2682:
.L2449:
	.loc 3 501 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL2683:
	.p2align 4,,10
	.p2align 3
.L2460:
	.cfi_restore_state
.LBB10472:
.LBB10473:
	.loc 58 23 0
	andl	$-4096, %edx
.LVL2684:
.LBE10473:
.LBE10472:
.LBB10474:
.LBB10475:
	.loc 3 118 0
	subl	$536870912, %edx
.LVL2685:
	je	.L2449
	.loc 3 125 0
	movl	x86KSnumIOPTLevels, %eax
.LVL2686:
	.loc 3 124 0
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	movl	%esi, %ecx
	andl	$1048575, %ecx
	.loc 3 125 0
	subl	$1, %eax
	.loc 3 124 0
	pushl	%eax
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	leal	20(%esp), %eax
	call	lookupIOPTSlot_resolve_levels
.LVL2687:
.LBE10475:
.LBE10474:
	.loc 3 485 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	4(%esp), %edx
	testl	%edx, %edx
	jne	.L2449
	.loc 3 485 0 is_stmt 0 discriminator 1
	movl	12(%esp), %eax
	testl	%eax, %eax
	jne	.L2449
.LBB10477:
.LBB10476:
	.loc 3 124 0 is_stmt 1
	movl	8(%esp), %edx
.LVL2688:
.LBE10476:
.LBE10477:
	.loc 3 489 0
	andl	$16777200, %ebx
.LVL2689:
	sall	$8, %ebx
	addl	$536870912, %ebx
	movl	(%edx), %eax
	andl	$-4096, %eax
	cmpl	%eax, %ebx
	jne	.L2449
.LVL2690:
	.loc 3 499 0
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	.loc 3 493 0
	movl	$0, (%edx)
	movl	$0, 4(%edx)
	.loc 3 499 0
	pushl	$3
	.cfi_def_cfa_offset 44
	pushl	%edx
	.cfi_def_cfa_offset 48
	call	flushCacheRange
.LVL2691:
	.loc 3 501 0
	addl	$36, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL2692:
	.loc 3 500 0
	jmp	invalidate_iotlb
.LVL2693:
.L2459:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -12
	.cfi_offset 6, -8
.LBB10478:
.LBB10471:
	call	cap_frame_cap_get_capFMappedAddress.part.143
.LVL2694:
.LBE10471:
.LBE10478:
	.cfi_endproc
.LFE619:
	.size	unmapIOPage, .-unmapIOPage
	.section	.text.unlikely
.LCOLDE491:
	.text
.LHOTE491:
	.section	.text.unlikely
.LCOLDB492:
	.text
.LHOTB492:
	.p2align 4,,15
	.globl	performX86IOUnMapInvocation
	.type	performX86IOUnMapInvocation, @function
performX86IOUnMapInvocation:
.LFB620:
	.loc 3 505 0
	.cfi_startproc
.LVL2695:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$16, %esp
	.cfi_def_cfa_offset 24
	.loc 3 505 0
	movl	32(%esp), %ebx
	.loc 3 506 0
	pushl	4(%ebx)
	.cfi_def_cfa_offset 28
	pushl	(%ebx)
	.cfi_def_cfa_offset 32
	call	unmapIOPage
.LVL2696:
	movl	(%ebx), %eax
.LVL2697:
.LBB10489:
.LBB10490:
	.loc 11 2865 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	4(%ebx), %edx
.LVL2698:
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$1, %ecx
	jne	.L2465
.LVL2699:
.LBE10490:
.LBE10489:
	.loc 3 510 0
	andl	$-1811939329, %eax
.LVL2700:
.LBB10492:
.LBB10493:
.LBB10494:
	.loc 11 2844 0
	andl	$-1073741824, %edx
.LVL2701:
.LBE10494:
.LBE10493:
.LBE10492:
	.loc 3 510 0
	movl	%eax, (%ebx)
.LVL2702:
	.loc 3 513 0
	xorl	%eax, %eax
	.loc 3 510 0
	movl	%edx, 4(%ebx)
.LVL2703:
	.loc 3 513 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL2704:
.L2465:
	.cfi_restore_state
.LBB10495:
.LBB10491:
	call	cap_frame_cap_set_capFMappedAddress.part.182
.LVL2705:
.LBE10491:
.LBE10495:
	.cfi_endproc
.LFE620:
	.size	performX86IOUnMapInvocation, .-performX86IOUnMapInvocation
	.section	.text.unlikely
.LCOLDE492:
	.text
.LHOTE492:
	.section	.rodata.str1.4
	.align 4
.LC493:
	.string	"No mapping type for mapped cap"
	.section	.text.unlikely
.LCOLDB494:
	.text
.LHOTB494:
	.p2align 4,,15
	.globl	Mode_finaliseCap
	.type	Mode_finaliseCap, @function
Mode_finaliseCap:
.LFB488:
	.loc 18 60 0
	.cfi_startproc
.LVL2706:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	20(%esp), %edx
	.loc 18 60 0
	movl	16(%esp), %ebx
	movl	24(%esp), %eax
.LVL2707:
.LBB10520:
.LBB10521:
	.loc 11 2202 0
	movl	%edx, %edi
	.loc 11 2203 0
	movl	%edx, %esi
	movzbl	%dl, %ecx
	.loc 11 2202 0
	andl	$14, %edi
	.loc 11 2203 0
	andl	$15, %esi
	cmpl	$14, %edi
	cmovne	%esi, %ecx
.LVL2708:
.LBE10521:
.LBE10520:
	.loc 18 61 0
	cmpl	$1, %ecx
	jne	.L2479
.LVL2709:
.LBB10522:
.LBB10523:
.LBB10524:
.LBB10525:
	.loc 11 2944 0
	cmpl	$1, %esi
	jne	.L2483
.LVL2710:
.LBE10525:
.LBE10524:
	.loc 46 75 0
	movl	%edx, %ecx
	andl	$201326592, %ecx
	movl	%ecx, %esi
	movl	%eax, %ecx
	andl	$1072693248, %ecx
	shrl	$16, %esi
	shrl	$20, %ecx
.LBE10523:
.LBE10522:
	.loc 18 64 0
	addl	%esi, %ecx
	je	.L2472
	.loc 18 65 0
	movl	%edx, %esi
	andl	$1610612736, %esi
	shrl	$29, %esi
	cmpl	$1, %esi
	je	.L2474
	cmpl	$2, %esi
	jne	.L2484
	.loc 18 107 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	pushl	32(%esp)
	.cfi_def_cfa_offset 28
	pushl	32(%esp)
	.cfi_def_cfa_offset 32
	call	unmapIOPage
.LVL2711:
	.loc 18 108 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.LVL2712:
.L2472:
.LBB10527:
.LBB10528:
	.loc 11 2225 0
	movl	$0, (%ebx)
.LBE10528:
.LBE10527:
	.loc 18 122 0
	movl	%ebx, %eax
.LBB10530:
.LBB10529:
	.loc 11 2225 0
	movl	$0, 4(%ebx)
.LVL2713:
.LBE10529:
.LBE10530:
	.loc 18 122 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL2714:
	.p2align 4,,10
	.p2align 3
.L2474:
	.cfi_restore_state
	.loc 18 98 0
	andl	$16777200, %edx
	sall	$8, %edx
	pushl	%edx
	.cfi_def_cfa_offset 20
	movl	%eax, %edx
	andl	$1073741824, %eax
	sall	$12, %edx
	shrl	$30, %eax
	pushl	%edx
	.cfi_def_cfa_offset 24
	pushl	%ecx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	unmapPage
.LVL2715:
	.loc 18 104 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	jmp	.L2472
.LVL2716:
	.p2align 4,,10
	.p2align 3
.L2484:
	.loc 18 111 0
	pushl	$__func__.6465
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$111
	.cfi_def_cfa_offset 24
	pushl	$.LC130
	.cfi_def_cfa_offset 28
	pushl	$.LC493
	.cfi_def_cfa_offset 32
	call	_fail
.LVL2717:
.L2483:
	.cfi_restore_state
.LBB10531:
.LBB10526:
	call	cap_frame_cap_get_capFMappedASID.part.145
.LVL2718:
.L2479:
.LBE10526:
.LBE10531:
	.loc 18 118 0
	pushl	$__func__.6465
	.cfi_def_cfa_offset 20
	pushl	$118
	.cfi_def_cfa_offset 24
	pushl	$.LC130
	.cfi_def_cfa_offset 28
	pushl	$.LC146
	.cfi_def_cfa_offset 32
	call	_fail
.LVL2719:
	.cfi_endproc
.LFE488:
	.size	Mode_finaliseCap, .-Mode_finaliseCap
	.section	.text.unlikely
.LCOLDE494:
	.text
.LHOTE494:
	.section	.rodata.str1.4
	.align 4
.LC495:
	.string	"cap_frame_cap_get_capFMappedASID(frame_cap) != 0"
	.section	.boot.text
.LCOLDB496:
.LHOTB496:
	.p2align 4,,15
	.globl	map_it_frame_cap
	.type	map_it_frame_cap, @function
map_it_frame_cap:
.LFB472:
	.loc 17 138 0
	.cfi_startproc
.LVL2720:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	.loc 17 138 0
	movl	16(%esp), %edx
	movl	20(%esp), %esi
	movl	24(%esp), %eax
.LVL2721:
	movl	28(%esp), %ebx
.LVL2722:
.LBB10591:
.LBB10592:
.LBB10593:
.LBB10594:
	.loc 11 2202 0
	movl	%edx, %ecx
	andl	$14, %ecx
	cmpl	$14, %ecx
	je	.L2486
	.loc 11 2203 0
	movl	%edx, %ecx
	andl	$15, %ecx
.LVL2723:
.LBE10594:
.LBE10593:
	.loc 54 387 0
	cmpl	$14, %ecx
	ja	.L2487
	jmp	*.L2489(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L2489:
	.long	.L2487
	.long	.L2487
	.long	.L2491
	.long	.L2487
	.long	.L2538
	.long	.L2487
	.long	.L2491
	.long	.L2487
	.long	.L2527
	.long	.L2487
	.long	.L2493
	.long	.L2487
	.long	.L2494
	.long	.L2487
	.long	.L2527
	.section	.boot.text
	.p2align 4,,10
	.p2align 3
.L2491:
	.loc 54 395 0
	movl	%edx, %esi
.LVL2724:
.L2538:
	andl	$-16, %esi
.LVL2725:
.L2492:
.LBE10592:
.LBE10591:
.LBB10641:
.LBB10642:
	.loc 11 2996 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$1, %edx
	jne	.L2521
	.loc 11 2999 0
	movl	%eax, %edx
.LBE10642:
.LBE10641:
.LBB10645:
.LBB10646:
	.loc 11 2855 0
	movl	%ebx, %ecx
.LBE10646:
.LBE10645:
	.loc 17 144 0
	andl	$201326592, %eax
.LVL2726:
	andl	$1072693248, %ebx
.LBB10648:
.LBB10643:
	.loc 11 2999 0
	andl	$16777200, %edx
.LVL2727:
.LBE10643:
.LBE10648:
	.loc 17 144 0
	shrl	$16, %eax
	shrl	$20, %ebx
.LBB10649:
.LBB10644:
	.loc 11 2999 0
	sall	$8, %edx
.LVL2728:
.LBE10644:
.LBE10649:
.LBB10650:
.LBB10647:
	.loc 11 2855 0
	sall	$12, %ecx
.LBE10647:
.LBE10650:
	.loc 17 144 0
	addl	%ebx, %eax
	je	.L2544
.LVL2729:
.LBB10651:
.LBB10652:
	.loc 11 1986 0
	movl	%ecx, %eax
	shrl	$22, %eax
	movl	(%esi,%eax,4), %eax
	testb	$-128, %al
	jne	.L2545
.LVL2730:
.LBE10652:
.LBE10651:
	.loc 17 147 0
	andl	$4194303, %ecx
.LVL2731:
	addl	$536870912, %edx
.LVL2732:
	andl	$-4096, %eax
	shrl	$12, %ecx
	orl	$7, %edx
.LVL2733:
	movl	%edx, -536870912(%eax,%ecx,4)
.LVL2734:
.LBB10654:
.LBB10655:
.LBB10656:
	.loc 50 45 0
	xorl	%eax, %eax
#APP
# 45 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine.h" 1
	invlpg (%eax)
# 0 "" 2
.LVL2735:
#NO_APP
.LBE10656:
.LBE10655:
.LBE10654:
	.loc 17 161 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
.LVL2736:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL2737:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL2738:
	ret
.LVL2739:
	.p2align 4,,10
	.p2align 3
.L2486:
	.cfi_restore_state
.LBB10657:
.LBB10639:
.LBB10596:
.LBB10595:
	.loc 11 2204 0
	movzbl	%dl, %ecx
.LVL2740:
.LBE10595:
.LBE10596:
	.loc 54 387 0
	cmpl	$62, %ecx
	ja	.L2487
	jmp	*.L2496(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L2496:
	.long	.L2487
	.long	.L2487
	.long	.L2495
	.long	.L2487
	.long	.L2497
	.long	.L2487
	.long	.L2498
	.long	.L2487
	.long	.L2527
	.long	.L2487
	.long	.L2499
	.long	.L2487
	.long	.L2500
	.long	.L2487
	.long	.L2527
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2527
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2501
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2487
	.long	.L2527
	.section	.boot.text
	.p2align 4,,10
	.p2align 3
.L2527:
.LBB10597:
.LBB10598:
	.loc 55 280 0
	xorl	%esi, %esi
.LVL2741:
	jmp	.L2492
.LVL2742:
	.p2align 4,,10
	.p2align 3
.L2493:
.LBE10598:
.LBE10597:
	.loc 54 398 0
	movl	%edx, %esi
.LVL2743:
	andl	$-32, %esi
	jmp	.L2492
.LVL2744:
	.p2align 4,,10
	.p2align 3
.L2494:
	.loc 54 401 0
	movl	%edx, %esi
.LVL2745:
	andl	$-1024, %esi
	jmp	.L2492
.LVL2746:
	.p2align 4,,10
	.p2align 3
.L2487:
.LBB10618:
.LBB10615:
	.loc 55 268 0
	cmpl	$31, %ecx
	ja	.L2506
	jmp	*.L2508(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L2508:
	.long	.L2506
	.long	.L2507
	.long	.L2506
	.long	.L2509
	.long	.L2506
	.long	.L2510
	.long	.L2506
	.long	.L2506
	.long	.L2506
	.long	.L2527
	.long	.L2506
	.long	.L2511
	.long	.L2506
	.long	.L2527
	.long	.L2506
	.long	.L2512
	.long	.L2506
	.long	.L2506
	.long	.L2506
	.long	.L2506
	.long	.L2506
	.long	.L2506
	.long	.L2506
	.long	.L2506
	.long	.L2506
	.long	.L2506
	.long	.L2506
	.long	.L2506
	.long	.L2506
	.long	.L2506
	.long	.L2506
	.long	.L2527
	.section	.boot.text
	.p2align 4,,10
	.p2align 3
.L2501:
.LVL2747:
.LBE10615:
.LBE10618:
.LBB10619:
.LBB10620:
.LBB10621:
.LBB10622:
.LBB10623:
.LBB10624:
	.loc 11 3437 0
	andl	$16128, %edx
.LVL2748:
	movl	%edx, %ecx
.LBE10624:
.LBE10623:
	.loc 54 103 0
	movl	$-32, %edx
.LBB10626:
.LBB10625:
	.loc 11 3437 0
	shrl	$8, %ecx
.LVL2749:
.LBE10625:
.LBE10626:
	.loc 54 103 0
	cmpl	$32, %ecx
	je	.L2523
	andl	$31, %ecx
	movl	$-1, %edx
	addl	$1, %ecx
	sall	%cl, %edx
.L2523:
.LVL2750:
.LBE10622:
.LBE10621:
.LBE10620:
.LBE10619:
	.loc 54 404 0
	andl	%edx, %esi
.LVL2751:
	jmp	.L2492
.LVL2752:
	.p2align 4,,10
	.p2align 3
.L2495:
.LBB10627:
.LBB10628:
	.loc 11 2320 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$2, %ecx
	je	.L2491
	call	cap_untyped_cap_get_capPtr.isra.115.part.116
.LVL2753:
	.p2align 4,,10
	.p2align 3
.L2497:
.LBE10628:
.LBE10627:
.LBB10629:
.LBB10630:
	.loc 11 2358 0
	andl	$15, %edx
.LVL2754:
	cmpl	$4, %edx
	je	.L2538
	call	cap_endpoint_cap_get_capEPPtr.part.117
.LVL2755:
	.p2align 4,,10
	.p2align 3
.L2498:
.LBE10630:
.LBE10629:
.LBB10631:
.LBB10632:
	.loc 11 2576 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$6, %ecx
	je	.L2491
	call	cap_notification_cap_get_capNtfnPtr.isra.97.part.98
.LVL2756:
	.p2align 4,,10
	.p2align 3
.L2499:
.LBE10632:
.LBE10631:
.LBB10633:
.LBB10634:
	.loc 11 2738 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$10, %ecx
	je	.L2493
	call	cap_cnode_cap_get_capCNodePtr.isra.118.part.119
.LVL2757:
	.p2align 4,,10
	.p2align 3
.L2500:
.LBE10634:
.LBE10633:
.LBB10635:
.LBB10636:
	.loc 11 2768 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$12, %ecx
	je	.L2494
	call	cap_thread_cap_get_capTCBPtr.isra.89.part.90
.LVL2758:
	.p2align 4,,10
	.p2align 3
.L2511:
.LBE10636:
.LBE10635:
.LBB10637:
.LBB10616:
.LBB10599:
.LBB10600:
	.loc 11 3287 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$11, %ecx
	jne	.L2546
.LVL2759:
.L2517:
.LBE10600:
.LBE10599:
	.loc 55 294 0
	andl	$16777200, %edx
.LVL2760:
	movl	%edx, %esi
.LVL2761:
	sall	$8, %esi
	jmp	.L2492
.LVL2762:
	.p2align 4,,10
	.p2align 3
.L2512:
.LBB10602:
.LBB10603:
	.loc 11 3590 0
	cmpb	$15, %dl
	jne	.L2547
.LVL2763:
.LBE10603:
.LBE10602:
	.loc 55 287 0
	andl	$268435200, %edx
.LVL2764:
	movl	%edx, %esi
.LVL2765:
	sall	$4, %esi
	jmp	.L2492
.LVL2766:
	.p2align 4,,10
	.p2align 3
.L2509:
.LBB10605:
.LBB10606:
	.loc 11 3123 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$3, %ecx
	je	.L2517
	call	cap_page_table_cap_get_capPTBasePtr.isra.127.part.128
.LVL2767:
	.p2align 4,,10
	.p2align 3
.L2510:
.LBE10606:
.LBE10605:
.LBB10607:
.LBB10608:
	.loc 11 3227 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$5, %ecx
	je	.L2517
	call	cap_page_directory_cap_get_capPDBasePtr.isra.129.part.130
.LVL2768:
	.p2align 4,,10
	.p2align 3
.L2507:
.LBE10608:
.LBE10607:
.LBB10609:
.LBB10610:
	.loc 11 2996 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$1, %ecx
	je	.L2517
.LVL2769:
.L2521:
	call	cap_frame_cap_get_capFBasePtr.isra.125.part.126
.LVL2770:
	.p2align 4,,10
	.p2align 3
.L2506:
.LBE10610:
.LBE10609:
.LBB10611:
.LBB10612:
	.loc 46 134 0
	pushl	$__func__.3040
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$134
	.cfi_def_cfa_offset 24
	pushl	$.LC145
	.cfi_def_cfa_offset 28
	pushl	$.LC226
	.cfi_def_cfa_offset 32
	call	_fail
.LVL2771:
.L2545:
	.cfi_restore_state
.LBE10612:
.LBE10611:
.LBE10616:
.LBE10637:
.LBE10639:
.LBE10657:
.LBB10658:
.LBB10653:
	call	pde_pde_pt_ptr_get_pt_base_address.part.148
.LVL2772:
.L2544:
.LBE10653:
.LBE10658:
	.loc 17 144 0 discriminator 1
	pushl	$__FUNCTION__.6336
	.cfi_remember_state
	.cfi_def_cfa_offset 20
.LVL2773:
	pushl	$144
	.cfi_def_cfa_offset 24
.LVL2774:
	pushl	$.LC127
	.cfi_def_cfa_offset 28
.LVL2775:
	pushl	$.LC495
	.cfi_def_cfa_offset 32
.LVL2776:
	call	_assert_fail
.LVL2777:
.L2546:
	.cfi_restore_state
.LBB10659:
.LBB10640:
.LBB10638:
.LBB10617:
.LBB10613:
.LBB10601:
	call	cap_asid_pool_cap_get_capASIDPool.isra.134.part.135
.LVL2778:
.L2547:
.LBE10601:
.LBE10613:
.LBB10614:
.LBB10604:
	call	cap_io_page_table_cap_get_capIOPTBasePtr.isra.132.part.133
.LVL2779:
.LBE10604:
.LBE10614:
.LBE10617:
.LBE10638:
.LBE10640:
.LBE10659:
	.cfi_endproc
.LFE472:
	.size	map_it_frame_cap, .-map_it_frame_cap
.LCOLDE496:
.LHOTE496:
	.section	.rodata.str1.4
	.align 4
.LC497:
	.string	"(capFMappedAddress & ~0xfffff000u) == ((0 && (capFMappedAddress & (1u << 31))) ? 0x0 : 0)"
	.section	.boot.text
.LCOLDB498:
.LHOTB498:
	.p2align 4,,15
	.globl	create_mapped_it_frame_cap
	.type	create_mapped_it_frame_cap, @function
create_mapped_it_frame_cap:
.LFB455:
	.loc 16 521 0
	.cfi_startproc
.LVL2780:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	.loc 16 521 0
	movl	52(%esp), %ecx
.LBB10664:
.LBB10665:
	.loc 16 495 0
	movl	56(%esp), %eax
.LBE10665:
.LBE10664:
	.loc 16 521 0
	movl	48(%esp), %ebp
	movl	32(%esp), %esi
.LBB10676:
.LBB10672:
	.loc 16 507 0
	movl	%ecx, %ebx
.LBE10672:
.LBE10676:
	.loc 16 521 0
	movl	44(%esp), %edi
.LVL2781:
.LBB10677:
.LBB10673:
	.loc 16 495 0
	testl	%eax, %eax
	setne	%dl
.LVL2782:
	.loc 16 507 0
	shrl	$10, %ebx
.LVL2783:
.LBB10666:
.LBB10667:
	.loc 11 2786 0
	testl	$4095, %ebp
	jne	.L2552
	.loc 11 2791 0
	testl	$4095, %edi
	jne	.L2553
	movzbl	%dl, %edx
.LVL2784:
	.loc 11 2800 0
	andl	$3, %ebx
.LVL2785:
	.loc 11 2804 0
	andl	$1023, %ecx
.LVL2786:
	.loc 11 2800 0
	sall	$26, %ebx
.LVL2787:
	andl	$-4096, %edi
.LVL2788:
	.loc 11 2804 0
	sall	$30, %edx
.LVL2789:
	sall	$20, %ecx
.LVL2790:
	.loc 11 2800 0
	movl	%ebx, %eax
.LVL2791:
	movl	%edi, %ebx
	.loc 11 2804 0
	orl	%edx, %ecx
	movl	%ebp, %edx
	.loc 11 2800 0
	orl	$587202561, %eax
	.loc 11 2804 0
	shrl	$12, %edx
	.loc 11 2800 0
	shrl	$8, %ebx
	orl	%eax, %ebx
.LVL2792:
	.loc 11 2804 0
	orl	%edx, %ecx
.LVL2793:
.LBE10667:
.LBE10666:
.LBE10673:
.LBE10677:
	.loc 16 523 0
	pushl	%ecx
	.cfi_def_cfa_offset 36
.LBB10678:
.LBB10674:
.LBB10670:
.LBB10668:
	.loc 11 2804 0
	movl	%ecx, %edi
.LVL2794:
.LBE10668:
.LBE10670:
.LBE10674:
.LBE10678:
	.loc 16 523 0
	pushl	%ebx
	.cfi_def_cfa_offset 40
	pushl	48(%esp)
	.cfi_def_cfa_offset 44
	pushl	48(%esp)
	.cfi_def_cfa_offset 48
	call	map_it_frame_cap
.LVL2795:
	.loc 16 525 0
	movl	%esi, %eax
	.loc 16 524 0
	movl	%ebx, (%esi)
	movl	%edi, 4(%esi)
.LVL2796:
	.loc 16 525 0
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL2797:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret	$4
.LVL2798:
.L2552:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -20
	.cfi_offset 5, -8
	.cfi_offset 6, -16
	.cfi_offset 7, -12
.LBB10679:
.LBB10675:
.LBB10671:
.LBB10669:
	.loc 11 2786 0
	pushl	$__FUNCTION__.2465
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	pushl	$2786
	.cfi_def_cfa_offset 40
	pushl	$.LC154
	.cfi_def_cfa_offset 44
	pushl	$.LC497
	.cfi_def_cfa_offset 48
	call	_assert_fail
.LVL2799:
.L2553:
	.cfi_restore_state
	.loc 11 2791 0
	pushl	$__FUNCTION__.2465
	.cfi_def_cfa_offset 36
	pushl	$2791
	.cfi_def_cfa_offset 40
	pushl	$.LC154
	.cfi_def_cfa_offset 44
	pushl	$.LC482
	.cfi_def_cfa_offset 48
	call	_assert_fail
.LVL2800:
.LBE10669:
.LBE10671:
.LBE10675:
.LBE10679:
	.cfi_endproc
.LFE455:
	.size	create_mapped_it_frame_cap, .-create_mapped_it_frame_cap
.LCOLDE498:
.LHOTE498:
.LCOLDB499:
.LHOTB499:
	.p2align 4,,15
	.globl	create_bi_frame_cap
	.type	create_bi_frame_cap, @function
create_bi_frame_cap:
.LFB653:
	.loc 30 235 0
	.cfi_startproc
.LVL2801:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 30 235 0
	movl	32(%esp), %ebx
	.loc 30 239 0
	leal	8(%esp), %eax
	.loc 30 235 0
	movl	36(%esp), %esi
	.loc 30 239 0
	pushl	$0
	.cfi_def_cfa_offset 36
	pushl	$0
	.cfi_def_cfa_offset 40
	pushl	$1
	.cfi_def_cfa_offset 44
	pushl	64(%esp)
	.cfi_def_cfa_offset 48
	pushl	64(%esp)
	.cfi_def_cfa_offset 52
	pushl	64(%esp)
	.cfi_def_cfa_offset 56
	pushl	64(%esp)
	.cfi_def_cfa_offset 60
	pushl	%eax
	.cfi_def_cfa_offset 64
	call	create_mapped_it_frame_cap
	.cfi_def_cfa_offset 60
.LVL2802:
.LBB10718:
.LBB10719:
.LBB10720:
.LBB10721:
	.loc 11 2202 0
	movl	%ebx, %ecx
	andl	$14, %ecx
.LBE10721:
.LBE10720:
.LBE10719:
.LBE10718:
	.loc 30 239 0
	movl	36(%esp), %eax
.LVL2803:
	movl	40(%esp), %edx
.LVL2804:
.LBB10766:
.LBB10764:
.LBB10724:
.LBB10722:
	.loc 11 2202 0
	addl	$28, %esp
	.cfi_def_cfa_offset 32
	cmpl	$14, %ecx
	je	.L2555
	.loc 11 2203 0
	movl	%ebx, %ecx
	andl	$15, %ecx
.LVL2805:
.LBE10722:
.LBE10724:
	.loc 54 387 0
	cmpl	$14, %ecx
	ja	.L2556
	jmp	*.L2558(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L2558:
	.long	.L2556
	.long	.L2556
	.long	.L2560
	.long	.L2556
	.long	.L2559
	.long	.L2556
	.long	.L2560
	.long	.L2556
	.long	.L2591
	.long	.L2556
	.long	.L2562
	.long	.L2556
	.long	.L2563
	.long	.L2556
	.long	.L2591
	.section	.boot.text
	.p2align 4,,10
	.p2align 3
.L2560:
	andl	$-16, %ebx
.LVL2806:
	addl	$144, %ebx
.LVL2807:
.L2561:
.LBE10764:
.LBE10766:
	.loc 30 240 0
	subl	$4, %esp
	.cfi_def_cfa_offset 36
.LVL2808:
	pushl	%edx
	.cfi_def_cfa_offset 40
.LVL2809:
	pushl	%eax
	.cfi_def_cfa_offset 44
.LVL2810:
	pushl	%ebx
	.cfi_def_cfa_offset 48
.LVL2811:
	call	write_slot
.LVL2812:
	.loc 30 241 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
.LVL2813:
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
.LVL2814:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL2815:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL2816:
	ret
.LVL2817:
	.p2align 4,,10
	.p2align 3
.L2555:
	.cfi_restore_state
.LBB10767:
.LBB10765:
.LBB10725:
.LBB10723:
	.loc 11 2204 0
	movzbl	%bl, %ecx
.LVL2818:
.LBE10723:
.LBE10725:
	.loc 54 387 0
	cmpl	$62, %ecx
	ja	.L2556
	jmp	*.L2565(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L2565:
	.long	.L2556
	.long	.L2556
	.long	.L2564
	.long	.L2556
	.long	.L2566
	.long	.L2556
	.long	.L2567
	.long	.L2556
	.long	.L2591
	.long	.L2556
	.long	.L2568
	.long	.L2556
	.long	.L2569
	.long	.L2556
	.long	.L2591
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2591
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2570
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2556
	.long	.L2591
	.section	.boot.text
	.p2align 4,,10
	.p2align 3
.L2591:
.LBB10726:
.LBB10727:
	.loc 55 268 0
	movl	$144, %ebx
.LVL2819:
	jmp	.L2561
.LVL2820:
	.p2align 4,,10
	.p2align 3
.L2563:
	andl	$-1024, %ebx
.LVL2821:
	addl	$144, %ebx
	jmp	.L2561
	.p2align 4,,10
	.p2align 3
.L2559:
.LVL2822:
	andl	$-16, %esi
.LVL2823:
	leal	144(%esi), %ebx
	jmp	.L2561
.LVL2824:
	.p2align 4,,10
	.p2align 3
.L2562:
	andl	$-32, %ebx
.LVL2825:
	addl	$144, %ebx
	jmp	.L2561
.LVL2826:
	.p2align 4,,10
	.p2align 3
.L2556:
	cmpl	$31, %ecx
	ja	.L2575
	jmp	*.L2577(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L2577:
	.long	.L2575
	.long	.L2576
	.long	.L2575
	.long	.L2578
	.long	.L2575
	.long	.L2579
	.long	.L2575
	.long	.L2575
	.long	.L2575
	.long	.L2591
	.long	.L2575
	.long	.L2580
	.long	.L2575
	.long	.L2591
	.long	.L2575
	.long	.L2581
	.long	.L2575
	.long	.L2575
	.long	.L2575
	.long	.L2575
	.long	.L2575
	.long	.L2575
	.long	.L2575
	.long	.L2575
	.long	.L2575
	.long	.L2575
	.long	.L2575
	.long	.L2575
	.long	.L2575
	.long	.L2575
	.long	.L2575
	.long	.L2591
	.section	.boot.text
	.p2align 4,,10
	.p2align 3
.L2570:
.LVL2827:
.LBE10727:
.LBE10726:
.LBB10745:
.LBB10746:
.LBB10747:
.LBB10748:
.LBB10749:
.LBB10750:
	.loc 11 3437 0
	andl	$16128, %ebx
.LVL2828:
.LBE10750:
.LBE10749:
	.loc 54 103 0
	movl	$-32, %ecx
.LBB10752:
.LBB10751:
	.loc 11 3437 0
	shrl	$8, %ebx
.LVL2829:
.LBE10751:
.LBE10752:
	.loc 54 103 0
	cmpl	$32, %ebx
	je	.L2587
	andl	$31, %ebx
	leal	1(%ebx), %ecx
	movl	$-1, %ebx
	sall	%cl, %ebx
	movl	%ebx, %ecx
.L2587:
.LVL2830:
	andl	%ecx, %esi
.LVL2831:
	leal	144(%esi), %ebx
	jmp	.L2561
.LVL2832:
	.p2align 4,,10
	.p2align 3
.L2569:
.LBE10748:
.LBE10747:
.LBE10746:
.LBE10745:
.LBB10753:
.LBB10754:
	.loc 11 2768 0
	movl	%ebx, %ecx
	andl	$15, %ecx
	cmpl	$12, %ecx
	je	.L2563
	call	cap_thread_cap_get_capTCBPtr.isra.89.part.90
.LVL2833:
	.p2align 4,,10
	.p2align 3
.L2564:
.LBE10754:
.LBE10753:
.LBB10755:
.LBB10756:
	.loc 11 2320 0
	movl	%ebx, %ecx
	andl	$15, %ecx
	cmpl	$2, %ecx
	je	.L2560
	call	cap_untyped_cap_get_capPtr.isra.115.part.116
.LVL2834:
	.p2align 4,,10
	.p2align 3
.L2566:
.LBE10756:
.LBE10755:
.LBB10757:
.LBB10758:
	.loc 11 2358 0
	andl	$15, %ebx
.LVL2835:
	cmpl	$4, %ebx
	je	.L2559
	call	cap_endpoint_cap_get_capEPPtr.part.117
.LVL2836:
	.p2align 4,,10
	.p2align 3
.L2567:
.LBE10758:
.LBE10757:
.LBB10759:
.LBB10760:
	.loc 11 2576 0
	movl	%ebx, %ecx
	andl	$15, %ecx
	cmpl	$6, %ecx
	je	.L2560
	call	cap_notification_cap_get_capNtfnPtr.isra.97.part.98
.LVL2837:
	.p2align 4,,10
	.p2align 3
.L2568:
.LBE10760:
.LBE10759:
.LBB10761:
.LBB10762:
	.loc 11 2738 0
	movl	%ebx, %ecx
	andl	$15, %ecx
	cmpl	$10, %ecx
	je	.L2562
	call	cap_cnode_cap_get_capCNodePtr.isra.118.part.119
.LVL2838:
	.p2align 4,,10
	.p2align 3
.L2580:
.LBE10762:
.LBE10761:
.LBB10763:
.LBB10744:
.LBB10728:
.LBB10729:
	.loc 11 3287 0
	movl	%ebx, %ecx
	andl	$15, %ecx
	cmpl	$11, %ecx
	jne	.L2604
.LVL2839:
.L2586:
	andl	$16777200, %ebx
.LVL2840:
	sall	$8, %ebx
	addl	$144, %ebx
	jmp	.L2561
.LVL2841:
	.p2align 4,,10
	.p2align 3
.L2581:
.LBE10729:
.LBE10728:
.LBB10731:
.LBB10732:
	.loc 11 3590 0
	cmpb	$15, %bl
	jne	.L2605
.LVL2842:
	andl	$268435200, %ebx
.LVL2843:
	sall	$4, %ebx
	addl	$144, %ebx
	jmp	.L2561
.LVL2844:
	.p2align 4,,10
	.p2align 3
.L2579:
.LBE10732:
.LBE10731:
.LBB10734:
.LBB10735:
	.loc 11 3227 0
	movl	%ebx, %ecx
	andl	$15, %ecx
	cmpl	$5, %ecx
	je	.L2586
	call	cap_page_directory_cap_get_capPDBasePtr.isra.129.part.130
.LVL2845:
	.p2align 4,,10
	.p2align 3
.L2576:
.LBE10735:
.LBE10734:
.LBB10736:
.LBB10737:
	.loc 11 2996 0
	movl	%ebx, %ecx
	andl	$15, %ecx
	cmpl	$1, %ecx
	je	.L2586
	call	cap_frame_cap_get_capFBasePtr.isra.125.part.126
.LVL2846:
	.p2align 4,,10
	.p2align 3
.L2578:
.LBE10737:
.LBE10736:
.LBB10738:
.LBB10739:
	.loc 11 3123 0
	movl	%ebx, %ecx
	andl	$15, %ecx
	cmpl	$3, %ecx
	je	.L2586
	call	cap_page_table_cap_get_capPTBasePtr.isra.127.part.128
.LVL2847:
	.p2align 4,,10
	.p2align 3
.L2575:
.LBE10739:
.LBE10738:
.LBB10740:
.LBB10741:
	.loc 46 134 0
	pushl	$__func__.3040
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	pushl	$134
	.cfi_def_cfa_offset 40
	pushl	$.LC145
	.cfi_def_cfa_offset 44
	pushl	$.LC226
	.cfi_def_cfa_offset 48
	call	_fail
.LVL2848:
.L2605:
	.cfi_restore_state
.LBE10741:
.LBE10740:
.LBB10742:
.LBB10733:
	call	cap_io_page_table_cap_get_capIOPTBasePtr.isra.132.part.133
.LVL2849:
.L2604:
.LBE10733:
.LBE10742:
.LBB10743:
.LBB10730:
	call	cap_asid_pool_cap_get_capASIDPool.isra.134.part.135
.LVL2850:
.LBE10730:
.LBE10743:
.LBE10744:
.LBE10763:
.LBE10765:
.LBE10767:
	.cfi_endproc
.LFE653:
	.size	create_bi_frame_cap, .-create_bi_frame_cap
.LCOLDE499:
.LHOTE499:
	.section	.text.unlikely
.LCOLDB500:
	.text
.LHOTB500:
	.p2align 4,,15
	.globl	deleteIOPageTable
	.type	deleteIOPageTable, @function
deleteIOPageTable:
.LFB618:
	.loc 3 413 0
	.cfi_startproc
.LVL2851:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 3 413 0
	movl	32(%esp), %ebx
	movl	36(%esp), %esi
.LVL2852:
.LBB10796:
.LBB10797:
	.loc 11 3486 0
	cmpb	$15, %bl
	jne	.L2620
.LBE10797:
.LBE10796:
	.loc 3 420 0
	testl	%esi, %esi
	jns	.L2606
.LVL2853:
	.loc 3 423 0
	movl	%esi, %edx
	movl	%ebx, %eax
	andl	$2147483647, %edx
.LVL2854:
	call	lookup_vtd_context_slot
.LVL2855:
	movl	(%eax), %edx
.LVL2856:
	.loc 3 425 0
	testb	$1, %dl
	jne	.L2621
.LVL2857:
.L2606:
	.loc 3 465 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL2858:
	ret
.LVL2859:
	.p2align 4,,10
	.p2align 3
.L2621:
	.cfi_restore_state
.LBB10799:
.LBB10800:
	.loc 11 3515 0
	movl	%esi, %ecx
.LBE10800:
.LBE10799:
.LBB10802:
.LBB10803:
	.loc 61 98 0
	andl	$-4096, %edx
.LBE10803:
.LBE10802:
.LBB10804:
.LBB10801:
	.loc 11 3515 0
	andl	$2013265920, %ecx
.LBE10801:
.LBE10804:
	.loc 3 431 0
	shrl	$27, %ecx
	je	.L2622
.LVL2860:
	.loc 3 447 0
	leal	-1(%ecx), %eax
.LVL2861:
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	movl	%esi, %ecx
	pushl	%eax
	.cfi_def_cfa_offset 44
	andl	$134152192, %ecx
	subl	$536870912, %edx
	pushl	%eax
	.cfi_def_cfa_offset 48
	shrl	$7, %ecx
	leal	20(%esp), %eax
	call	lookupIOPTSlot_resolve_levels
.LVL2862:
	.loc 3 450 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	4(%esp), %edx
	testl	%edx, %edx
	jne	.L2606
	.loc 3 450 0 is_stmt 0 discriminator 1
	movl	12(%esp), %eax
	testl	%eax, %eax
	jne	.L2606
	.loc 3 447 0 is_stmt 1
	movl	8(%esp), %ecx
.LVL2863:
	.loc 3 453 0
	andl	$268435200, %ebx
.LVL2864:
	sall	$4, %ebx
	leal	536870912(%ebx), %eax
	movl	(%ecx), %edx
	andl	$-4096, %edx
	cmpl	%edx, %eax
	jne	.L2606
.LVL2865:
	.loc 3 461 0
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	.loc 3 456 0
	movl	$0, (%ecx)
	movl	$0, 4(%ecx)
	.loc 3 461 0
	pushl	$3
	.cfi_def_cfa_offset 44
	pushl	%ecx
	.cfi_def_cfa_offset 48
	call	flushCacheRange
.LVL2866:
	addl	$16, %esp
	.cfi_def_cfa_offset 32
.LVL2867:
.L2611:
	.loc 3 465 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL2868:
	.loc 3 463 0
	jmp	invalidate_iotlb
.LVL2869:
	.p2align 4,,10
	.p2align 3
.L2622:
	.cfi_restore_state
	.loc 3 433 0
	andl	$268435200, %ebx
.LVL2870:
	sall	$4, %ebx
	addl	$536870912, %ebx
	cmpl	%ebx, %edx
	jne	.L2606
.LVL2871:
	.loc 3 444 0
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	.loc 3 436 0
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	$0, 8(%eax)
	movl	$0, 12(%eax)
	.loc 3 444 0
	pushl	$3
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	call	flushCacheRange
.LVL2872:
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	jmp	.L2611
.LVL2873:
.L2620:
.LBB10805:
.LBB10798:
	call	cap_io_page_table_cap_get_capIOPTIsMapped.part.199
.LVL2874:
.LBE10798:
.LBE10805:
	.cfi_endproc
.LFE618:
	.size	deleteIOPageTable, .-deleteIOPageTable
	.section	.text.unlikely
.LCOLDE500:
	.text
.LHOTE500:
	.section	.text.unlikely
.LCOLDB501:
	.text
.LHOTB501:
	.p2align 4,,15
	.globl	Arch_finaliseCap
	.type	Arch_finaliseCap, @function
Arch_finaliseCap:
.LFB625:
	.loc 28 204 0
	.cfi_startproc
.LVL2875:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	36(%esp), %ecx
	.loc 28 204 0
	movl	32(%esp), %eax
	movl	40(%esp), %esi
.LVL2876:
.LBB10806:
.LBB10807:
	.loc 11 2202 0
	movl	%ecx, %edi
	.loc 11 2203 0
	movl	%ecx, %ebx
	movzbl	%cl, %edx
	.loc 11 2202 0
	andl	$14, %edi
	.loc 11 2203 0
	andl	$15, %ebx
	cmpl	$14, %edi
	cmovne	%ebx, %edx
.LVL2877:
.LBE10807:
.LBE10806:
	.loc 28 206 0
	subl	$3, %edx
	cmpl	$28, %edx
	ja	.L2626
	jmp	*.L2628(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L2628:
	.long	.L2627
	.long	.L2626
	.long	.L2629
	.long	.L2626
	.long	.L2626
	.long	.L2626
	.long	.L2630
	.long	.L2626
	.long	.L2631
	.long	.L2626
	.long	.L2632
	.long	.L2626
	.long	.L2633
	.long	.L2626
	.long	.L2626
	.long	.L2626
	.long	.L2626
	.long	.L2626
	.long	.L2626
	.long	.L2626
	.long	.L2626
	.long	.L2626
	.long	.L2626
	.long	.L2626
	.long	.L2626
	.long	.L2626
	.long	.L2626
	.long	.L2626
	.long	.L2630
	.text
	.p2align 4,,10
	.p2align 3
.L2631:
	.loc 28 228 0
	movl	44(%esp), %ebx
	testl	%ebx, %ebx
	je	.L2630
.LVL2878:
.LBB10808:
.LBB10809:
	.loc 11 3287 0
	movl	%ecx, %edx
	andl	$15, %edx
	cmpl	$11, %edx
	jne	.L2664
.LBE10809:
.LBE10808:
	.loc 28 229 0
	andl	$16777200, %ecx
	movl	%eax, 12(%esp)
.LVL2879:
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	andl	$4095, %esi
	sall	$8, %ecx
	pushl	%ecx
	.cfi_def_cfa_offset 44
	pushl	%esi
	.cfi_def_cfa_offset 48
	call	deleteASIDPool
.LVL2880:
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	12(%esp), %eax
.LVL2881:
.L2630:
.LBB10811:
.LBB10812:
	.loc 11 2225 0
	movl	$0, (%eax)
	movl	$0, 4(%eax)
.LVL2882:
.LBE10812:
.LBE10811:
	.loc 28 304 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
	.p2align 4,,10
	.p2align 3
.L2633:
	.cfi_restore_state
	.loc 28 252 0
	movl	44(%esp), %edx
	testl	%edx, %edx
	je	.L2630
.LVL2883:
.LBB10813:
.LBB10814:
	.loc 11 3486 0 discriminator 1
	cmpb	$15, %cl
	jne	.L2665
.LBE10814:
.LBE10813:
	.loc 28 252 0
	testl	%esi, %esi
	jns	.L2630
	movl	%eax, 12(%esp)
	.loc 28 253 0
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	pushl	48(%esp)
	.cfi_def_cfa_offset 44
	pushl	48(%esp)
	.cfi_def_cfa_offset 48
	call	deleteIOPageTable
.LVL2884:
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	12(%esp), %eax
	jmp	.L2630
.LVL2885:
	.p2align 4,,10
	.p2align 3
.L2627:
	.loc 28 218 0
	movl	44(%esp), %edi
	testl	%edi, %edi
	je	.L2630
.LVL2886:
.LBB10816:
.LBB10817:
	.loc 11 3032 0 discriminator 1
	movl	%ecx, %edx
	andl	$15, %edx
	cmpl	$3, %edx
	jne	.L2666
.LBE10817:
.LBE10816:
	.loc 28 218 0
	testl	$8388608, %esi
	je	.L2630
	.loc 28 219 0
	movl	%esi, %edx
	andl	$16777200, %ecx
	movl	%eax, 12(%esp)
.LVL2887:
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	sall	$8, %ecx
	andl	$8386560, %esi
	sall	$21, %edx
	shrl	$11, %esi
	pushl	%ecx
	.cfi_def_cfa_offset 40
	pushl	%edx
	.cfi_def_cfa_offset 44
	pushl	%esi
	.cfi_def_cfa_offset 48
	call	unmapPageTable
.LVL2888:
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	12(%esp), %eax
	jmp	.L2630
.LVL2889:
	.p2align 4,,10
	.p2align 3
.L2629:
	.loc 28 208 0
	movl	44(%esp), %edx
	testl	%edx, %edx
	je	.L2630
.LVL2890:
.LBB10819:
.LBB10820:
	.loc 11 3159 0 discriminator 1
	movl	%ecx, %edx
	andl	$15, %edx
	cmpl	$5, %edx
	jne	.L2667
.LBE10820:
.LBE10819:
	.loc 28 208 0
	testl	$16384, %esi
	je	.L2630
.LBB10822:
.LBB10823:
	.loc 17 229 0
	andl	$16777200, %ecx
	andl	$16380, %esi
	movl	%eax, 12(%esp)
.LVL2891:
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	sall	$8, %ecx
	shrl	$2, %esi
	pushl	%ecx
	.cfi_def_cfa_offset 44
	pushl	%esi
	.cfi_def_cfa_offset 48
	call	deleteASID
.LVL2892:
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	12(%esp), %eax
	jmp	.L2630
.LVL2893:
	.p2align 4,,10
	.p2align 3
.L2632:
.LBE10823:
.LBE10822:
	.loc 28 246 0
	movl	44(%esp), %ecx
	testl	%ecx, %ecx
	je	.L2630
	movl	%eax, 12(%esp)
	.loc 28 247 0
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	pushl	48(%esp)
	.cfi_def_cfa_offset 44
	pushl	48(%esp)
	.cfi_def_cfa_offset 48
	call	unmapVTDContextEntry
.LVL2894:
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	12(%esp), %eax
	jmp	.L2630
	.p2align 4,,10
	.p2align 3
.L2626:
	.loc 28 300 0
	pushl	44(%esp)
	.cfi_def_cfa_offset 36
	pushl	44(%esp)
	.cfi_def_cfa_offset 40
	pushl	44(%esp)
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	movl	%eax, 28(%esp)
	call	Mode_finaliseCap
	.cfi_def_cfa_offset 44
.LVL2895:
	addl	$12, %esp
	.cfi_def_cfa_offset 32
	movl	12(%esp), %eax
	.loc 28 304 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL2896:
.L2666:
	.cfi_restore_state
.LBB10824:
.LBB10818:
	call	cap_page_table_cap_get_capPTIsMapped.part.142
.LVL2897:
.L2665:
.LBE10818:
.LBE10824:
.LBB10825:
.LBB10815:
	call	cap_io_page_table_cap_get_capIOPTIsMapped.part.199
.LVL2898:
.L2664:
.LBE10815:
.LBE10825:
.LBB10826:
.LBB10810:
	call	cap_asid_pool_cap_get_capASIDPool.isra.134.part.135
.LVL2899:
.L2667:
.LBE10810:
.LBE10826:
.LBB10827:
.LBB10821:
	call	cap_page_directory_cap_get_capPDIsMapped.part.149
.LVL2900:
.LBE10821:
.LBE10827:
	.cfi_endproc
.LFE625:
	.size	Arch_finaliseCap, .-Arch_finaliseCap
	.section	.text.unlikely
.LCOLDE501:
	.text
.LHOTE501:
	.section	.boot.text
.LCOLDB502:
.LHOTB502:
	.p2align 4,,15
	.globl	init_idt_entry
	.type	init_idt_entry, @function
init_idt_entry:
.LFB446:
	.loc 16 190 0
	.cfi_startproc
.LVL2901:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.loc 16 190 0
	movl	12(%esp), %ecx
	movl	16(%esp), %eax
.LVL2902:
	.loc 16 194 0
	cmpl	$157, %ecx
	jg	.L2672
	xorl	%edx, %edx
	cmpl	$3, %ecx
	je	.L2672
.L2669:
.LVL2903:
	.loc 16 198 0
	movl	8(%esp), %ebx
	leal	(%ebx,%ecx,8), %ebx
.LVL2904:
	movzwl	%ax, %ecx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %ecx
	orl	%edx, %eax
	movl	%ecx, (%ebx)
	movl	%eax, 4(%ebx)
	.loc 16 206 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL2905:
	.p2align 4,,10
	.p2align 3
.L2672:
	.cfi_restore_state
	.loc 16 194 0
	movl	$24576, %edx
	jmp	.L2669
	.cfi_endproc
.LFE446:
	.size	init_idt_entry, .-init_idt_entry
.LCOLDE502:
.LHOTE502:
	.section	.rodata.str1.4
	.align 4
.LC503:
	.string	"(capFIsDevice & ~0x1u) == ((0 && (capFIsDevice & (1u << 31))) ? 0x0 : 0)"
	.align 4
.LC504:
	.string	"(capPTBasePtr & ~0xfffff000u) == ((0 && (capPTBasePtr & (1u << 31))) ? 0x0 : 0)"
	.align 4
.LC505:
	.string	"(capPDBasePtr & ~0xfffff000u) == ((0 && (capPDBasePtr & (1u << 31))) ? 0x0 : 0)"
	.align 4
.LC506:
	.string	"(capIOPTBasePtr & ~0xfffff000u) == ((0 && (capIOPTBasePtr & (1u << 31))) ? 0x0 : 0)"
	.align 4
.LC507:
	.string	"Mode_createObject got an API type or invalid object type"
	.section	.text.unlikely
.LCOLDB508:
	.text
.LHOTB508:
	.p2align 4,,15
	.globl	Mode_createObject
	.type	Mode_createObject, @function
Mode_createObject:
.LFB491:
	.loc 18 138 0
	.cfi_startproc
.LVL2906:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 18 139 0
	movl	20(%esp), %ecx
	.loc 18 138 0
	movl	16(%esp), %eax
	movl	24(%esp), %ebx
	.loc 18 139 0
	leal	-5(%ecx), %edx
	cmpl	$4, %edx
	ja	.L2678
	jmp	*.L2680(,%edx,4)
	.section	.rodata
	.align 4
	.align 4
.L2680:
	.long	.L2679
	.long	.L2681
	.long	.L2682
	.long	.L2683
	.long	.L2684
	.text
	.p2align 4,,10
	.p2align 3
.L2683:
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L2691:
.LBB10842:
.LBB10843:
	.loc 17 202 0
	movl	ia32KSGlobalPD+3584(%edx), %ecx
	movl	%ecx, 3584(%ebx,%edx)
.LVL2907:
	addl	$4, %edx
	.loc 17 201 0
	cmpl	$512, %edx
	jne	.L2691
.LVL2908:
.LBE10843:
.LBE10842:
.LBB10844:
.LBB10845:
	.loc 11 3142 0
	testl	$4095, %ebx
	jne	.L2696
.LVL2909:
	.loc 11 3153 0
	andl	$-4096, %ebx
.LVL2910:
	movl	$0, 4(%eax)
.LVL2911:
	shrl	$8, %ebx
	orl	$5, %ebx
	movl	%ebx, (%eax)
.LBE10845:
.LBE10844:
	.loc 18 195 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret	$4
.LVL2912:
	.p2align 4,,10
	.p2align 3
.L2684:
	.cfi_restore_state
.LBB10847:
.LBB10848:
	.loc 11 3468 0
	testl	$4095, %ebx
	jne	.L2697
.LVL2913:
	.loc 11 3480 0
	andl	$-4096, %ebx
.LVL2914:
	movl	$0, 4(%eax)
.LVL2915:
	shrl	$4, %ebx
	orl	$15, %ebx
	movl	%ebx, (%eax)
.LBE10848:
.LBE10847:
	.loc 18 195 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret	$4
.LVL2916:
	.p2align 4,,10
	.p2align 3
.L2679:
	.cfi_restore_state
.LBB10850:
.LBB10851:
	.loc 11 2788 0
	testl	$-2, 32(%esp)
	jne	.L2688
	.loc 11 2791 0
	testl	$4095, %ebx
	jne	.L2689
.LVL2917:
	.loc 11 2806 0
	movl	32(%esp), %edx
	andl	$-4096, %ebx
.LVL2918:
	movl	$0, 4(%eax)
.LVL2919:
	shrl	$8, %ebx
	sall	$28, %edx
	orl	$50331649, %edx
	orl	%edx, %ebx
	movl	%ebx, (%eax)
.LBE10851:
.LBE10850:
	.loc 18 195 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret	$4
.LVL2920:
	.p2align 4,,10
	.p2align 3
.L2681:
	.cfi_restore_state
.LBB10853:
.LBB10854:
	.loc 11 2788 0
	testl	$-2, 32(%esp)
	jne	.L2688
	.loc 11 2791 0
	testl	$4095, %ebx
	jne	.L2689
.LVL2921:
	.loc 11 2806 0
	movl	32(%esp), %edx
	andl	$-4096, %ebx
.LVL2922:
	movl	$1073741824, 4(%eax)
.LVL2923:
	shrl	$8, %ebx
	sall	$28, %edx
	orl	$50331649, %edx
	orl	%edx, %ebx
	movl	%ebx, (%eax)
.LBE10854:
.LBE10853:
	.loc 18 195 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret	$4
.LVL2924:
	.p2align 4,,10
	.p2align 3
.L2682:
	.cfi_restore_state
.LBB10855:
.LBB10856:
	.loc 11 3015 0
	testl	$4095, %ebx
	jne	.L2698
.LVL2925:
	.loc 11 3026 0
	andl	$-4096, %ebx
.LVL2926:
	movl	$0, 4(%eax)
.LVL2927:
	shrl	$8, %ebx
	orl	$3, %ebx
	movl	%ebx, (%eax)
.LBE10856:
.LBE10855:
	.loc 18 195 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret	$4
.LVL2928:
	.p2align 4,,10
	.p2align 3
.L2678:
	.cfi_restore_state
	.loc 18 193 0
	pushl	$__func__.6488
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$193
	.cfi_def_cfa_offset 24
	pushl	$.LC130
	.cfi_def_cfa_offset 28
	pushl	$.LC507
	.cfi_def_cfa_offset 32
	call	_fail
.LVL2929:
.L2696:
	.cfi_restore_state
.LBB10858:
.LBB10846:
	.loc 11 3142 0
	pushl	$__FUNCTION__.2596
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$3142
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC505
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2930:
.L2698:
	.cfi_restore_state
.LBE10846:
.LBE10858:
.LBB10859:
.LBB10857:
	.loc 11 3015 0
	pushl	$__FUNCTION__.2548
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$3015
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC504
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2931:
.L2689:
	.cfi_restore_state
.LBE10857:
.LBE10859:
.LBB10860:
.LBB10852:
	.loc 11 2791 0
	pushl	$__FUNCTION__.2465
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$2791
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC482
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2932:
.L2688:
	.cfi_restore_state
	.loc 11 2788 0
	pushl	$__FUNCTION__.2465
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$2788
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC503
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2933:
.L2697:
	.cfi_restore_state
.LBE10852:
.LBE10860:
.LBB10861:
.LBB10849:
	.loc 11 3468 0
	pushl	$__FUNCTION__.2713
	.cfi_def_cfa_offset 20
	pushl	$3468
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC506
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2934:
.LBE10849:
.LBE10861:
	.cfi_endproc
.LFE491:
	.size	Mode_createObject, .-Mode_createObject
	.section	.text.unlikely
.LCOLDE508:
	.text
.LHOTE508:
	.section	.text.unlikely
.LCOLDB509:
	.text
.LHOTB509:
	.p2align 4,,15
	.globl	Arch_createObject
	.type	Arch_createObject, @function
Arch_createObject:
.LFB629:
	.loc 28 468 0
	.cfi_startproc
.LVL2935:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$20, %esp
	.cfi_def_cfa_offset 28
	.loc 28 468 0
	movl	28(%esp), %ebx
	.loc 28 506 0
	pushl	44(%esp)
	.cfi_def_cfa_offset 32
	pushl	44(%esp)
	.cfi_def_cfa_offset 36
	pushl	44(%esp)
	.cfi_def_cfa_offset 40
	pushl	44(%esp)
	.cfi_def_cfa_offset 44
	pushl	%ebx
	.cfi_def_cfa_offset 48
	call	Mode_createObject
	.cfi_def_cfa_offset 44
.LVL2936:
	.loc 28 510 0
	movl	%ebx, %eax
	addl	$36, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret	$4
	.cfi_endproc
.LFE629:
	.size	Arch_createObject, .-Arch_createObject
	.section	.text.unlikely
.LCOLDE509:
	.text
.LHOTE509:
	.section	.text.unlikely
.LCOLDB510:
	.text
.LHOTB510:
	.p2align 4,,15
	.globl	makeUserPTE
	.type	makeUserPTE, @function
makeUserPTE:
.LFB460:
	.loc 16 592 0
	.cfi_startproc
.LVL2937:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
.LVL2938:
	.loc 16 592 0
	movl	28(%esp), %eax
.LBB10874:
.LBB10875:
	.loc 20 590 0
	cmpl	$2, %eax
	je	.L2707
	cmpl	$3, %eax
	je	.L2704
	cmpl	$1, %eax
	je	.L2704
	call	WritableFromVMRights.part.62
.LVL2939:
	.p2align 4,,10
	.p2align 3
.L2704:
.LBE10875:
.LBE10874:
.LBB10879:
.LBB10880:
	.loc 20 605 0
	subl	$2, %eax
.LVL2940:
	cmpl	$1, %eax
	jbe	.L2719
.LBE10880:
.LBE10879:
.LBB10883:
.LBB10876:
	.loc 20 596 0
	movl	$1, %ebx
.LBE10876:
.LBE10883:
.LBB10884:
.LBB10881:
	.loc 20 607 0
	xorl	%esi, %esi
	jmp	.L2705
.LVL2941:
	.p2align 4,,10
	.p2align 3
.L2707:
.LBE10881:
.LBE10884:
.LBB10885:
.LBB10877:
	.loc 20 592 0
	xorl	%ebx, %ebx
.LVL2942:
.L2703:
.LBE10877:
.LBE10885:
.LBB10886:
.LBB10882:
	.loc 20 611 0
	movl	$1, %esi
.L2705:
.LVL2943:
.LBE10882:
.LBE10886:
.LBB10887:
.LBB10888:
	.loc 11 842 0
	movl	24(%esp), %edx
.LBE10888:
.LBE10887:
.LBB10891:
.LBB10892:
	.loc 11 831 0
	movl	24(%esp), %ecx
.LBE10892:
.LBE10891:
.LBB10895:
.LBB10889:
	.loc 11 842 0
	andl	$2, %edx
.LBE10889:
.LBE10895:
.LBB10896:
.LBB10893:
	.loc 11 831 0
	andl	$4, %ecx
.LBE10893:
.LBE10896:
.LBB10897:
.LBB10890:
	.loc 11 842 0
	shrl	%edx
.LVL2944:
.LBE10890:
.LBE10897:
.LBB10898:
.LBB10894:
	.loc 11 831 0
	shrl	$2, %ecx
.LVL2945:
.LBE10894:
.LBE10898:
.LBB10899:
.LBB10900:
	.loc 11 45 0
	testl	$4095, 20(%esp)
	jne	.L2720
.LVL2946:
	.loc 11 70 0
	movl	24(%esp), %eax
	sall	$7, %ecx
.LVL2947:
	movl	20(%esp), %edi
	sall	$4, %edx
.LVL2948:
	sall	$2, %esi
	andl	$1, %eax
.LVL2949:
	sall	$3, %eax
.LVL2950:
	andl	$-4096, %edi
	orl	$1, %eax
	orl	%edi, %eax
	leal	(%ebx,%ebx), %edi
	orl	%ecx, %eax
	orl	%edx, %eax
	orl	%esi, %eax
	orl	%edi, %eax
	movl	%eax, %ebx
	movl	16(%esp), %eax
	movl	%ebx, (%eax)
.LVL2951:
.LBE10900:
.LBE10899:
	.loc 16 606 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL2952:
.L2719:
	.cfi_restore_state
.LBB10902:
.LBB10878:
	.loc 20 596 0
	movl	$1, %ebx
	jmp	.L2703
.LVL2953:
.L2720:
.LBE10878:
.LBE10902:
.LBB10903:
.LBB10901:
	call	pte_new.part.112
.LVL2954:
.LBE10901:
.LBE10903:
	.cfi_endproc
.LFE460:
	.size	makeUserPTE, .-makeUserPTE
	.section	.text.unlikely
.LCOLDE510:
	.text
.LHOTE510:
	.section	.rodata.str1.4
	.align 4
.LC511:
	.string	"Error: Mapping unknown ACPI table type\n"
	.align 4
.LC512:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/plat/pc99/machine/acpi.c"
	.section	.rodata.str1.1
.LC513:
	.string	"false"
	.section	.boot.text
.LCOLDB514:
.LHOTB514:
	.p2align 4,,15
	.type	acpi_table_init, @function
acpi_table_init:
.LFB841:
	.file 67 "/home/axjllt/Desktop/ori_refos/kernel/src/plat/pc99/machine/acpi.c"
	.loc 67 195 0
	.cfi_startproc
.LVL2955:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	movl	%edx, %edi
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	movl	%eax, %esi
.LVL2956:
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 67 201 0
	movl	%eax, %ebx
	.loc 67 202 0
	movl	$4194303, %eax
.LVL2957:
	.loc 67 201 0
	andl	$4194303, %ebx
.LVL2958:
	.loc 67 202 0
	subl	%ebx, %eax
	.loc 67 203 0
	cmpl	$36, %eax
	sbbl	%eax, %eax
	notl	%eax
	addl	$2, %eax
.LVL2959:
	.loc 67 207 0
	pushl	%eax
	.cfi_def_cfa_offset 20
	pushl	%esi
	.cfi_def_cfa_offset 24
	call	map_temp_boot_page
.LVL2960:
	.loc 67 209 0
	popl	%eax
	.cfi_def_cfa_offset 20
	popl	%edx
	.cfi_def_cfa_offset 16
	testl	%edi, %edi
	je	.L2724
	cmpl	$1, %edi
	jne	.L2732
.LVL2961:
.LBB10910:
	.loc 67 217 0
	addl	4(%esi), %ebx
.LVL2962:
.L2730:
	movl	%ebx, %eax
	movl	$1025, %edx
	mull	%edx
.LBE10910:
	.loc 67 227 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
.LBB10911:
	.loc 67 217 0
	subl	%edx, %ebx
	shrl	%ebx
	addl	%ebx, %edx
	shrl	$21, %edx
	addl	$1, %edx
.LVL2963:
.LBE10911:
	.loc 67 227 0
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%esi
	.cfi_def_cfa_offset 32
	call	map_temp_boot_page
.LVL2964:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	.loc 67 230 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL2965:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL2966:
	ret
.LVL2967:
	.p2align 4,,10
	.p2align 3
.L2732:
	.cfi_restore_state
.LBB10912:
.LBB10913:
	.loc 67 221 0
	subl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 28
	pushl	$.LC511
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL2968:
	.loc 67 222 0
	pushl	$__FUNCTION__.9808
	.cfi_def_cfa_offset 36
	pushl	$222
	.cfi_def_cfa_offset 40
	pushl	$.LC512
	.cfi_def_cfa_offset 44
	pushl	$.LC513
	.cfi_def_cfa_offset 48
	call	_assert_fail
.LVL2969:
	.p2align 4,,10
	.p2align 3
.L2724:
	.cfi_restore_state
.LBE10913:
.LBE10912:
.LBB10914:
	.loc 67 212 0
	addl	20(%esi), %ebx
.LVL2970:
	jmp	.L2730
.LBE10914:
	.cfi_endproc
.LFE841:
	.size	acpi_table_init, .-acpi_table_init
.LCOLDE514:
.LHOTE514:
	.section	.rodata.str1.4
	.align 4
.LC515:
	.string	"BIOS: ACPI information corrupt\n"
	.section	.rodata.str1.1
.LC516:
	.string	"ACPI: RSDT paddr=%p\n"
.LC517:
	.string	"ACPI: RSDT vaddr=%p\n"
	.section	.rodata.str1.4
	.align 4
.LC518:
	.string	"acpi_rsdt_mapped->header.length > 0"
	.section	.rodata.str1.1
.LC519:
	.string	"ACPI: RSDT checksum failure\n"
	.section	.boot.text
.LCOLDB520:
.LHOTB520:
	.p2align 4,,15
	.globl	acpi_validate_rsdp
	.type	acpi_validate_rsdp, @function
acpi_validate_rsdp:
.LFB843:
	.loc 67 254 0
	.cfi_startproc
.LVL2971:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
.LBB10925:
.LBB10926:
	.loc 67 168 0
	xorl	%edx, %edx
.LBE10926:
.LBE10925:
	.loc 67 254 0
	subl	$8, %esp
	.cfi_def_cfa_offset 16
.LVL2972:
	.loc 67 254 0
	movl	16(%esp), %ebx
	leal	20(%ebx), %ecx
	movl	%ebx, %eax
.LVL2973:
	.p2align 4,,10
	.p2align 3
.L2734:
.LBB10928:
.LBB10927:
	.loc 67 171 0
	addb	(%eax), %dl
.LVL2974:
	.loc 67 172 0
	addl	$1, %eax
.LVL2975:
	.loc 67 170 0
	cmpl	%ecx, %eax
	jne	.L2734
.LVL2976:
.LBE10927:
.LBE10928:
	.loc 67 258 0
	testb	%dl, %dl
	jne	.L2744
	.loc 67 264 0
	movl	16(%ebx), %ebx
.LVL2977:
	.loc 67 265 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	pushl	%ebx
	.cfi_def_cfa_offset 28
	pushl	$.LC516
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL2978:
	.loc 67 266 0
	movl	$1, %edx
	movl	%ebx, %eax
	call	acpi_table_init
.LVL2979:
	movl	%eax, %ebx
.LVL2980:
	.loc 67 267 0
	popl	%eax
	.cfi_def_cfa_offset 28
.LVL2981:
	popl	%edx
	.cfi_def_cfa_offset 24
	pushl	%ebx
	.cfi_def_cfa_offset 28
	pushl	$.LC517
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL2982:
	.loc 67 269 0
	movl	4(%ebx), %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	je	.L2745
	addl	%ebx, %eax
	xorl	%edx, %edx
.LVL2983:
	.p2align 4,,10
	.p2align 3
.L2738:
.LBB10929:
.LBB10930:
	.loc 67 171 0
	addb	(%ebx), %dl
.LVL2984:
	.loc 67 172 0
	addl	$1, %ebx
.LVL2985:
	.loc 67 170 0
	cmpl	%ebx, %eax
	jne	.L2738
.LVL2986:
.LBE10930:
.LBE10929:
	.loc 67 275 0
	movl	$1, %eax
	.loc 67 270 0
	testb	%dl, %dl
	jne	.L2746
	.loc 67 276 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L2746:
	.cfi_restore_state
	.loc 67 271 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC519
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL2987:
	.loc 67 272 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	.loc 67 276 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L2744:
	.cfi_restore_state
	.loc 67 259 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC515
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL2988:
	.loc 67 260 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	.loc 67 276 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL2989:
.L2745:
	.cfi_restore_state
.LBB10931:
.LBB10932:
	.loc 67 269 0
	pushl	$__FUNCTION__.9818
	.cfi_def_cfa_offset 20
	pushl	$269
	.cfi_def_cfa_offset 24
	pushl	$.LC512
	.cfi_def_cfa_offset 28
	pushl	$.LC518
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL2990:
.LBE10932:
.LBE10931:
	.cfi_endproc
.LFE843:
	.size	acpi_validate_rsdp, .-acpi_validate_rsdp
.LCOLDE520:
.LHOTE520:
	.section	.rodata.str1.4
	.align 4
.LC521:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/kernel/boot.c"
	.align 4
.LC522:
	.string	"Ran out of reserved physical regions\n"
	.section	.rodata.str1.1
.LC523:
	.string	"!p_region_overlaps(reg)"
	.section	.boot.text
.LCOLDB524:
.LHOTB524:
	.p2align 4,,15
	.globl	add_allocated_p_region
	.type	add_allocated_p_region, @function
add_allocated_p_region:
.LFB509:
	.loc 2 119 0
	.cfi_startproc
.LVL2991:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	.loc 2 119 0
	movl	32(%esp), %ecx
	movl	36(%esp), %edx
	.loc 2 122 0
	cmpl	%ecx, %edx
	jb	.L2748
.LVL2992:
.LBB10933:
.LBB10934:
	.loc 2 108 0
	movl	allocated_p_regions+264, %edi
	xorl	%eax, %eax
	testl	%edi, %edi
	je	.L2750
.LVL2993:
	.p2align 4,,10
	.p2align 3
.L2773:
	.loc 2 109 0
	cmpl	%edx, allocated_p_regions(,%eax,8)
	jnb	.L2751
	cmpl	allocated_p_regions+4(,%eax,8), %ecx
	jb	.L2752
.L2751:
	.loc 2 108 0
	addl	$1, %eax
.LVL2994:
	cmpl	%eax, %edi
	jne	.L2773
.LVL2995:
.LBE10934:
.LBE10933:
	.loc 2 129 0
	cmpl	allocated_p_regions+4, %ecx
	je	.L2766
	.loc 2 134 0
	cmpl	allocated_p_regions, %edx
	je	.L2767
	.loc 2 140 0
	jb	.L2783
	movl	$allocated_p_regions+8, %eax
.LVL2996:
	.loc 2 140 0 is_stmt 0 discriminator 2
	xorl	%ebx, %ebx
	jmp	.L2761
.LVL2997:
	.p2align 4,,10
	.p2align 3
.L2763:
	.loc 2 129 0 is_stmt 1
	cmpl	%ecx, 4(%eax)
	je	.L2754
	.loc 2 134 0
	movl	(%eax), %esi
	cmpl	%edx, %esi
	je	.L2755
	addl	$8, %eax
	.loc 2 140 0
	cmpl	%edx, %esi
	ja	.L2756
.LVL2998:
.L2761:
	.loc 2 127 0 discriminator 2
	addl	$1, %ebx
.LVL2999:
	cmpl	%ebx, %edi
	jne	.L2763
	.loc 2 158 0
	cmpl	$32, %edi
	je	.L2764
.LVL3000:
.L2750:
	.loc 2 162 0
	movl	%ecx, allocated_p_regions(,%edi,8)
	.loc 2 164 0
	movl	$1, %eax
	.loc 2 162 0
	movl	%edx, allocated_p_regions+4(,%edi,8)
	.loc 2 163 0
	addl	$1, %edi
	movl	%edi, allocated_p_regions+264
.L2779:
	.loc 2 165 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3001:
	.p2align 4,,10
	.p2align 3
.L2752:
	.cfi_restore_state
	.loc 2 123 0
	pushl	$__FUNCTION__.6670
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	pushl	$123
	.cfi_def_cfa_offset 40
	pushl	$.LC521
	.cfi_def_cfa_offset 44
	pushl	$.LC523
	.cfi_def_cfa_offset 48
	call	_assert_fail
.LVL3002:
.L2766:
	.cfi_restore_state
	.loc 2 129 0
	xorl	%ebx, %ebx
.LVL3003:
.L2754:
	.loc 2 130 0
	movl	%edx, allocated_p_regions+4(,%ebx,8)
	.loc 2 131 0
	call	merge_regions
.LVL3004:
	.loc 2 165 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 2 132 0
	movl	$1, %eax
	.loc 2 165 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3005:
.L2767:
	.cfi_restore_state
	.loc 2 134 0
	xorl	%ebx, %ebx
.LVL3006:
.L2755:
	.loc 2 135 0
	movl	%ecx, allocated_p_regions(,%ebx,8)
	.loc 2 136 0
	call	merge_regions
.LVL3007:
	.loc 2 165 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 2 137 0
	movl	$1, %eax
	.loc 2 165 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3008:
.L2783:
	.cfi_restore_state
	.loc 2 140 0
	xorl	%ebx, %ebx
.LVL3009:
	.p2align 4,,10
	.p2align 3
.L2756:
	leal	allocated_p_regions-8(,%edi,8), %eax
	leal	allocated_p_regions-8(,%ebx,8), %esi
	.loc 2 142 0
	cmpl	$32, %edi
	je	.L2764
	.p2align 4,,10
	.p2align 3
.L2762:
	.loc 2 148 0 discriminator 3
	movl	(%eax), %edi
	subl	$8, %eax
	movl	12(%eax), %ebp
	movl	%edi, 16(%eax)
	movl	%ebp, 20(%eax)
.LVL3010:
	.loc 2 147 0 discriminator 3
	cmpl	%esi, %eax
	jne	.L2762
	.loc 2 151 0
	movl	%ecx, allocated_p_regions(,%ebx,8)
	.loc 2 153 0
	movl	$1, %eax
	.loc 2 151 0
	movl	%edx, allocated_p_regions+4(,%ebx,8)
	.loc 2 152 0
	addl	$1, allocated_p_regions+264
	.loc 2 165 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.L2764:
	.cfi_restore_state
	.loc 2 143 0
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC522
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL3011:
	.loc 2 144 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	jmp	.L2779
.LVL3012:
.L2748:
	.loc 2 122 0 discriminator 1
	pushl	$__FUNCTION__.6670
	.cfi_def_cfa_offset 36
	pushl	$122
	.cfi_def_cfa_offset 40
	pushl	$.LC521
	.cfi_def_cfa_offset 44
	pushl	$.LC327
	.cfi_def_cfa_offset 48
	call	_assert_fail
.LVL3013:
	.cfi_endproc
.LFE509:
	.size	add_allocated_p_region, .-add_allocated_p_region
.LCOLDE524:
.LHOTE524:
	.section	.rodata.str1.4
	.align 4
.LC525:
	.string	"idx == ( (PPTR_IOAPIC_START + i * BIT(PAGE_BITS)) & MASK(LARGE_PAGE_BITS)) >> PAGE_BITS"
	.align 4
.LC526:
	.string	"idx == ((PPTR_DRHU_START + i * BIT(PAGE_BITS)) & MASK(LARGE_PAGE_BITS)) >> PAGE_BITS"
	.section	.boot.text
.LCOLDB527:
.LHOTB527:
	.p2align 4,,15
	.globl	map_kernel_window_devices
	.type	map_kernel_window_devices, @function
map_kernel_window_devices:
.LFB535:
	.loc 20 131 0
	.cfi_startproc
.LVL3014:
.LBB10959:
.LBB10960:
.LBB10961:
.LBB10962:
.LBB10963:
.LBB10964:
	.loc 10 101 0
	movl	$27, %ecx
#APP
# 101 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine.h" 1
	rdmsr
# 0 "" 2
.LVL3015:
#NO_APP
.LBE10964:
.LBE10963:
.LBE10962:
.LBE10961:
.LBE10960:
.LBE10959:
	.loc 20 138 0
	andl	$-4096, %eax
	jne	.L2822
	.loc 20 139 0
	xorl	%eax, %eax
.LVL3016:
	.loc 20 202 0
	ret
	.p2align 4,,10
	.p2align 3
.L2822:
	.loc 20 131 0
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%eax, %ebp
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	.loc 20 141 0
	leal	4096(%eax), %ebx
	.loc 20 131 0
	subl	$52, %esp
	.cfi_def_cfa_offset 72
	.loc 20 141 0
	pushl	%ebx
	.cfi_def_cfa_offset 76
	pushl	%eax
	.cfi_def_cfa_offset 80
	call	add_allocated_p_region
.LVL3017:
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	testl	%eax, %eax
	je	.L2785
.LVL3018:
	.loc 20 149 0
	movl	64(%esp), %eax
	movl	%ebp, %edx
	orl	$283, %edx
.LVL3019:
	movl	%edx, 4032(%eax)
.LVL3020:
	.loc 20 151 0
	movl	68(%esp), %edx
.LVL3021:
	testl	%edx, %edx
	je	.L2786
	movl	68(%esp), %eax
.LVL3022:
	movl	$1009, %edx
	leal	1009(%eax), %ebp
	movl	%ebp, 8(%esp)
	movl	%edx, %ebp
	jmp	.L2789
.LVL3023:
	.p2align 4,,10
	.p2align 3
.L2788:
	.loc 20 160 0
	movl	64(%esp), %eax
	movl	%ecx, (%eax,%ebp,4)
	.loc 20 161 0
	addl	$1, %ebp
.LVL3024:
	.loc 20 162 0
	cmpl	$1024, %ebp
	je	.L2785
.LVL3025:
	.loc 20 151 0 discriminator 2
	cmpl	8(%esp), %ebp
	je	.L2823
.LVL3026:
.L2789:
	.loc 20 152 0
	movl	72(%esp), %eax
	.loc 20 153 0
	subl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 72
	.loc 20 152 0
	movl	-4036(%eax,%ebp,4), %ebx
.LVL3027:
	.loc 20 153 0
	leal	4096(%ebx), %edi
	pushl	%edi
	.cfi_def_cfa_offset 76
	pushl	%ebx
	.cfi_def_cfa_offset 80
	call	add_allocated_p_region
.LVL3028:
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	testl	%eax, %eax
	je	.L2785
.LVL3029:
.LBB10965:
.LBB10966:
.LBB10967:
	.loc 11 45 0
	testl	$4095, %ebx
	jne	.L2791
	.loc 11 68 0
	andl	$-4096, %ebx
.LVL3030:
	movl	%ebx, %ecx
	orl	$283, %ecx
.LVL3031:
.LBE10967:
.LBE10966:
.LBE10965:
	.loc 20 159 0
	testl	$-1024, %ebp
	je	.L2788
	.loc 20 159 0 is_stmt 0 discriminator 1
	pushl	$__FUNCTION__.7010
	.cfi_def_cfa_offset 68
	pushl	$159
	.cfi_def_cfa_offset 72
	pushl	$.LC138
	.cfi_def_cfa_offset 76
	pushl	$.LC525
	.cfi_def_cfa_offset 80
	call	_assert_fail
.LVL3032:
.L2786:
	.cfi_restore_state
.LBB10970:
.LBB10971:
	.file 68 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/kernel/vspace.h"
	.loc 68 39 0 is_stmt 1
	leal	28(%esp), %edx
	subl	$12, %esp
	.cfi_def_cfa_offset 76
.LBE10971:
.LBE10970:
	.loc 20 171 0
	movl	$1010, %ebp
.LBB10973:
.LBB10972:
	.loc 68 39 0
	pushl	%edx
	.cfi_def_cfa_offset 80
	call	makeUserPTEInvalid
	.cfi_def_cfa_offset 76
.LVL3033:
	movl	40(%esp), %eax
.LVL3034:
.LBE10972:
.LBE10973:
	.loc 20 170 0
	movl	76(%esp), %edx
	addl	$12, %esp
	.cfi_def_cfa_offset 64
	movl	%eax, 4036(%edx)
.LVL3035:
.L2796:
	.loc 20 175 0 discriminator 1
	movl	76(%esp), %eax
	movl	%ebp, %ebx
	testl	%eax, %eax
	je	.L2790
	movl	80(%esp), %edi
	leal	0(,%ebp,4), %eax
	.loc 20 175 0 is_stmt 0
	movl	$-57344, %esi
	addl	76(%esp), %ebx
	movl	%esi, %ecx
	subl	%eax, %edi
	movl	%edi, 12(%esp)
	movl	%ebx, 24(%esp)
	jmp	.L2793
.LVL3036:
	.p2align 4,,10
	.p2align 3
.L2826:
.LBB10974:
.LBB10975:
.LBB10976:
	.loc 11 45 0 is_stmt 1
	testl	$4095, %edi
	jne	.L2791
.LBE10976:
.LBE10975:
.LBE10974:
	.loc 20 184 0
	movl	8(%esp), %ecx
.LBB10979:
.LBB10978:
.LBB10977:
	.loc 11 68 0
	andl	$-4096, %edi
.LVL3037:
	orl	$283, %edi
.LVL3038:
.LBE10977:
.LBE10978:
.LBE10979:
	.loc 20 184 0
	movl	%ecx, %eax
	andl	$4190208, %eax
	shrl	$12, %eax
	cmpl	%eax, %ebp
	jne	.L2824
	.loc 20 185 0
	movl	64(%esp), %eax
	movl	%edi, (%eax,%ebp,4)
	.loc 20 186 0
	addl	$1, %ebp
.LVL3039:
	.loc 20 187 0
	cmpl	$1024, %ebp
	je	.L2785
	addl	$4096, %ecx
	.loc 20 175 0 discriminator 2
	cmpl	%ebp, 24(%esp)
	je	.L2825
.LVL3040:
.L2793:
	.loc 20 176 0
	movl	12(%esp), %eax
	movl	%ecx, 8(%esp)
.LVL3041:
	.loc 20 177 0
	subl	$8, %esp
	.cfi_def_cfa_offset 72
	.loc 20 176 0
	movl	(%eax,%ebp,4), %edi
.LVL3042:
	.loc 20 177 0
	leal	4096(%edi), %esi
	pushl	%esi
	.cfi_def_cfa_offset 76
	pushl	%edi
	.cfi_def_cfa_offset 80
	call	add_allocated_p_region
.LVL3043:
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	testl	%eax, %eax
	jne	.L2826
.LVL3044:
	.p2align 4,,10
	.p2align 3
.L2785:
	.loc 20 139 0
	xorl	%eax, %eax
.L2819:
	.loc 20 202 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3045:
.L2825:
	.cfi_restore_state
	movl	24(%esp), %ebx
.LVL3046:
.L2790:
	movl	64(%esp), %ecx
	leal	28(%esp), %edx
.LVL3047:
	.p2align 4,,10
	.p2align 3
.L2794:
.LBB10980:
.LBB10981:
	.loc 68 39 0
	subl	$12, %esp
	.cfi_def_cfa_offset 76
	pushl	%edx
	.cfi_def_cfa_offset 80
	call	makeUserPTEInvalid
	.cfi_def_cfa_offset 76
.LVL3048:
	movl	40(%esp), %eax
.LVL3049:
.LBE10981:
.LBE10980:
	.loc 20 193 0
	addl	$12, %esp
	.cfi_def_cfa_offset 64
	.loc 20 195 0
	movl	%eax, (%ecx,%ebx,4)
	.loc 20 196 0
	addl	$1, %ebx
.LVL3050:
	.loc 20 193 0
	cmpl	$1024, %ebx
	jne	.L2794
	.loc 20 201 0
	movl	$1, %eax
.LVL3051:
	jmp	.L2819
.LVL3052:
	.p2align 4,,10
	.p2align 3
.L2823:
	movl	8(%esp), %ebp
.LVL3053:
	jmp	.L2796
.LVL3054:
.L2791:
.LBB10982:
.LBB10969:
.LBB10968:
	call	pte_new.part.112
.LVL3055:
.L2824:
.LBE10968:
.LBE10969:
.LBE10982:
	.loc 20 184 0 discriminator 1
	pushl	$__FUNCTION__.7010
	.cfi_def_cfa_offset 68
	pushl	$184
	.cfi_def_cfa_offset 72
	pushl	$.LC138
	.cfi_def_cfa_offset 76
	pushl	$.LC526
	.cfi_def_cfa_offset 80
	call	_assert_fail
.LVL3056:
	.cfi_endproc
.LFE535:
	.size	map_kernel_window_devices, .-map_kernel_window_devices
.LCOLDE527:
.LHOTE527:
.LCOLDB528:
.LHOTB528:
	.p2align 4,,15
	.globl	map_kernel_window
	.type	map_kernel_window, @function
map_kernel_window:
.LFB447:
	.loc 16 215 0
	.cfi_startproc
.LVL3057:
	movl	$ia32KSGlobalPD+3584, %ecx
	.loc 16 225 0
	xorl	%eax, %eax
.LVL3058:
	.p2align 4,,10
	.p2align 3
.L2828:
	.loc 16 245 0
	movl	%eax, %edx
	.loc 16 246 0
	addl	$4194304, %eax
.LVL3059:
	addl	$4, %ecx
	.loc 16 245 0
	andl	$-2097152, %edx
.LVL3060:
	orl	$387, %edx
.LVL3061:
	movl	%edx, -4(%ecx)
	.loc 16 231 0
	cmpl	$532676608, %eax
	jne	.L2828
.LVL3062:
	.loc 16 308 0
	movl	$0, ia32KSGlobalPT
	.loc 16 291 0
	movl	$ia32KSGlobalPT+536870912, %eax
.LVL3063:
	andl	$-4096, %eax
	orl	$3, %eax
.LVL3064:
	movl	%eax, ia32KSGlobalPD+4092
.LVL3065:
	movl	$ia32KSGlobalPT+4, %eax
.LVL3066:
	.p2align 4,,10
	.p2align 3
.L2829:
	.loc 16 327 0
	movl	$0, (%eax)
	addl	$4, %eax
	.loc 16 313 0
	cmpl	$ia32KSGlobalPT+4032, %eax
	jne	.L2829
	.loc 16 215 0
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	.loc 16 332 0
	pushl	40(%esp)
	.cfi_def_cfa_offset 32
	pushl	40(%esp)
	.cfi_def_cfa_offset 36
	pushl	40(%esp)
	.cfi_def_cfa_offset 40
	pushl	40(%esp)
	.cfi_def_cfa_offset 44
	pushl	$ia32KSGlobalPT
	.cfi_def_cfa_offset 48
	call	map_kernel_window_devices
.LVL3067:
	addl	$32, %esp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	je	.L2830
.LVL3068:
.LBB10996:
.LBB10997:
.LBB10998:
	.loc 50 45 0
	xorl	%eax, %eax
#APP
# 45 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine.h" 1
	invlpg (%eax)
# 0 "" 2
.LVL3069:
#NO_APP
.LBE10998:
.LBE10997:
.LBE10996:
	.loc 16 337 0
	movl	$1, %eax
.L2830:
.LVL3070:
	.loc 16 338 0
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE447:
	.size	map_kernel_window, .-map_kernel_window
.LCOLDE528:
.LHOTE528:
	.section	.rodata.str1.4
	.align 4
.LC529:
	.string	"Dropping memory region 0x%lx-0x%lx, try increasing MAX_NUM_FREEMEM_REG\n"
	.align 4
.LC530:
	.string	"Adding physical memory region 0x%lx-0x%lx\n"
	.section	.boot.text
.LCOLDB531:
.LHOTB531:
	.p2align 4,,15
	.type	add_mem_p_regs, @function
add_mem_p_regs:
.LFB519:
	.file 69 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/kernel/boot_sys.c"
	.loc 69 239 0
	.cfi_startproc
.LVL3071:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	movl	$532676608, %ebx
	movl	%ebx, %ebp
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	cmpl	$532676608, %edx
	cmovbe	%edx, %ebp
	cmpl	$532676608, %eax
	cmovbe	%eax, %ebx
	.loc 69 246 0
	cmpl	%ebp, %ebx
	je	.L2840
	.loc 69 251 0
	cmpl	$16, boot_state+532
	je	.L2842
	.loc 69 255 0
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	pushl	%ebp
	.cfi_def_cfa_offset 40
	pushl	%ebx
	.cfi_def_cfa_offset 44
	pushl	$.LC530
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL3072:
	.loc 69 256 0
	movl	boot_state+532, %eax
	leal	boot_state+528(,%eax,8), %eax
	movl	%ebx, 8(%eax)
	movl	%ebp, 12(%eax)
	.loc 69 258 0
	popl	%eax
	.cfi_def_cfa_offset 44
	popl	%edx
	.cfi_def_cfa_offset 40
	pushl	%ebp
	.cfi_def_cfa_offset 44
	.loc 69 257 0
	addl	$1, boot_state+532
.LVL3073:
	.loc 69 258 0
	pushl	%ebx
	.cfi_def_cfa_offset 48
	call	add_allocated_p_region
.LVL3074:
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 69 259 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3075:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3076:
	.p2align 4,,10
	.p2align 3
.L2840:
	.cfi_restore_state
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 69 249 0
	movl	$1, %eax
.LVL3077:
	.loc 69 259 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3078:
	.p2align 4,,10
	.p2align 3
.L2842:
	.cfi_restore_state
	.loc 69 252 0
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	pushl	%ebp
	.cfi_def_cfa_offset 40
	pushl	%ebx
	.cfi_def_cfa_offset 44
	pushl	$.LC529
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL3079:
	.loc 69 253 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	.loc 69 259 0
	addl	$12, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE519:
	.size	add_mem_p_regs, .-add_mem_p_regs
.LCOLDE531:
.LHOTE531:
	.section	.rodata.str1.1
.LC532:
	.string	"PAT support not found\n"
	.section	.boot.text
.LCOLDB533:
.LHOTB533:
	.p2align 4,,15
	.globl	init_pat_msr
	.type	init_pat_msr, @function
init_pat_msr:
.LFB538:
	.loc 20 504 0
	.cfi_startproc
.LVL3080:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
.LBB10999:
.LBB11000:
	.loc 10 134 0
	xorl	%ecx, %ecx
	movl	$1, %eax
.LBE11000:
.LBE10999:
	.loc 20 504 0
	subl	$8, %esp
	.cfi_def_cfa_offset 16
.LBB11002:
.LBB11001:
	.loc 10 134 0
#APP
# 134 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine.h" 1
	cpuid
# 0 "" 2
.LVL3081:
#NO_APP
.LBE11001:
.LBE11002:
	.loc 20 508 0
	movl	%edx, %ebx
	andl	$65536, %ebx
	je	.L2847
.LVL3082:
.LBB11003:
.LBB11004:
.LBB11005:
.LBB11006:
	.loc 10 101 0
	movl	$631, %ecx
#APP
# 101 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine.h" 1
	rdmsr
# 0 "" 2
#NO_APP
	movl	%eax, %ebx
.LVL3083:
.LBE11006:
.LBE11005:
.LBE11004:
.LBE11003:
.LBB11007:
.LBB11008:
.LBB11009:
.LBB11010:
#APP
# 101 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine.h" 1
	rdmsr
# 0 "" 2
.LVL3084:
#NO_APP
.LBE11010:
.LBE11009:
.LBE11008:
.LBE11007:
	.loc 20 522 0
	movl	%ebx, %eax
	andl	$-8, %edx
	andl	$-117901064, %eax
	orl	$1, %edx
	orl	$459782, %eax
.LVL3085:
.LBB11011:
.LBB11012:
.LBB11013:
.LBB11014:
	.loc 10 120 0
#APP
# 120 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine.h" 1
	wrmsr
# 0 "" 2
.LVL3086:
#NO_APP
.LBE11014:
.LBE11013:
.LBE11012:
.LBE11011:
	.loc 20 523 0
	movl	$1, %ebx
	.loc 20 524 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L2847:
	.cfi_restore_state
	.loc 20 509 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC532
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL3087:
	.loc 20 510 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	.loc 20 524 0
	movl	%ebx, %eax
	addl	$8, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE538:
	.size	init_pat_msr, .-init_pat_msr
.LCOLDE533:
.LHOTE533:
	.section	.rodata.str1.1
.LC534:
	.string	"Invalid vspace\n"
.LC535:
	.string	"ESP not aligned\n"
.LC536:
	.string	"0x%lx: INVALID\n"
.LC537:
	.string	"0x%lx: 0x%lx\n"
	.section	.text.unlikely
.LCOLDB538:
	.text
.LHOTB538:
	.p2align 4,,15
	.globl	Arch_userStackTrace
	.type	Arch_userStackTrace, @function
Arch_userStackTrace:
.LFB483:
	.loc 17 364 0
	.cfi_startproc
.LVL3088:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 17 364 0
	movl	48(%esp), %edx
	.loc 17 370 0
	movl	%edx, %eax
	andl	$-1024, %eax
	movl	16(%eax), %eax
.LVL3089:
.LBB11074:
.LBB11075:
	.loc 11 2202 0
	movl	%eax, %ecx
	andl	$14, %ecx
	cmpl	$14, %ecx
	je	.L2849
.LVL3090:
.LBE11075:
.LBE11074:
	.loc 17 373 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$5, %ecx
	je	.L2851
.L2850:
	.loc 17 374 0
	movl	$.LC534, 48(%esp)
.LVL3091:
	.loc 17 398 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 17 384 0
	jmp	kprintf
.LVL3092:
	.p2align 4,,10
	.p2align 3
.L2849:
	.cfi_restore_state
	.loc 17 373 0
	cmpb	$5, %al
	jne	.L2850
.L2851:
.LVL3093:
.LBB11076:
.LBB11077:
.LBB11078:
.LBB11079:
.LBB11080:
.LBB11081:
	.loc 11 3227 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$5, %ecx
	jne	.L2874
.LVL3094:
.LBE11081:
.LBE11080:
.LBE11079:
.LBE11078:
.LBE11077:
.LBE11076:
.LBB11090:
.LBB11091:
	.loc 15 36 0
	movl	580(%edx), %ebx
.LBE11091:
.LBE11090:
.LBB11092:
.LBB11093:
.LBB11094:
	.loc 17 344 0
	leal	8(%esp), %ebp
.LBE11094:
.LBE11093:
.LBE11092:
.LBB11113:
.LBB11088:
.LBB11086:
.LBB11084:
	.loc 55 277 0
	andl	$16777200, %eax
.LVL3095:
	movl	%eax, %esi
	sall	$8, %esi
.LVL3096:
	leal	64(%ebx), %edi
.LBE11084:
.LBE11086:
.LBE11088:
.LBE11113:
	.loc 17 383 0
	testb	$3, %bl
	je	.L2867
	jmp	.L2875
.LVL3097:
	.p2align 4,,10
	.p2align 3
.L2878:
.LBB11114:
.LBB11110:
.LBB11107:
.LBB11095:
.LBB11096:
	.loc 11 2161 0
	je	.L2876
.LVL3098:
.LBE11096:
.LBE11095:
	.loc 17 338 0
	testb	$1, %al
	je	.L2854
.LVL3099:
	.loc 17 342 0
	movl	%ebx, %edx
.LBB11098:
.LBB11099:
	.loc 11 2094 0
	andl	$-2097152, %eax
.LVL3100:
.LBE11099:
.LBE11098:
	.loc 17 342 0
	andl	$4194303, %edx
.LVL3101:
.L2856:
.LBE11107:
.LBE11110:
	.loc 17 393 0
	subl	$4, %esp
	.cfi_def_cfa_offset 52
	pushl	-536870912(%eax,%edx)
	.cfi_def_cfa_offset 56
.LVL3102:
	pushl	%ebx
	.cfi_def_cfa_offset 60
.LVL3103:
	addl	$4, %ebx
.LVL3104:
	pushl	$.LC537
	.cfi_def_cfa_offset 64
.LVL3105:
	call	kprintf
.LVL3106:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.LVL3107:
.LBE11114:
	.loc 17 388 0
	cmpl	%ebx, %edi
	je	.L2877
.LVL3108:
.L2867:
.LBB11115:
.LBB11111:
.LBB11108:
.LBB11100:
.LBB11101:
	.loc 11 1937 0
	movl	%ebx, %eax
	shrl	$22, %eax
	movl	(%esi,%eax,4), %eax
.LVL3109:
.LBE11101:
.LBE11100:
	.loc 17 337 0
	testb	$-128, %al
	jne	.L2878
.L2854:
	.loc 17 344 0
	subl	$4, %esp
	.cfi_def_cfa_offset 52
	pushl	%ebx
	.cfi_def_cfa_offset 56
	pushl	%esi
	.cfi_def_cfa_offset 60
	pushl	%ebp
	.cfi_def_cfa_offset 64
	call	lookupPTSlot
	.cfi_def_cfa_offset 60
.LVL3110:
	movl	24(%esp), %eax
.LVL3111:
	.loc 17 345 0
	addl	$12, %esp
	.cfi_def_cfa_offset 48
	movl	8(%esp), %edx
	testl	%edx, %edx
	jne	.L2857
.LVL3112:
.LBB11102:
.LBB11103:
	.loc 11 142 0
	movl	(%eax), %eax
.LVL3113:
.LBE11103:
.LBE11102:
	.loc 17 345 0
	testb	$1, %al
	je	.L2857
.LVL3114:
	.loc 17 347 0
	movl	%ebx, %edx
.LBB11104:
.LBB11105:
	.loc 11 87 0
	andl	$-4096, %eax
.LVL3115:
.LBE11105:
.LBE11104:
	.loc 17 347 0
	andl	$4095, %edx
.LVL3116:
	jmp	.L2856
.LVL3117:
	.p2align 4,,10
	.p2align 3
.L2857:
.LBE11108:
.LBE11111:
	.loc 17 395 0
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	%ebx
	.cfi_def_cfa_offset 60
	addl	$4, %ebx
.LVL3118:
	pushl	$.LC536
	.cfi_def_cfa_offset 64
.LVL3119:
	call	kprintf
.LVL3120:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.LBE11115:
	.loc 17 388 0
	cmpl	%ebx, %edi
	jne	.L2867
.LVL3121:
.L2877:
	.loc 17 398 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3122:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3123:
	.p2align 4,,10
	.p2align 3
.L2875:
	.cfi_restore_state
	.loc 17 384 0
	movl	$.LC535, 48(%esp)
.LVL3124:
	.loc 17 398 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 17 384 0
	jmp	kprintf
.LVL3125:
.L2876:
	.cfi_restore_state
.LBB11116:
.LBB11112:
.LBB11109:
.LBB11106:
.LBB11097:
	call	pde_pde_large_ptr_get_present.part.153
.LVL3126:
.L2874:
.LBE11097:
.LBE11106:
.LBE11109:
.LBE11112:
.LBE11116:
.LBB11117:
.LBB11089:
.LBB11087:
.LBB11085:
.LBB11083:
.LBB11082:
	call	cap_page_directory_cap_get_capPDBasePtr.isra.129.part.130
.LVL3127:
.LBE11082:
.LBE11083:
.LBE11085:
.LBE11087:
.LBE11089:
.LBE11117:
	.cfi_endproc
.LFE483:
	.size	Arch_userStackTrace, .-Arch_userStackTrace
	.section	.text.unlikely
.LCOLDE538:
	.text
.LHOTE538:
	.section	.rodata.str1.1
.LC539:
	.string	"IPC Buffer is an invalid cap."
	.section	.rodata.str1.4
	.align 4
.LC540:
	.string	"Specifying a device frame as an IPC buffer is not permitted."
	.align 4
.LC541:
	.string	"IPC Buffer vaddr 0x%x is not aligned."
	.section	.text.unlikely
.LCOLDB542:
	.text
.LHOTB542:
	.p2align 4,,15
	.globl	checkValidIPCBuffer
	.type	checkValidIPCBuffer, @function
checkValidIPCBuffer:
.LFB546:
	.loc 20 651 0
	.cfi_startproc
.LVL3128:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 20 651 0
	movl	20(%esp), %eax
.LVL3129:
.LBB11118:
.LBB11119:
	.loc 11 2202 0
	movl	%eax, %ebx
	.loc 11 2203 0
	movl	%eax, %ecx
	movzbl	%al, %edx
	.loc 11 2202 0
	andl	$14, %ebx
	.loc 11 2203 0
	andl	$15, %ecx
	cmpl	$14, %ebx
	cmovne	%ecx, %edx
.LVL3130:
.LBE11119:
.LBE11118:
	.loc 20 652 0
	cmpl	$1, %edx
	je	.L2882
	.loc 20 653 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	pushl	556(%eax)
	.cfi_def_cfa_offset 24
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	pushl	$653
	.cfi_def_cfa_offset 36
	pushl	$__func__.7089
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL3131:
	addl	$20, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC539
	.cfi_def_cfa_offset 32
.L2890:
	.loc 20 658 0
	call	kprintf
.LVL3132:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL3133:
	.loc 20 660 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	$3, %eax
	.loc 20 659 0
	movl	$3, current_syscall_error+24
.L2883:
	.loc 20 670 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L2882:
	.cfi_restore_state
.LVL3134:
.LBB11120:
.LBB11121:
	.loc 11 2930 0
	cmpl	$1, %ecx
	jne	.L2891
.LVL3135:
.LBE11121:
.LBE11120:
	.loc 20 657 0
	testl	$268435456, %eax
	jne	.L2892
	.loc 20 663 0
	movl	16(%esp), %eax
	andl	$511, %eax
	je	.L2883
	.loc 20 664 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	pushl	556(%eax)
	.cfi_def_cfa_offset 24
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	pushl	$664
	.cfi_def_cfa_offset 36
	pushl	$__func__.7089
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL3136:
	addl	$24, %esp
	.cfi_def_cfa_offset 24
	pushl	24(%esp)
	.cfi_def_cfa_offset 28
	pushl	$.LC541
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL3137:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL3138:
	.loc 20 666 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	$3, %eax
	.loc 20 665 0
	movl	$5, current_syscall_error+24
	.loc 20 670 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L2892:
	.cfi_restore_state
	.loc 20 658 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	556(%eax)
	.cfi_def_cfa_offset 24
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	pushl	$658
	.cfi_def_cfa_offset 36
	pushl	$__func__.7089
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL3139:
	addl	$20, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC540
	.cfi_def_cfa_offset 32
	jmp	.L2890
.LVL3140:
.L2891:
	.cfi_restore_state
.LBB11123:
.LBB11122:
	.loc 11 2930 0
	pushl	$__FUNCTION__.2515
	.cfi_def_cfa_offset 20
	pushl	$2931
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC216
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL3141:
.LBE11122:
.LBE11123:
	.cfi_endproc
.LFE546:
	.size	checkValidIPCBuffer, .-checkValidIPCBuffer
	.section	.text.unlikely
.LCOLDE542:
	.text
.LHOTE542:
	.section	.rodata.str1.4
	.align 4
.LC543:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/object/ioport.c"
	.section	.rodata.str1.1
.LC544:
	.string	"first_allowed <= last_allowed"
.LC545:
	.string	"start_port <= end_port"
	.section	.rodata.str1.4
	.align 4
.LC546:
	.string	"IOPort: Ports %d--%d fall outside permitted range %d--%d."
	.section	.text.unlikely
.LCOLDB547:
	.text
.LHOTB547:
	.p2align 4,,15
	.type	ensurePortOperationAllowed, @function
ensurePortOperationAllowed:
.LFB605:
	.file 70 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/object/ioport.c"
	.loc 70 21 0
	.cfi_startproc
.LVL3142:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$12, %esp
	.cfi_def_cfa_offset 32
.LBB11124:
.LBB11125:
	.loc 11 3622 0
	cmpb	$31, %al
	jne	.L2903
.LBE11125:
.LBE11124:
	.loc 70 24 0
	movl	32(%esp), %eax
.LVL3143:
.LBB11129:
.LBB11126:
	.loc 11 3625 0
	movl	%edx, %ebp
.LBE11126:
.LBE11129:
.LBB11130:
.LBB11131:
	.loc 11 3639 0
	movzwl	%dx, %ebx
	movl	%ecx, %edi
.LBE11131:
.LBE11130:
.LBB11132:
.LBB11127:
	.loc 11 3625 0
	shrl	$16, %ebp
.LVL3144:
.LBE11127:
.LBE11132:
	.loc 70 24 0
	leal	-1(%ecx,%eax), %esi
.LVL3145:
	.loc 70 25 0
	cmpl	%ebp, %ebx
	jb	.L2904
	.loc 70 26 0
	cmpl	%esi, %ecx
	ja	.L2905
	.loc 70 28 0
	cmpl	%ebp, %ecx
	jb	.L2900
	.loc 70 36 0
	xorl	%eax, %eax
	.loc 70 28 0
	cmpl	%ebx, %esi
	ja	.L2900
	.loc 70 37 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3146:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3147:
	.p2align 4,,10
	.p2align 3
.L2900:
	.cfi_restore_state
	.loc 70 29 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	pushl	556(%eax)
	.cfi_def_cfa_offset 40
	leal	668(%eax), %edx
.LVL3148:
	pushl	%edx
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	pushl	$31
	.cfi_def_cfa_offset 52
	pushl	$__func__.7649
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	$.LC111
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL3149:
	addl	$20, %esp
	.cfi_def_cfa_offset 44
	pushl	%ebx
	.cfi_def_cfa_offset 48
	pushl	%ebp
	.cfi_def_cfa_offset 52
	pushl	%esi
	.cfi_def_cfa_offset 56
	pushl	%edi
	.cfi_def_cfa_offset 60
	pushl	$.LC546
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL3150:
	addl	$20, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC113
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL3151:
	.loc 70 33 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	$3, %eax
	.loc 70 32 0
	movl	$3, current_syscall_error+24
	.loc 70 37 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3152:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL3153:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3154:
.L2905:
	.cfi_restore_state
	.loc 70 26 0 discriminator 1
	pushl	$__FUNCTION__.7648
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	pushl	$26
	.cfi_def_cfa_offset 40
	pushl	$.LC543
	.cfi_def_cfa_offset 44
	pushl	$.LC545
	.cfi_def_cfa_offset 48
	call	_assert_fail
.LVL3155:
.L2904:
	.cfi_restore_state
	.loc 70 25 0 discriminator 1
	pushl	$__FUNCTION__.7648
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	pushl	$25
	.cfi_def_cfa_offset 40
	pushl	$.LC543
	.cfi_def_cfa_offset 44
	pushl	$.LC544
	.cfi_def_cfa_offset 48
	call	_assert_fail
.LVL3156:
.L2903:
	.cfi_restore_state
.LBB11133:
.LBB11128:
	call	cap_io_port_cap_get_capIOPortFirstPort.part.194
.LVL3157:
.LBE11128:
.LBE11133:
	.cfi_endproc
.LFE605:
	.size	ensurePortOperationAllowed, .-ensurePortOperationAllowed
	.section	.text.unlikely
.LCOLDE547:
	.text
.LHOTE547:
	.section	.rodata.str1.1
.LC548:
	.string	"Deriving an unmapped PT cap"
	.section	.rodata.str1.4
	.align 4
.LC549:
	.string	"Deriving a PD cap without an assigned ASID"
	.section	.text.unlikely
.LCOLDB550:
	.text
.LHOTB550:
	.p2align 4,,15
	.globl	Arch_deriveCap
	.type	Arch_deriveCap, @function
Arch_deriveCap:
.LFB622:
	.loc 28 28 0
	.cfi_startproc
.LVL3158:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	24(%esp), %edx
	.loc 28 28 0
	movl	16(%esp), %ebx
	movl	28(%esp), %ecx
.LVL3159:
.LBB11134:
.LBB11135:
	.loc 11 2202 0
	movl	%edx, %edi
	.loc 11 2203 0
	movl	%edx, %esi
	movzbl	%dl, %eax
	.loc 11 2202 0
	andl	$14, %edi
	.loc 11 2203 0
	andl	$15, %esi
	cmpl	$14, %edi
	cmovne	%esi, %eax
.LVL3160:
.LBE11135:
.LBE11134:
	.loc 28 31 0
	subl	$3, %eax
	cmpl	$28, %eax
	ja	.L2909
	jmp	*.L2911(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L2911:
	.long	.L2910
	.long	.L2909
	.long	.L2912
	.long	.L2909
	.long	.L2909
	.long	.L2909
	.long	.L2914
	.long	.L2909
	.long	.L2914
	.long	.L2909
	.long	.L2914
	.long	.L2909
	.long	.L2915
	.long	.L2909
	.long	.L2909
	.long	.L2909
	.long	.L2909
	.long	.L2909
	.long	.L2909
	.long	.L2909
	.long	.L2909
	.long	.L2909
	.long	.L2909
	.long	.L2909
	.long	.L2909
	.long	.L2909
	.long	.L2909
	.long	.L2909
	.long	.L2914
	.text
	.p2align 4,,10
	.p2align 3
.L2914:
.LVL3161:
	.loc 28 70 0
	movl	$0, (%ebx)
	.loc 28 139 0
	movl	%ebx, %eax
	.loc 28 70 0
	movl	%edx, 4(%ebx)
	movl	%ecx, 8(%ebx)
	.loc 28 139 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL3162:
	.p2align 4,,10
	.p2align 3
.L2915:
	.cfi_restore_state
.LBB11136:
.LBB11137:
	.loc 11 3486 0
	cmpb	$15, %dl
	jne	.L2929
.LBE11137:
.LBE11136:
	.loc 28 74 0
	xorl	%eax, %eax
	.loc 28 72 0
	testl	%ecx, %ecx
	js	.L2923
	.loc 28 76 0
	movl	$3, current_syscall_error+24
.LVL3163:
.LBB11139:
.LBB11140:
	.loc 11 2225 0
	xorl	%ecx, %ecx
	xorl	%edx, %edx
.LBE11140:
.LBE11139:
	.loc 28 78 0
	movl	$3, %eax
.LVL3164:
.L2923:
	.loc 28 80 0
	movl	%eax, (%ebx)
	.loc 28 139 0
	movl	%ebx, %eax
.LVL3165:
	.loc 28 80 0
	movl	%edx, 4(%ebx)
	movl	%ecx, 8(%ebx)
	.loc 28 139 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL3166:
	.p2align 4,,10
	.p2align 3
.L2910:
	.cfi_restore_state
.LBB11141:
.LBB11142:
	.loc 11 3032 0
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$3, %eax
	jne	.L2930
.LBE11142:
.LBE11141:
	.loc 28 35 0
	xorl	%eax, %eax
	.loc 28 33 0
	testl	$8388608, %ecx
	jne	.L2923
	.loc 28 37 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	pushl	556(%eax)
	.cfi_def_cfa_offset 24
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	pushl	$37
	.cfi_def_cfa_offset 36
	pushl	$__func__.7809
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL3167:
	addl	$20, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC548
	.cfi_def_cfa_offset 32
.LVL3168:
.L2928:
	.loc 28 49 0
	call	kprintf
.LVL3169:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL3170:
	.loc 28 50 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.LBB11144:
.LBB11145:
	.loc 11 2225 0
	xorl	%ecx, %ecx
	xorl	%edx, %edx
.LBE11145:
.LBE11144:
	.loc 28 50 0
	movl	$3, current_syscall_error+24
.LVL3171:
	.loc 28 52 0
	movl	$3, %eax
.LVL3172:
	jmp	.L2923
.LVL3173:
	.p2align 4,,10
	.p2align 3
.L2912:
.LBB11146:
.LBB11147:
	.loc 11 3159 0
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$5, %eax
	jne	.L2931
.LBE11147:
.LBE11146:
	.loc 28 47 0
	xorl	%eax, %eax
	.loc 28 45 0
	testb	$64, %ch
	jne	.L2923
	.loc 28 49 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	556(%eax)
	.cfi_def_cfa_offset 24
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	pushl	$49
	.cfi_def_cfa_offset 36
	pushl	$__func__.7809
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL3174:
	addl	$20, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC549
	.cfi_def_cfa_offset 32
	jmp	.L2928
.LVL3175:
	.p2align 4,,10
	.p2align 3
.L2909:
	.cfi_restore_state
	.loc 28 137 0
	pushl	28(%esp)
	.cfi_def_cfa_offset 20
	pushl	28(%esp)
	.cfi_def_cfa_offset 24
	pushl	28(%esp)
	.cfi_def_cfa_offset 28
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	Mode_deriveCap
	.cfi_def_cfa_offset 28
.LVL3176:
	.loc 28 139 0
	movl	%ebx, %eax
	.loc 28 137 0
	addl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 28 139 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL3177:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL3178:
.L2929:
	.cfi_restore_state
.LBB11149:
.LBB11138:
	call	cap_io_page_table_cap_get_capIOPTIsMapped.part.199
.LVL3179:
.L2931:
.LBE11138:
.LBE11149:
.LBB11150:
.LBB11148:
	call	cap_page_directory_cap_get_capPDIsMapped.part.149
.LVL3180:
.L2930:
.LBE11148:
.LBE11150:
.LBB11151:
.LBB11143:
	call	cap_page_table_cap_get_capPTIsMapped.part.142
.LVL3181:
.LBE11143:
.LBE11151:
	.cfi_endproc
.LFE622:
	.size	Arch_deriveCap, .-Arch_deriveCap
	.section	.text.unlikely
.LCOLDE550:
	.text
.LHOTE550:
	.section	.text.unlikely
.LCOLDB551:
	.text
.LHOTB551:
	.p2align 4,,15
	.globl	deriveCap
	.type	deriveCap, @function
deriveCap:
.LFB785:
	.loc 45 58 0
	.cfi_startproc
.LVL3182:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	24(%esp), %ebx
.LVL3183:
	.loc 45 58 0
	movl	16(%esp), %esi
.LBB11152:
.LBB11153:
.LBB11154:
.LBB11155:
	.loc 11 2202 0
	movl	%ebx, %eax
	andl	$14, %eax
	cmpl	$14, %eax
	je	.L2933
.LVL3184:
.LBE11155:
.LBE11154:
.LBE11153:
.LBE11152:
.LBB11156:
.LBB11157:
	.loc 11 2203 0
	movl	%ebx, %eax
	andl	$15, %eax
.LBE11157:
.LBE11156:
	.loc 45 61 0
	testb	$1, %bl
	jne	.L2934
.L2938:
	movl	28(%esp), %edi
	.loc 45 65 0
	cmpl	$8, %eax
	je	.L2943
	ja	.L2941
	cmpl	$2, %eax
	jne	.L2958
	.loc 45 77 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	32(%esp)
	.cfi_def_cfa_offset 32
	call	ensureNoChildren
.LVL3185:
.LBB11159:
.LBB11160:
	.loc 11 2225 0
	xorl	%edx, %edx
.LBE11160:
.LBE11159:
	.loc 45 78 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.LBB11162:
.LBB11161:
	.loc 11 2225 0
	testl	%eax, %eax
	cmovne	%edx, %edi
	cmovne	%edx, %ebx
.LVL3186:
.L2940:
.LBE11161:
.LBE11162:
	.loc 45 95 0
	movl	%eax, (%esi)
	.loc 45 96 0
	movl	%esi, %eax
.LVL3187:
	.loc 45 95 0
	movl	%ebx, 4(%esi)
	movl	%edi, 8(%esi)
.LVL3188:
	.loc 45 96 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
.LVL3189:
	.p2align 4,,10
	.p2align 3
.L2941:
	.cfi_restore_state
	.loc 45 65 0
	cmpl	$14, %eax
	je	.L2943
	cmpl	$46, %eax
	je	.L2943
.L2958:
	.loc 45 67 0
	xorl	%eax, %eax
	jmp	.L2940
	.p2align 4,,10
	.p2align 3
.L2943:
.LBB11163:
.LBB11164:
	.loc 11 2225 0
	xorl	%edi, %edi
	xorl	%ebx, %ebx
.LBE11164:
.LBE11163:
	.loc 45 67 0
	xorl	%eax, %eax
	jmp	.L2940
.LVL3190:
	.p2align 4,,10
	.p2align 3
.L2933:
.LBB11165:
.LBB11158:
	.loc 11 2204 0
	movzbl	%bl, %eax
.LBE11158:
.LBE11165:
	.loc 45 61 0
	testb	$1, %bl
	je	.L2938
.L2934:
	.loc 45 62 0
	pushl	28(%esp)
	.cfi_def_cfa_offset 20
	pushl	28(%esp)
	.cfi_def_cfa_offset 24
	pushl	28(%esp)
	.cfi_def_cfa_offset 28
	pushl	%esi
	.cfi_def_cfa_offset 32
	call	Arch_deriveCap
	.cfi_def_cfa_offset 28
.LVL3191:
	.loc 45 96 0
	movl	%esi, %eax
	.loc 45 62 0
	addl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 45 96 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL3192:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret	$4
	.cfi_endproc
.LFE785:
	.size	deriveCap, .-deriveCap
	.section	.text.unlikely
.LCOLDE551:
	.text
.LHOTE551:
	.section	.text.unlikely
.LCOLDB552:
	.text
.LHOTB552:
	.p2align 4,,15
	.globl	doNormalTransfer
	.type	doNormalTransfer, @function
doNormalTransfer:
.LFB686:
	.loc 32 150 0
	.cfi_startproc
.LVL3193:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$92, %esp
	.cfi_def_cfa_offset 112
	.loc 32 150 0
	movl	112(%esp), %edx
.LVL3194:
	movl	136(%esp), %esi
.LBB11218:
.LBB11219:
	.loc 15 36 0
	movl	528(%edx), %ebp
.LVL3195:
.LBE11219:
.LBE11218:
.LBB11220:
.LBB11221:
	.loc 34 89 0
	movl	%ebp, %ebx
	andl	$127, %ebx
	cmpl	$120, %ebx
	jbe	.L2960
.LVL3196:
.LBB11222:
.LBB11223:
	.loc 60 125 0
	andl	$-128, %ebp
.LVL3197:
	.loc 60 126 0
	movl	$120, %ebx
	orl	$120, %ebp
.LVL3198:
.L2960:
.LBE11223:
.LBE11222:
.LBE11221:
.LBE11220:
	.loc 32 158 0
	movl	128(%esp), %ecx
	testl	%ecx, %ecx
	jne	.L2999
	.loc 32 165 0
	movl	current_extra_caps+4, %eax
	.loc 32 166 0
	xorl	%ecx, %ecx
	.loc 32 165 0
	movl	%eax, 48(%esp)
	movl	current_extra_caps+8, %eax
	movl	%eax, 52(%esp)
.LVL3199:
.L2962:
.LBB11224:
.LBB11225:
	.loc 31 328 0
	testl	%ebx, %ebx
	je	.L2963
.LVL3200:
.LBB11226:
.LBB11227:
	.loc 15 36 0
	movl	532(%edx), %eax
.LVL3201:
.LBE11227:
.LBE11226:
.LBB11229:
.LBB11230:
	.loc 15 30 0
	movl	132(%esp), %edi
	movl	%eax, 532(%edi)
.LVL3202:
.LBE11230:
.LBE11229:
	.loc 31 328 0
	cmpl	$1, %ebx
	je	.L2963
.LVL3203:
.LBB11232:
.LBB11228:
	.loc 15 36 0
	movl	536(%edx), %eax
.LVL3204:
.LBE11228:
.LBE11232:
	.loc 31 333 0
	testl	%esi, %esi
	movl	116(%esp), %edx
.LVL3205:
.LBB11233:
.LBB11231:
	.loc 15 30 0
	movl	%eax, 536(%edi)
.LVL3206:
.LBE11231:
.LBE11233:
	.loc 31 333 0
	sete	%al
	testl	%edx, %edx
	sete	%dl
	orb	%al, %dl
	jne	.L2979
	.loc 31 338 0
	cmpl	$2, %ebx
	jbe	.L2980
	movl	116(%esp), %edi
	movl	$2, %eax
	movb	%dl, 12(%esp)
.LVL3207:
	.p2align 4,,10
	.p2align 3
.L2965:
	.loc 31 339 0
	addl	$1, %eax
.LVL3208:
	movl	(%edi,%eax,4), %edx
	movl	%edx, (%esi,%eax,4)
.LVL3209:
	.loc 31 338 0
	cmpl	%ebx, %eax
	jne	.L2965
	movzbl	12(%esp), %edx
	jmp	.L2964
.LVL3210:
	.p2align 4,,10
	.p2align 3
.L2963:
	.loc 31 333 0
	testl	%esi, %esi
	sete	%dl
.LVL3211:
.L2964:
	movl	48(%esp), %eax
	movl	%ecx, 44(%esp)
.LBE11225:
.LBE11224:
.LBB11236:
.LBB11237:
.LBB11238:
.LBB11239:
	.loc 60 85 0
	andl	$-3969, %ebp
.LVL3212:
.LBE11239:
.LBE11238:
	.loc 32 205 0
	movl	%ecx, %edi
	movl	%ecx, 56(%esp)
	movl	%eax, 60(%esp)
	movl	52(%esp), %eax
	movl	%eax, 64(%esp)
.LVL3213:
	testl	%ecx, %ecx
	je	.L2966
	testb	%dl, %dl
	je	.L3000
.LVL3214:
.L2966:
.LBE11237:
.LBE11236:
.LBB11268:
.LBB11269:
	.loc 15 30 0
	movl	132(%esp), %eax
	andl	$-128, %ebp
.LVL3215:
	orl	%ebp, %ebx
.LVL3216:
.LBE11269:
.LBE11268:
.LBB11271:
.LBB11272:
	movl	132(%esp), %ecx
.LBE11272:
.LBE11271:
.LBB11274:
.LBB11270:
	movl	%ebx, 528(%eax)
.LVL3217:
.LBE11270:
.LBE11274:
.LBB11275:
.LBB11273:
	movl	124(%esp), %eax
	movl	%eax, 516(%ecx)
.LVL3218:
.LBE11273:
.LBE11275:
	.loc 32 177 0
	addl	$92, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3219:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3220:
	.p2align 4,,10
	.p2align 3
.L2999:
	.cfi_restore_state
	.loc 32 159 0
	subl	$4, %esp
	.cfi_def_cfa_offset 116
	pushl	%ebp
	.cfi_def_cfa_offset 120
	pushl	124(%esp)
	.cfi_def_cfa_offset 124
	pushl	%edx
	.cfi_def_cfa_offset 128
	movl	%edx, 28(%esp)
	call	lookupExtraCaps
.LVL3221:
	.loc 32 160 0
	movl	current_extra_caps+4, %ecx
	movl	%ecx, 64(%esp)
	movl	current_extra_caps+8, %ecx
	movl	%ecx, 68(%esp)
.LVL3222:
	.loc 32 161 0
	addl	$16, %esp
	.cfi_def_cfa_offset 112
	.loc 32 162 0
	movl	$0, %ecx
	testl	%eax, %eax
	movl	12(%esp), %edx
	cmove	current_extra_caps, %ecx
	jmp	.L2962
.LVL3223:
	.p2align 4,,10
	.p2align 3
.L3000:
.LBB11276:
.LBB11266:
	.loc 32 209 0
	subl	$8, %esp
	.cfi_def_cfa_offset 120
	pushl	%esi
	.cfi_def_cfa_offset 124
	pushl	144(%esp)
	.cfi_def_cfa_offset 128
	call	getReceiveSlots
.LVL3224:
	addl	$16, %esp
	.cfi_def_cfa_offset 112
	.loc 32 211 0
	xorl	%ecx, %ecx
.LBB11240:
.LBB11241:
.LBB11242:
	.loc 60 86 0
	movl	%ebp, 24(%esp)
	movl	%eax, %ebp
.LVL3225:
	movl	%esi, 136(%esp)
	movl	%ecx, %esi
.LVL3226:
	movl	%ebx, 28(%esp)
.LVL3227:
.L2976:
.LBE11242:
.LBE11241:
	.loc 32 213 0
	movl	4(%edi), %eax
	movl	%eax, 12(%esp)
.LVL3228:
	movl	(%edi), %eax
.LVL3229:
.LBB11246:
.LBB11247:
	.loc 11 2202 0
	movl	%eax, %edx
	andl	$14, %edx
	movl	%edx, 20(%esp)
	.loc 11 2203 0
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$14, 20(%esp)
	movl	%edx, 16(%esp)
	movzbl	%al, %edx
	cmovne	16(%esp), %edx
.LVL3230:
.LBE11247:
.LBE11246:
	.loc 32 215 0
	cmpl	$4, %edx
	je	.L3001
.L2969:
.LBB11248:
	.loc 32 228 0
	testl	%ebp, %ebp
	je	.L2998
	.loc 32 232 0
	movl	12(%esp), %ebx
.LVL3231:
	pushl	%ebx
	.cfi_def_cfa_offset 116
.LVL3232:
	pushl	%eax
	.cfi_def_cfa_offset 120
	pushl	%edi
	.cfi_def_cfa_offset 124
	leal	80(%esp), %eax
.LVL3233:
	pushl	%eax
	.cfi_def_cfa_offset 128
	call	deriveCap
	.cfi_def_cfa_offset 124
.LVL3234:
	.loc 32 234 0
	addl	$12, %esp
	.cfi_def_cfa_offset 112
	movl	68(%esp), %eax
	testl	%eax, %eax
	jne	.L2998
	movl	72(%esp), %eax
.LVL3235:
.LBB11249:
.LBB11250:
	.loc 11 2202 0
	movl	%eax, %ecx
	.loc 11 2203 0
	movl	%eax, %edx
	movzbl	%al, %eax
.LVL3236:
	.loc 11 2202 0
	andl	$14, %ecx
	.loc 11 2203 0
	andl	$15, %edx
.LVL3237:
	cmpl	$14, %ecx
	cmovne	%edx, %eax
.LVL3238:
.LBE11250:
.LBE11249:
	.loc 32 237 0
	testl	%eax, %eax
	je	.L2998
	.loc 32 241 0
	pushl	%ebp
	.cfi_def_cfa_offset 116
	.loc 32 243 0
	xorl	%ebp, %ebp
.LVL3239:
	.loc 32 241 0
	pushl	%edi
	.cfi_def_cfa_offset 120
.LVL3240:
	pushl	84(%esp)
	.cfi_def_cfa_offset 124
	pushl	84(%esp)
	.cfi_def_cfa_offset 128
	call	cteInsert
.LVL3241:
	addl	$16, %esp
	.cfi_def_cfa_offset 112
.LVL3242:
.L2971:
.LBE11248:
.LBE11240:
	.loc 32 211 0
	addl	$1, %esi
.LVL3243:
	cmpl	$3, %esi
	je	.L2981
	movl	56(%esp,%esi,4), %edi
.LVL3244:
	testl	%edi, %edi
	jne	.L2976
.LVL3245:
.L2998:
	movl	28(%esp), %ebx
.LVL3246:
	movl	%esi, %eax
	movl	24(%esp), %ebp
.LVL3247:
	sall	$7, %eax
	andl	$384, %eax
.L2975:
.LVL3248:
.LBB11262:
.LBB11263:
	.loc 60 105 0
	andl	$-385, %ebp
.LVL3249:
	.loc 60 106 0
	orl	%eax, %ebp
.LVL3250:
	jmp	.L2966
.LVL3251:
.L2981:
	movl	28(%esp), %ebx
.LVL3252:
.LBE11263:
.LBE11262:
	.loc 32 211 0
	movl	$384, %eax
	movl	24(%esp), %ebp
.LVL3253:
	jmp	.L2975
.LVL3254:
.L3001:
.LBB11264:
.LBB11251:
.LBB11252:
	.loc 11 2358 0
	cmpl	$4, 16(%esp)
	jne	.L3002
.LBE11252:
.LBE11251:
	.loc 32 215 0
	movl	12(%esp), %edx
	andl	$-16, %edx
	cmpl	%edx, 120(%esp)
	jne	.L2969
.LVL3255:
.LBB11254:
.LBB11243:
	.loc 60 85 0
	movl	24(%esp), %edx
.LBE11243:
.LBE11254:
.LBB11255:
.LBB11256:
	.loc 31 252 0
	shrl	$4, %eax
.LVL3256:
.LBE11256:
.LBE11255:
.LBB11258:
.LBB11244:
	.loc 60 86 0
	movl	$1, %edi
.LVL3257:
.LBE11244:
.LBE11258:
.LBB11259:
.LBB11257:
	.loc 31 252 0
	movl	136(%esp), %ecx
	movl	%eax, 488(%ecx,%esi,4)
.LVL3258:
.LBE11257:
.LBE11259:
.LBB11260:
.LBB11245:
	.loc 60 85 0
	movl	%edx, %eax
	.loc 60 86 0
	movl	%esi, %ecx
	andl	$3584, %edx
.LVL3259:
	shrl	$9, %edx
	sall	%cl, %edi
	.loc 60 85 0
	andb	$241, %ah
.LVL3260:
	.loc 60 86 0
	orl	%edi, %edx
	sall	$9, %edx
	andl	$3584, %edx
	orl	%edx, %eax
.LVL3261:
	movl	%eax, 24(%esp)
.LVL3262:
	jmp	.L2971
.LVL3263:
.L2979:
.LBE11245:
.LBE11260:
.LBE11264:
.LBE11266:
.LBE11276:
.LBB11277:
.LBB11234:
	.loc 31 333 0
	movl	%eax, %edx
	.loc 31 328 0
	movl	$2, %ebx
	jmp	.L2964
.LVL3264:
.L3002:
.LBE11234:
.LBE11277:
.LBB11278:
.LBB11267:
.LBB11265:
.LBB11261:
.LBB11253:
	call	cap_endpoint_cap_get_capEPPtr.part.117
.LVL3265:
.L2980:
.LBE11253:
.LBE11261:
.LBE11265:
.LBE11267:
.LBE11278:
.LBB11279:
.LBB11235:
	.loc 31 338 0
	movl	$2, %ebx
	jmp	.L2964
.LBE11235:
.LBE11279:
	.cfi_endproc
.LFE686:
	.size	doNormalTransfer, .-doNormalTransfer
	.section	.text.unlikely
.LCOLDE552:
	.text
.LHOTE552:
	.section	.text.unlikely
.LCOLDB553:
	.text
.LHOTB553:
	.p2align 4,,15
	.globl	doIPCTransfer
	.type	doIPCTransfer, @function
doIPCTransfer:
.LFB684:
	.loc 32 104 0
	.cfi_startproc
.LVL3266:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$36, %esp
	.cfi_def_cfa_offset 56
	.loc 32 104 0
	movl	60(%esp), %eax
	movl	72(%esp), %ebx
	movl	56(%esp), %edi
	movl	64(%esp), %esi
	movl	%eax, 16(%esp)
	movl	68(%esp), %ebp
	.loc 32 107 0
	pushl	%ebx
	.cfi_def_cfa_offset 60
	pushl	$1
	.cfi_def_cfa_offset 64
	call	lookupIPCBuffer
.LVL3267:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.LVL3268:
	.loc 32 109 0
	testb	$7, 604(%edi)
	jne	.L3004
	movl	%eax, 12(%esp)
	.loc 32 110 0
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	%edi
	.cfi_def_cfa_offset 60
	pushl	$0
	.cfi_def_cfa_offset 64
	call	lookupIPCBuffer
.LVL3269:
	addl	$12, %esp
	.cfi_def_cfa_offset 52
.LVL3270:
	.loc 32 111 0
	movl	16(%esp), %ecx
	pushl	%ecx
	.cfi_def_cfa_offset 56
	pushl	%ebx
	.cfi_def_cfa_offset 60
	pushl	%ebp
	.cfi_def_cfa_offset 64
	pushl	%esi
	.cfi_def_cfa_offset 68
	pushl	28(%esp)
	.cfi_def_cfa_offset 72
	pushl	%eax
	.cfi_def_cfa_offset 76
	pushl	%edi
	.cfi_def_cfa_offset 80
	call	doNormalTransfer
.LVL3271:
	addl	$32, %esp
	.cfi_def_cfa_offset 48
	.loc 32 116 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3272:
	.p2align 4,,10
	.p2align 3
.L3004:
	.cfi_restore_state
	.loc 32 114 0
	movl	%ebx, 56(%esp)
	movl	%edi, 52(%esp)
	movl	%esi, 48(%esp)
	movl	%eax, 60(%esp)
	.loc 32 116 0
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 32 114 0
	jmp	doFaultTransfer
.LVL3273:
	.cfi_endproc
.LFE684:
	.size	doIPCTransfer, .-doIPCTransfer
	.section	.text.unlikely
.LCOLDE553:
	.text
.LHOTE553:
	.section	.rodata.str1.4
	.align 4
.LC554:
	.string	"(((~0x8 >> 3) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0)"
	.align 4
.LC555:
	.string	"(((~0x4 >> 2) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0)"
	.section	.rodata.str1.1
.LC556:
	.string	"dest"
	.section	.text.unlikely
.LCOLDB557:
	.text
.LHOTB557:
	.p2align 4,,15
	.globl	sendIPC
	.type	sendIPC, @function
sendIPC:
.LFB754:
	.loc 64 42 0
	.cfi_startproc
.LVL3274:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 64 42 0
	movl	68(%esp), %eax
	movl	84(%esp), %esi
	movl	64(%esp), %ecx
	movl	76(%esp), %edi
	movl	%eax, 12(%esp)
	movl	72(%esp), %eax
	movl	80(%esp), %ebx
	movl	%eax, 16(%esp)
	movl	(%esi), %eax
.LVL3275:
	.loc 64 43 0
	movl	%eax, %edx
	andl	$3, %edx
	cmpl	$1, %edx
	jbe	.L3010
	cmpl	$2, %edx
	jne	.L3008
.LVL3276:
	movl	4(%esi), %ecx
.LBB11334:
.LBB11335:
.LBB11336:
	.loc 64 27 0
	movl	%eax, %edx
	andl	$-16, %edx
	movl	%edx, 24(%esp)
.LBE11336:
.LBE11335:
	.loc 64 80 0
	movl	%ecx, %ebp
	movl	%ecx, 28(%esp)
.LVL3277:
	andl	$-16, %ebp
.LVL3278:
	je	.L3036
.LVL3279:
.LBB11337:
.LBB11338:
	.loc 31 227 0
	movl	656(%ebp), %edx
.LVL3280:
	.loc 31 228 0
	movl	652(%ebp), %ecx
	.loc 31 227 0
	testl	%edx, %edx
	je	.L3021
	.loc 31 228 0
	movl	%ecx, 652(%edx)
	movl	652(%ebp), %ecx
	movl	%ebp, 20(%esp)
.LVL3281:
.L3022:
	.loc 31 233 0
	testl	%ecx, %ecx
	je	.L3031
	.loc 31 234 0
	movl	%edx, 656(%ecx)
.LVL3282:
.L3023:
.LBE11338:
.LBE11337:
.LBB11340:
.LBB11341:
.LBB11342:
.LBB11343:
	.loc 11 880 0
	movl	20(%esp), %ecx
	testb	$15, %cl
	jne	.L3024
	.loc 11 882 0
	movl	28(%esp), %edx
	andl	$-16, %ecx
	andl	$15, %edx
	orl	%ecx, %edx
	movl	%edx, 4(%esi)
.LVL3283:
.LBE11343:
.LBE11342:
.LBB11344:
.LBB11345:
	.loc 11 899 0
	movl	24(%esp), %edx
	testb	$15, %dl
	jne	.L3025
	.loc 11 901 0
	andl	$-16, %edx
	andl	$15, %eax
.LVL3284:
	orl	%edx, %eax
.LBE11345:
.LBE11344:
.LBE11341:
.LBE11340:
	.loc 64 86 0
	movl	20(%esp), %edx
.LBB11349:
.LBB11348:
.LBB11347:
.LBB11346:
	.loc 11 901 0
	movl	%eax, (%esi)
.LVL3285:
.LBE11346:
.LBE11347:
.LBE11348:
.LBE11349:
	.loc 64 86 0
	testl	%edx, %edx
	je	.L3037
.L3026:
	.loc 64 91 0
	subl	$12, %esp
	.cfi_def_cfa_offset 76
	pushl	%ebp
	.cfi_def_cfa_offset 80
	pushl	%edi
	.cfi_def_cfa_offset 84
	pushl	36(%esp)
	.cfi_def_cfa_offset 88
	pushl	%esi
	.cfi_def_cfa_offset 92
	pushl	%ebx
	.cfi_def_cfa_offset 96
	call	doIPCTransfer
.LVL3286:
	.loc 64 93 0
	addl	$24, %esp
	.cfi_def_cfa_offset 72
	pushl	$1
	.cfi_def_cfa_offset 76
	pushl	%ebp
	.cfi_def_cfa_offset 80
	call	setThreadState
.LVL3287:
.LBB11350:
.LBB11351:
	.loc 32 409 0
	movl	%ebp, %eax
	movl	$1, %edx
	call	possibleSwitchTo
.LVL3288:
.LBE11351:
.LBE11350:
	.loc 64 96 0
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	movl	12(%esp), %eax
	testl	%eax, %eax
	je	.L3038
	.loc 64 98 0
	testl	%edi, %edi
	jne	.L3039
.L3029:
	.loc 64 101 0
	movl	%ebx, 64(%esp)
	movl	$0, 68(%esp)
.LBE11334:
	.loc 64 108 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3289:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL3290:
.LBB11355:
	.loc 64 101 0
	jmp	setThreadState
.LVL3291:
	.p2align 4,,10
	.p2align 3
.L3010:
	.cfi_restore_state
.LBE11355:
	.loc 64 46 0
	testl	%ecx, %ecx
	je	.L3008
.LVL3292:
.LBB11356:
.LBB11357:
.LBB11358:
	.loc 11 446 0
	movl	588(%ebx), %eax
	andl	$-16, %eax
	orl	$4, %eax
	movl	%eax, 588(%ebx)
.LVL3293:
.LBE11358:
.LBE11357:
.LBB11359:
.LBB11360:
	.loc 11 414 0
	testl	$15, %esi
	jne	.L3040
	.loc 11 416 0
	movl	%esi, %eax
.LBE11360:
.LBE11359:
.LBB11365:
.LBB11366:
	.loc 11 340 0
	movl	596(%ebx), %edx
.LBE11366:
.LBE11365:
.LBB11368:
.LBB11363:
	.loc 11 416 0
	andl	$-16, %eax
	orl	$4, %eax
	movl	%eax, 588(%ebx)
.LVL3294:
.LBE11363:
.LBE11368:
.LBB11369:
.LBB11367:
	.loc 11 340 0
	movl	16(%esp), %eax
	andl	$15, %edx
	sall	$4, %eax
	orl	%edx, %eax
	movl	%eax, 596(%ebx)
.LVL3295:
.LBE11367:
.LBE11369:
.LBB11370:
.LBB11371:
	.loc 11 357 0
	testl	$-2, %edi
	jne	.L3041
	.loc 11 359 0
	sall	$3, %edi
.LVL3296:
	andl	$-9, %eax
	andl	$8, %edi
	orl	%eax, %edi
	movl	%edi, 596(%ebx)
.LVL3297:
.LBE11371:
.LBE11370:
.LBB11373:
.LBB11374:
	.loc 11 376 0
	testl	$-2, 12(%esp)
	jne	.L3042
	.loc 11 378 0
	movl	12(%esp), %eax
	andl	$-5, %edi
	sall	$2, %eax
	andl	$4, %eax
	orl	%eax, %edi
	movl	%edi, 596(%ebx)
.LVL3298:
.LBE11374:
.LBE11373:
.LBB11376:
.LBB11377:
	.loc 32 428 0
	cmpl	ksCurThread, %ebx
	jne	.L3016
	movl	ksSchedulerAction, %ecx
	testl	%ecx, %ecx
	jne	.L3016
	movl	%ebx, %eax
	call	scheduleTCB.part.264
.LVL3299:
	.p2align 4,,10
	.p2align 3
.L3016:
	movl	4(%esi), %ecx
.LVL3300:
	movl	(%esi), %eax
.LVL3301:
.LBE11377:
.LBE11376:
.LBB11378:
.LBB11379:
	.loc 31 211 0
	movl	%ecx, %edx
.LBE11379:
.LBE11378:
.LBB11383:
.LBB11384:
	.loc 64 27 0
	movl	%eax, %edi
	andl	$-16, %edi
.LVL3302:
.LBE11384:
.LBE11383:
.LBB11385:
.LBB11380:
	.loc 31 211 0
	andl	$-16, %edx
.LVL3303:
	je	.L3030
	.loc 31 214 0
	movl	%ebx, 652(%edi)
.LVL3304:
.L3017:
	.loc 31 216 0
	movl	%edi, 656(%ebx)
.LBE11380:
.LBE11385:
.LBB11386:
.LBB11387:
	.loc 11 920 0
	movl	%eax, %edi
.LVL3305:
.LBE11387:
.LBE11386:
.LBB11389:
.LBB11381:
	.loc 31 217 0
	movl	$0, 652(%ebx)
.LVL3306:
.LBE11381:
.LBE11389:
.LBB11390:
.LBB11388:
	.loc 11 920 0
	andl	$-4, %edi
	orl	$1, %edi
	movl	%edi, (%esi)
.LVL3307:
.LBE11388:
.LBE11390:
.LBB11391:
.LBB11392:
.LBB11393:
.LBB11394:
	.loc 11 880 0
	testb	$15, %dl
	jne	.L3024
.LVL3308:
	.loc 11 882 0
	andl	$15, %ecx
.LVL3309:
	andl	$-16, %edx
.LVL3310:
	orl	%ecx, %edx
	movl	%edx, 4(%esi)
.LVL3311:
.LBE11394:
.LBE11393:
.LBB11396:
.LBB11397:
	.loc 11 899 0
	testb	$15, %bl
	jne	.L3025
	.loc 11 901 0
	andl	$-16, %ebx
.LVL3312:
	andl	$12, %eax
	orl	$1, %ebx
	orl	%ebx, %eax
	movl	%eax, (%esi)
.LVL3313:
.L3008:
.LBE11397:
.LBE11396:
.LBE11392:
.LBE11391:
.LBE11356:
	.loc 64 108 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3314:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3315:
	.p2align 4,,10
	.p2align 3
.L3038:
	.cfi_restore_state
.LBB11407:
	.loc 64 96 0 discriminator 1
	testb	$7, 604(%ebx)
	je	.L3008
	.loc 64 98 0
	testl	%edi, %edi
	je	.L3029
.LVL3316:
.L3039:
	.loc 64 99 0
	movl	%ebp, 68(%esp)
	movl	%ebx, 64(%esp)
.LBE11407:
	.loc 64 108 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3317:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL3318:
.LBB11408:
	.loc 64 99 0
	jmp	setupCallerCap
.LVL3319:
	.p2align 4,,10
	.p2align 3
.L3031:
	.cfi_restore_state
.LBB11352:
.LBB11339:
	.loc 31 227 0
	movl	%edx, 24(%esp)
.LVL3320:
	jmp	.L3023
.LVL3321:
	.p2align 4,,10
	.p2align 3
.L3021:
	.loc 31 230 0
	movl	%ecx, 20(%esp)
.LVL3322:
	jmp	.L3022
.LVL3323:
	.p2align 4,,10
	.p2align 3
.L3030:
.LBE11339:
.LBE11352:
.LBE11408:
.LBB11409:
.LBB11402:
.LBB11382:
	.loc 31 211 0
	movl	%ebx, %edx
.LVL3324:
	jmp	.L3017
.LVL3325:
	.p2align 4,,10
	.p2align 3
.L3037:
.LBE11382:
.LBE11402:
.LBE11409:
.LBB11410:
.LBB11353:
.LBB11354:
	.loc 11 919 0
	andl	$-4, %eax
	movl	%eax, (%esi)
	jmp	.L3026
.LVL3326:
.L3025:
.LBE11354:
.LBE11353:
.LBE11410:
.LBB11411:
.LBB11403:
.LBB11401:
.LBB11399:
.LBB11398:
	call	endpoint_ptr_set_epQueue_tail.isra.241.part.242
.LVL3327:
.L3024:
.LBE11398:
.LBE11399:
.LBB11400:
.LBB11395:
	call	endpoint_ptr_set_epQueue_head.isra.239.part.240
.LVL3328:
.L3041:
.LBE11395:
.LBE11400:
.LBE11401:
.LBE11403:
.LBB11404:
.LBB11372:
	.loc 11 357 0
	pushl	$__FUNCTION__.1442
	.cfi_remember_state
	.cfi_def_cfa_offset 68
	pushl	$357
	.cfi_def_cfa_offset 72
	pushl	$.LC154
	.cfi_def_cfa_offset 76
	pushl	$.LC554
	.cfi_def_cfa_offset 80
	call	_assert_fail
.LVL3329:
.L3042:
	.cfi_restore_state
.LBE11372:
.LBE11404:
.LBB11405:
.LBB11375:
	.loc 11 376 0
	pushl	$__FUNCTION__.1451
	.cfi_remember_state
	.cfi_def_cfa_offset 68
	pushl	$376
	.cfi_def_cfa_offset 72
	pushl	$.LC154
	.cfi_def_cfa_offset 76
	pushl	$.LC555
	.cfi_def_cfa_offset 80
	call	_assert_fail
.LVL3330:
.L3036:
	.cfi_restore_state
.LBE11375:
.LBE11405:
.LBE11411:
.LBB11412:
	.loc 64 80 0 discriminator 1
	pushl	$__FUNCTION__.8856
	.cfi_remember_state
	.cfi_def_cfa_offset 68
	pushl	$80
	.cfi_def_cfa_offset 72
	pushl	$.LC391
	.cfi_def_cfa_offset 76
	pushl	$.LC556
	.cfi_def_cfa_offset 80
	call	_assert_fail
.LVL3331:
.L3040:
	.cfi_restore_state
.LBE11412:
.LBB11413:
.LBB11406:
.LBB11364:
.LBB11361:
.LBB11362:
	.loc 11 414 0
	pushl	$__FUNCTION__.1469
	.cfi_def_cfa_offset 68
	pushl	$414
	.cfi_def_cfa_offset 72
	pushl	$.LC154
	.cfi_def_cfa_offset 76
	pushl	$.LC388
	.cfi_def_cfa_offset 80
	call	_assert_fail
.LVL3332:
.LBE11362:
.LBE11361:
.LBE11364:
.LBE11406:
.LBE11413:
	.cfi_endproc
.LFE754:
	.size	sendIPC, .-sendIPC
	.section	.text.unlikely
.LCOLDE557:
	.text
.LHOTE557:
	.section	.text.unlikely
.LCOLDB558:
	.text
.LHOTB558:
	.p2align 4,,15
	.globl	sendFaultIPC
	.type	sendFaultIPC, @function
sendFaultIPC:
.LFB676:
	.file 71 "/home/axjllt/Desktop/ori_refos/kernel/src/kernel/faulthandler.c"
	.loc 71 32 0
	.cfi_startproc
.LVL3333:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 71 38 0
	movl	current_lookup_fault, %eax
.LVL3334:
	.loc 71 32 0
	movl	64(%esp), %ebx
	.loc 71 38 0
	movl	current_lookup_fault+4, %edx
	movl	%eax, 8(%esp)
	.loc 71 41 0
	leal	20(%esp), %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 68
	.loc 71 40 0
	movl	636(%ebx), %esi
.LVL3335:
	.loc 71 38 0
	movl	%edx, 16(%esp)
	.loc 71 41 0
	pushl	%esi
	.cfi_def_cfa_offset 72
	pushl	%ebx
	.cfi_def_cfa_offset 76
	pushl	%eax
	.cfi_def_cfa_offset 80
	call	lookupCap
	.cfi_def_cfa_offset 76
.LVL3336:
	.loc 71 42 0
	movl	32(%esp), %eax
	addl	$12, %esp
	.cfi_def_cfa_offset 64
	testl	%eax, %eax
	jne	.L3058
	.loc 71 41 0
	movl	24(%esp), %edx
.LVL3337:
.LBB11414:
.LBB11415:
	.loc 11 2202 0
	movl	%edx, %ebp
	.loc 11 2203 0
	movl	%edx, %edi
	movzbl	%dl, %ecx
	.loc 11 2202 0
	andl	$14, %ebp
	.loc 11 2203 0
	andl	$15, %edi
	cmpl	$14, %ebp
	cmovne	%edi, %ecx
.LVL3338:
.LBE11415:
.LBE11414:
	.loc 71 48 0
	cmpl	$4, %ecx
	je	.L3059
.L3048:
.LVL3339:
	.loc 71 62 0
	movl	$1, current_fault
	.loc 71 65 0
	movl	$1, %eax
	.loc 71 62 0
	movl	%esi, current_fault+4
.LVL3340:
	.loc 71 63 0
	movl	$1, current_lookup_fault
	movl	$0, current_lookup_fault+4
.LVL3341:
.L3045:
	.loc 71 67 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL3342:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3343:
	.p2align 4,,10
	.p2align 3
.L3058:
	.cfi_restore_state
	.loc 71 43 0
	movl	%esi, current_fault+4
	.loc 71 44 0
	movl	$1, %eax
.LVL3344:
	.loc 71 43 0
	movl	$1, current_fault
	.loc 71 67 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3345:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3346:
	.p2align 4,,10
	.p2align 3
.L3059:
	.cfi_restore_state
.LBB11416:
.LBB11417:
	.loc 11 2424 0 discriminator 1
	cmpl	$4, %edi
	jne	.L3060
.LBE11417:
.LBE11416:
	.loc 71 46 0
	movl	28(%esp), %ecx
	.loc 71 48 0
	testb	$1, %cl
	je	.L3048
.LVL3347:
	.loc 71 49 0
	testb	$4, %cl
	je	.L3048
	.loc 71 51 0
	movl	current_fault, %esi
.LVL3348:
	movl	current_fault+4, %edi
	movl	%esi, 604(%ebx)
	.loc 71 52 0
	movl	current_fault, %esi
	.loc 71 51 0
	movl	%edi, 608(%ebx)
	.loc 71 52 0
	andl	$7, %esi
	cmpl	$1, %esi
	je	.L3061
.LVL3349:
.L3050:
	movl	%eax, 8(%esp)
.LVL3350:
	.loc 71 55 0
	andl	$-16, %ecx
	subl	$8, %esp
	.cfi_def_cfa_offset 72
	shrl	$4, %edx
.LVL3351:
	pushl	%ecx
	.cfi_def_cfa_offset 76
	pushl	%ebx
	.cfi_def_cfa_offset 80
	pushl	$1
	.cfi_def_cfa_offset 84
	pushl	%edx
	.cfi_def_cfa_offset 88
	pushl	$0
	.cfi_def_cfa_offset 92
	pushl	$1
	.cfi_def_cfa_offset 96
	call	sendIPC
.LVL3352:
	.loc 71 60 0
	addl	$32, %esp
	.cfi_def_cfa_offset 64
	movl	8(%esp), %eax
	jmp	.L3045
.LVL3353:
	.p2align 4,,10
	.p2align 3
.L3061:
	.loc 71 53 0
	movl	8(%esp), %edi
	movl	12(%esp), %ebp
	movl	%edi, 612(%ebx)
.LVL3354:
	movl	%ebp, 616(%ebx)
	jmp	.L3050
.LVL3355:
.L3060:
.LBB11419:
.LBB11418:
	call	cap_endpoint_cap_get_capCanSend.part.206
.LVL3356:
.LBE11418:
.LBE11419:
	.cfi_endproc
.LFE676:
	.size	sendFaultIPC, .-sendFaultIPC
	.section	.text.unlikely
.LCOLDE558:
	.text
.LHOTE558:
	.section	.text.unlikely
.LCOLDB559:
	.text
.LHOTB559:
	.p2align 4,,15
	.globl	performInvocation_Endpoint
	.type	performInvocation_Endpoint, @function
performInvocation_Endpoint:
.LFB795:
	.loc 45 617 0
	.cfi_startproc
.LVL3357:
	subl	$20, %esp
	.cfi_def_cfa_offset 24
	.loc 45 618 0
	pushl	24(%esp)
	.cfi_def_cfa_offset 28
	pushl	ksCurThread
	.cfi_def_cfa_offset 32
	pushl	40(%esp)
	.cfi_def_cfa_offset 36
	pushl	40(%esp)
	.cfi_def_cfa_offset 40
	pushl	56(%esp)
	.cfi_def_cfa_offset 44
	pushl	56(%esp)
	.cfi_def_cfa_offset 48
	call	sendIPC
.LVL3358:
	.loc 45 621 0
	xorl	%eax, %eax
	addl	$44, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE795:
	.size	performInvocation_Endpoint, .-performInvocation_Endpoint
	.section	.text.unlikely
.LCOLDE559:
	.text
.LHOTE559:
	.section	.rodata.str1.4
	.align 4
.LC560:
	.string	"cap_get_capType(cap) == cap_endpoint_cap"
	.section	.rodata.str1.1
.LC561:
	.string	"sender"
	.section	.text.unlikely
.LCOLDB562:
	.text
.LHOTB562:
	.p2align 4,,15
	.globl	receiveIPC
	.type	receiveIPC, @function
receiveIPC:
.LFB755:
	.loc 64 112 0
	.cfi_startproc
.LVL3359:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 64 112 0
	movl	52(%esp), %eax
.LVL3360:
	movl	48(%esp), %esi
.LVL3361:
	movl	56(%esp), %ebx
.LVL3362:
	movl	60(%esp), %ecx
.LBB11487:
.LBB11488:
	.loc 11 2202 0
	movl	%eax, %edi
	.loc 11 2203 0
	movl	%eax, %edx
	movzbl	%al, %eax
	.loc 11 2202 0
	andl	$14, %edi
	.loc 11 2203 0
	andl	$15, %edx
	cmpl	$14, %edi
	cmovne	%edx, %eax
.LVL3363:
.LBE11488:
.LBE11487:
	.loc 64 117 0
	cmpl	$4, %eax
	jne	.L3097
.LVL3364:
.LBB11489:
.LBB11490:
	.loc 11 2358 0
	cmpl	$4, %edx
	jne	.L3098
.LBE11490:
.LBE11489:
	.loc 64 122 0
	movl	600(%esi), %eax
.LBB11493:
.LBB11491:
	.loc 11 2361 0
	andl	$-16, %ebx
.LVL3365:
.LBE11491:
.LBE11493:
	.loc 64 123 0
	testl	%eax, %eax
	je	.L3069
	movl	(%eax), %edx
.LVL3366:
	.loc 64 123 0 is_stmt 0 discriminator 1
	movl	%edx, %edi
	andl	$3, %edi
	cmpl	$2, %edi
	je	.L3099
.LVL3367:
.L3069:
	movl	(%ebx), %edx
.LVL3368:
	.loc 64 126 0 is_stmt 1
	movl	%edx, %eax
.LVL3369:
	andl	$3, %eax
	cmpl	$1, %eax
	je	.L3071
	jb	.L3072
	cmpl	$2, %eax
	je	.L3072
.L3064:
	.loc 64 200 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3370:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3371:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3372:
	.p2align 4,,10
	.p2align 3
.L3072:
	.cfi_restore_state
.LBB11494:
	.loc 64 131 0
	testl	%ecx, %ecx
	je	.L3073
.LVL3373:
.LBB11495:
.LBB11496:
	.loc 11 416 0
	movl	%ebx, %eax
	orl	$3, %eax
	movl	%eax, 588(%esi)
.LVL3374:
.LBE11496:
.LBE11495:
.LBB11497:
.LBB11498:
	.loc 32 428 0
	cmpl	ksCurThread, %esi
	je	.L3100
.LVL3375:
.L3074:
	movl	4(%ebx), %ecx
.LVL3376:
	movl	(%ebx), %eax
.LVL3377:
.LBE11498:
.LBE11497:
.LBB11500:
.LBB11501:
	.loc 31 211 0
	movl	%ecx, %edx
.LBE11501:
.LBE11500:
.LBB11505:
.LBB11506:
	.loc 64 27 0
	movl	%eax, %edi
	andl	$-16, %edi
.LVL3378:
.LBE11506:
.LBE11505:
.LBB11507:
.LBB11502:
	.loc 31 211 0
	andl	$-16, %edx
.LVL3379:
	je	.L3088
	.loc 31 214 0
	movl	%esi, 652(%edi)
.LVL3380:
.L3075:
	.loc 31 216 0
	movl	%edi, 656(%esi)
.LBE11502:
.LBE11507:
.LBB11508:
.LBB11509:
	.loc 11 920 0
	movl	%eax, %edi
.LVL3381:
.LBE11509:
.LBE11508:
.LBB11511:
.LBB11503:
	.loc 31 217 0
	movl	$0, 652(%esi)
.LVL3382:
.LBE11503:
.LBE11511:
.LBB11512:
.LBB11510:
	.loc 11 920 0
	andl	$-4, %edi
	orl	$2, %edi
	movl	%edi, (%ebx)
.LVL3383:
.LBE11510:
.LBE11512:
.LBB11513:
.LBB11514:
.LBB11515:
.LBB11516:
	.loc 11 880 0
	testb	$15, %dl
	jne	.L3082
.LVL3384:
	.loc 11 882 0
	andl	$15, %ecx
.LVL3385:
	andl	$-16, %edx
.LVL3386:
	orl	%ecx, %edx
	movl	%edx, 4(%ebx)
.LVL3387:
.LBE11516:
.LBE11515:
.LBB11518:
.LBB11519:
	.loc 11 899 0
	testl	$15, %esi
	jne	.L3083
	.loc 11 901 0
	andl	$12, %eax
	andl	$-16, %esi
.LVL3388:
	orl	$2, %eax
	orl	%esi, %eax
	movl	%eax, (%ebx)
.LVL3389:
.LBE11519:
.LBE11518:
.LBE11514:
.LBE11513:
.LBE11494:
	.loc 64 200 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3390:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3391:
	.p2align 4,,10
	.p2align 3
.L3071:
	.cfi_restore_state
	movl	4(%ebx), %eax
.LBB11530:
.LBB11531:
.LBB11532:
	.loc 64 27 0
	movl	%edx, %ecx
	andl	$-16, %ecx
	movl	%ecx, 8(%esp)
.LBE11532:
.LBE11531:
	.loc 64 163 0
	movl	%eax, %edi
	movl	%eax, 12(%esp)
.LVL3392:
	andl	$-16, %edi
.LVL3393:
	je	.L3101
.LVL3394:
.LBB11533:
.LBB11534:
	.loc 31 227 0
	movl	656(%edi), %ecx
.LVL3395:
	.loc 31 228 0
	movl	652(%edi), %eax
	.loc 31 227 0
	testl	%ecx, %ecx
	je	.L3079
	.loc 31 228 0
	movl	%eax, 652(%ecx)
	movl	652(%edi), %ebp
	movl	%edi, %eax
.LVL3396:
.L3080:
	.loc 31 233 0
	testl	%ebp, %ebp
	je	.L3089
	.loc 31 234 0
	movl	%ecx, 656(%ebp)
.LVL3397:
.L3081:
.LBE11534:
.LBE11533:
.LBB11536:
.LBB11537:
.LBB11538:
.LBB11539:
	.loc 11 880 0
	testb	$15, %al
	jne	.L3082
	.loc 11 882 0
	movl	12(%esp), %ecx
	movl	%eax, %ebp
	andl	$-16, %ebp
	andl	$15, %ecx
	orl	%ebp, %ecx
	movl	%ecx, 4(%ebx)
.LVL3398:
.LBE11539:
.LBE11538:
.LBB11540:
.LBB11541:
	.loc 11 899 0
	movl	8(%esp), %ecx
	testb	$15, %cl
	jne	.L3083
	.loc 11 901 0
	andl	$15, %edx
.LVL3399:
	andl	$-16, %ecx
	orl	%ecx, %edx
	movl	%edx, (%ebx)
.LVL3400:
.LBE11541:
.LBE11540:
.LBE11537:
.LBE11536:
	.loc 64 169 0
	testl	%eax, %eax
	je	.L3102
.L3084:
	movl	596(%edi), %eax
.LVL3401:
	.loc 64 179 0
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	%esi
	.cfi_def_cfa_offset 64
.LVL3402:
.LBB11542:
.LBB11543:
	.loc 11 346 0
	movl	%eax, %ebp
.LBE11543:
.LBE11542:
	.loc 64 179 0
	shrl	$4, %eax
.LBB11545:
.LBB11544:
	.loc 11 346 0
	andl	$8, %ebp
	shrl	$3, %ebp
.LBE11544:
.LBE11545:
	.loc 64 179 0
	pushl	%ebp
	.cfi_def_cfa_offset 68
	pushl	%eax
	.cfi_def_cfa_offset 72
	pushl	%ebx
	.cfi_def_cfa_offset 76
	pushl	%edi
	.cfi_def_cfa_offset 80
	call	doIPCTransfer
.LVL3403:
	.loc 64 184 0
	addl	$32, %esp
	.cfi_def_cfa_offset 48
	testb	$4, 596(%edi)
	je	.L3103
.L3085:
	.loc 64 186 0
	testl	%ebp, %ebp
	je	.L3087
	.loc 64 187 0
	movl	%esi, 52(%esp)
	movl	%edi, 48(%esp)
.LBE11530:
	.loc 64 200 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3404:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL3405:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LBB11553:
	.loc 64 187 0
	jmp	setupCallerCap
.LVL3406:
	.p2align 4,,10
	.p2align 3
.L3103:
	.cfi_restore_state
	.loc 64 184 0 discriminator 1
	testb	$7, 604(%edi)
	jne	.L3085
	.loc 64 192 0
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	$1
	.cfi_def_cfa_offset 60
	pushl	%edi
	.cfi_def_cfa_offset 64
	call	setThreadState
.LVL3407:
.LBE11553:
	.loc 64 200 0
	addl	$44, %esp
	.cfi_def_cfa_offset 20
.LBB11554:
.LBB11546:
.LBB11547:
	.loc 32 415 0
	movl	%edi, %eax
	xorl	%edx, %edx
.LBE11547:
.LBE11546:
.LBE11554:
	.loc 64 200 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3408:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL3409:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LBB11555:
.LBB11549:
.LBB11548:
	.loc 32 415 0
	jmp	possibleSwitchTo
.LVL3410:
	.p2align 4,,10
	.p2align 3
.L3087:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -20
	.cfi_offset 5, -8
	.cfi_offset 6, -16
	.cfi_offset 7, -12
.LBE11548:
.LBE11549:
	.loc 64 189 0
	movl	%edi, 48(%esp)
	movl	$0, 52(%esp)
.LBE11555:
	.loc 64 200 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3411:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL3412:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LBB11556:
	.loc 64 189 0
	jmp	setThreadState
.LVL3413:
	.p2align 4,,10
	.p2align 3
.L3073:
	.cfi_restore_state
.LBE11556:
.LBB11557:
.LBB11524:
.LBB11525:
.LBB11526:
	.loc 15 30 0
	movl	$0, 516(%esi)
.LVL3414:
	jmp	.L3064
.LVL3415:
	.p2align 4,,10
	.p2align 3
.L3099:
.LBE11526:
.LBE11525:
.LBE11524:
.LBE11557:
.LBB11558:
.LBB11559:
.LBB11560:
.LBB11561:
	movl	8(%eax), %ecx
.LBE11561:
.LBE11560:
.LBB11563:
.LBB11564:
	.loc 11 1123 0
	andl	$-4, %edx
.LBE11564:
.LBE11563:
.LBB11566:
.LBB11562:
	.loc 15 30 0
	movl	%ecx, 516(%esi)
.LVL3416:
.LBE11562:
.LBE11566:
.LBB11567:
.LBB11565:
	.loc 11 1123 0
	movl	%edx, (%eax)
.LVL3417:
.LBE11565:
.LBE11567:
.LBE11559:
.LBE11558:
	.loc 64 200 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3418:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3419:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3420:
	.p2align 4,,10
	.p2align 3
.L3079:
	.cfi_restore_state
.LBB11568:
.LBB11550:
.LBB11535:
	.loc 31 230 0
	movl	%eax, %ebp
	jmp	.L3080
	.p2align 4,,10
	.p2align 3
.L3089:
	.loc 31 227 0
	movl	%ecx, 8(%esp)
.LVL3421:
	jmp	.L3081
.LVL3422:
	.p2align 4,,10
	.p2align 3
.L3102:
.LBE11535:
.LBE11550:
.LBB11551:
.LBB11552:
	.loc 11 919 0
	andl	$-4, %edx
	movl	%edx, (%ebx)
	jmp	.L3084
.LVL3423:
	.p2align 4,,10
	.p2align 3
.L3100:
.LBE11552:
.LBE11551:
.LBE11568:
.LBB11569:
.LBB11527:
.LBB11499:
	.loc 32 428 0
	movl	ksSchedulerAction, %eax
	testl	%eax, %eax
	jne	.L3074
	movl	%esi, %eax
	call	scheduleTCB.part.264
.LVL3424:
	jmp	.L3074
.LVL3425:
	.p2align 4,,10
	.p2align 3
.L3088:
.LBE11499:
.LBE11527:
.LBB11528:
.LBB11504:
	.loc 31 211 0
	movl	%esi, %edx
.LVL3426:
	jmp	.L3075
.LVL3427:
.L3097:
.LBE11504:
.LBE11528:
.LBE11569:
	.loc 64 117 0 discriminator 1
	pushl	$__FUNCTION__.8864
	.cfi_remember_state
	.cfi_def_cfa_offset 52
	pushl	$117
	.cfi_def_cfa_offset 56
	pushl	$.LC391
	.cfi_def_cfa_offset 60
	pushl	$.LC560
	.cfi_def_cfa_offset 64
	call	_assert_fail
.LVL3428:
.L3098:
	.cfi_restore_state
.LBB11570:
.LBB11492:
	call	cap_endpoint_cap_get_capEPPtr.part.117
.LVL3429:
.L3083:
.LBE11492:
.LBE11570:
.LBB11571:
.LBB11529:
.LBB11523:
.LBB11521:
.LBB11520:
	call	endpoint_ptr_set_epQueue_tail.isra.241.part.242
.LVL3430:
.L3082:
.LBE11520:
.LBE11521:
.LBB11522:
.LBB11517:
	call	endpoint_ptr_set_epQueue_head.isra.239.part.240
.LVL3431:
.L3101:
.LBE11517:
.LBE11522:
.LBE11523:
.LBE11529:
.LBE11571:
.LBB11572:
	.loc 64 163 0 discriminator 1
	pushl	$__FUNCTION__.8864
	.cfi_def_cfa_offset 52
.LVL3432:
	pushl	$163
	.cfi_def_cfa_offset 56
	pushl	$.LC391
	.cfi_def_cfa_offset 60
	pushl	$.LC561
	.cfi_def_cfa_offset 64
	call	_assert_fail
.LVL3433:
.LBE11572:
	.cfi_endproc
.LFE755:
	.size	receiveIPC, .-receiveIPC
	.section	.text.unlikely
.LCOLDE562:
	.text
.LHOTE562:
	.section	.rodata.str1.4
	.align 4
.LC563:
	.string	"X86PageDirectoryGetStatusBits: Truncated message"
	.align 4
.LC564:
	.string	"X86PageDirectoryGetStatusBits: address inside kernel window"
	.align 4
.LC565:
	.string	"X86PageDirectoryGetStatusBits: No mapping found"
	.align 4
.LC566:
	.string	"ptSlot.status == EXCEPTION_NONE && pte_ptr_get_present(ptSlot.ptSlot)"
	.align 4
.LC567:
	.string	"decodeIA32PageDirectoryInvocation: illegal operation"
	.section	.text.unlikely
.LCOLDB568:
	.text
.LHOTB568:
	.p2align 4,,15
	.globl	decodeIA32PageDirectoryInvocation
	.type	decodeIA32PageDirectoryInvocation, @function
decodeIA32PageDirectoryInvocation:
.LFB481:
	.loc 17 261 0
	.cfi_startproc
.LVL3434:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
.LBB11626:
	.loc 17 271 0
	movl	ksCurThread, %eax
.LBE11626:
	.loc 17 263 0
	cmpl	$30, 32(%esp)
	jne	.L3136
.LBB11674:
	.loc 17 270 0
	movl	36(%esp), %edx
	testl	%edx, %edx
	je	.L3140
.LVL3435:
.LBB11627:
.LBB11628:
.LBB11629:
.LBB11630:
	.loc 15 36 0
	movl	532(%eax), %ebx
.LVL3436:
.LBE11630:
.LBE11629:
.LBE11628:
.LBE11627:
	.loc 17 279 0
	cmpl	$-536870913, %ebx
	ja	.L3141
	.loc 17 287 0
	movl	48(%esp), %edx
	movl	44(%esp), %eax
	call	cap_get_capPtr
.LVL3437:
.LBB11631:
.LBB11632:
	.loc 17 173 0
	movl	%ebx, %edx
	shrl	$22, %edx
.LVL3438:
	leal	(%eax,%edx,4), %esi
.LVL3439:
.LBE11632:
.LBE11631:
	.loc 17 291 0
	leal	8(%esp), %edx
.LVL3440:
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	pushl	%ebx
	.cfi_def_cfa_offset 40
	pushl	%eax
	.cfi_def_cfa_offset 44
	pushl	%edx
	.cfi_def_cfa_offset 48
	call	lookupPTSlot
	.cfi_def_cfa_offset 44
.LVL3441:
.LBB11633:
.LBB11634:
	.loc 11 1937 0
	movl	(%esi), %eax
.LBE11634:
.LBE11633:
	.loc 17 291 0
	movl	20(%esp), %ebx
.LVL3442:
	movl	24(%esp), %edi
.LVL3443:
	.loc 17 294 0
	addl	$12, %esp
	.cfi_def_cfa_offset 32
	testb	$-128, %al
	jne	.L3142
.L3110:
	.loc 17 296 0
	testl	%ebx, %ebx
	jne	.L3113
	.loc 17 297 0
	testb	$1, (%edi)
	je	.L3113
	.loc 17 307 0
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	pushl	$2
	.cfi_def_cfa_offset 44
	pushl	ksCurThread
	.cfi_def_cfa_offset 48
	call	setThreadState
.LVL3444:
.LBB11635:
.LBB11636:
.LBB11637:
.LBB11638:
	.loc 11 1937 0
	movl	(%esi), %eax
.LBE11638:
.LBE11637:
	.loc 17 235 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	testb	$-128, %al
	jne	.L3120
.LVL3445:
.L3117:
.LBB11640:
.LBB11641:
	.loc 11 142 0
	movl	(%edi), %eax
.LVL3446:
.LBE11641:
.LBE11640:
	.loc 17 244 0
	testb	$1, %al
	je	.L3118
.L3139:
	.loc 17 246 0
	movl	ksCurThread, %ecx
.LVL3447:
.LBB11642:
.LBB11643:
.LBB11644:
	.loc 15 30 0
	movl	%eax, %edx
.LBE11644:
.LBE11643:
.LBE11642:
.LBB11651:
.LBB11652:
.LBB11653:
	andl	$64, %eax
.LBE11653:
.LBE11652:
.LBE11651:
.LBB11658:
.LBB11648:
.LBB11645:
	andl	$32, %edx
.LBE11645:
.LBE11648:
.LBE11658:
.LBB11659:
.LBB11656:
.LBB11654:
	shrl	$6, %eax
.LBE11654:
.LBE11656:
.LBE11659:
.LBB11660:
.LBB11649:
.LBB11646:
	shrl	$5, %edx
.LBE11646:
.LBE11649:
.LBE11660:
.LBB11661:
.LBB11657:
.LBB11655:
	movl	%eax, 536(%ecx)
.LBE11655:
.LBE11657:
.LBE11661:
.LBE11636:
.LBE11635:
	.loc 17 308 0
	xorl	%eax, %eax
.LBB11668:
.LBB11666:
.LBB11662:
.LBB11650:
.LBB11647:
	.loc 15 30 0
	movl	%edx, 532(%ecx)
.LVL3448:
	jmp	.L3137
.LVL3449:
	.p2align 4,,10
	.p2align 3
.L3136:
.LBE11647:
.LBE11650:
.LBE11662:
.LBE11666:
.LBE11668:
.LBE11674:
	.loc 17 312 0
	leal	668(%eax), %edx
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	pushl	556(%eax)
	.cfi_def_cfa_offset 40
	pushl	%edx
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	pushl	$312
	.cfi_def_cfa_offset 52
	pushl	$__func__.6392
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	$.LC111
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL3450:
	addl	$20, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC567
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL3451:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL3452:
	.loc 17 315 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	$3, %eax
	.loc 17 313 0
	movl	$3, current_syscall_error+24
.LVL3453:
.L3137:
	.loc 17 317 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL3454:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L3141:
	.cfi_restore_state
.LBB11675:
	.loc 17 280 0
	leal	668(%eax), %edx
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	pushl	556(%eax)
	.cfi_def_cfa_offset 40
	pushl	%edx
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	pushl	$280
	.cfi_def_cfa_offset 52
	pushl	$__func__.6392
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	$.LC111
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL3455:
	addl	$20, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC564
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL3456:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL3457:
	.loc 17 284 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	$3, %eax
	.loc 17 281 0
	movl	$1, current_syscall_error+24
	.loc 17 282 0
	movl	$0, current_syscall_error
.LBE11675:
	.loc 17 317 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L3140:
	.cfi_restore_state
.LBB11676:
	.loc 17 271 0
	leal	668(%eax), %edx
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	pushl	556(%eax)
	.cfi_def_cfa_offset 40
	pushl	%edx
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	pushl	$271
	.cfi_def_cfa_offset 52
	pushl	$__func__.6392
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	$.LC111
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL3458:
	addl	$20, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC563
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL3459:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL3460:
	.loc 17 274 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	$3, %eax
	.loc 17 272 0
	movl	$7, current_syscall_error+24
.LBE11676:
	.loc 17 317 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL3461:
	.p2align 4,,10
	.p2align 3
.L3113:
	.cfi_restore_state
.LBB11677:
	.loc 17 299 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	pushl	556(%eax)
	.cfi_def_cfa_offset 40
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	pushl	$299
	.cfi_def_cfa_offset 52
	pushl	$__func__.6392
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	$.LC111
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL3462:
	addl	$20, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC565
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL3463:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL3464:
	.loc 17 304 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	$3, %eax
	.loc 17 301 0
	movl	$1, current_syscall_error+24
	.loc 17 302 0
	movl	$1, current_syscall_error
.LBE11677:
	.loc 17 317 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL3465:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL3466:
	ret
.LVL3467:
	.p2align 4,,10
	.p2align 3
.L3142:
	.cfi_restore_state
.LBB11678:
.LBB11669:
.LBB11670:
	.loc 11 2161 0
	je	.L3116
.LBE11670:
.LBE11669:
	.loc 17 295 0
	testb	$1, %al
	je	.L3110
	.loc 17 307 0
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	pushl	$2
	.cfi_def_cfa_offset 44
	pushl	ksCurThread
	.cfi_def_cfa_offset 48
	call	setThreadState
.LVL3468:
.LBB11672:
.LBB11667:
.LBB11663:
.LBB11639:
	.loc 11 1937 0
	movl	(%esi), %eax
.LBE11639:
.LBE11663:
	.loc 17 235 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	testb	$-128, %al
	jne	.L3120
.LVL3469:
.L3115:
	.loc 17 244 0
	testl	%ebx, %ebx
	je	.L3117
.L3118:
	pushl	$__FUNCTION__.6378
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	pushl	$244
	.cfi_def_cfa_offset 40
	pushl	$.LC127
	.cfi_def_cfa_offset 44
	pushl	$.LC566
	.cfi_def_cfa_offset 48
	call	_assert_fail
.LVL3470:
	.p2align 4,,10
	.p2align 3
.L3120:
	.cfi_restore_state
.LBB11664:
.LBB11665:
	.loc 11 2161 0
	testb	$-128, %al
	je	.L3116
.LBE11665:
.LBE11664:
	.loc 17 236 0
	testb	$1, %al
	je	.L3115
	jmp	.L3139
.LVL3471:
.L3116:
.LBE11667:
.LBE11672:
.LBB11673:
.LBB11671:
	call	pde_pde_large_ptr_get_present.part.153
.LVL3472:
.LBE11671:
.LBE11673:
.LBE11678:
	.cfi_endproc
.LFE481:
	.size	decodeIA32PageDirectoryInvocation, .-decodeIA32PageDirectoryInvocation
	.section	.text.unlikely
.LCOLDE568:
	.text
.LHOTE568:
	.section	.text.unlikely
.LCOLDB569:
	.text
.LHOTB569:
	.p2align 4,,15
	.globl	decodeX86ModeMMUInvocation
	.type	decodeX86ModeMMUInvocation, @function
decodeX86ModeMMUInvocation:
.LFB464:
	.loc 16 675 0
	.cfi_startproc
.LVL3473:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	.loc 16 675 0
	movl	32(%esp), %ecx
.LVL3474:
	movl	36(%esp), %ebx
.LVL3475:
.LBB11685:
.LBB11686:
	.loc 11 2202 0
	movl	%ecx, %esi
	.loc 11 2203 0
	movl	%ecx, %edx
	movzbl	%cl, %eax
	.loc 11 2202 0
	andl	$14, %esi
	.loc 11 2203 0
	andl	$15, %edx
	cmpl	$14, %esi
	cmovne	%edx, %eax
.LVL3476:
.LBE11686:
.LBE11685:
	.loc 16 676 0
	cmpl	$5, %eax
	jne	.L3152
	.loc 16 678 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	64(%esp)
	.cfi_def_cfa_offset 32
	pushl	64(%esp)
	.cfi_def_cfa_offset 36
	pushl	64(%esp)
	.cfi_def_cfa_offset 40
	pushl	64(%esp)
	.cfi_def_cfa_offset 44
	pushl	%ebx
	.cfi_def_cfa_offset 48
	pushl	%ecx
	.cfi_def_cfa_offset 52
	pushl	64(%esp)
	.cfi_def_cfa_offset 56
	pushl	60(%esp)
	.cfi_def_cfa_offset 60
	pushl	60(%esp)
	.cfi_def_cfa_offset 64
	call	decodeIA32PageDirectoryInvocation
.LVL3477:
	.loc 16 683 0
	addl	$52, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL3478:
.L3152:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -12
	.cfi_offset 6, -8
.LBB11687:
.LBB11688:
	.loc 16 681 0
	pushl	$__func__.6268
	.cfi_def_cfa_offset 20
	pushl	$681
	.cfi_def_cfa_offset 24
	pushl	$.LC122
	.cfi_def_cfa_offset 28
	pushl	$.LC146
	.cfi_def_cfa_offset 32
	call	_fail
.LVL3479:
.LBE11688:
.LBE11687:
	.cfi_endproc
.LFE464:
	.size	decodeX86ModeMMUInvocation, .-decodeX86ModeMMUInvocation
	.section	.text.unlikely
.LCOLDE569:
	.text
.LHOTE569:
	.section	.rodata.str1.1
.LC570:
	.string	"IOPort: Truncated message."
	.section	.rodata.str1.4
	.align 4
.LC571:
	.string	"IOPort Out32: Truncated message."
	.section	.rodata.str1.1
.LC572:
	.string	"IOPort: Unknown operation."
	.section	.text.unlikely
.LCOLDB573:
	.text
.LHOTB573:
	.p2align 4,,15
	.globl	decodeX86PortInvocation
	.type	decodeX86PortInvocation, @function
decodeX86PortInvocation:
.LFB606:
	.loc 70 49 0
	.cfi_startproc
.LVL3480:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 70 49 0
	movl	20(%esp), %eax
	.loc 70 56 0
	testl	%eax, %eax
	je	.L3183
	.loc 70 64 0
	movl	16(%esp), %ebx
	leal	-45(%ebx), %edx
	cmpl	$2, %edx
	ja	.L3156
	cmpl	$1, %eax
	jbe	.L3184
.L3156:
.LVL3481:
	.loc 70 74 0
	movl	16(%esp), %eax
.LBB11725:
.LBB11726:
	.loc 56 31 0
	movl	ksCurThread, %edx
.LVL3482:
.LBE11726:
.LBE11725:
	.loc 70 74 0
	subl	$42, %eax
.LBB11730:
.LBB11729:
.LBB11727:
.LBB11728:
	.loc 15 36 0
	movl	532(%edx), %ecx
.LVL3483:
.LBE11728:
.LBE11727:
.LBE11729:
.LBE11730:
	.loc 70 74 0
	cmpl	$5, %eax
	ja	.L3157
	movzwl	%cx, %ebx
	jmp	*.L3159(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L3159:
	.long	.L3158
	.long	.L3160
	.long	.L3161
	.long	.L3162
	.long	.L3163
	.long	.L3164
	.text
.LVL3484:
	.p2align 4,,10
	.p2align 3
.L3183:
	.loc 70 57 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	pushl	556(%eax)
	.cfi_def_cfa_offset 24
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	pushl	$57
	.cfi_def_cfa_offset 36
	pushl	$__func__.7663
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL3485:
	addl	$20, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC570
	.cfi_def_cfa_offset 32
.L3182:
	.loc 70 65 0
	call	kprintf
.LVL3486:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL3487:
	.loc 70 67 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	$3, %eax
	.loc 70 66 0
	movl	$7, current_syscall_error+24
.L3178:
	.loc 70 193 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL3488:
	.p2align 4,,10
	.p2align 3
.L3163:
	.cfi_restore_state
.LBB11731:
	.loc 70 137 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	movl	%ebx, %ecx
.LVL3489:
	pushl	$2
	.cfi_def_cfa_offset 32
	movl	48(%esp), %eax
	movl	52(%esp), %edx
	call	ensurePortOperationAllowed
.LVL3490:
	.loc 70 138 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	jne	.L3178
.LVL3491:
	.loc 70 144 0
	movl	ksCurThread, %eax
.LVL3492:
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	movzwl	536(%eax), %eax
	pushl	%eax
	.cfi_def_cfa_offset 28
.LVL3493:
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	out16
.LVL3494:
	.loc 70 146 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	jmp	.L3166
.LVL3495:
	.p2align 4,,10
	.p2align 3
.L3162:
.LBE11731:
.LBB11732:
	.loc 70 121 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	movl	%ebx, %ecx
.LVL3496:
	pushl	$1
	.cfi_def_cfa_offset 32
	movl	48(%esp), %eax
	movl	52(%esp), %edx
	call	ensurePortOperationAllowed
.LVL3497:
	.loc 70 122 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	jne	.L3178
.LVL3498:
	.loc 70 128 0
	movl	ksCurThread, %eax
.LVL3499:
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	movzbl	536(%eax), %eax
	pushl	%eax
	.cfi_def_cfa_offset 28
.LVL3500:
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	out8
.LVL3501:
	.loc 70 130 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	jmp	.L3166
.LVL3502:
	.p2align 4,,10
	.p2align 3
.L3161:
.LBE11732:
	.loc 70 106 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	movl	%ebx, %ecx
.LVL3503:
	pushl	$4
	.cfi_def_cfa_offset 32
	movl	48(%esp), %eax
	movl	52(%esp), %edx
	call	ensurePortOperationAllowed
.LVL3504:
	.loc 70 107 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	jne	.L3178
	.loc 70 112 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	in32
.LVL3505:
	.loc 70 114 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	jmp	.L3165
.LVL3506:
	.p2align 4,,10
	.p2align 3
.L3160:
	.loc 70 92 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	movl	%ebx, %ecx
.LVL3507:
	pushl	$2
	.cfi_def_cfa_offset 32
	movl	48(%esp), %eax
	movl	52(%esp), %edx
	call	ensurePortOperationAllowed
.LVL3508:
	.loc 70 93 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	jne	.L3178
	.loc 70 98 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	in16
.LVL3509:
	.loc 70 100 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	.loc 70 98 0
	movzwl	%ax, %eax
.LVL3510:
	.loc 70 100 0
	jmp	.L3165
.LVL3511:
	.p2align 4,,10
	.p2align 3
.L3158:
	.loc 70 78 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	movl	%ebx, %ecx
.LVL3512:
	pushl	$1
	.cfi_def_cfa_offset 32
	movl	48(%esp), %eax
	movl	52(%esp), %edx
	call	ensurePortOperationAllowed
.LVL3513:
	.loc 70 79 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	jne	.L3178
	.loc 70 84 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	in8
.LVL3514:
	.loc 70 86 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	.loc 70 84 0
	movzbl	%al, %eax
.LVL3515:
.L3165:
	.loc 70 173 0
	movl	ksCurThread, %edx
.LVL3516:
.LBB11733:
.LBB11734:
	.loc 15 30 0
	movl	%eax, 532(%edx)
.LBE11734:
.LBE11733:
	.loc 70 185 0
	movl	$1, %eax
.LVL3517:
.LBB11735:
.LBB11736:
	.loc 15 30 0
	movl	$0, 516(%edx)
.LVL3518:
	jmp	.L3167
.LVL3519:
	.p2align 4,,10
	.p2align 3
.L3164:
.LBE11736:
.LBE11735:
.LBB11737:
	.loc 70 153 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	movl	%ebx, %ecx
.LVL3520:
	pushl	$4
	.cfi_def_cfa_offset 32
	movl	48(%esp), %eax
	movl	52(%esp), %edx
	call	ensurePortOperationAllowed
.LVL3521:
	.loc 70 154 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	jne	.L3178
.LBB11738:
.LBB11739:
.LBB11740:
.LBB11741:
	.loc 15 36 0
	movl	ksCurThread, %eax
.LVL3522:
.LBE11741:
.LBE11740:
.LBE11739:
.LBE11738:
	.loc 70 160 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	pushl	536(%eax)
	.cfi_def_cfa_offset 28
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	out32
.LVL3523:
	.loc 70 162 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L3166:
	movl	ksCurThread, %edx
.LBE11737:
	.loc 70 49 0
	xorl	%eax, %eax
.LVL3524:
.L3167:
	.loc 70 191 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
.LBB11742:
.LBB11743:
	.loc 15 30 0
	movl	%eax, 528(%edx)
.LVL3525:
.LBE11743:
.LBE11742:
	.loc 70 191 0
	pushl	$2
	.cfi_def_cfa_offset 28
	pushl	%edx
	.cfi_def_cfa_offset 32
	call	setThreadState
.LVL3526:
	.loc 70 192 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	.loc 70 193 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL3527:
	ret
.LVL3528:
	.p2align 4,,10
	.p2align 3
.L3157:
	.cfi_restore_state
	.loc 70 166 0
	leal	668(%edx), %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	pushl	556(%edx)
	.cfi_def_cfa_offset 24
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	%edx
	.cfi_def_cfa_offset 32
	pushl	$166
	.cfi_def_cfa_offset 36
	pushl	$__func__.7663
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL3529:
	addl	$20, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC572
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL3530:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL3531:
	.loc 70 168 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	$3, %eax
	.loc 70 167 0
	movl	$3, current_syscall_error+24
	.loc 70 168 0
	jmp	.L3178
	.p2align 4,,10
	.p2align 3
.L3184:
	.loc 70 65 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	pushl	556(%eax)
	.cfi_def_cfa_offset 24
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	pushl	$65
	.cfi_def_cfa_offset 36
	pushl	$__func__.7663
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL3532:
	addl	$20, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC571
	.cfi_def_cfa_offset 32
	jmp	.L3182
	.cfi_endproc
.LFE606:
	.size	decodeX86PortInvocation, .-decodeX86PortInvocation
	.section	.text.unlikely
.LCOLDE573:
	.text
.LHOTE573:
	.section	.rodata.str1.4
	.align 4
.LC574:
	.string	"X86IOPageTable: Illegal operation."
	.align 4
.LC575:
	.string	"X86IOPageTableMap: Truncated message."
	.align 4
.LC576:
	.string	"X86IOPageTableMap: IO page table is already mapped."
	.align 4
.LC577:
	.string	"X86IOPageTableMap: Invalid IO space capability."
	.align 4
.LC578:
	.string	"(aw & ~0x7u) == ((0 && (aw & (1u << 31))) ? 0x0 : 0)"
	.align 4
.LC579:
	.string	"(((~0x78000000u >> 27 ) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB580:
	.text
.LHOTB580:
	.p2align 4,,15
	.globl	decodeX86IOPTInvocation
	.type	decodeX86IOPTInvocation, @function
decodeX86IOPTInvocation:
.LFB615:
	.loc 3 188 0
	.cfi_startproc
.LVL3533:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$60, %esp
	.cfi_def_cfa_offset 80
	.loc 3 188 0
	movl	80(%esp), %eax
	movl	92(%esp), %esi
.LVL3534:
	movl	96(%esp), %ebx
.LVL3535:
	.loc 3 197 0
	cmpl	$34, %eax
	je	.L3210
	.loc 3 203 0
	cmpl	$33, %eax
	je	.L3189
	.loc 3 204 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 84
	pushl	556(%eax)
	.cfi_def_cfa_offset 88
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 92
	pushl	%eax
	.cfi_def_cfa_offset 96
	pushl	$204
	.cfi_def_cfa_offset 100
	pushl	$__func__.7749
	.cfi_def_cfa_offset 104
	pushl	$0
	.cfi_def_cfa_offset 108
	pushl	$.LC111
	.cfi_def_cfa_offset 112
	call	kprintf
.LVL3536:
	addl	$20, %esp
	.cfi_def_cfa_offset 92
	pushl	$.LC574
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL3537:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL3538:
	.loc 3 206 0
	addl	$16, %esp
	.cfi_def_cfa_offset 80
	movl	$3, %eax
	.loc 3 205 0
	movl	$3, current_syscall_error+24
.L3188:
.LVL3539:
	.loc 3 296 0 discriminator 1
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3540:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3541:
	.p2align 4,,10
	.p2align 3
.L3189:
	.cfi_restore_state
	movl	100(%esp), %edx
	.loc 3 209 0 discriminator 1
	testl	%edx, %edx
	je	.L3206
	movl	84(%esp), %eax
	testl	%eax, %eax
	je	.L3206
.LVL3542:
.LBB11818:
.LBB11819:
	.loc 11 3486 0
	movl	%esi, %eax
.LBE11819:
.LBE11818:
.LBB11822:
.LBB11823:
	.loc 56 31 0
	movl	ksCurThread, %ebp
.LVL3543:
.LBE11823:
.LBE11822:
.LBB11827:
.LBB11820:
	.loc 11 3486 0
	cmpb	$15, %al
	jne	.L3211
.LBE11820:
.LBE11827:
	.loc 3 218 0
	testl	%ebx, %ebx
	js	.L3212
	.loc 3 215 0
	movl	(%edx), %eax
.LVL3544:
.LBB11828:
.LBB11829:
	.loc 11 2202 0
	movl	%eax, %edi
	.loc 11 2203 0
	movl	%eax, %ecx
	.loc 11 2202 0
	andl	$14, %edi
	.loc 11 2203 0
	andl	$15, %ecx
	.loc 11 2202 0
	movl	%edi, 16(%esp)
.LVL3545:
	.loc 11 2203 0
	cmpl	$14, 16(%esp)
	movl	%ecx, %edi
	movzbl	%al, %ecx
	cmovne	%edi, %ecx
.LBE11829:
.LBE11828:
	.loc 3 225 0
	cmpl	$13, %ecx
	je	.L3196
	.loc 3 226 0
	leal	668(%ebp), %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 84
	pushl	556(%ebp)
	.cfi_def_cfa_offset 88
.LVL3546:
	pushl	%eax
	.cfi_def_cfa_offset 92
	pushl	%ebp
	.cfi_def_cfa_offset 96
	pushl	$226
	.cfi_def_cfa_offset 100
	pushl	$__func__.7749
	.cfi_def_cfa_offset 104
	pushl	$0
	.cfi_def_cfa_offset 108
	pushl	$.LC111
	.cfi_def_cfa_offset 112
	call	kprintf
.LVL3547:
	addl	$20, %esp
	.cfi_def_cfa_offset 92
	pushl	$.LC577
	.cfi_def_cfa_offset 96
.L3208:
	call	kprintf
.LVL3548:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL3549:
	.loc 3 229 0
	addl	$16, %esp
	.cfi_def_cfa_offset 80
	movl	$3, %eax
	.loc 3 227 0
	movl	$2, current_syscall_error+24
	.loc 3 228 0
	movl	$0, current_syscall_error+4
	.loc 3 229 0
	jmp	.L3188
.LVL3550:
	.p2align 4,,10
	.p2align 3
.L3206:
	.loc 3 210 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 84
	pushl	556(%eax)
	.cfi_def_cfa_offset 88
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 92
	pushl	%eax
	.cfi_def_cfa_offset 96
	pushl	$210
	.cfi_def_cfa_offset 100
	pushl	$__func__.7749
	.cfi_def_cfa_offset 104
	pushl	$0
	.cfi_def_cfa_offset 108
	pushl	$.LC111
	.cfi_def_cfa_offset 112
	call	kprintf
.LVL3551:
	addl	$20, %esp
	.cfi_def_cfa_offset 92
	pushl	$.LC575
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL3552:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL3553:
	.loc 3 212 0
	addl	$16, %esp
	.cfi_def_cfa_offset 80
	movl	$3, %eax
	.loc 3 211 0
	movl	$7, current_syscall_error+24
	.loc 3 296 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3554:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3555:
	.p2align 4,,10
	.p2align 3
.L3210:
	.cfi_restore_state
	.loc 3 199 0
	subl	$8, %esp
	.cfi_def_cfa_offset 88
	pushl	$2
	.cfi_def_cfa_offset 92
	pushl	ksCurThread
	.cfi_def_cfa_offset 96
	call	setThreadState
.LVL3556:
.LBB11830:
.LBB11831:
	.loc 3 152 0
	popl	%ecx
	.cfi_def_cfa_offset 92
	popl	%edi
	.cfi_def_cfa_offset 88
.LVL3557:
	pushl	%ebx
	.cfi_def_cfa_offset 92
.LVL3558:
	pushl	%esi
	.cfi_def_cfa_offset 96
	call	deleteIOPageTable
.LVL3559:
.LBB11832:
.LBB11833:
	.loc 11 3499 0
	movl	%esi, %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 80
	cmpb	$15, %al
	jne	.L3213
.LVL3560:
.LBE11833:
.LBE11832:
	.loc 3 154 0
	movl	88(%esp), %eax
	andl	$2147483647, %ebx
.LVL3561:
	movl	%esi, (%eax)
	movl	%ebx, 4(%eax)
.LVL3562:
.LBE11831:
.LBE11830:
	.loc 3 296 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 3 200 0
	xorl	%eax, %eax
	.loc 3 296 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3563:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3564:
	.p2align 4,,10
	.p2align 3
.L3212:
	.cfi_restore_state
	.loc 3 219 0
	leal	668(%ebp), %eax
	subl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 84
	pushl	556(%ebp)
	.cfi_def_cfa_offset 88
.LVL3565:
	pushl	%eax
	.cfi_def_cfa_offset 92
	pushl	%ebp
	.cfi_def_cfa_offset 96
	pushl	$219
	.cfi_def_cfa_offset 100
	pushl	$__func__.7749
	.cfi_def_cfa_offset 104
	pushl	$0
	.cfi_def_cfa_offset 108
	pushl	$.LC111
	.cfi_def_cfa_offset 112
	call	kprintf
.LVL3566:
	addl	$20, %esp
	.cfi_def_cfa_offset 92
	pushl	$.LC576
	.cfi_def_cfa_offset 96
	jmp	.L3208
.LVL3567:
	.p2align 4,,10
	.p2align 3
.L3196:
	.cfi_restore_state
	.loc 3 215 0
	movl	4(%edx), %ecx
.LBB11837:
.LBB11826:
.LBB11824:
.LBB11825:
	.loc 15 36 0
	movl	532(%ebp), %edx
	movl	%edx, 16(%esp)
.LVL3568:
.LBE11825:
.LBE11824:
.LBE11826:
.LBE11837:
.LBB11838:
.LBB11839:
	.loc 11 3333 0
	cmpl	$13, %edi
	jne	.L3214
	.loc 11 3336 0
	movzwl	%cx, %edi
.LVL3569:
.LBE11839:
.LBE11838:
	.loc 3 234 0
	testl	%edi, %edi
	jne	.L3198
	.loc 3 235 0
	movl	$2, current_syscall_error+24
	.loc 3 238 0
	movl	$3, %eax
	.loc 3 236 0
	movl	$0, current_syscall_error+4
	.loc 3 238 0
	jmp	.L3188
.L3198:
.LVL3570:
.LBB11841:
.LBB11842:
	.loc 58 29 0
	movl	%esi, %edx
.LBE11842:
.LBE11841:
	.loc 3 242 0
	movl	%ecx, 20(%esp)
.LBB11844:
.LBB11843:
	.loc 58 29 0
	andl	$268435200, %edx
	sall	$4, %edx
.LVL3571:
	addl	$536870912, %edx
.LVL3572:
	movl	%edx, 8(%esp)
.LVL3573:
.LBE11843:
.LBE11844:
	.loc 3 242 0
	movl	%ecx, %edx
	call	lookup_vtd_context_slot
.LVL3574:
	movl	(%eax), %edx
.LVL3575:
	.loc 3 244 0
	testb	$1, %dl
	jne	.L3199
.LBB11845:
	.loc 3 247 0
	movl	x86KSnumIOPTLevels, %ecx
	leal	-2(%ecx), %edx
.LVL3576:
.LBB11846:
.LBB11847:
	.loc 61 76 0
	movl	20(%esp), %ecx
	testl	$-8, %edx
	jne	.L3215
	.loc 61 89 0
	shrl	$16, %ecx
	movl	%eax, 20(%esp)
.LVL3577:
.LBE11847:
.LBE11846:
	.loc 3 260 0
	subl	$8, %esp
	.cfi_def_cfa_offset 88
.LBB11852:
.LBB11853:
	.loc 11 3583 0
	andl	$-2013331456, %ebx
.LVL3578:
.LBE11853:
.LBE11852:
.LBB11856:
.LBB11848:
	.loc 61 89 0
	sall	$8, %ecx
.LBE11848:
.LBE11856:
.LBB11857:
.LBB11854:
	.loc 11 3583 0
	orl	$-2147483648, %ebx
.LBE11854:
.LBE11857:
.LBB11858:
.LBB11849:
	.loc 61 89 0
	orl	%edx, %ecx
.LBE11849:
.LBE11858:
.LBB11859:
.LBB11855:
	.loc 11 3583 0
	orl	%edi, %ebx
.LVL3579:
.LBE11855:
.LBE11859:
.LBB11860:
.LBB11850:
	.loc 61 89 0
	movl	%ecx, 24(%esp)
.LVL3580:
.LBE11850:
.LBE11860:
	.loc 3 260 0
	pushl	$2
	.cfi_def_cfa_offset 92
	pushl	%ebp
	.cfi_def_cfa_offset 96
	call	setThreadState
.LVL3581:
.LBB11861:
.LBB11862:
	.loc 3 162 0
	movl	24(%esp), %edx
	movl	36(%esp), %eax
	movl	32(%esp), %ecx
	orl	$1, %edx
	movl	%edx, (%eax)
	movl	$0, 4(%eax)
	movl	%ecx, 8(%eax)
	movl	$0, 12(%eax)
	.loc 3 163 0
	popl	%edi
	.cfi_def_cfa_offset 92
	popl	%ebp
	.cfi_def_cfa_offset 88
	pushl	$3
	.cfi_def_cfa_offset 92
	pushl	%eax
	.cfi_def_cfa_offset 96
.LVL3582:
.L3209:
.LBE11862:
.LBE11861:
.LBE11845:
.LBB11864:
.LBB11865:
.LBB11866:
	.loc 3 173 0
	call	flushCacheRange
.LVL3583:
	.loc 3 174 0
	movl	104(%esp), %eax
.LBE11866:
.LBE11865:
	.loc 3 294 0
	addl	$16, %esp
	.cfi_def_cfa_offset 80
.LBB11869:
.LBB11867:
	.loc 3 174 0
	movl	%esi, (%eax)
	movl	%ebx, 4(%eax)
.LBE11867:
.LBE11869:
	.loc 3 294 0
	xorl	%eax, %eax
.LVL3584:
	jmp	.L3188
.LVL3585:
.L3199:
.LBB11870:
.LBB11871:
	.loc 58 23 0
	andl	$-4096, %edx
.LVL3586:
.LBE11871:
.LBE11870:
.LBB11872:
.LBB11873:
	.loc 3 118 0
	subl	$536870912, %edx
.LVL3587:
	je	.L3203
.LBE11873:
.LBE11872:
.LBE11864:
	.loc 3 216 0
	movl	16(%esp), %ebp
.LBB11893:
.LBB11877:
.LBB11874:
	.loc 3 124 0
	subl	$8, %esp
	.cfi_def_cfa_offset 88
	.loc 3 125 0
	movl	x86KSnumIOPTLevels, %eax
.LVL3588:
.LBE11874:
.LBE11877:
.LBE11893:
	.loc 3 216 0
	andl	$-2097152, %ebp
.LBB11894:
.LBB11878:
.LBB11875:
	.loc 3 125 0
	subl	$1, %eax
	.loc 3 124 0
	movl	%ebp, %ecx
	pushl	%eax
	.cfi_def_cfa_offset 92
	shrl	$12, %ecx
	pushl	%eax
	.cfi_def_cfa_offset 96
	leal	52(%esp), %eax
	call	lookupIOPTSlot_resolve_levels
.LVL3589:
.LBE11875:
.LBE11878:
	.loc 3 269 0
	addl	$16, %esp
	.cfi_def_cfa_offset 80
	movl	36(%esp), %ebx
.LVL3590:
	testl	%ebx, %ebx
	jne	.L3203
.LBB11879:
.LBB11876:
	.loc 3 124 0
	movl	40(%esp), %eax
	movl	%eax, 16(%esp)
.LVL3591:
.LBE11876:
.LBE11879:
	.loc 3 276 0
	testl	$-4096, (%eax)
	je	.L3204
	.loc 3 277 0
	movl	$8, current_syscall_error+24
	.loc 3 279 0
	movl	$3, %eax
	jmp	.L3188
.LVL3592:
.L3203:
	.loc 3 270 0
	movl	$6, current_syscall_error+24
	.loc 3 272 0
	movl	$3, %eax
	.loc 3 271 0
	movl	$0, current_syscall_error+20
	.loc 3 272 0
	jmp	.L3188
.LVL3593:
.L3204:
	.loc 3 282 0
	subl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 92
	.loc 3 275 0
	movl	x86KSnumIOPTLevels, %ebx
.LVL3594:
	.loc 3 282 0
	movl	$1, %ecx
	.loc 3 275 0
	subl	56(%esp), %ebx
	.loc 3 282 0
	pushl	$1
	.cfi_def_cfa_offset 96
	movl	24(%esp), %edx
	leal	40(%esp), %eax
.LVL3595:
	call	vtd_pte_new
.LVL3596:
	movl	40(%esp), %eax
	movl	44(%esp), %edx
.LVL3597:
.LBB11880:
.LBB11881:
	.loc 11 3528 0
	addl	$16, %esp
	.cfi_def_cfa_offset 80
	testb	$16, %bl
	jne	.L3216
.LBE11881:
.LBE11880:
.LBB11883:
.LBB11884:
	.loc 11 3557 0
	movl	%ebx, %ecx
	movl	%ebp, %ebx
	movl	%eax, 8(%esp)
	sall	$27, %ecx
	movl	%edx, 12(%esp)
.LVL3598:
	shrl	$5, %ebx
	andl	$2013265920, %ecx
.LBE11884:
.LBE11883:
	.loc 3 293 0
	pushl	%eax
	.cfi_def_cfa_offset 84
.LBB11888:
.LBB11885:
	.loc 11 3557 0
	orl	$-2147483648, %ecx
.LBE11885:
.LBE11888:
	.loc 3 293 0
	pushl	%eax
	.cfi_def_cfa_offset 88
.LBB11889:
.LBB11886:
	.loc 11 3557 0
	orl	%edi, %ecx
.LBE11886:
.LBE11889:
	.loc 3 293 0
	pushl	$2
	.cfi_def_cfa_offset 92
	pushl	ksCurThread
	.cfi_def_cfa_offset 96
.LBB11890:
.LBB11887:
	.loc 11 3557 0
	orl	%ecx, %ebx
.LBE11887:
.LBE11890:
	.loc 3 293 0
	call	setThreadState
.LVL3599:
.LBB11891:
.LBB11868:
	.loc 3 172 0
	movl	32(%esp), %edi
	movl	24(%esp), %eax
	movl	28(%esp), %edx
	movl	%eax, (%edi)
.LVL3600:
	movl	%edx, 4(%edi)
	.loc 3 173 0
	popl	%edx
	.cfi_def_cfa_offset 92
.LVL3601:
	popl	%ecx
	.cfi_def_cfa_offset 88
	pushl	$3
	.cfi_def_cfa_offset 92
	pushl	%edi
	.cfi_def_cfa_offset 96
	jmp	.L3209
.LVL3602:
.L3213:
	.cfi_restore_state
.LBE11868:
.LBE11891:
.LBE11894:
.LBB11895:
.LBB11836:
.LBB11835:
.LBB11834:
	call	cap_io_page_table_cap_set_capIOPTIsMapped.part.201
.LVL3603:
.L3214:
.LBE11834:
.LBE11835:
.LBE11836:
.LBE11895:
.LBB11896:
.LBB11840:
	call	cap_io_space_cap_get_capPCIDevice.part.197
.LVL3604:
.L3215:
.LBE11840:
.LBE11896:
.LBB11897:
.LBB11863:
.LBB11851:
	.loc 61 76 0
	pushl	$__FUNCTION__.3657
	.cfi_remember_state
	.cfi_def_cfa_offset 84
	pushl	$76
	.cfi_def_cfa_offset 88
	pushl	$.LC304
	.cfi_def_cfa_offset 92
	pushl	$.LC578
	.cfi_def_cfa_offset 96
	call	_assert_fail
.LVL3605:
.L3211:
	.cfi_restore_state
.LBE11851:
.LBE11863:
.LBE11897:
.LBB11898:
.LBB11821:
	call	cap_io_page_table_cap_get_capIOPTIsMapped.part.199
.LVL3606:
.L3216:
.LBE11821:
.LBE11898:
.LBB11899:
.LBB11892:
.LBB11882:
	.loc 11 3528 0
	pushl	$__FUNCTION__.2733
	.cfi_def_cfa_offset 84
	pushl	$3528
	.cfi_def_cfa_offset 88
	pushl	$.LC154
	.cfi_def_cfa_offset 92
	pushl	$.LC579
	.cfi_def_cfa_offset 96
	call	_assert_fail
.LVL3607:
.LBE11882:
.LBE11892:
.LBE11899:
	.cfi_endproc
.LFE615:
	.size	decodeX86IOPTInvocation, .-decodeX86IOPTInvocation
	.section	.text.unlikely
.LCOLDE580:
	.text
.LHOTE580:
	.section	.rodata.str1.4
	.align 4
.LC581:
	.string	"X86PageMapIO: Truncated message."
	.align 4
.LC582:
	.string	"X86PageMapIO: Invalid page size."
	.align 4
.LC583:
	.string	"X86PageMapIO: Page already mapped."
	.align 4
.LC584:
	.string	"X86PageMapIO: Invalid IO space capability."
	.align 4
.LC585:
	.string	"X86PageMapIO: Invalid PCI device."
	.section	.text.unlikely
.LCOLDB586:
	.text
.LHOTB586:
	.p2align 4,,15
	.globl	decodeX86IOMapInvocation
	.type	decodeX86IOMapInvocation, @function
decodeX86IOMapInvocation:
.LFB617:
	.loc 3 317 0
	.cfi_startproc
.LVL3608:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$76, %esp
	.cfi_def_cfa_offset 96
	.loc 3 329 0
	cmpl	$1, 96(%esp)
	.loc 3 317 0
	movl	104(%esp), %ebp
.LVL3609:
	movl	108(%esp), %edi
.LVL3610:
	movl	112(%esp), %edx
.LVL3611:
	.loc 3 329 0
	jbe	.L3245
	testl	%edx, %edx
	je	.L3245
.LVL3612:
.LBB11963:
.LBB11964:
	.loc 11 2812 0
	movl	%ebp, %eax
	andl	$15, %eax
	cmpl	$1, %eax
	jne	.L3255
.LBE11964:
.LBE11963:
	.loc 3 335 0
	testl	$1073741824, %edi
	jne	.L3256
.LVL3613:
.LBB11966:
.LBB11967:
	.loc 46 75 0
	movl	%ebp, %ebx
	andl	$201326592, %ebx
	movl	%ebx, %ecx
	movl	%edi, %ebx
	andl	$1072693248, %ebx
	shrl	$16, %ecx
	movl	%ebx, %eax
	shrl	$20, %eax
.LBE11967:
.LBE11966:
	.loc 3 342 0
	addl	%eax, %ecx
	movl	%ecx, %ebx
	jne	.L3257
.LVL3614:
	.loc 3 349 0
	movl	(%edx), %eax
.LVL3615:
.LBB11968:
.LBB11969:
	.loc 56 31 0
	movl	ksCurThread, %esi
.LBE11969:
.LBE11968:
.LBB11977:
.LBB11978:
	.loc 11 2202 0
	movl	%eax, %ecx
	andl	$14, %ecx
.LBE11978:
.LBE11977:
.LBB11980:
.LBB11974:
	.loc 56 31 0
	movl	%esi, 12(%esp)
.LVL3616:
.LBE11974:
.LBE11980:
.LBB11981:
.LBB11979:
	.loc 11 2202 0
	movl	%ecx, 16(%esp)
	.loc 11 2203 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$14, 16(%esp)
	movl	%ecx, %esi
	movl	%ecx, 20(%esp)
	movzbl	%al, %ecx
	cmovne	%esi, %ecx
.LVL3617:
.LBE11979:
.LBE11981:
	.loc 3 353 0
	cmpl	$13, %ecx
	je	.L3226
	.loc 3 354 0
	subl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 100
	movl	16(%esp), %esi
	pushl	556(%esi)
	.cfi_def_cfa_offset 104
	movl	%esi, %eax
.LVL3618:
	addl	$668, %eax
	pushl	%eax
	.cfi_def_cfa_offset 108
	pushl	%esi
	.cfi_def_cfa_offset 112
	pushl	$354
	.cfi_def_cfa_offset 116
.LVL3619:
	pushl	$__func__.7776
	.cfi_def_cfa_offset 120
	pushl	$0
	.cfi_def_cfa_offset 124
	pushl	$.LC111
	.cfi_def_cfa_offset 128
	call	kprintf
.LVL3620:
	addl	$20, %esp
	.cfi_def_cfa_offset 108
	pushl	$.LC584
	.cfi_def_cfa_offset 112
	jmp	.L3252
.LVL3621:
	.p2align 4,,10
	.p2align 3
.L3245:
	.cfi_restore_state
	.loc 3 330 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 100
	.loc 3 332 0
	movl	$3, %ebx
	.loc 3 330 0
	pushl	556(%eax)
	.cfi_def_cfa_offset 104
	leal	668(%eax), %edx
.LVL3622:
	pushl	%edx
	.cfi_def_cfa_offset 108
	pushl	%eax
	.cfi_def_cfa_offset 112
	pushl	$330
	.cfi_def_cfa_offset 116
	pushl	$__func__.7776
	.cfi_def_cfa_offset 120
	pushl	$0
	.cfi_def_cfa_offset 124
	pushl	$.LC111
	.cfi_def_cfa_offset 128
	call	kprintf
.LVL3623:
	addl	$20, %esp
	.cfi_def_cfa_offset 108
	pushl	$.LC581
	.cfi_def_cfa_offset 112
	call	kprintf
.LVL3624:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL3625:
	.loc 3 332 0
	addl	$16, %esp
	.cfi_def_cfa_offset 96
	.loc 3 331 0
	movl	$7, current_syscall_error+24
.L3249:
	.loc 3 410 0
	addl	$76, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL3626:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3627:
	.p2align 4,,10
	.p2align 3
.L3256:
	.cfi_restore_state
	.loc 3 336 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 100
	pushl	556(%eax)
	.cfi_def_cfa_offset 104
	leal	668(%eax), %edx
.LVL3628:
	pushl	%edx
	.cfi_def_cfa_offset 108
	pushl	%eax
	.cfi_def_cfa_offset 112
	pushl	$336
	.cfi_def_cfa_offset 116
	pushl	$__func__.7776
	.cfi_def_cfa_offset 120
	pushl	$0
	.cfi_def_cfa_offset 124
	pushl	$.LC111
	.cfi_def_cfa_offset 128
	call	kprintf
.LVL3629:
	addl	$20, %esp
	.cfi_def_cfa_offset 108
	pushl	$.LC582
	.cfi_def_cfa_offset 112
.L3252:
	.loc 3 343 0
	call	kprintf
.LVL3630:
	movl	$.LC113, (%esp)
	.loc 3 346 0
	movl	$3, %ebx
	.loc 3 343 0
	call	kprintf
.LVL3631:
	.loc 3 346 0
	addl	$16, %esp
	.cfi_def_cfa_offset 96
	.loc 3 410 0
	movl	%ebx, %eax
	.loc 3 344 0
	movl	$2, current_syscall_error+24
	.loc 3 345 0
	movl	$0, current_syscall_error+4
	.loc 3 410 0
	addl	$76, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL3632:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL3633:
	.p2align 4,,10
	.p2align 3
.L3257:
	.cfi_restore_state
	.loc 3 343 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 100
	pushl	556(%eax)
	.cfi_def_cfa_offset 104
	leal	668(%eax), %edx
.LVL3634:
	pushl	%edx
	.cfi_def_cfa_offset 108
	pushl	%eax
	.cfi_def_cfa_offset 112
	pushl	$343
	.cfi_def_cfa_offset 116
	pushl	$__func__.7776
	.cfi_def_cfa_offset 120
	pushl	$0
	.cfi_def_cfa_offset 124
	pushl	$.LC111
	.cfi_def_cfa_offset 128
	call	kprintf
.LVL3635:
	addl	$20, %esp
	.cfi_def_cfa_offset 108
	pushl	$.LC583
	.cfi_def_cfa_offset 112
	jmp	.L3252
.LVL3636:
.L3255:
	.cfi_restore_state
.LBB11982:
.LBB11965:
	call	cap_frame_cap_get_capFSize.part.160
.LVL3637:
	.p2align 4,,10
	.p2align 3
.L3226:
.LBE11965:
.LBE11982:
.LBB11983:
.LBB11975:
.LBB11970:
.LBB11971:
	.loc 15 36 0
	movl	12(%esp), %esi
.LBE11971:
.LBE11970:
.LBE11975:
.LBE11983:
.LBB11984:
.LBB11985:
	.loc 11 3333 0
	cmpl	$13, 20(%esp)
.LBE11985:
.LBE11984:
	.loc 3 349 0
	movl	4(%edx), %edx
.LVL3638:
.LBB11988:
.LBB11976:
.LBB11973:
.LBB11972:
	.loc 15 36 0
	movl	536(%esi), %ecx
.LVL3639:
.LBE11972:
.LBE11973:
.LBE11976:
.LBE11988:
.LBB11989:
.LBB11986:
	.loc 11 3333 0
	jne	.L3258
	.loc 11 3336 0
	movzwl	%dx, %esi
	movl	%esi, 16(%esp)
.LBE11986:
.LBE11989:
	.loc 3 362 0
	testl	%esi, %esi
	jne	.L3228
	.loc 3 363 0
	subl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 100
	movl	16(%esp), %esi
	pushl	556(%esi)
	.cfi_def_cfa_offset 104
	movl	%esi, %eax
.LVL3640:
	addl	$668, %eax
	pushl	%eax
	.cfi_def_cfa_offset 108
	pushl	%esi
	.cfi_def_cfa_offset 112
	pushl	$363
	.cfi_def_cfa_offset 116
.LVL3641:
	pushl	$__func__.7776
	.cfi_def_cfa_offset 120
	pushl	$0
	.cfi_def_cfa_offset 124
	pushl	$.LC111
	.cfi_def_cfa_offset 128
	call	kprintf
.LVL3642:
	addl	$20, %esp
	.cfi_def_cfa_offset 108
	pushl	$.LC585
	.cfi_def_cfa_offset 112
	jmp	.L3252
.LVL3643:
	.p2align 4,,10
	.p2align 3
.L3228:
	.cfi_restore_state
	movl	%ecx, 12(%esp)
	.loc 3 369 0
	call	lookup_vtd_context_slot
.LVL3644:
	.loc 3 371 0
	movl	12(%esp), %ecx
	movl	(%eax), %eax
.LVL3645:
	testb	$1, %al
	jne	.L3229
.L3231:
	.loc 3 373 0
	movl	$6, current_syscall_error+24
	.loc 3 375 0
	movl	$3, %ebx
	.loc 3 374 0
	movl	$0, current_syscall_error+20
	.loc 3 375 0
	jmp	.L3249
.L3229:
.LVL3646:
.LBB11990:
.LBB11991:
	.loc 58 23 0
	andl	$-4096, %eax
.LVL3647:
.LBE11991:
.LBE11990:
.LBB11992:
.LBB11993:
	.loc 3 118 0
	subl	$536870912, %eax
.LVL3648:
	movl	%eax, %edx
	je	.L3231
	.loc 3 125 0
	movl	x86KSnumIOPTLevels, %eax
.LVL3649:
	.loc 3 124 0
	shrl	$12, %ecx
	subl	$8, %esp
	.cfi_def_cfa_offset 104
	movl	%ecx, 20(%esp)
	.loc 3 125 0
	subl	$1, %eax
	.loc 3 124 0
	pushl	%eax
	.cfi_def_cfa_offset 108
	pushl	%eax
	.cfi_def_cfa_offset 112
	leal	68(%esp), %eax
	call	lookupIOPTSlot_resolve_levels
.LVL3650:
.LBE11993:
.LBE11992:
	.loc 3 380 0
	addl	$16, %esp
	.cfi_def_cfa_offset 96
	movl	52(%esp), %eax
	testl	%eax, %eax
	jne	.L3231
	.loc 3 380 0 is_stmt 0 discriminator 1
	cmpl	$0, 60(%esp)
	jne	.L3231
.LBB11995:
.LBB11994:
	.loc 3 124 0 is_stmt 1
	movl	56(%esp), %esi
.LVL3651:
.LBE11994:
.LBE11995:
	.loc 3 386 0
	testl	$-4096, (%esi)
	je	.L3233
	.loc 3 387 0
	movl	$8, current_syscall_error+24
	.loc 3 388 0
	movl	$3, %ebx
	jmp	.L3249
.L3233:
.LVL3652:
.LBB11996:
.LBB11997:
	.loc 56 31 0
	movl	ksCurThread, %eax
	movl	%eax, 20(%esp)
.LVL3653:
.LBB11998:
.LBB11999:
	.loc 15 36 0
	movl	532(%eax), %edx
.LVL3654:
.LBE11999:
.LBE11998:
.LBE11997:
.LBE11996:
.LBB12000:
.LBB12001:
	.loc 11 2973 0
	movl	%ebp, %eax
	andl	$50331648, %eax
	shrl	$24, %eax
.LVL3655:
.LBE12001:
.LBE12000:
	.loc 3 394 0
	cmpl	$3, %eax
	jne	.L3236
	testb	$1, %dl
	jne	.L3259
.L3236:
.LVL3656:
	.loc 3 395 0
	andb	$2, %dl
.LVL3657:
	je	.L3238
	.loc 3 394 0
	xorl	%ecx, %ecx
	.loc 3 395 0
	subl	$1, %eax
	je	.L3238
.LVL3658:
.L3240:
	movl	$1, %eax
.LVL3659:
.L3239:
	.loc 3 397 0
	movl	%ebp, %edx
	subl	$12, %esp
	.cfi_def_cfa_offset 108
	andl	$16777200, %edx
	pushl	%eax
	.cfi_def_cfa_offset 112
.LVL3660:
	leal	56(%esp), %eax
	sall	$8, %edx
	addl	$536870912, %edx
	call	vtd_pte_new
.LVL3661:
	movl	60(%esp), %edx
.LVL3662:
	.loc 3 405 0
	movl	%edi, %ecx
	.loc 3 397 0
	movl	56(%esp), %eax
	movl	%edx, 44(%esp)
.LVL3663:
	.loc 3 405 0
	movl	%ebp, %edx
	.loc 3 397 0
	movl	%eax, 40(%esp)
	.loc 3 405 0
	popl	%eax
	.cfi_def_cfa_offset 108
	andl	$-1610612737, %edx
	pushl	28(%esp)
	.cfi_def_cfa_offset 112
	orl	$1073741824, %edx
.LVL3664:
	leal	48(%esp), %eax
	call	cap_frame_cap_set_capFMappedASID
.LVL3665:
	movl	48(%esp), %ebp
.LVL3666:
	movl	52(%esp), %edi
.LVL3667:
.LBB12002:
.LBB12003:
	.loc 11 2865 0
	addl	$16, %esp
	.cfi_def_cfa_offset 96
	movl	%ebp, %eax
	andl	$15, %eax
	subl	$1, %eax
	jne	.L3260
.LVL3668:
	.loc 11 2871 0
	andl	$-1048576, %edi
.LVL3669:
	orl	12(%esp), %edi
.LVL3670:
.LBE12003:
.LBE12002:
	.loc 3 408 0
	pushl	%edx
	.cfi_def_cfa_offset 100
	pushl	%edx
	.cfi_def_cfa_offset 104
	pushl	$2
	.cfi_def_cfa_offset 108
	pushl	32(%esp)
	.cfi_def_cfa_offset 112
	call	setThreadState
.LVL3671:
.LBB12005:
.LBB12006:
	.loc 3 301 0
	movl	116(%esp), %eax
	.loc 3 302 0
	movl	44(%esp), %edx
	.loc 3 301 0
	movl	%ebp, (%eax)
.LVL3672:
	movl	%edi, 4(%eax)
	.loc 3 302 0
	movl	40(%esp), %eax
	movl	%edx, 4(%esi)
.LVL3673:
	movl	%eax, (%esi)
	.loc 3 303 0
	popl	%ecx
	.cfi_def_cfa_offset 108
	popl	%edi
	.cfi_def_cfa_offset 104
.LVL3674:
	pushl	$3
	.cfi_def_cfa_offset 108
.LVL3675:
	pushl	%esi
	.cfi_def_cfa_offset 112
	call	flushCacheRange
.LVL3676:
.LBE12006:
.LBE12005:
	.loc 3 409 0
	addl	$16, %esp
	.cfi_def_cfa_offset 96
	jmp	.L3249
.LVL3677:
.L3238:
	.loc 3 399 0
	movl	$1, current_syscall_error+24
	.loc 3 401 0
	movl	$3, %ebx
.LVL3678:
	.loc 3 400 0
	movl	$0, current_syscall_error
	.loc 3 401 0
	jmp	.L3249
.LVL3679:
.L3260:
.LBB12007:
.LBB12004:
	call	cap_frame_cap_set_capFMappedAddress.part.182
.LVL3680:
.L3258:
.LBE12004:
.LBE12007:
.LBB12008:
.LBB11987:
	call	cap_io_space_cap_get_capPCIDevice.part.197
.LVL3681:
.L3259:
.LBE11987:
.LBE12008:
	.loc 3 395 0
	andb	$2, %dl
.LVL3682:
	je	.L3243
	.loc 3 394 0
	movl	$1, %ecx
	jmp	.L3240
.L3243:
	.loc 3 395 0
	xorl	%eax, %eax
	.loc 3 394 0
	movl	$1, %ecx
	jmp	.L3239
	.cfi_endproc
.LFE617:
	.size	decodeX86IOMapInvocation, .-decodeX86IOMapInvocation
	.section	.text.unlikely
.LCOLDE586:
	.text
.LHOTE586:
	.section	.rodata.str1.4
	.align 4
.LC587:
	.string	"X86Frame: Frame already mapped."
	.align 4
.LC588:
	.string	"cap_frame_cap_get_capFMapType(cap) == X86_MappingNone"
	.align 4
.LC589:
	.string	"X86Frame: Attempting to map frame into invalid page directory cap."
	.align 4
.LC590:
	.string	"X86Frame: Mapping address too high."
	.align 4
.LC591:
	.string	"X86FrameRemap: Attempting to remap frame with different mapping type"
	.align 4
.LC592:
	.string	"X86FrameRemap: Truncated message"
	.align 4
.LC593:
	.string	"X86FrameRemap: Attempting to map frame into invalid page directory."
	.align 4
.LC594:
	.string	"X86PageRemap: Frame must already have been mapped into provided vspace."
	.align 4
.LC595:
	.string	"((cap_ptr->words[0] >> 0) & 0xf) == cap_frame_cap"
	.align 4
.LC596:
	.string	"Mapped frame cap was not mapped"
	.section	.text.unlikely
.LCOLDB597:
	.text
.LHOTB597:
	.p2align 4,,15
	.globl	decodeX86FrameInvocation
	.type	decodeX86FrameInvocation, @function
decodeX86FrameInvocation:
.LFB556:
	.loc 20 856 0
	.cfi_startproc
.LVL3683:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$92, %esp
	.cfi_def_cfa_offset 112
	.loc 20 856 0
	movl	120(%esp), %eax
	movl	128(%esp), %ebp
	movl	116(%esp), %edx
	movl	124(%esp), %edi
.LVL3684:
	movl	%eax, 24(%esp)
	.loc 20 857 0
	movl	112(%esp), %eax
	.loc 20 856 0
	movl	144(%esp), %ecx
	movl	%ebp, 12(%esp)
	movl	132(%esp), %esi
.LVL3685:
	.loc 20 857 0
	subl	$35, %eax
	cmpl	$4, %eax
	ja	.L3262
	movl	%edi, %ebx
	jmp	*.L3264(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L3264:
	.long	.L3263
	.long	.L3265
	.long	.L3266
	.long	.L3267
	.long	.L3268
	.text
	.p2align 4,,10
	.p2align 3
.L3267:
	.loc 20 1174 0
	pushl	%ecx
	.cfi_def_cfa_offset 116
	pushl	144(%esp)
	.cfi_def_cfa_offset 120
	pushl	144(%esp)
	.cfi_def_cfa_offset 124
	pushl	144(%esp)
	.cfi_def_cfa_offset 128
	pushl	%ebp
	.cfi_def_cfa_offset 132
	pushl	%edi
	.cfi_def_cfa_offset 136
	pushl	48(%esp)
	.cfi_def_cfa_offset 140
	pushl	%edx
	.cfi_def_cfa_offset 144
	call	decodeX86IOMapInvocation
.LVL3686:
	addl	$32, %esp
	.cfi_def_cfa_offset 112
	movl	%eax, %esi
.LVL3687:
.L3356:
	.loc 20 1196 0
	addl	$92, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%esi, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3688:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL3689:
	ret
.LVL3690:
	.p2align 4,,10
	.p2align 3
.L3268:
	.cfi_restore_state
	.loc 20 1187 0
	subl	$8, %esp
	.cfi_def_cfa_offset 120
	pushl	$2
	.cfi_def_cfa_offset 124
	pushl	ksCurThread
	.cfi_def_cfa_offset 128
	call	setThreadState
.LVL3691:
.LBB12226:
.LBB12227:
	.loc 11 2996 0
	movl	%edi, %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 112
.LVL3692:
	andl	$15, %eax
	cmpl	$1, %eax
	jne	.L3386
.LVL3693:
.LBE12227:
.LBE12226:
.LBB12229:
.LBB12230:
	.loc 20 31 0
	movl	ksCurThread, %eax
.LVL3694:
.LBB12231:
.LBB12232:
	.loc 15 30 0
	andl	$16777200, %ebx
.LBE12232:
.LBE12231:
.LBE12230:
.LBE12229:
	.loc 20 1188 0
	xorl	%esi, %esi
.LVL3695:
.LBB12238:
.LBB12237:
.LBB12234:
.LBB12233:
	.loc 15 30 0
	sall	$8, %ebx
	addl	$536870912, %ebx
	movl	%ebx, 532(%eax)
.LVL3696:
.LBE12233:
.LBE12234:
.LBB12235:
.LBB12236:
	movl	$1, 528(%eax)
.LVL3697:
.LBE12236:
.LBE12235:
.LBE12237:
.LBE12238:
	.loc 20 1196 0
	addl	$92, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
.LVL3698:
	movl	%esi, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3699:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3700:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL3701:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL3702:
	ret
.LVL3703:
	.p2align 4,,10
	.p2align 3
.L3265:
	.cfi_restore_state
.LBB12239:
.LBB12240:
.LBB12241:
	.loc 11 2891 0
	movl	%edi, %eax
	andl	$15, %eax
	cmpl	$1, %eax
	jne	.L3387
.LVL3704:
.LBE12241:
.LBE12240:
	.loc 20 1028 0
	movl	%edi, %eax
	andl	$1610612736, %eax
	cmpl	$536870912, %eax
	jne	.L3388
	.loc 20 1035 0 discriminator 1
	testl	%esi, %esi
	je	.L3352
	cmpl	$1, %edx
	jbe	.L3352
.LVL3705:
.LBB12243:
.LBB12244:
	.loc 56 31 0
	movl	ksCurThread, %ebp
.LVL3706:
.LBE12244:
.LBE12243:
	.loc 20 1046 0
	subl	$8, %esp
	.cfi_def_cfa_offset 120
	.loc 20 1044 0
	movl	4(%esi), %edi
.LVL3707:
	movl	(%esi), %esi
.LVL3708:
.LBB12248:
.LBB12247:
.LBB12245:
.LBB12246:
	.loc 15 36 0
	movl	532(%ebp), %eax
	movl	%eax, 24(%esp)
.LVL3709:
.LBE12246:
.LBE12245:
.LBE12247:
.LBE12248:
.LBB12249:
.LBB12250:
.LBB12251:
.LBB12252:
	movl	536(%ebp), %eax
	movl	%eax, 32(%esp)
.LVL3710:
.LBE12252:
.LBE12251:
.LBE12250:
.LBE12249:
	.loc 20 1046 0
	pushl	%edi
	.cfi_def_cfa_offset 124
.LVL3711:
	pushl	%esi
	.cfi_def_cfa_offset 128
.LVL3712:
	call	isValidNativeRoot
.LVL3713:
	addl	$16, %esp
	.cfi_def_cfa_offset 112
.LVL3714:
	testl	%eax, %eax
	je	.L3389
	.loc 20 1053 0
	movl	%edi, %edx
	movl	%esi, %eax
	call	cap_get_capPtr
.LVL3715:
	movl	%edi, %edx
.LBB12253:
.LBB12254:
.LBB12255:
.LBB12256:
	.loc 11 2202 0
	movl	%esi, %edi
.LVL3716:
.LBE12256:
.LBE12255:
.LBE12254:
.LBE12253:
	.loc 20 1053 0
	movl	%eax, 28(%esp)
.LVL3717:
.LBB12263:
.LBB12261:
.LBB12258:
.LBB12257:
	.loc 11 2202 0
	andl	$14, %edi
	movl	%esi, %eax
.LVL3718:
	.loc 11 2203 0
	andl	$15, %esi
	movzbl	%al, %eax
	cmpl	$14, %edi
	cmovne	%esi, %eax
.LBE12257:
.LBE12258:
	.loc 46 105 0
	cmpl	$5, %eax
	jne	.L3369
.LVL3719:
.LBB12259:
.LBB12260:
	.loc 11 3186 0
	cmpl	$5, %esi
	jne	.L3317
.LVL3720:
.LBE12260:
.LBE12259:
.LBE12261:
.LBE12263:
.LBB12264:
.LBB12265:
	.loc 46 75 0
	movl	12(%esp), %eax
	movl	%ebx, %esi
.LBE12265:
.LBE12264:
	.loc 20 1056 0
	andl	$16380, %edx
.LBB12268:
.LBB12266:
	.loc 46 75 0
	andl	$201326592, %esi
.LBE12266:
.LBE12268:
	.loc 20 1056 0
	shrl	$2, %edx
.LBB12269:
.LBB12267:
	.loc 46 75 0
	shrl	$16, %esi
	andl	$1072693248, %eax
	shrl	$20, %eax
	addl	%esi, %eax
.LVL3721:
.LBE12267:
.LBE12269:
	.loc 20 1056 0
	cmpl	%edx, %eax
	je	.L3390
	.loc 20 1057 0
	leal	668(%ebp), %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 116
.LVL3722:
	pushl	556(%ebp)
	.cfi_def_cfa_offset 120
	pushl	%eax
	.cfi_def_cfa_offset 124
	pushl	%ebp
	.cfi_def_cfa_offset 128
	pushl	$1057
	.cfi_def_cfa_offset 132
	pushl	$__func__.7178
	.cfi_def_cfa_offset 136
	pushl	$0
	.cfi_def_cfa_offset 140
	pushl	$.LC111
	.cfi_def_cfa_offset 144
	call	kprintf
.LVL3723:
	addl	$20, %esp
	.cfi_def_cfa_offset 124
	pushl	$.LC594
	.cfi_def_cfa_offset 128
.LVL3724:
.L3374:
	call	kprintf
.LVL3725:
	.loc 20 1061 0
	movl	$3, %esi
	.loc 20 1057 0
	movl	$.LC113, (%esp)
.LVL3726:
	call	kprintf
.LVL3727:
	.loc 20 1061 0
	addl	$16, %esp
	.cfi_def_cfa_offset 112
	.loc 20 1058 0
	movl	$2, current_syscall_error+24
	.loc 20 1059 0
	movl	$0, current_syscall_error+4
	.loc 20 1061 0
	jmp	.L3356
.LVL3728:
	.p2align 4,,10
	.p2align 3
.L3266:
.LBE12239:
.LBB12322:
.LBB12323:
.LBB12324:
.LBB12325:
	.loc 11 2944 0
	movl	%edi, %eax
	andl	$15, %eax
	cmpl	$1, %eax
	jne	.L3391
.LVL3729:
.LBE12325:
.LBE12324:
	.loc 46 75 0
	movl	%edi, %esi
.LVL3730:
	andl	$201326592, %esi
	movl	%esi, %edx
	movl	12(%esp), %esi
	shrl	$16, %edx
	andl	$1072693248, %esi
	movl	%esi, %eax
	shrl	$20, %eax
.LBE12323:
.LBE12322:
	.loc 20 1148 0
	addl	%eax, %edx
	movl	%edx, %esi
	je	.L3356
	.loc 20 1149 0
	movl	%edi, %eax
	andl	$1610612736, %eax
	shrl	$29, %eax
	cmpl	$1, %eax
	je	.L3333
	jb	.L3334
	cmpl	$2, %eax
	jne	.L3392
	.loc 20 1155 0
	subl	$8, %esp
	.cfi_def_cfa_offset 120
.LVL3731:
	pushl	$2
	.cfi_def_cfa_offset 124
.LVL3732:
	pushl	ksCurThread
	.cfi_def_cfa_offset 128
.LVL3733:
	call	setThreadState
.LVL3734:
	.loc 20 1156 0
	movl	40(%esp), %eax
	movl	%edi, 128(%esp)
	movl	%ebp, 132(%esp)
	movl	%eax, 136(%esp)
	.loc 20 1196 0
	addl	$108, %esp
	.cfi_def_cfa_offset 20
.LVL3735:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL3736:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL3737:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL3738:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL3739:
	.loc 20 1156 0
	jmp	performX86IOUnMapInvocation
.LVL3740:
	.p2align 4,,10
	.p2align 3
.L3263:
	.cfi_def_cfa_offset 112
	.cfi_offset 3, -20
	.cfi_offset 5, -8
	.cfi_offset 6, -16
	.cfi_offset 7, -12
.LBB12327:
	.loc 20 871 0 discriminator 1
	cmpl	$2, %edx
	jbe	.L3351
	testl	%esi, %esi
	je	.L3351
.LVL3741:
.LBB12328:
.LBB12329:
	.loc 11 2812 0
	movl	%edi, %eax
	andl	$15, %eax
	cmpl	$1, %eax
	jne	.L3393
.LVL3742:
.LBE12329:
.LBE12328:
.LBB12333:
.LBB12334:
	.loc 56 31 0
	movl	ksCurThread, %eax
	movl	%eax, %edx
	movl	%eax, 28(%esp)
.LVL3743:
.LBB12335:
.LBB12336:
	.loc 15 36 0
	movl	532(%eax), %eax
.LVL3744:
	movl	%eax, 32(%esp)
.LVL3745:
.LBE12336:
.LBE12335:
.LBE12334:
.LBE12333:
.LBB12337:
.LBB12338:
.LBB12339:
.LBB12340:
	movl	536(%edx), %eax
	movl	%eax, 40(%esp)
.LVL3746:
.LBE12340:
.LBE12339:
.LBE12338:
.LBE12337:
.LBB12341:
.LBB12342:
	.loc 56 34 0
	testl	%ecx, %ecx
	je	.L3394
	.loc 56 35 0
	movl	12(%ecx), %eax
.LBE12342:
.LBE12341:
	.loc 20 885 0
	movl	12(%esp), %ecx
.LVL3747:
	.loc 20 881 0
	movl	4(%esi), %edx
.LVL3748:
.LBB12345:
.LBB12343:
	.loc 56 35 0
	movl	%eax, 36(%esp)
.LVL3749:
.LBE12343:
.LBE12345:
	.loc 20 881 0
	movl	(%esi), %eax
.LVL3750:
	.loc 20 885 0
	andl	$1072693248, %ecx
	shrl	$20, %ecx
	.loc 20 881 0
	movl	%edx, 20(%esp)
.LVL3751:
	movl	%eax, 16(%esp)
	.loc 20 885 0
	movl	%edi, %eax
.LVL3752:
	andl	$201326592, %eax
	shrl	$16, %eax
	addl	%ecx, %eax
	jne	.L3395
	.loc 20 893 0
	testl	$1610612736, %edi
	jne	.L3396
	.loc 20 895 0
	subl	$8, %esp
	.cfi_def_cfa_offset 120
.LVL3753:
	pushl	28(%esp)
	.cfi_def_cfa_offset 124
.LVL3754:
	pushl	28(%esp)
	.cfi_def_cfa_offset 128
	call	isValidNativeRoot
.LVL3755:
	addl	$16, %esp
	.cfi_def_cfa_offset 112
	testl	%eax, %eax
	je	.L3397
	.loc 20 902 0
	movl	20(%esp), %edx
	movl	16(%esp), %eax
	call	cap_get_capPtr
.LVL3756:
	movl	16(%esp), %edx
	movl	20(%esp), %ecx
	movl	%eax, 28(%esp)
.LVL3757:
	movl	%edx, %eax
.LVL3758:
.LBB12346:
.LBB12347:
.LBB12348:
.LBB12349:
	.loc 11 2202 0
	andl	$14, %edx
	movl	%ecx, %esi
.LVL3759:
	.loc 11 2203 0
	movl	%eax, %ecx
	movzbl	%al, %eax
	andl	$15, %ecx
	cmpl	$14, %edx
	cmovne	%ecx, %eax
.LBE12349:
.LBE12348:
	.loc 46 105 0
	cmpl	$5, %eax
	jne	.L3369
.LVL3760:
.LBB12350:
.LBB12351:
	.loc 11 3186 0
	cmpl	$5, %ecx
	jne	.L3317
.LBE12351:
.LBE12350:
.LBE12347:
.LBE12346:
.LBB12361:
	.loc 20 908 0
	leal	72(%esp), %eax
.LBE12361:
.LBB12362:
.LBB12358:
.LBB12355:
.LBB12352:
	.loc 11 3189 0
	andl	$16380, %esi
.LBE12352:
.LBE12355:
.LBE12358:
.LBE12362:
.LBB12363:
	.loc 20 908 0
	subl	$8, %esp
	.cfi_def_cfa_offset 120
.LVL3761:
.LBE12363:
.LBB12364:
.LBB12359:
.LBB12356:
.LBB12353:
	.loc 11 3189 0
	shrl	$2, %esi
	movl	%esi, 24(%esp)
.LBE12353:
.LBE12356:
.LBE12359:
.LBE12364:
.LBB12365:
	.loc 20 908 0
	pushl	%esi
	.cfi_def_cfa_offset 124
	pushl	%eax
	.cfi_def_cfa_offset 128
	call	findVSpaceForASID
	.cfi_def_cfa_offset 124
.LVL3762:
	movl	88(%esp), %eax
.LVL3763:
	.loc 20 909 0
	addl	$12, %esp
	.cfi_def_cfa_offset 112
	movl	72(%esp), %edx
	testl	%edx, %edx
	jne	.L3383
	.loc 20 916 0
	cmpl	%eax, 28(%esp)
	je	.L3398
.LVL3764:
.L3382:
.LBE12365:
.LBE12327:
.LBB12433:
.LBB12270:
	.loc 20 1076 0
	movl	$2, current_syscall_error+24
	.loc 20 1077 0
	movl	$1, current_syscall_error+4
	.loc 20 1079 0
	jmp	.L3376
.LVL3765:
	.p2align 4,,10
	.p2align 3
.L3262:
.LBE12270:
.LBE12433:
	.loc 20 1192 0
	movl	$3, current_syscall_error+24
.LVL3766:
.L3376:
	.loc 20 1196 0
	addl	$92, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 20 1194 0
	movl	$3, %esi
	.loc 20 1196 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	movl	%esi, %eax
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL3767:
	ret
.LVL3768:
	.p2align 4,,10
	.p2align 3
.L3351:
	.cfi_restore_state
.LBB12434:
	.loc 20 872 0
	movl	$7, current_syscall_error+24
	.loc 20 874 0
	movl	$3, %esi
.LVL3769:
	jmp	.L3356
.LVL3770:
	.p2align 4,,10
	.p2align 3
.L3388:
.LBE12434:
.LBB12435:
	.loc 20 1029 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 116
	.loc 20 1032 0
	movl	$3, %esi
.LVL3771:
	.loc 20 1029 0
	pushl	556(%eax)
	.cfi_def_cfa_offset 120
.LVL3772:
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 124
.LVL3773:
	pushl	%eax
	.cfi_def_cfa_offset 128
.LVL3774:
	pushl	$1029
	.cfi_def_cfa_offset 132
.LVL3775:
	pushl	$__func__.7178
	.cfi_def_cfa_offset 136
.LVL3776:
	pushl	$0
	.cfi_def_cfa_offset 140
.LVL3777:
	pushl	$.LC111
	.cfi_def_cfa_offset 144
.LVL3778:
	call	kprintf
.LVL3779:
	addl	$20, %esp
	.cfi_def_cfa_offset 124
.LVL3780:
	pushl	$.LC591
	.cfi_def_cfa_offset 128
.LVL3781:
	call	kprintf
.LVL3782:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL3783:
	.loc 20 1032 0
	addl	$16, %esp
	.cfi_def_cfa_offset 112
.LVL3784:
	.loc 20 1030 0
	movl	$3, current_syscall_error+24
	.loc 20 1032 0
	jmp	.L3356
.LVL3785:
	.p2align 4,,10
	.p2align 3
.L3392:
.LBE12435:
	.loc 20 1169 0
	xorl	%esi, %esi
	jmp	.L3356
.LVL3786:
	.p2align 4,,10
	.p2align 3
.L3397:
.LBB12436:
	.loc 20 896 0
	subl	$4, %esp
	.cfi_def_cfa_offset 116
	movl	32(%esp), %ecx
	pushl	556(%ecx)
	.cfi_def_cfa_offset 120
	movl	%ecx, %eax
	addl	$668, %eax
	pushl	%eax
	.cfi_def_cfa_offset 124
	pushl	%ecx
	.cfi_def_cfa_offset 128
	pushl	$896
	.cfi_def_cfa_offset 132
	pushl	$__func__.7178
	.cfi_def_cfa_offset 136
	pushl	$0
	.cfi_def_cfa_offset 140
	pushl	$.LC111
	.cfi_def_cfa_offset 144
	call	kprintf
.LVL3787:
	addl	$20, %esp
	.cfi_def_cfa_offset 124
	pushl	$.LC589
	.cfi_def_cfa_offset 128
.LVL3788:
.L3375:
.LBE12436:
.LBB12437:
	.loc 20 1047 0
	call	kprintf
.LVL3789:
	.loc 20 1051 0
	movl	$3, %esi
.LVL3790:
	.loc 20 1047 0
	movl	$.LC113, (%esp)
.LVL3791:
	call	kprintf
.LVL3792:
	.loc 20 1051 0
	addl	$16, %esp
	.cfi_def_cfa_offset 112
	.loc 20 1048 0
	movl	$2, current_syscall_error+24
	.loc 20 1049 0
	movl	$1, current_syscall_error+4
	.loc 20 1051 0
	jmp	.L3356
.LVL3793:
	.p2align 4,,10
	.p2align 3
.L3389:
	.loc 20 1047 0
	leal	668(%ebp), %eax
	subl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 116
.LVL3794:
	pushl	556(%ebp)
	.cfi_def_cfa_offset 120
.LVL3795:
	pushl	%eax
	.cfi_def_cfa_offset 124
.LVL3796:
	pushl	%ebp
	.cfi_def_cfa_offset 128
.LVL3797:
	pushl	$1047
	.cfi_def_cfa_offset 132
.LVL3798:
	pushl	$__func__.7178
	.cfi_def_cfa_offset 136
.LVL3799:
	pushl	$0
	.cfi_def_cfa_offset 140
.LVL3800:
	pushl	$.LC111
	.cfi_def_cfa_offset 144
.LVL3801:
	call	kprintf
.LVL3802:
	addl	$20, %esp
	.cfi_def_cfa_offset 124
.LVL3803:
	pushl	$.LC593
	.cfi_def_cfa_offset 128
.LVL3804:
	jmp	.L3375
.LVL3805:
	.p2align 4,,10
	.p2align 3
.L3334:
	.cfi_restore_state
.LBE12437:
	.loc 20 1164 0
	pushl	$__func__.7178
	.cfi_remember_state
	.cfi_def_cfa_offset 116
.LVL3806:
	pushl	$1164
	.cfi_def_cfa_offset 120
.LVL3807:
	pushl	$.LC138
	.cfi_def_cfa_offset 124
.LVL3808:
	pushl	$.LC596
	.cfi_def_cfa_offset 128
.LVL3809:
	call	_fail
.LVL3810:
	.p2align 4,,10
	.p2align 3
.L3333:
	.cfi_restore_state
	.loc 20 1151 0
	subl	$8, %esp
	.cfi_def_cfa_offset 120
.LVL3811:
.LBB12438:
.LBB12439:
	.loc 20 834 0
	andl	$16777200, %ebx
.LBE12439:
.LBE12438:
	.loc 20 1151 0
	pushl	$2
	.cfi_def_cfa_offset 124
.LVL3812:
.LBB12456:
.LBB12452:
	.loc 20 834 0
	sall	$8, %ebx
.LBE12452:
.LBE12456:
	.loc 20 1151 0
	pushl	ksCurThread
	.cfi_def_cfa_offset 128
.LVL3813:
	call	setThreadState
.LVL3814:
.LBB12457:
.LBB12453:
	.loc 20 834 0
	pushl	%ebx
	.cfi_def_cfa_offset 132
.LVL3815:
	movl	32(%esp), %ebp
.LVL3816:
	movl	%ebp, %eax
	andl	$1073741824, %ebp
	sall	$12, %eax
	shrl	$30, %ebp
	pushl	%eax
	.cfi_def_cfa_offset 136
.LVL3817:
	pushl	%esi
	.cfi_def_cfa_offset 140
.LVL3818:
	pushl	%ebp
	.cfi_def_cfa_offset 144
.LVL3819:
	call	unmapPage
.LVL3820:
.LBB12440:
.LBB12441:
	.loc 11 2878 0
	movl	56(%esp), %eax
	addl	$32, %esp
	.cfi_def_cfa_offset 112
.LVL3821:
	movl	(%eax), %eax
.LVL3822:
	movl	%eax, %edx
	andl	$15, %edx
	cmpl	$1, %edx
	jne	.L3399
.LVL3823:
.LBE12441:
.LBE12440:
.LBB12443:
.LBB12444:
	.loc 46 95 0
	movl	24(%esp), %ecx
.LBE12444:
.LBE12443:
.LBB12446:
.LBB12447:
	.loc 11 2923 0
	andl	$-1811939329, %eax
.LVL3824:
.LBE12447:
.LBE12446:
.LBE12453:
.LBE12457:
	.loc 20 1152 0
	xorl	%esi, %esi
.LBB12458:
.LBB12454:
.LBB12449:
.LBB12445:
	.loc 46 95 0
	andl	$-1073741824, 4(%ecx)
.LVL3825:
.LBE12445:
.LBE12449:
.LBB12450:
.LBB12448:
	.loc 11 2923 0
	movl	%eax, (%ecx)
.LVL3826:
.LBE12448:
.LBE12450:
.LBE12454:
.LBE12458:
	.loc 20 1152 0
	jmp	.L3356
.LVL3827:
	.p2align 4,,10
	.p2align 3
.L3352:
.LBB12459:
	.loc 20 1036 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 116
	.loc 20 1039 0
	movl	$3, %esi
.LVL3828:
	.loc 20 1036 0
	pushl	556(%eax)
	.cfi_def_cfa_offset 120
.LVL3829:
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 124
.LVL3830:
	pushl	%eax
	.cfi_def_cfa_offset 128
.LVL3831:
	pushl	$1036
	.cfi_def_cfa_offset 132
.LVL3832:
	pushl	$__func__.7178
	.cfi_def_cfa_offset 136
.LVL3833:
	pushl	$0
	.cfi_def_cfa_offset 140
.LVL3834:
	pushl	$.LC111
	.cfi_def_cfa_offset 144
.LVL3835:
	call	kprintf
.LVL3836:
	addl	$20, %esp
	.cfi_def_cfa_offset 124
.LVL3837:
	pushl	$.LC592
	.cfi_def_cfa_offset 128
.LVL3838:
	call	kprintf
.LVL3839:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL3840:
	.loc 20 1039 0
	addl	$16, %esp
	.cfi_def_cfa_offset 112
.LVL3841:
	.loc 20 1037 0
	movl	$7, current_syscall_error+24
	.loc 20 1039 0
	jmp	.L3356
.LVL3842:
	.p2align 4,,10
	.p2align 3
.L3395:
.LBE12459:
.LBB12460:
	.loc 20 886 0
	subl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 116
.LVL3843:
	movl	32(%esp), %ecx
	pushl	556(%ecx)
	.cfi_def_cfa_offset 120
.LVL3844:
	movl	%ecx, %eax
	addl	$668, %eax
	pushl	%eax
	.cfi_def_cfa_offset 124
.LVL3845:
	pushl	%ecx
	.cfi_def_cfa_offset 128
.LVL3846:
	pushl	$886
	.cfi_def_cfa_offset 132
.LVL3847:
	pushl	$__func__.7178
	.cfi_def_cfa_offset 136
.LVL3848:
	pushl	$0
	.cfi_def_cfa_offset 140
.LVL3849:
	pushl	$.LC111
	.cfi_def_cfa_offset 144
.LVL3850:
	call	kprintf
.LVL3851:
	addl	$20, %esp
	.cfi_def_cfa_offset 124
.LVL3852:
	pushl	$.LC587
	.cfi_def_cfa_offset 128
.LVL3853:
	jmp	.L3374
.LVL3854:
	.p2align 4,,10
	.p2align 3
.L3383:
	.cfi_restore_state
.LBE12460:
.LBB12461:
.LBB12271:
	.loc 20 1069 0
	movl	$6, current_syscall_error+24
	.loc 20 1070 0
	movl	$0, current_syscall_error+20
	.loc 20 1072 0
	jmp	.L3376
.LVL3855:
	.p2align 4,,10
	.p2align 3
.L3390:
	.loc 20 1067 0
	leal	72(%esp), %edx
	subl	$8, %esp
	.cfi_def_cfa_offset 120
.LVL3856:
	pushl	%eax
	.cfi_def_cfa_offset 124
.LVL3857:
	pushl	%edx
	.cfi_def_cfa_offset 128
.LVL3858:
	call	findVSpaceForASID
	.cfi_def_cfa_offset 124
.LVL3859:
	.loc 20 1068 0
	movl	84(%esp), %esi
	.loc 20 1067 0
	movl	88(%esp), %eax
	.loc 20 1068 0
	addl	$12, %esp
	.cfi_def_cfa_offset 112
.LVL3860:
	testl	%esi, %esi
	jne	.L3383
	.loc 20 1075 0
	cmpl	%eax, 28(%esp)
	jne	.L3382
.LVL3861:
.LBE12271:
.LBB12272:
.LBB12273:
	.loc 11 2855 0
	movl	12(%esp), %ecx
.LBE12273:
.LBE12272:
.LBB12276:
.LBB12277:
	.loc 11 2973 0
	movl	%ebx, %edx
.LBE12277:
.LBE12276:
.LBB12280:
.LBB12281:
	.loc 58 29 0
	movl	%ebx, %edi
.LBE12281:
.LBE12280:
.LBB12284:
.LBB12278:
	.loc 11 2973 0
	andl	$50331648, %edx
.LBE12278:
.LBE12284:
.LBB12285:
.LBB12282:
	.loc 58 29 0
	andl	$16777200, %edi
	sall	$8, %edi
.LBE12282:
.LBE12285:
.LBB12286:
.LBB12279:
	.loc 11 2973 0
	shrl	$24, %edx
.LBE12279:
.LBE12286:
.LBB12287:
.LBB12283:
	.loc 58 29 0
	addl	$536870912, %edi
.LBE12283:
.LBE12287:
.LBB12288:
.LBB12274:
	.loc 11 2855 0
	movl	%ecx, %eax
.LBE12274:
.LBE12288:
.LBB12289:
.LBB12290:
	.loc 11 2815 0
	andl	$1073741824, %ecx
.LBE12290:
.LBE12289:
.LBB12292:
.LBB12275:
	.loc 11 2855 0
	sall	$12, %eax
.LVL3862:
.LBE12275:
.LBE12292:
.LBB12293:
.LBB12291:
	.loc 11 2815 0
	shrl	$30, %ecx
.LVL3863:
.LBE12291:
.LBE12293:
.LBB12294:
.LBB12295:
	.loc 20 674 0
	cmpl	$2, %edx
	je	.L3400
	.loc 20 684 0
	movl	$1, %ebx
	.loc 20 677 0
	cmpl	$3, %edx
	je	.L3401
.L3324:
.LBE12295:
.LBE12294:
	.loc 20 1090 0
	subl	$1, %ecx
	je	.L3326
.LBB12297:
	.loc 20 1096 0
	leal	56(%esp), %edx
	pushl	%ecx
	.cfi_def_cfa_offset 116
.LVL3864:
	pushl	%eax
	.cfi_def_cfa_offset 120
.LVL3865:
	pushl	36(%esp)
	.cfi_def_cfa_offset 124
.LVL3866:
	pushl	%edx
	.cfi_def_cfa_offset 128
.LVL3867:
	call	lookupPTSlot
	.cfi_def_cfa_offset 124
.LVL3868:
	.loc 20 1097 0
	movl	68(%esp), %esi
	.loc 20 1096 0
	movl	72(%esp), %ebp
.LVL3869:
	.loc 20 1097 0
	addl	$12, %esp
	.cfi_def_cfa_offset 112
.LVL3870:
	testl	%esi, %esi
	je	.L3327
.LVL3871:
.L3377:
	.loc 20 1098 0
	movl	$6, current_syscall_error+24
	.loc 20 1101 0
	movl	$3, %esi
	.loc 20 1099 0
	movl	$0, current_syscall_error+20
	.loc 20 1101 0
	jmp	.L3356
.LVL3872:
.L3398:
.LBE12297:
.LBE12461:
.LBB12462:
.LBB12366:
.LBB12330:
	.loc 11 2815 0
	movl	12(%esp), %eax
.LBE12330:
.LBE12366:
.LBB12367:
.LBB12368:
	.loc 59 59 0
	movl	$12, %ecx
.LBE12368:
.LBE12367:
.LBB12370:
.LBB12331:
	.loc 11 2815 0
	andl	$1073741824, %eax
.LBE12331:
.LBE12370:
.LBB12371:
.LBB12369:
	.loc 59 59 0
	shrl	$30, %eax
	movl	%eax, 44(%esp)
	movl	$22, %eax
	cmovne	%eax, %ecx
.LVL3873:
.LBE12369:
.LBE12371:
	.loc 20 926 0
	movl	$1, %eax
	sall	%cl, %eax
	addl	32(%esp), %eax
	cmpl	$-536870912, %eax
	ja	.L3402
.LBB12372:
.LBB12373:
	.loc 11 2973 0
	movl	%edi, %eax
	andl	$50331648, %eax
	shrl	$24, %eax
.LVL3874:
.LBE12373:
.LBE12372:
.LBB12374:
.LBB12375:
	.loc 20 674 0
	cmpl	$2, %eax
	je	.L3403
	.loc 20 684 0
	movl	$1, 12(%esp)
.LVL3875:
	.loc 20 677 0
	cmpl	$3, %eax
	je	.L3404
.L3291:
.LVL3876:
.LBE12375:
.LBE12374:
.LBB12378:
.LBB12379:
.LBB12380:
.LBB12381:
	.loc 59 59 0
	cmpl	$1, 44(%esp)
	movl	$22, %eax
	movl	$12, %ecx
.LVL3877:
	cmove	%eax, %ecx
.LVL3878:
.LBE12381:
.LBE12380:
	.file 72 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/kernel/vspace.h"
	.loc 72 139 0
	movl	$1, %eax
	sall	%cl, %eax
	movl	%eax, %esi
	subl	$1, %esi
.LBE12379:
.LBE12378:
	.loc 20 936 0
	andl	32(%esp), %esi
	je	.L3368
	.loc 20 937 0
	movl	$5, current_syscall_error+24
	.loc 20 939 0
	movl	$3, %esi
	jmp	.L3356
.LVL3879:
.L3402:
	.loc 20 927 0
	movl	ksCurThread, %eax
.LVL3880:
	pushl	%edi
	.cfi_def_cfa_offset 116
	.loc 20 931 0
	movl	$3, %esi
	.loc 20 927 0
	pushl	556(%eax)
	.cfi_def_cfa_offset 120
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 124
	pushl	%eax
	.cfi_def_cfa_offset 128
	pushl	$927
	.cfi_def_cfa_offset 132
	pushl	$__func__.7178
	.cfi_def_cfa_offset 136
	pushl	$0
	.cfi_def_cfa_offset 140
	pushl	$.LC111
	.cfi_def_cfa_offset 144
	call	kprintf
.LVL3881:
	addl	$20, %esp
	.cfi_def_cfa_offset 124
.LVL3882:
	pushl	$.LC590
	.cfi_def_cfa_offset 128
.LVL3883:
	call	kprintf
.LVL3884:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL3885:
	.loc 20 931 0
	addl	$16, %esp
	.cfi_def_cfa_offset 112
.LVL3886:
	.loc 20 928 0
	movl	$1, current_syscall_error+24
	.loc 20 929 0
	movl	$0, current_syscall_error
	.loc 20 931 0
	jmp	.L3356
.LVL3887:
.L3368:
	.loc 20 944 0
	subl	$12, %esp
	.cfi_def_cfa_offset 124
.LVL3888:
	movl	%edi, %edx
	movl	%ebp, %ecx
	pushl	28(%esp)
	.cfi_def_cfa_offset 128
.LVL3889:
.LBB12382:
.LBB12383:
	.loc 58 29 0
	andl	$16777200, %ebx
.LBE12383:
.LBE12382:
	.loc 20 944 0
	leal	80(%esp), %eax
.LBB12386:
.LBB12384:
	.loc 58 29 0
	sall	$8, %ebx
.LBE12384:
.LBE12386:
	.loc 20 944 0
	call	cap_frame_cap_set_capFMappedASID
.LVL3890:
	movl	80(%esp), %edi
.LBB12387:
.LBB12385:
	.loc 58 29 0
	addl	$536870912, %ebx
.LVL3891:
.LBE12385:
.LBE12387:
	.loc 20 944 0
	movl	84(%esp), %ebp
.LBB12388:
.LBB12389:
	.loc 11 2865 0
	addl	$16, %esp
	.cfi_def_cfa_offset 112
.LVL3892:
	movl	%edi, %ecx
.LBE12389:
.LBE12388:
	.loc 20 944 0
	movl	%edi, %eax
.LBB12395:
.LBB12390:
	.loc 11 2865 0
	andl	$15, %ecx
.LBE12390:
.LBE12395:
	.loc 20 944 0
	movl	%ebp, %edx
.LVL3893:
.LBB12396:
.LBB12391:
	.loc 11 2865 0
	subl	$1, %ecx
	jne	.L3405
.LVL3894:
	.loc 11 2871 0
	movl	32(%esp), %edi
.LVL3895:
	andl	$-1048576, %edx
.LBE12391:
.LBE12396:
.LBB12397:
.LBB12398:
	.loc 11 2910 0
	andl	$-1610612737, %eax
	orl	$536870912, %eax
	movl	%eax, 16(%esp)
.LBE12398:
.LBE12397:
.LBB12399:
.LBB12392:
	.loc 11 2871 0
	movl	%edi, %ecx
	shrl	$12, %ecx
	orl	%ecx, %edx
.LBE12392:
.LBE12399:
	.loc 20 948 0
	cmpl	$1, 44(%esp)
.LBB12400:
.LBB12393:
	.loc 11 2871 0
	movl	%edx, %ebp
.LVL3896:
.LBE12393:
.LBE12400:
	.loc 20 948 0
	jne	.L3406
.LVL3897:
.LBB12401:
.LBB12402:
.LBB12403:
	.loc 17 173 0
	movl	32(%esp), %eax
	movl	28(%esp), %ecx
	shrl	$22, %eax
	leal	(%ecx,%eax,4), %edi
.LVL3898:
.LBE12403:
.LBE12402:
.LBB12404:
.LBB12405:
	.loc 11 1937 0
	movl	(%edi), %eax
.LVL3899:
.LBE12405:
.LBE12404:
	.loc 20 988 0
	testb	$-128, %al
	je	.L3407
.LVL3900:
.LBB12406:
.LBB12407:
	.loc 11 2161 0
	testb	$-128, %al
	je	.L3408
.LVL3901:
.L3301:
.LBE12407:
.LBE12406:
	.loc 20 988 0
	testb	$1, %al
	je	.L3302
.LVL3902:
.L3380:
.LBE12401:
.LBE12462:
.LBB12463:
.LBB12298:
	.loc 20 1128 0
	movl	$8, current_syscall_error+24
	.loc 20 1130 0
	movl	$3, %esi
	jmp	.L3356
.LVL3903:
.L3403:
.LBE12298:
.LBE12463:
.LBB12464:
.LBB12424:
.LBB12376:
	.loc 20 674 0
	movl	40(%esp), %eax
	andl	$2, %eax
	shrl	%eax
	.loc 20 675 0
	cmpl	$1, %eax
	sbbl	%eax, %eax
	addl	$2, %eax
	movl	%eax, 12(%esp)
.LVL3904:
	jmp	.L3291
.LVL3905:
.L3326:
.LBE12376:
.LBE12424:
.LBE12464:
.LBB12465:
.LBB12317:
.LBB12299:
.LBB12300:
	.loc 17 173 0
	movl	28(%esp), %ecx
	shrl	$22, %eax
.LVL3906:
	leal	(%ecx,%eax,4), %ebp
.LVL3907:
.LBE12300:
.LBE12299:
.LBB12301:
.LBB12302:
	.loc 11 1937 0
	movl	0(%ebp), %eax
.LVL3908:
.LBE12302:
.LBE12301:
	.loc 20 1126 0
	testb	$-128, %al
	jne	.L3329
.LVL3909:
.LBB12303:
.LBB12304:
	.loc 11 2028 0
	jne	.L3330
.LVL3910:
.LBE12304:
.LBE12303:
	.loc 20 1126 0
	testb	$1, %al
	jne	.L3380
.L3329:
	.loc 20 1133 0
	leal	48(%esp), %eax
	pushl	%ebx
	.cfi_def_cfa_offset 116
.LVL3911:
	pushl	28(%esp)
	.cfi_def_cfa_offset 120
.LVL3912:
	pushl	%edi
	.cfi_def_cfa_offset 124
.LVL3913:
	pushl	%eax
	.cfi_def_cfa_offset 128
.LVL3914:
	call	makeUserPDELargePage
	.cfi_def_cfa_offset 124
.LVL3915:
	movl	60(%esp), %ebx
.LVL3916:
.L3381:
	.loc 20 1135 0
	subl	$12, %esp
	.cfi_def_cfa_offset 136
	pushl	$2
	.cfi_def_cfa_offset 140
.LVL3917:
	pushl	ksCurThread
	.cfi_def_cfa_offset 144
	call	setThreadState
.LVL3918:
.LBB12305:
.LBB12306:
.LBB12307:
.LBB12308:
.LBB12309:
.LBB12310:
.LBB12311:
	.loc 50 45 0
	xorl	%eax, %eax
.LVL3919:
.LBE12311:
.LBE12310:
.LBE12309:
.LBE12308:
.LBE12307:
	.loc 20 825 0
	movl	%ebx, 0(%ebp)
.LVL3920:
.LBB12316:
.LBB12315:
.LBB12314:
.LBB12313:
.LBB12312:
	.loc 50 45 0
#APP
# 45 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine.h" 1
	invlpg (%eax)
# 0 "" 2
.LVL3921:
#NO_APP
.LBE12312:
.LBE12313:
.LBE12314:
.LBE12315:
.LBE12316:
.LBE12306:
.LBE12305:
	.loc 20 1136 0
	addl	$32, %esp
	.cfi_def_cfa_offset 112
.LVL3922:
	jmp	.L3356
.LVL3923:
.L3404:
.LBE12317:
.LBE12465:
.LBB12466:
.LBB12425:
.LBB12377:
	.loc 20 677 0
	movl	40(%esp), %eax
	testb	$2, %al
	je	.L3291
.LVL3924:
	.loc 20 678 0
	andl	$1, %eax
	.loc 20 675 0
	cmpl	$1, %eax
	sbbl	%eax, %eax
	addl	$3, %eax
	movl	%eax, 12(%esp)
	jmp	.L3291
.LVL3925:
.L3401:
.LBE12377:
.LBE12425:
.LBE12466:
.LBB12467:
.LBB12318:
.LBB12296:
	.loc 20 677 0
	movl	16(%esp), %edx
	testb	$2, %dl
	je	.L3324
.LVL3926:
	.loc 20 678 0
	andl	$1, %edx
	.loc 20 675 0
	cmpl	$1, %edx
	sbbl	%ebx, %ebx
	addl	$3, %ebx
	jmp	.L3324
.LVL3927:
.L3400:
	.loc 20 674 0
	movl	16(%esp), %edx
	andl	$2, %edx
	shrl	%edx
	.loc 20 675 0
	cmpl	$1, %edx
	sbbl	%ebx, %ebx
	addl	$2, %ebx
	jmp	.L3324
.LVL3928:
.L3406:
.LBE12296:
.LBE12318:
.LBE12467:
.LBB12468:
.LBB12426:
	.loc 20 954 0
	leal	56(%esp), %eax
	pushl	%esi
	.cfi_def_cfa_offset 116
.LVL3929:
	pushl	%edi
	.cfi_def_cfa_offset 120
	pushl	36(%esp)
	.cfi_def_cfa_offset 124
	pushl	%eax
	.cfi_def_cfa_offset 128
	call	lookupPTSlot
	.cfi_def_cfa_offset 124
.LVL3930:
	.loc 20 955 0
	movl	68(%esp), %esi
	.loc 20 954 0
	movl	72(%esp), %edi
.LVL3931:
	.loc 20 955 0
	addl	$12, %esp
	.cfi_def_cfa_offset 112
	testl	%esi, %esi
	jne	.L3377
	.loc 20 962 0
	testb	$1, (%edi)
	jne	.L3380
	.loc 20 967 0
	leal	52(%esp), %edx
	pushl	12(%esp)
	.cfi_def_cfa_offset 116
	pushl	40(%esp)
	.cfi_def_cfa_offset 120
	pushl	%ebx
	.cfi_def_cfa_offset 124
	pushl	%edx
	.cfi_def_cfa_offset 128
	call	makeUserPTE
	.cfi_def_cfa_offset 124
.LVL3932:
	movl	64(%esp), %ebx
.LVL3933:
.L3379:
.LBE12426:
.LBB12427:
	.loc 20 1004 0
	subl	$12, %esp
	.cfi_def_cfa_offset 136
	pushl	$2
	.cfi_def_cfa_offset 140
.LVL3934:
	pushl	ksCurThread
	.cfi_def_cfa_offset 144
	call	setThreadState
.LVL3935:
.LBB12409:
.LBB12410:
	.loc 20 806 0
	movl	56(%esp), %eax
	movl	48(%esp), %ecx
	movl	%ebp, 4(%eax)
	movl	%ecx, (%eax)
.LBB12411:
.LBB12412:
.LBB12413:
.LBB12414:
.LBB12415:
	.loc 50 45 0
	xorl	%eax, %eax
.LVL3936:
.LBE12415:
.LBE12414:
.LBE12413:
.LBE12412:
.LBE12411:
	.loc 20 807 0
	movl	%ebx, (%edi)
.LVL3937:
.LBB12420:
.LBB12419:
.LBB12418:
.LBB12417:
.LBB12416:
	.loc 50 45 0
#APP
# 45 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/32/mode/machine.h" 1
	invlpg (%eax)
# 0 "" 2
.LVL3938:
#NO_APP
.LBE12416:
.LBE12417:
.LBE12418:
.LBE12419:
.LBE12420:
.LBE12410:
.LBE12409:
	.loc 20 1005 0
	addl	$32, %esp
	.cfi_def_cfa_offset 112
	jmp	.L3356
.LVL3939:
.L3407:
.LBB12421:
.LBB12422:
	.loc 11 2028 0
	je	.L3301
.LVL3940:
.L3330:
	call	pde_pde_pt_ptr_get_present.part.178
.LVL3941:
.L3302:
.LBE12422:
.LBE12421:
	.loc 20 1003 0
	leal	48(%esp), %eax
	pushl	12(%esp)
	.cfi_remember_state
	.cfi_def_cfa_offset 116
.LVL3942:
	pushl	40(%esp)
	.cfi_def_cfa_offset 120
.LVL3943:
	pushl	%ebx
	.cfi_def_cfa_offset 124
.LVL3944:
	pushl	%eax
	.cfi_def_cfa_offset 128
.LVL3945:
	call	makeUserPDELargePage
	.cfi_def_cfa_offset 124
.LVL3946:
	movl	60(%esp), %ebx
	jmp	.L3379
.LVL3947:
.L3327:
	.cfi_restore_state
.LBE12427:
.LBE12468:
.LBB12469:
.LBB12319:
	.loc 20 1104 0
	leal	52(%esp), %eax
	pushl	%ebx
	.cfi_remember_state
	.cfi_def_cfa_offset 116
.LVL3948:
	pushl	28(%esp)
	.cfi_def_cfa_offset 120
.LVL3949:
	pushl	%edi
	.cfi_def_cfa_offset 124
.LVL3950:
	pushl	%eax
	.cfi_def_cfa_offset 128
.LVL3951:
	call	makeUserPTE
	.cfi_def_cfa_offset 124
.LVL3952:
	movl	64(%esp), %ebx
.LVL3953:
	jmp	.L3381
.LVL3954:
.L3386:
	.cfi_restore_state
.LBE12319:
.LBE12469:
.LBB12470:
.LBB12228:
	call	cap_frame_cap_get_capFBasePtr.isra.125.part.126
.LVL3955:
.L3391:
.LBE12228:
.LBE12470:
.LBB12471:
.LBB12326:
	call	cap_frame_cap_get_capFMappedASID.part.145
.LVL3956:
.L3387:
.LBE12326:
.LBE12471:
.LBB12472:
.LBB12320:
.LBB12242:
	call	cap_frame_cap_get_capFMapType.isra.158.part.159
.LVL3957:
.L3394:
.LBE12242:
.LBE12320:
.LBE12472:
.LBB12473:
.LBB12428:
.LBB12344:
	call	getSyscallArg.part.152
.LVL3958:
.L3399:
.LBE12344:
.LBE12428:
.LBE12473:
.LBB12474:
.LBB12455:
.LBB12451:
.LBB12442:
	.loc 11 2878 0
	pushl	$__FUNCTION__.2495
	.cfi_remember_state
	.cfi_def_cfa_offset 116
.LVL3959:
	pushl	$2879
	.cfi_def_cfa_offset 120
.LVL3960:
	pushl	$.LC154
	.cfi_def_cfa_offset 124
.LVL3961:
	pushl	$.LC595
	.cfi_def_cfa_offset 128
.LVL3962:
	call	_assert_fail
.LVL3963:
.L3405:
	.cfi_restore_state
.LBE12442:
.LBE12451:
.LBE12455:
.LBE12474:
.LBB12475:
.LBB12429:
.LBB12394:
	call	cap_frame_cap_set_capFMappedAddress.part.182
.LVL3964:
.L3408:
.LBE12394:
.LBE12429:
.LBB12430:
.LBB12423:
.LBB12408:
	call	pde_pde_large_ptr_get_present.part.153
.LVL3965:
.L3393:
.LBE12408:
.LBE12423:
.LBE12430:
.LBB12431:
.LBB12332:
	call	cap_frame_cap_get_capFSize.part.160
.LVL3966:
.L3396:
.LBE12332:
.LBE12431:
	.loc 20 893 0 discriminator 1
	pushl	$__FUNCTION__.7179
	.cfi_remember_state
	.cfi_def_cfa_offset 116
.LVL3967:
	pushl	$893
	.cfi_def_cfa_offset 120
.LVL3968:
	pushl	$.LC138
	.cfi_def_cfa_offset 124
.LVL3969:
	pushl	$.LC588
	.cfi_def_cfa_offset 128
.LVL3970:
	call	_assert_fail
.LVL3971:
.L3317:
	.cfi_restore_state
.LBB12432:
.LBB12360:
.LBB12357:
.LBB12354:
	call	cap_page_directory_cap_get_capPDMappedASID.part.139
.LVL3972:
.L3369:
.LBE12354:
.LBE12357:
.LBE12360:
.LBE12432:
.LBE12475:
.LBB12476:
.LBB12321:
.LBB12262:
	call	cap_get_capMappedASID.part.140
.LVL3973:
.LBE12262:
.LBE12321:
.LBE12476:
	.cfi_endproc
.LFE556:
	.size	decodeX86FrameInvocation, .-decodeX86FrameInvocation
	.section	.text.unlikely
.LCOLDE597:
	.text
.LHOTE597:
	.section	.rodata.str1.4
	.align 4
.LC598:
	.string	"Kernel init failing: not enough memory\n"
	.align 4
.LC599:
	.string	"alloc_region(): wasted 0x%lx bytes due to alignment, try to increase MAX_NUM_FREEMEM_REG\n"
	.section	.boot.text
.LCOLDB600:
.LHOTB600:
	.p2align 4,,15
	.globl	alloc_region
	.type	alloc_region, @function
alloc_region:
.LFB647:
	.loc 30 54 0
	.cfi_startproc
.LVL3974:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	.loc 30 75 0
	movl	$1, %eax
	.loc 30 70 0
	xorl	%ebp, %ebp
	.loc 30 54 0
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$60, %esp
	.cfi_def_cfa_offset 80
	.loc 30 54 0
	movl	80(%esp), %ecx
	.loc 30 59 0
	movl	$0, 36(%esp)
	.loc 30 57 0
	movl	$0, 16(%esp)
	movl	$0, 20(%esp)
	.loc 30 58 0
	movl	$0, 24(%esp)
	.loc 30 75 0
	sall	%cl, %eax
	.loc 30 58 0
	movl	$0, 28(%esp)
	.loc 30 75 0
	movl	%eax, 12(%esp)
	.loc 30 59 0
	movl	$0, 32(%esp)
	.loc 30 56 0
	movl	$0, 40(%esp)
	jmp	.L3414
.LVL3975:
	.p2align 4,,10
	.p2align 3
.L3431:
	.loc 30 75 0
	movl	12(%esp), %edi
	leal	(%eax,%edi), %edx
.LVL3976:
.L3411:
	.loc 30 81 0
	cmpl	%eax, 4(%esp)
	setbe	%cl
	cmpl	%eax, %edx
	seta	8(%esp)
	movl	%ecx, %edi
	movzbl	8(%esp), %ecx
	movl	%edi, %ebx
	testb	%bl, %cl
	je	.L3412
	cmpl	%edx, %esi
	jb	.L3412
	.loc 30 83 0
	movl	4(%esp), %ecx
	movl	%eax, %edi
	movl	%esi, %ebx
	subl	%edx, %ebx
	subl	%ecx, %edi
	cmpl	%ebx, %edi
	jb	.L3417
	movl	%eax, 8(%esp)
	movl	%ecx, %edi
	movl	%edx, 4(%esp)
.L3413:
.LVL3977:
	.loc 30 94 0
	movl	16(%esp), %ebx
	cmpl	%ebx, 20(%esp)
	je	.L3419
.LVL3978:
.LBB12477:
.LBB12478:
	.loc 30 49 0 discriminator 1
	movl	%esi, %ecx
.LBE12478:
.LBE12477:
.LBB12480:
.LBB12481:
	movl	28(%esp), %ebx
.LBE12481:
.LBE12480:
.LBB12483:
.LBB12479:
	subl	4(%esp), %ecx
.LBE12479:
.LBE12483:
.LBB12484:
.LBB12482:
	subl	24(%esp), %ebx
.LBE12482:
.LBE12484:
	.loc 30 94 0 discriminator 1
	cmpl	%ecx, %ebx
	ja	.L3419
.LVL3979:
	.loc 30 95 0
	je	.L3429
.LVL3980:
	.p2align 4,,10
	.p2align 3
.L3412:
	.loc 30 70 0 discriminator 2
	addl	$1, %ebp
.LVL3981:
	cmpl	$16, %ebp
	je	.L3430
.LVL3982:
.L3414:
	.loc 30 72 0
	movl	ndks_boot(,%ebp,8), %ebx
	movzbl	80(%esp), %ecx
	.loc 30 73 0
	movl	ndks_boot+4(,%ebp,8), %esi
	.loc 30 72 0
	leal	-1(%ebx), %eax
	movl	%ebx, 4(%esp)
	shrl	%cl, %eax
	addl	$1, %eax
	.loc 30 73 0
	movl	%esi, %edx
	.loc 30 72 0
	sall	%cl, %eax
	.loc 30 73 0
	shrl	%cl, %edx
	.loc 30 72 0
	movl	%eax, %edi
	.loc 30 73 0
	sall	%cl, %edx
	.loc 30 72 0
	subl	%ebx, %edi
	movl	%esi, %ebx
	subl	%edx, %ebx
	cmpl	%ebx, %edi
	jb	.L3431
.LVL3983:
	.loc 30 78 0
	movl	%edx, %eax
	subl	12(%esp), %eax
.LVL3984:
	jmp	.L3411
.LVL3985:
	.p2align 4,,10
	.p2align 3
.L3429:
	.loc 30 96 0
	movl	36(%esp), %ecx
	subl	32(%esp), %ecx
	movl	%ecx, 44(%esp)
	movl	8(%esp), %ecx
	subl	%edi, %ecx
	cmpl	%ecx, 44(%esp)
	jbe	.L3412
.LVL3986:
	.p2align 4,,10
	.p2align 3
.L3419:
	.loc 30 99 0
	movl	8(%esp), %ecx
	.loc 30 98 0
	movl	%esi, 28(%esp)
.LVL3987:
	movl	4(%esp), %esi
.LVL3988:
	movl	%ebp, 40(%esp)
.LVL3989:
	.loc 30 70 0
	addl	$1, %ebp
.LVL3990:
	.loc 30 99 0
	movl	%edi, 32(%esp)
.LVL3991:
	movl	%edx, 20(%esp)
.LVL3992:
	movl	%ecx, 36(%esp)
.LVL3993:
	.loc 30 98 0
	movl	%esi, 24(%esp)
.LVL3994:
	movl	%eax, 16(%esp)
.LVL3995:
	.loc 30 70 0
	cmpl	$16, %ebp
	jne	.L3414
.LVL3996:
	.p2align 4,,10
	.p2align 3
.L3430:
	.loc 30 104 0
	movl	16(%esp), %esi
	cmpl	%esi, 20(%esp)
	je	.L3432
	.loc 30 109 0
	movl	40(%esp), %eax
.LVL3997:
	.loc 30 111 0
	subl	$8, %esp
	.cfi_def_cfa_offset 88
	movl	44(%esp), %edx
.LVL3998:
	.loc 30 109 0
	movl	$0, ndks_boot(,%eax,8)
	movl	$0, ndks_boot+4(,%eax,8)
	.loc 30 111 0
	movl	40(%esp), %eax
	pushl	%edx
	.cfi_def_cfa_offset 92
.LVL3999:
	pushl	%eax
	.cfi_def_cfa_offset 96
	call	insert_region
.LVL4000:
	.loc 30 112 0
	movl	40(%esp), %eax
.LVL4001:
	movl	44(%esp), %edx
	popl	%ecx
	.cfi_def_cfa_offset 92
	popl	%ebx
	.cfi_def_cfa_offset 88
	pushl	%edx
	.cfi_def_cfa_offset 92
.LVL4002:
	pushl	%eax
	.cfi_def_cfa_offset 96
	call	insert_region
.LVL4003:
	addl	$16, %esp
	.cfi_def_cfa_offset 80
	movl	16(%esp), %ebx
	testl	%eax, %eax
	je	.L3433
.LVL4004:
	.loc 30 117 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL4005:
	ret
.LVL4006:
	.p2align 4,,10
	.p2align 3
.L3417:
	.cfi_restore_state
	movl	%esi, 8(%esp)
	movl	%edx, %edi
	movl	%eax, %esi
	jmp	.L3413
.LVL4007:
	.p2align 4,,10
	.p2align 3
.L3433:
	.loc 30 113 0
	subl	$8, %esp
	.cfi_def_cfa_offset 88
	movl	36(%esp), %eax
	subl	32(%esp), %eax
	pushl	%eax
	.cfi_def_cfa_offset 92
	pushl	$.LC599
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL4008:
	addl	$16, %esp
	.cfi_def_cfa_offset 80
.LVL4009:
	.loc 30 117 0
	movl	%ebx, %eax
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL4010:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL4011:
	ret
.LVL4012:
	.p2align 4,,10
	.p2align 3
.L3432:
	.cfi_restore_state
	.loc 30 105 0
	subl	$12, %esp
	.cfi_def_cfa_offset 92
	.loc 30 106 0
	xorl	%ebx, %ebx
	.loc 30 105 0
	pushl	$.LC598
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL4013:
	.loc 30 106 0
	addl	$16, %esp
	.cfi_def_cfa_offset 80
	.loc 30 117 0
	movl	%ebx, %eax
	addl	$60, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL4014:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL4015:
	ret
	.cfi_endproc
.LFE647:
	.size	alloc_region, .-alloc_region
.LCOLDE600:
.LHOTE600:
	.section	.rodata.str1.4
	.align 4
.LC601:
	.string	"Kernel init failed: ran out of cap slots\n"
	.section	.boot.text
.LCOLDB602:
.LHOTB602:
	.p2align 4,,15
	.globl	provide_cap
	.type	provide_cap, @function
provide_cap:
.LFB656:
	.loc 30 304 0
	.cfi_startproc
.LVL4016:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 30 305 0
	movl	ndks_boot+132, %eax
	.loc 30 304 0
	movl	16(%esp), %edx
	movl	20(%esp), %ebx
	.loc 30 305 0
	cmpl	ndks_boot+136, %eax
	jnb	.L3486
.LVL4017:
.LBB12523:
.LBB12524:
.LBB12525:
.LBB12526:
	.loc 11 2202 0
	movl	%edx, %ecx
	andl	$14, %ecx
	cmpl	$14, %ecx
	je	.L3437
	.loc 11 2203 0
	movl	%edx, %ecx
	andl	$15, %ecx
.LVL4018:
.LBE12526:
.LBE12525:
	.loc 54 387 0
	cmpl	$14, %ecx
	ja	.L3438
	jmp	*.L3440(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L3440:
	.long	.L3438
	.long	.L3438
	.long	.L3442
	.long	.L3438
	.long	.L3441
	.long	.L3438
	.long	.L3442
	.long	.L3438
	.long	.L3473
	.long	.L3438
	.long	.L3444
	.long	.L3438
	.long	.L3445
	.long	.L3438
	.long	.L3473
	.section	.boot.text
.LVL4019:
	.p2align 4,,10
	.p2align 3
.L3486:
.LBE12524:
.LBE12523:
	.loc 30 306 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC601
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL4020:
	.loc 30 307 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	.loc 30 312 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL4021:
	.p2align 4,,10
	.p2align 3
.L3437:
	.cfi_restore_state
.LBB12571:
.LBB12569:
.LBB12528:
.LBB12527:
	.loc 11 2204 0
	movzbl	%dl, %ecx
.LVL4022:
.LBE12527:
.LBE12528:
	.loc 54 387 0
	cmpl	$62, %ecx
	ja	.L3438
	jmp	*.L3447(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L3447:
	.long	.L3438
	.long	.L3438
	.long	.L3446
	.long	.L3438
	.long	.L3448
	.long	.L3438
	.long	.L3449
	.long	.L3438
	.long	.L3473
	.long	.L3438
	.long	.L3450
	.long	.L3438
	.long	.L3451
	.long	.L3438
	.long	.L3473
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3473
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3452
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3438
	.long	.L3473
	.section	.boot.text
	.p2align 4,,10
	.p2align 3
.L3442:
	.loc 54 395 0
	andl	$-16, %edx
.LVL4023:
.L3443:
.LBE12569:
.LBE12571:
	.loc 30 309 0
	sall	$4, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 20
.LVL4024:
	pushl	32(%esp)
	.cfi_def_cfa_offset 24
.LVL4025:
	addl	%eax, %edx
	pushl	32(%esp)
	.cfi_def_cfa_offset 28
.LVL4026:
	pushl	%edx
	.cfi_def_cfa_offset 32
.LVL4027:
	call	write_slot
.LVL4028:
	.loc 30 311 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.LVL4029:
	movl	$1, %eax
	.loc 30 310 0
	addl	$1, ndks_boot+132
	.loc 30 312 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
.LVL4030:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL4031:
	ret
.LVL4032:
	.p2align 4,,10
	.p2align 3
.L3473:
	.cfi_restore_state
.LBB12572:
.LBB12570:
.LBB12529:
.LBB12530:
	.loc 55 280 0
	xorl	%edx, %edx
.LVL4033:
	jmp	.L3443
.LVL4034:
	.p2align 4,,10
	.p2align 3
.L3444:
.LBE12530:
.LBE12529:
	.loc 54 398 0
	andl	$-32, %edx
.LVL4035:
	jmp	.L3443
.LVL4036:
	.p2align 4,,10
	.p2align 3
.L3445:
	.loc 54 401 0
	andl	$-1024, %edx
.LVL4037:
	jmp	.L3443
	.p2align 4,,10
	.p2align 3
.L3441:
.LVL4038:
	.loc 54 392 0
	andl	$-16, %ebx
.LVL4039:
	movl	%ebx, %edx
	jmp	.L3443
.LVL4040:
	.p2align 4,,10
	.p2align 3
.L3438:
.LBB12549:
.LBB12547:
	.loc 55 268 0
	cmpl	$31, %ecx
	ja	.L3457
	jmp	*.L3459(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L3459:
	.long	.L3457
	.long	.L3458
	.long	.L3457
	.long	.L3460
	.long	.L3457
	.long	.L3461
	.long	.L3457
	.long	.L3457
	.long	.L3457
	.long	.L3473
	.long	.L3457
	.long	.L3462
	.long	.L3457
	.long	.L3473
	.long	.L3457
	.long	.L3463
	.long	.L3457
	.long	.L3457
	.long	.L3457
	.long	.L3457
	.long	.L3457
	.long	.L3457
	.long	.L3457
	.long	.L3457
	.long	.L3457
	.long	.L3457
	.long	.L3457
	.long	.L3457
	.long	.L3457
	.long	.L3457
	.long	.L3457
	.long	.L3473
	.section	.boot.text
	.p2align 4,,10
	.p2align 3
.L3452:
.LVL4041:
.LBE12547:
.LBE12549:
.LBB12550:
.LBB12551:
.LBB12552:
.LBB12553:
.LBB12554:
.LBB12555:
	.loc 11 3437 0
	andl	$16128, %edx
.LVL4042:
	movl	%edx, %ecx
.LBE12555:
.LBE12554:
	.loc 54 103 0
	movl	$-32, %edx
.LBB12557:
.LBB12556:
	.loc 11 3437 0
	shrl	$8, %ecx
.LVL4043:
.LBE12556:
.LBE12557:
	.loc 54 103 0
	cmpl	$32, %ecx
	je	.L3469
	andl	$31, %ecx
	movl	$-1, %edx
	addl	$1, %ecx
	sall	%cl, %edx
.L3469:
.LVL4044:
.LBE12553:
.LBE12552:
.LBE12551:
.LBE12550:
	.loc 54 404 0
	andl	%ebx, %edx
	jmp	.L3443
.LVL4045:
	.p2align 4,,10
	.p2align 3
.L3451:
.LBB12558:
.LBB12559:
	.loc 11 2768 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$12, %ecx
	je	.L3445
	call	cap_thread_cap_get_capTCBPtr.isra.89.part.90
.LVL4046:
	.p2align 4,,10
	.p2align 3
.L3450:
.LBE12559:
.LBE12558:
.LBB12560:
.LBB12561:
	.loc 11 2738 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$10, %ecx
	je	.L3444
	call	cap_cnode_cap_get_capCNodePtr.isra.118.part.119
.LVL4047:
	.p2align 4,,10
	.p2align 3
.L3449:
.LBE12561:
.LBE12560:
.LBB12562:
.LBB12563:
	.loc 11 2576 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$6, %ecx
	je	.L3442
	call	cap_notification_cap_get_capNtfnPtr.isra.97.part.98
.LVL4048:
	.p2align 4,,10
	.p2align 3
.L3448:
.LBE12563:
.LBE12562:
.LBB12564:
.LBB12565:
	.loc 11 2358 0
	andl	$15, %edx
.LVL4049:
	cmpl	$4, %edx
	je	.L3441
	call	cap_endpoint_cap_get_capEPPtr.part.117
.LVL4050:
	.p2align 4,,10
	.p2align 3
.L3446:
.LBE12565:
.LBE12564:
.LBB12566:
.LBB12567:
	.loc 11 2320 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$2, %ecx
	je	.L3442
	call	cap_untyped_cap_get_capPtr.isra.115.part.116
.LVL4051:
	.p2align 4,,10
	.p2align 3
.L3462:
.LBE12567:
.LBE12566:
.LBB12568:
.LBB12548:
.LBB12531:
.LBB12532:
	.loc 11 3287 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$11, %ecx
	jne	.L3487
.LVL4052:
.L3468:
.LBE12532:
.LBE12531:
	.loc 55 294 0
	andl	$16777200, %edx
.LVL4053:
	sall	$8, %edx
	jmp	.L3443
.LVL4054:
	.p2align 4,,10
	.p2align 3
.L3463:
.LBB12534:
.LBB12535:
	.loc 11 3590 0
	cmpb	$15, %dl
	jne	.L3488
.LVL4055:
.LBE12535:
.LBE12534:
	.loc 55 287 0
	andl	$268435200, %edx
.LVL4056:
	sall	$4, %edx
	jmp	.L3443
.LVL4057:
	.p2align 4,,10
	.p2align 3
.L3461:
.LBB12537:
.LBB12538:
	.loc 11 3227 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$5, %ecx
	je	.L3468
	call	cap_page_directory_cap_get_capPDBasePtr.isra.129.part.130
.LVL4058:
	.p2align 4,,10
	.p2align 3
.L3458:
.LBE12538:
.LBE12537:
.LBB12539:
.LBB12540:
	.loc 11 2996 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$1, %ecx
	je	.L3468
	call	cap_frame_cap_get_capFBasePtr.isra.125.part.126
.LVL4059:
	.p2align 4,,10
	.p2align 3
.L3460:
.LBE12540:
.LBE12539:
.LBB12541:
.LBB12542:
	.loc 11 3123 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$3, %ecx
	je	.L3468
	call	cap_page_table_cap_get_capPTBasePtr.isra.127.part.128
.LVL4060:
	.p2align 4,,10
	.p2align 3
.L3457:
.LBE12542:
.LBE12541:
.LBB12543:
.LBB12544:
	.loc 46 134 0
	pushl	$__func__.3040
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$134
	.cfi_def_cfa_offset 24
	pushl	$.LC145
	.cfi_def_cfa_offset 28
	pushl	$.LC226
	.cfi_def_cfa_offset 32
	call	_fail
.LVL4061:
.L3488:
	.cfi_restore_state
.LBE12544:
.LBE12543:
.LBB12545:
.LBB12536:
	call	cap_io_page_table_cap_get_capIOPTBasePtr.isra.132.part.133
.LVL4062:
.L3487:
.LBE12536:
.LBE12545:
.LBB12546:
.LBB12533:
	call	cap_asid_pool_cap_get_capASIDPool.isra.134.part.135
.LVL4063:
.LBE12533:
.LBE12546:
.LBE12548:
.LBE12568:
.LBE12570:
.LBE12572:
	.cfi_endproc
.LFE656:
	.size	provide_cap, .-provide_cap
.LCOLDE602:
.LHOTE602:
.LCOLDB603:
.LHOTB603:
	.p2align 4,,15
	.globl	create_frames_of_region
	.type	create_frames_of_region, @function
create_frames_of_region:
.LFB657:
	.loc 30 322 0
	.cfi_startproc
.LVL4064:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	.loc 30 328 0
	movl	ndks_boot+132, %edx
	.loc 30 322 0
	movl	88(%esp), %eax
	.loc 30 330 0
	movl	84(%esp), %ebx
	.loc 30 322 0
	movl	92(%esp), %ebp
	.loc 30 328 0
	movl	%edx, 20(%esp)
.LVL4065:
	.loc 30 322 0
	movl	%eax, 12(%esp)
	.loc 30 330 0
	cmpl	%eax, %ebx
	jnb	.L3497
	.loc 30 332 0
	movl	$536870912, %eax
.LVL4066:
	subl	96(%esp), %eax
	movl	%eax, 16(%esp)
	jmp	.L3496
.LVL4067:
	.p2align 4,,10
	.p2align 3
.L3491:
.LBB12580:
.LBB12581:
.LBB12582:
.LBB12583:
.LBB12584:
	.loc 11 2791 0
	testl	$4095, %ebx
	jne	.L3500
.LVL4068:
.LBE12584:
.LBE12583:
.LBE12582:
.LBE12581:
.LBE12580:
	.loc 30 334 0
	movl	%ebx, %eax
	xorl	%edi, %edi
.LVL4069:
	andl	$-4096, %eax
	shrl	$8, %eax
	orl	$50331649, %eax
	movl	%eax, %esi
.L3492:
	.loc 30 336 0
	pushl	%edi
	.cfi_def_cfa_offset 68
.LVL4070:
	pushl	%esi
	.cfi_def_cfa_offset 72
	pushl	80(%esp)
	.cfi_def_cfa_offset 76
	pushl	80(%esp)
	.cfi_def_cfa_offset 80
	call	provide_cap
.LVL4071:
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	testl	%eax, %eax
	je	.L3501
	.loc 30 330 0 discriminator 2
	addl	$4096, %ebx
.LVL4072:
	cmpl	12(%esp), %ebx
	jnb	.L3502
.L3496:
	.loc 30 331 0
	testl	%ebp, %ebp
	je	.L3491
	.loc 30 332 0
	leal	24(%esp), %eax
	pushl	$1
	.cfi_def_cfa_offset 68
	pushl	$0
	.cfi_def_cfa_offset 72
	pushl	$1
	.cfi_def_cfa_offset 76
	movl	28(%esp), %edx
	leal	(%edx,%ebx), %ecx
	pushl	%ecx
	.cfi_def_cfa_offset 80
	pushl	%ebx
	.cfi_def_cfa_offset 84
	pushl	100(%esp)
	.cfi_def_cfa_offset 88
	pushl	100(%esp)
	.cfi_def_cfa_offset 92
	pushl	%eax
	.cfi_def_cfa_offset 96
	call	create_mapped_it_frame_cap
	.cfi_def_cfa_offset 92
.LVL4073:
	movl	52(%esp), %esi
.LVL4074:
	movl	56(%esp), %edi
	addl	$28, %esp
	.cfi_def_cfa_offset 64
	jmp	.L3492
.LVL4075:
	.p2align 4,,10
	.p2align 3
.L3501:
	.loc 30 337 0
	movl	64(%esp), %eax
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	$0, 8(%eax)
	.loc 30 347 0
	movl	64(%esp), %eax
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL4076:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL4077:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret	$4
.LVL4078:
	.p2align 4,,10
	.p2align 3
.L3502:
	.cfi_restore_state
	movl	ndks_boot+132, %eax
.L3490:
.LVL4079:
	.loc 30 344 0
	movl	64(%esp), %edi
.LVL4080:
	movl	20(%esp), %ecx
	movl	%eax, 4(%edi)
	.loc 30 347 0
	movl	64(%esp), %eax
	.loc 30 344 0
	movl	%ecx, (%edi)
	movl	$1, 8(%edi)
	.loc 30 347 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL4081:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret	$4
.LVL4082:
.L3497:
	.cfi_restore_state
	.loc 30 330 0
	movl	20(%esp), %eax
.LVL4083:
	jmp	.L3490
.LVL4084:
.L3500:
.LBB12589:
.LBB12588:
.LBB12587:
.LBB12586:
.LBB12585:
	.loc 11 2791 0
	pushl	$__FUNCTION__.2465
	.cfi_def_cfa_offset 68
	pushl	$2791
	.cfi_def_cfa_offset 72
	pushl	$.LC154
	.cfi_def_cfa_offset 76
	pushl	$.LC482
	.cfi_def_cfa_offset 80
	call	_assert_fail
.LVL4085:
.LBE12585:
.LBE12586:
.LBE12587:
.LBE12588:
.LBE12589:
	.cfi_endproc
.LFE657:
	.size	create_frames_of_region, .-create_frames_of_region
.LCOLDE603:
.LHOTE603:
	.section	.rodata.str1.4
	.align 4
.LC604:
	.string	"(capIsDevice & ~0x1u) == ((0 && (capIsDevice & (1u << 31))) ? 0x0 : 0)"
	.align 4
.LC605:
	.string	"(capPtr & ~0xfffffff0u) == ((0 && (capPtr & (1u << 31))) ? 0x0 : 0)"
	.align 4
.LC606:
	.string	"Kernel init: Too many untyped regions for boot info\n"
	.section	.boot.text
.LCOLDB607:
.LHOTB607:
	.p2align 4,,15
	.globl	create_untypeds_for_region
	.type	create_untypeds_for_region, @function
create_untypeds_for_region:
.LFB664:
	.loc 30 539 0
	.cfi_startproc
.LVL4086:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	$31, %ebp
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
.LBB12602:
.LBB12603:
.LBB12604:
.LBB12605:
	.loc 11 2244 0
	movl	56(%esp), %eax
	movl	60(%esp), %ebx
.LBE12605:
.LBE12604:
.LBE12603:
.LBE12602:
	.loc 30 539 0
	movl	64(%esp), %edi
.LVL4087:
.LBB12619:
.LBB12614:
.LBB12610:
.LBB12606:
	.loc 11 2244 0
	sall	$5, %eax
	movl	%eax, 12(%esp)
	.loc 11 2234 0
	movl	56(%esp), %eax
	movl	%ebx, %esi
	andl	$-2, %eax
	movl	%eax, 8(%esp)
.LBE12606:
.LBE12610:
.LBE12614:
.LBE12619:
	.loc 30 543 0
	cmpl	%ebx, %edi
	jne	.L3518
	jmp	.L3513
.LVL4088:
	.p2align 4,,10
	.p2align 3
.L3524:
	.loc 30 561 0
	cmpl	$3, %ebx
	ja	.L3507
.L3508:
	.loc 30 566 0
	movl	$1, %eax
	movl	%ebx, %ecx
	sall	%cl, %eax
	addl	%eax, %esi
.LVL4089:
	.loc 30 543 0
	cmpl	%esi, %edi
	je	.L3513
.LVL4090:
.L3518:
.LBB12620:
.LBB12621:
	.loc 65 105 0
	movl	%edi, %eax
.LBE12621:
.LBE12620:
	.loc 30 545 0
	movl	%ebp, %ebx
.LBB12623:
.LBB12622:
	.loc 65 105 0
	subl	%esi, %eax
.LVL4091:
	bsrl	%eax, %eax
.LVL4092:
	xorl	$31, %eax
.LVL4093:
.LBE12622:
.LBE12623:
	.loc 30 545 0
	subl	%eax, %ebx
.LVL4094:
	.loc 30 548 0
	testl	%esi, %esi
	je	.L3506
.LVL4095:
.LBB12624:
.LBB12625:
.LBB12626:
.LBB12627:
	.loc 65 119 0
	bsfl	%esi, %eax
.LVL4096:
	cmpl	%eax, %ebx
	cmova	%eax, %ebx
.LVL4097:
.L3506:
.LBE12627:
.LBE12626:
.LBE12625:
.LBE12624:
	.loc 30 557 0
	cmpl	$29, %ebx
	jbe	.L3524
	.loc 30 558 0
	movl	$29, %ebx
.LVL4098:
.L3507:
.LBB12628:
.LBB12615:
	.loc 30 511 0
	movl	ndks_boot+132, %eax
	subl	68(%esp), %eax
.LVL4099:
	.loc 30 512 0
	cmpl	$166, %eax
	jbe	.L3525
	.loc 30 520 0
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC606
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL4100:
.LBE12615:
.LBE12628:
	.loc 30 566 0
	movl	$1, %eax
	movl	%ebx, %ecx
.LBB12629:
.LBB12616:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.LBE12616:
.LBE12629:
	sall	%cl, %eax
	addl	%eax, %esi
.LVL4101:
	.loc 30 543 0
	cmpl	%esi, %edi
	jne	.L3518
.LVL4102:
.L3513:
	.loc 30 569 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 30 568 0
	movl	$1, %eax
	.loc 30 569 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL4103:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL4104:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL4105:
	.p2align 4,,10
	.p2align 3
.L3525:
	.cfi_restore_state
	movl	ndks_boot+128, %ecx
.LBB12630:
.LBB12617:
	.loc 30 513 0
	movzbl	56(%esp), %edx
	leal	(%ecx,%eax,8), %eax
.LVL4106:
	movb	%dl, 92(%eax)
.LBB12611:
.LBB12607:
	.loc 11 2234 0
	movl	8(%esp), %edx
.LBE12607:
.LBE12611:
	.loc 30 513 0
	leal	536870912(%esi), %ecx
	movl	%ecx, 85(%eax)
	.loc 30 516 0
	leal	-4(%ebx), %ecx
	.loc 30 513 0
	movb	$0, 89(%eax)
	movb	$0, 90(%eax)
	movb	%bl, 91(%eax)
	.loc 30 516 0
	movl	$1, %eax
	sall	%cl, %eax
.LVL4107:
.LBB12612:
.LBB12608:
	.loc 11 2234 0
	testl	%edx, %edx
	jne	.L3526
	.loc 11 2236 0
	testl	$15, %esi
	jne	.L3527
.LVL4108:
	.loc 11 2247 0
	movl	%esi, %ecx
	sall	$6, %eax
.LVL4109:
	andl	$-16, %ecx
	orl	$2, %ecx
.LVL4110:
	movl	%ecx, (%esp)
	movl	12(%esp), %ecx
.LVL4111:
	orl	%ebx, %ecx
	orl	%eax, %ecx
	movl	%ecx, 4(%esp)
.LVL4112:
.LBE12608:
.LBE12612:
	.loc 30 518 0
	pushl	4(%esp)
	.cfi_def_cfa_offset 52
	pushl	4(%esp)
	.cfi_def_cfa_offset 56
	pushl	60(%esp)
	.cfi_def_cfa_offset 60
	pushl	60(%esp)
	.cfi_def_cfa_offset 64
	call	provide_cap
.LVL4113:
.LBE12617:
.LBE12630:
	.loc 30 562 0
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	testl	%eax, %eax
	jne	.L3508
	.loc 30 569 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 30 563 0
	xorl	%eax, %eax
	.loc 30 569 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL4114:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL4115:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL4116:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL4117:
.L3527:
	.cfi_restore_state
.LBB12631:
.LBB12618:
.LBB12613:
.LBB12609:
	.loc 11 2236 0
	pushl	$__FUNCTION__.2256
	.cfi_remember_state
	.cfi_def_cfa_offset 52
	pushl	$2236
	.cfi_def_cfa_offset 56
	pushl	$.LC154
	.cfi_def_cfa_offset 60
	pushl	$.LC605
	.cfi_def_cfa_offset 64
	call	_assert_fail
.LVL4118:
.L3526:
	.cfi_restore_state
	.loc 11 2234 0
	pushl	$__FUNCTION__.2256
	.cfi_def_cfa_offset 52
	pushl	$2234
	.cfi_def_cfa_offset 56
	pushl	$.LC154
	.cfi_def_cfa_offset 60
	pushl	$.LC604
	.cfi_def_cfa_offset 64
	call	_assert_fail
.LVL4119:
.LBE12609:
.LBE12613:
.LBE12618:
.LBE12631:
	.cfi_endproc
.LFE664:
	.size	create_untypeds_for_region, .-create_untypeds_for_region
.LCOLDE607:
.LHOTE607:
.LCOLDB608:
.LHOTB608:
	.p2align 4,,15
	.globl	create_kernel_untypeds
	.type	create_kernel_untypeds, @function
create_kernel_untypeds:
.LFB665:
	.loc 30 573 0
	.cfi_startproc
.LVL4120:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	$ndks_boot, %ebp
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$20, %esp
	.cfi_def_cfa_offset 40
	.loc 30 573 0
	movl	40(%esp), %esi
	movl	44(%esp), %edi
	movl	56(%esp), %ebx
	.loc 30 578 0
	pushl	%ebx
	.cfi_def_cfa_offset 44
	pushl	56(%esp)
	.cfi_def_cfa_offset 48
	pushl	56(%esp)
	.cfi_def_cfa_offset 52
	pushl	$0
	.cfi_def_cfa_offset 56
	pushl	%edi
	.cfi_def_cfa_offset 60
	pushl	%esi
	.cfi_def_cfa_offset 64
	call	create_untypeds_for_region
.LVL4121:
	addl	$32, %esp
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	je	.L3531
	.p2align 4,,10
	.p2align 3
.L3535:
	.loc 30 584 0
	movl	0(%ebp), %eax
.LVL4122:
	.loc 30 586 0
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	.loc 30 585 0
	movl	$0, 0(%ebp)
	.loc 30 584 0
	movl	4(%ebp), %edx
	.loc 30 585 0
	movl	$0, 4(%ebp)
	.loc 30 586 0
	pushl	%ebx
	.cfi_def_cfa_offset 44
	pushl	%edx
	.cfi_def_cfa_offset 48
.LVL4123:
	pushl	%eax
	.cfi_def_cfa_offset 52
	pushl	$0
	.cfi_def_cfa_offset 56
	pushl	%edi
	.cfi_def_cfa_offset 60
	pushl	%esi
	.cfi_def_cfa_offset 64
	call	create_untypeds_for_region
.LVL4124:
	addl	$32, %esp
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	je	.L3531
.LVL4125:
	addl	$8, %ebp
	.loc 30 583 0 discriminator 2
	cmpl	$ndks_boot+128, %ebp
	jne	.L3535
	.loc 30 592 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	.loc 30 591 0
	movl	$1, %eax
	.loc 30 592 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL4126:
	.p2align 4,,10
	.p2align 3
.L3531:
	.cfi_restore_state
	addl	$12, %esp
	.cfi_def_cfa_offset 20
	.loc 30 579 0
	xorl	%eax, %eax
	.loc 30 592 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL4127:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL4128:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE665:
	.size	create_kernel_untypeds, .-create_kernel_untypeds
.LCOLDE608:
.LHOTE608:
	.section	.rodata.str1.1
.LC609:
	.string	"receive"
.LC610:
	.string	"send"
.LC611:
	.string	"code"
.LC612:
	.string	"data"
.LC613:
	.string	"null fault"
	.section	.rodata.str1.4
	.align 4
.LC614:
	.string	"cap fault in %s phase at address 0x%x"
	.align 4
.LC615:
	.string	"vm fault on %s at address 0x%x with status 0x%x"
	.section	.rodata.str1.1
.LC616:
	.string	"unknown syscall 0x%x"
.LC617:
	.string	"user exception 0x%x code 0x%x"
.LC618:
	.string	"unknown fault"
	.section	.text.unlikely
.LCOLDB619:
	.text
.LHOTB619:
	.p2align 4,,15
	.type	print_fault, @function
print_fault:
.LFB677:
	.loc 71 72 0
	.cfi_startproc
.LVL4129:
	.loc 71 73 0
	movl	%eax, %ecx
	.loc 71 72 0
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.loc 71 73 0
	andl	$7, %ecx
	.loc 71 72 0
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 71 73 0
	cmpl	$5, %ecx
	ja	.L3541
	jmp	*.L3543(,%ecx,4)
	.section	.rodata
	.align 4
	.align 4
.L3543:
	.long	.L3542
	.long	.L3544
	.long	.L3545
	.long	.L3546
	.long	.L3541
	.long	.L3547
	.text
	.p2align 4,,10
	.p2align 3
.L3545:
.LVL4130:
	.loc 71 89 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	$.LC616
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL4131:
	.loc 71 91 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	.loc 71 101 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL4132:
	.p2align 4,,10
	.p2align 3
.L3542:
	.cfi_restore_state
	.loc 71 75 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC613
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL4133:
	.loc 71 76 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	.loc 71 101 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL4134:
	.p2align 4,,10
	.p2align 3
.L3544:
	.cfi_restore_state
	.loc 71 78 0
	testl	%eax, %eax
	movl	$.LC610, %ecx
	movl	$.LC609, %eax
.LVL4135:
	cmovns	%ecx, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	pushl	%edx
	.cfi_def_cfa_offset 24
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	$.LC614
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL4136:
	.loc 71 81 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	.loc 71 101 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL4137:
	.p2align 4,,10
	.p2align 3
.L3546:
	.cfi_restore_state
	.loc 71 93 0
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	shrl	$3, %eax
.LVL4138:
	pushl	%eax
	.cfi_def_cfa_offset 24
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	$.LC617
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL4139:
	.loc 71 96 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	.loc 71 101 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL4140:
	.p2align 4,,10
	.p2align 3
.L3547:
	.cfi_restore_state
.LBB12632:
.LBB12633:
	.loc 11 1766 0
	movl	%eax, %ecx
.LBE12633:
.LBE12632:
	.loc 71 83 0
	movl	$.LC612, %ebx
.LBB12635:
.LBB12634:
	.loc 11 1766 0
	shrl	$27, %ecx
.LVL4141:
.LBE12634:
.LBE12635:
	.loc 71 83 0
	testl	$524288, %eax
	movl	$.LC611, %eax
.LVL4142:
	cmove	%ebx, %eax
	pushl	%ecx
	.cfi_def_cfa_offset 20
	pushl	%edx
	.cfi_def_cfa_offset 24
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	$.LC615
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL4143:
	.loc 71 87 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	.loc 71 101 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
.LVL4144:
	.p2align 4,,10
	.p2align 3
.L3541:
	.cfi_restore_state
	.loc 71 98 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC618
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL4145:
	.loc 71 99 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	.loc 71 101 0
	addl	$8, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE677:
	.size	print_fault, .-print_fault
	.section	.text.unlikely
.LCOLDE619:
	.text
.LHOTE619:
	.section	.rodata.str1.1
.LC620:
	.string	"Caught "
.LC621:
	.string	"\nwhile trying to handle:\n"
.LC622:
	.string	"\nin thread %p \"%s\" "
.LC623:
	.string	"at address %p\n"
.LC624:
	.string	"With stack:\n"
	.section	.text.unlikely
.LCOLDB625:
	.text
.LHOTB625:
	.p2align 4,,15
	.globl	handleDoubleFault
	.type	handleDoubleFault, @function
handleDoubleFault:
.LFB678:
	.loc 71 107 0
	.cfi_startproc
.LVL4146:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$28, %esp
	.cfi_def_cfa_offset 44
	.loc 71 109 0
	movl	current_fault, %esi
.LVL4147:
	.loc 71 107 0
	movl	52(%esp), %edx
	movl	48(%esp), %eax
.LVL4148:
	.loc 71 109 0
	movl	current_fault+4, %edi
	.loc 71 107 0
	movl	44(%esp), %ebx
	movl	%edx, 24(%esp)
	movl	%eax, 20(%esp)
	.loc 71 110 0
	pushl	$.LC620
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL4149:
	.loc 71 111 0
	movl	%edi, %edx
.LVL4150:
	movl	%esi, %eax
	call	print_fault
.LVL4151:
	.loc 71 112 0
	movl	$.LC621, (%esp)
	call	kprintf
.LVL4152:
	.loc 71 113 0
	movl	28(%esp), %edx
	movl	24(%esp), %eax
	call	print_fault
.LVL4153:
	.loc 71 116 0
	leal	668(%ebx), %eax
	addl	$12, %esp
	.cfi_def_cfa_offset 36
	pushl	%eax
	.cfi_def_cfa_offset 40
	pushl	%ebx
	.cfi_def_cfa_offset 44
	pushl	$.LC622
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL4154:
	.loc 71 119 0
	popl	%eax
	.cfi_def_cfa_offset 44
	popl	%edx
	.cfi_def_cfa_offset 40
	pushl	556(%ebx)
	.cfi_def_cfa_offset 44
	pushl	$.LC623
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL4155:
	.loc 71 120 0
	movl	$.LC624, (%esp)
	call	kprintf
.LVL4156:
	.loc 71 121 0
	movl	%ebx, (%esp)
	call	Arch_userStackTrace
.LVL4157:
	.loc 71 124 0
	movl	%ebx, 48(%esp)
	movl	$0, 52(%esp)
	.loc 71 125 0
	addl	$32, %esp
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL4158:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	.loc 71 124 0
	jmp	setThreadState
.LVL4159:
	.cfi_endproc
.LFE678:
	.size	handleDoubleFault, .-handleDoubleFault
	.section	.text.unlikely
.LCOLDE625:
	.text
.LHOTE625:
	.section	.text.unlikely
.LCOLDB626:
	.text
.LHOTB626:
	.p2align 4,,15
	.globl	handleFault
	.type	handleFault, @function
handleFault:
.LFB675:
	.loc 71 20 0
	.cfi_startproc
.LVL4160:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.loc 71 22 0
	movl	current_fault+4, %edi
.LVL4161:
	.loc 71 20 0
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	.loc 71 22 0
	movl	current_fault, %esi
	.loc 71 20 0
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 71 20 0
	movl	16(%esp), %ebx
	.loc 71 24 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	sendFaultIPC
.LVL4162:
	.loc 71 25 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	je	.L3556
	.loc 71 26 0
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	pushl	%edi
	.cfi_def_cfa_offset 24
.LVL4163:
	pushl	%esi
	.cfi_def_cfa_offset 28
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	handleDoubleFault
.LVL4164:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L3556:
	.loc 71 28 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL4165:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE675:
	.size	handleFault, .-handleFault
	.section	.text.unlikely
.LCOLDE626:
	.text
.LHOTE626:
	.section	.rodata.str1.4
	.align 4
.LC627:
	.string	"(code & ~0x1fffffffu) == ((0 && (code & (1u << 31))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB628:
	.text
.LHOTB628:
	.p2align 4,,15
	.globl	handleUserLevelFault
	.type	handleUserLevelFault, @function
handleUserLevelFault:
.LFB400:
	.file 73 "/home/axjllt/Desktop/ori_refos/kernel/src/api/syscall.c"
	.loc 73 204 0
	.cfi_startproc
.LVL4166:
	subl	$12, %esp
	.cfi_def_cfa_offset 16
.LVL4167:
	.loc 73 204 0
	movl	20(%esp), %eax
.LBB12642:
.LBB12643:
	.loc 11 1687 0
	testl	$-536870912, %eax
	jne	.L3565
.LVL4168:
.LBE12643:
.LBE12642:
	.loc 73 205 0
	leal	3(,%eax,8), %eax
	.loc 73 206 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	.loc 73 205 0
	movl	%eax, current_fault
	movl	28(%esp), %eax
	.loc 73 206 0
	pushl	ksCurThread
	.cfi_def_cfa_offset 32
	.loc 73 205 0
	movl	%eax, current_fault+4
	.loc 73 206 0
	call	handleFault
.LVL4169:
	.loc 73 208 0
	call	schedule
.LVL4170:
	.loc 73 209 0
	call	activateThread
.LVL4171:
	.loc 73 212 0
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
.LVL4172:
.L3565:
	.cfi_def_cfa_offset 16
.LBB12644:
.LBB12645:
.LBB12646:
	.loc 11 1687 0
	pushl	$__FUNCTION__.2026
	.cfi_def_cfa_offset 20
	pushl	$1687
	.cfi_def_cfa_offset 24
	pushl	$.LC154
	.cfi_def_cfa_offset 28
	pushl	$.LC627
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL4173:
.LBE12646:
.LBE12645:
.LBE12644:
	.cfi_endproc
.LFE400:
	.size	handleUserLevelFault, .-handleUserLevelFault
	.section	.text.unlikely
.LCOLDE628:
	.text
.LHOTE628:
	.section	.text.unlikely
.LCOLDB629:
	.text
.LHOTB629:
	.p2align 4,,15
	.globl	handleVMFaultEvent
	.type	handleVMFaultEvent, @function
handleVMFaultEvent:
.LFB401:
	.loc 73 216 0
	.cfi_startproc
.LVL4174:
	subl	$20, %esp
	.cfi_def_cfa_offset 24
	.loc 73 219 0
	pushl	24(%esp)
	.cfi_def_cfa_offset 28
	pushl	ksCurThread
	.cfi_def_cfa_offset 32
	call	handleVMFault
.LVL4175:
	.loc 73 220 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	je	.L3567
	.loc 73 221 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	ksCurThread
	.cfi_def_cfa_offset 32
	call	handleFault
.LVL4176:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L3567:
	.loc 73 224 0
	call	schedule
.LVL4177:
	.loc 73 225 0
	call	activateThread
.LVL4178:
	.loc 73 228 0
	xorl	%eax, %eax
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE401:
	.size	handleVMFaultEvent, .-handleVMFaultEvent
	.section	.text.unlikely
.LCOLDE629:
	.text
.LHOTE629:
	.section	.rodata.str1.4
	.align 4
.LC630:
	.string	"CNode SaveCaller: Reply cap not present."
	.align 4
.LC631:
	.string	"caller capability must be null or reply"
	.section	.text.unlikely
.LCOLDB632:
	.text
.LHOTB632:
	.p2align 4,,15
	.globl	invokeCNodeSaveCaller
	.type	invokeCNodeSaveCaller, @function
invokeCNodeSaveCaller:
.LFB729:
	.loc 33 368 0
	.cfi_startproc
.LVL4179:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 33 372 0
	movl	ksCurThread, %ecx
	movl	%ecx, %eax
	andl	$-1024, %eax
	.loc 33 373 0
	movl	48(%eax), %edx
	.loc 33 372 0
	leal	48(%eax), %edi
	.loc 33 373 0
	movl	52(%eax), %ebp
.LVL4180:
	.loc 33 372 0
	movl	%edi, 12(%esp)
.LVL4181:
.LBB12647:
.LBB12648:
	.loc 11 2202 0
	movl	%edx, %esi
	.loc 11 2203 0
	movl	%edx, %ebx
	movzbl	%dl, %eax
	.loc 11 2202 0
	andl	$14, %esi
	.loc 11 2203 0
	andl	$15, %ebx
	cmpl	$14, %esi
	cmovne	%ebx, %eax
.LVL4182:
.LBE12648:
.LBE12647:
	.loc 33 375 0
	testl	%eax, %eax
	je	.L3576
	cmpl	$8, %eax
	jne	.L3583
.LVL4183:
.LBB12649:
.LBB12650:
	.loc 11 2636 0
	cmpl	$8, %ebx
	jne	.L3584
.LVL4184:
.LBE12650:
.LBE12649:
	.loc 33 381 0
	testb	$16, %dl
	je	.L3585
.LVL4185:
.L3578:
	.loc 33 392 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL4186:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL4187:
	ret
.LVL4188:
	.p2align 4,,10
	.p2align 3
.L3583:
	.cfi_restore_state
	.loc 33 387 0
	pushl	$__func__.8661
	.cfi_remember_state
	.cfi_def_cfa_offset 52
	pushl	$387
	.cfi_def_cfa_offset 56
	pushl	$.LC381
	.cfi_def_cfa_offset 60
	pushl	$.LC631
	.cfi_def_cfa_offset 64
	call	_fail
.LVL4189:
	.p2align 4,,10
	.p2align 3
.L3576:
	.cfi_restore_state
	.loc 33 377 0
	leal	668(%ecx), %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 52
	pushl	556(%ecx)
	.cfi_def_cfa_offset 56
	pushl	%eax
	.cfi_def_cfa_offset 60
	pushl	%ecx
	.cfi_def_cfa_offset 64
	pushl	$377
	.cfi_def_cfa_offset 68
	pushl	$__func__.8661
	.cfi_def_cfa_offset 72
	pushl	$0
	.cfi_def_cfa_offset 76
	pushl	$.LC111
	.cfi_def_cfa_offset 80
	call	kprintf
.LVL4190:
	addl	$20, %esp
	.cfi_def_cfa_offset 60
	pushl	$.LC630
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL4191:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL4192:
	.loc 33 378 0
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	.loc 33 392 0
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL4193:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL4194:
	.p2align 4,,10
	.p2align 3
.L3585:
	.cfi_restore_state
	.loc 33 382 0
	pushl	48(%esp)
	.cfi_def_cfa_offset 52
	pushl	16(%esp)
	.cfi_def_cfa_offset 56
.LVL4195:
	pushl	%ebp
	.cfi_def_cfa_offset 60
.LVL4196:
	pushl	%edx
	.cfi_def_cfa_offset 64
	call	cteMove
.LVL4197:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L3578
.LVL4198:
.L3584:
.LBB12652:
.LBB12651:
	call	cap_reply_cap_get_capReplyMaster.isra.92.part.93
.LVL4199:
.LBE12651:
.LBE12652:
	.cfi_endproc
.LFE729:
	.size	invokeCNodeSaveCaller, .-invokeCNodeSaveCaller
	.section	.text.unlikely
.LCOLDE632:
	.text
.LHOTE632:
	.section	.rodata.str1.4
	.align 4
.LC633:
	.string	"Domain Configure: Truncated message."
	.align 4
.LC634:
	.string	"Domain Configure: invalid domain (%lu >= %u)."
	.align 4
.LC635:
	.string	"Domain Configure: thread cap required."
	.section	.text.unlikely
.LCOLDB636:
	.text
.LHOTB636:
	.p2align 4,,15
	.globl	decodeDomainInvocation
	.type	decodeDomainInvocation, @function
decodeDomainInvocation:
.LFB823:
	.loc 31 1183 0
	.cfi_startproc
.LVL4200:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
.LVL4201:
	.loc 31 1187 0
	cmpl	$27, 16(%esp)
	jne	.L3598
	.loc 31 1192 0
	movl	20(%esp), %edx
	.loc 31 1193 0
	movl	ksCurThread, %eax
	.loc 31 1192 0
	testl	%edx, %edx
	je	.L3599
.LVL4202:
.LBB12653:
.LBB12654:
.LBB12655:
.LBB12656:
	.loc 15 36 0
	movl	532(%eax), %ebx
.LVL4203:
.LBE12656:
.LBE12655:
.LBE12654:
.LBE12653:
	.loc 31 1198 0
	testl	%ebx, %ebx
	jne	.L3600
	movl	24(%esp), %edx
	.loc 31 1207 0
	testl	%edx, %edx
	je	.L3601
	.loc 31 1213 0
	movl	(%edx), %esi
.LVL4204:
.LBB12657:
.LBB12658:
	.loc 11 2202 0
	movl	%esi, %ecx
	.loc 11 2203 0
	movl	%esi, %edi
	movl	%esi, %edx
	.loc 11 2202 0
	andl	$14, %ecx
	.loc 11 2203 0
	andl	$15, %edi
	movzbl	%dl, %edx
	cmpl	$14, %ecx
	cmovne	%edi, %edx
.LVL4205:
.LBE12658:
.LBE12657:
	.loc 31 1214 0
	cmpl	$12, %edx
	jne	.L3602
	.loc 31 1221 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	pushl	$2
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	setThreadState
.LVL4206:
.LBB12659:
.LBB12660:
	.loc 11 2768 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	cmpl	$12, %edi
	jne	.L3603
.LVL4207:
.LBE12660:
.LBE12659:
	.loc 31 1222 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	andl	$-16, %esi
.LVL4208:
	pushl	$0
	.cfi_def_cfa_offset 28
	pushl	%esi
	.cfi_def_cfa_offset 32
	call	setDomain
.LVL4209:
	.loc 31 1223 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L3588:
	.loc 31 1224 0
	movl	%ebx, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL4210:
	.p2align 4,,10
	.p2align 3
.L3600:
	.cfi_restore_state
	.loc 31 1199 0
	leal	668(%eax), %edx
.LVL4211:
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	pushl	556(%eax)
	.cfi_def_cfa_offset 24
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	pushl	$1200
	.cfi_def_cfa_offset 36
	pushl	$__func__.9485
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL4212:
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	pushl	$1
	.cfi_def_cfa_offset 24
	pushl	%ebx
	.cfi_def_cfa_offset 28
	.loc 31 1203 0
	movl	$3, %ebx
	.loc 31 1199 0
	pushl	$.LC634
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL4213:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL4214:
	.loc 31 1203 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	.loc 31 1224 0
	movl	%ebx, %eax
	.loc 31 1201 0
	movl	$1, current_syscall_error+24
	.loc 31 1202 0
	movl	$0, current_syscall_error
	.loc 31 1224 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L3598:
	.cfi_restore_state
	.loc 31 1188 0
	movl	$3, current_syscall_error+24
	.loc 31 1189 0
	movl	$3, %ebx
	.loc 31 1224 0
	movl	%ebx, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL4215:
	.p2align 4,,10
	.p2align 3
.L3599:
	.cfi_restore_state
	.loc 31 1193 0
	leal	668(%eax), %edx
.LVL4216:
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	pushl	556(%eax)
	.cfi_def_cfa_offset 24
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	pushl	$1193
	.cfi_def_cfa_offset 36
.L3597:
	.loc 31 1208 0
	pushl	$__func__.9485
	.cfi_def_cfa_offset 40
	.loc 31 1210 0
	movl	$3, %ebx
	.loc 31 1208 0
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL4217:
	addl	$20, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC633
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL4218:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL4219:
	.loc 31 1210 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	.loc 31 1224 0
	movl	%ebx, %eax
	.loc 31 1209 0
	movl	$7, current_syscall_error+24
	.loc 31 1224 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL4220:
	.p2align 4,,10
	.p2align 3
.L3601:
	.cfi_restore_state
	.loc 31 1208 0
	leal	668(%eax), %edx
.LVL4221:
	subl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	556(%eax)
	.cfi_def_cfa_offset 24
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	pushl	$1208
	.cfi_def_cfa_offset 36
	jmp	.L3597
.LVL4222:
	.p2align 4,,10
	.p2align 3
.L3602:
	.cfi_restore_state
	.loc 31 1215 0
	leal	668(%eax), %edx
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	.loc 31 1218 0
	movl	$3, %ebx
	.loc 31 1215 0
	pushl	556(%eax)
	.cfi_def_cfa_offset 24
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	pushl	$1215
	.cfi_def_cfa_offset 36
	pushl	$__func__.9485
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL4223:
	addl	$20, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC635
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL4224:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL4225:
	.loc 31 1218 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	.loc 31 1216 0
	movl	$1, current_syscall_error+24
	.loc 31 1217 0
	movl	$1, current_syscall_error
	.loc 31 1218 0
	jmp	.L3588
.LVL4226:
.L3603:
.LBB12662:
.LBB12661:
	call	cap_thread_cap_get_capTCBPtr.isra.89.part.90
.LVL4227:
.LBE12661:
.LBE12662:
	.cfi_endproc
.LFE823:
	.size	decodeDomainInvocation, .-decodeDomainInvocation
	.section	.text.unlikely
.LCOLDE636:
	.text
.LHOTE636:
	.section	.rodata.str1.4
	.align 4
.LC637:
	.string	"TCB BindNotification: Truncated message."
	.align 4
.LC638:
	.string	"TCB BindNotification: TCB already has a bound notification."
	.align 4
.LC639:
	.string	"TCB BindNotification: Notification is invalid."
	.align 4
.LC640:
	.string	"TCB BindNotification: Insufficient access rights"
	.align 4
.LC641:
	.string	"TCB BindNotification: Notification cannot be bound."
	.section	.text.unlikely
.LCOLDB642:
	.text
.LHOTB642:
	.p2align 4,,15
	.globl	decodeBindNotification
	.type	decodeBindNotification, @function
decodeBindNotification:
.LFB824:
	.loc 31 1228 0
	.cfi_startproc
.LVL4228:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	movl	40(%esp), %edx
	.loc 31 1228 0
	movl	32(%esp), %eax
.LVL4229:
	.loc 31 1233 0
	testl	%edx, %edx
	je	.L3621
.LVL4230:
.LBB12663:
.LBB12664:
	.loc 11 2768 0
	movl	%eax, %ecx
	andl	$15, %ecx
	cmpl	$12, %ecx
	jne	.L3622
.LVL4231:
.LBE12664:
.LBE12663:
	.loc 31 1239 0
	andl	$-16, %eax
	movl	%eax, %ebp
.LVL4232:
	.loc 31 1241 0
	movl	600(%eax), %eax
.LVL4233:
	testl	%eax, %eax
	je	.L3608
	.loc 31 1242 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	pushl	556(%eax)
	.cfi_def_cfa_offset 40
	leal	668(%eax), %edx
.LVL4234:
	pushl	%edx
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	pushl	$1242
	.cfi_def_cfa_offset 52
	pushl	$__func__.9493
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	$.LC111
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL4235:
	addl	$20, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC638
	.cfi_def_cfa_offset 48
.L3619:
	.loc 31 1265 0
	call	kprintf
.LVL4236:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL4237:
	.loc 31 1267 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
.LVL4238:
	.loc 31 1273 0
	movl	$3, %eax
	.loc 31 1266 0
	movl	$3, current_syscall_error+24
	.loc 31 1273 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL4239:
	ret
.LVL4240:
	.p2align 4,,10
	.p2align 3
.L3608:
	.cfi_restore_state
	.loc 31 1247 0
	movl	(%edx), %ecx
.LVL4241:
.LBB12666:
.LBB12667:
	.loc 11 2202 0
	movl	%ecx, %edi
	.loc 11 2203 0
	movl	%ecx, %esi
	movzbl	%cl, %ebx
	.loc 11 2202 0
	andl	$14, %edi
	.loc 11 2203 0
	andl	$15, %esi
	cmpl	$14, %edi
	cmovne	%esi, %ebx
.LVL4242:
.LBE12667:
.LBE12666:
	.loc 31 1249 0
	cmpl	$6, %ebx
	je	.L3623
	.loc 31 1252 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	pushl	556(%eax)
	.cfi_def_cfa_offset 40
.LVL4243:
	leal	668(%eax), %edx
.LVL4244:
	pushl	%edx
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	pushl	$1252
	.cfi_def_cfa_offset 52
	pushl	$__func__.9493
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	$.LC111
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL4245:
	addl	$20, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC639
	.cfi_def_cfa_offset 48
	jmp	.L3619
.LVL4246:
	.p2align 4,,10
	.p2align 3
.L3621:
	.cfi_restore_state
	.loc 31 1234 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	pushl	556(%eax)
	.cfi_def_cfa_offset 40
	leal	668(%eax), %edx
.LVL4247:
	pushl	%edx
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	pushl	$1234
	.cfi_def_cfa_offset 52
	pushl	$__func__.9493
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	$.LC111
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL4248:
	addl	$20, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC637
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL4249:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL4250:
	.loc 31 1236 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 31 1273 0
	movl	$3, %eax
	.loc 31 1235 0
	movl	$7, current_syscall_error+24
	.loc 31 1273 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL4251:
	.p2align 4,,10
	.p2align 3
.L3623:
	.cfi_restore_state
.LBB12668:
.LBB12669:
	.loc 11 2576 0
	cmpl	$6, %esi
	jne	.L3624
.LVL4252:
.LBE12669:
.LBE12668:
	.loc 31 1257 0
	testb	$2, 4(%edx)
	je	.L3625
	.loc 31 1250 0
	movl	%ecx, %ebx
	andl	$-16, %ebx
.LVL4253:
	.loc 31 1263 0
	testl	$-16, 4(%ebx)
	jne	.L3615
.LVL4254:
	.loc 31 1264 0
	testl	$-16, 12(%ebx)
	je	.L3616
.LVL4255:
.L3615:
	.loc 31 1265 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	pushl	556(%eax)
	.cfi_def_cfa_offset 40
.LVL4256:
	leal	668(%eax), %edx
.LVL4257:
	pushl	%edx
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	pushl	$1265
	.cfi_def_cfa_offset 52
	pushl	$__func__.9493
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	$.LC111
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL4258:
	addl	$20, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC641
	.cfi_def_cfa_offset 48
	jmp	.L3619
.LVL4259:
	.p2align 4,,10
	.p2align 3
.L3625:
	.cfi_restore_state
	.loc 31 1258 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	pushl	556(%eax)
	.cfi_def_cfa_offset 40
.LVL4260:
	leal	668(%eax), %edx
.LVL4261:
	pushl	%edx
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	pushl	$1258
	.cfi_def_cfa_offset 52
	pushl	$__func__.9493
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	$.LC111
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL4262:
	addl	$20, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC640
	.cfi_def_cfa_offset 48
	jmp	.L3619
.LVL4263:
.L3616:
	.cfi_restore_state
	.loc 31 1271 0
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	pushl	$2
	.cfi_def_cfa_offset 44
.LVL4264:
	pushl	ksCurThread
	.cfi_def_cfa_offset 48
	call	setThreadState
.LVL4265:
	.loc 31 1272 0
	movl	%ebx, 52(%esp)
	movl	%ebp, 48(%esp)
	.loc 31 1273 0
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL4266:
	.loc 31 1272 0
	jmp	invokeTCB_NotificationControl
.LVL4267:
.L3622:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -20
	.cfi_offset 5, -8
	.cfi_offset 6, -16
	.cfi_offset 7, -12
.LBB12671:
.LBB12665:
	call	cap_thread_cap_get_capTCBPtr.isra.89.part.90
.LVL4268:
.L3624:
.LBE12665:
.LBE12671:
.LBB12672:
.LBB12670:
	call	cap_notification_cap_get_capNtfnPtr.isra.97.part.98
.LVL4269:
.LBE12670:
.LBE12672:
	.cfi_endproc
.LFE824:
	.size	decodeBindNotification, .-decodeBindNotification
	.section	.text.unlikely
.LCOLDE642:
	.text
.LHOTE642:
	.section	.rodata.str1.4
	.align 4
.LC643:
	.string	"TCB UnbindNotification: TCB already has no bound Notification."
	.section	.text.unlikely
.LCOLDB644:
	.text
.LHOTB644:
	.p2align 4,,15
	.globl	decodeUnbindNotification
	.type	decodeUnbindNotification, @function
decodeUnbindNotification:
.LFB825:
	.loc 31 1277 0
	.cfi_startproc
.LVL4270:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 31 1277 0
	movl	16(%esp), %ebx
.LVL4271:
.LBB12698:
.LBB12699:
	.loc 11 2768 0
	movl	%ebx, %eax
	andl	$15, %eax
	cmpl	$12, %eax
	jne	.L3632
.LVL4272:
.LBE12699:
.LBE12698:
	.loc 31 1280 0
	andl	$-16, %ebx
.LVL4273:
	.loc 31 1282 0
	movl	600(%ebx), %eax
	testl	%eax, %eax
	je	.L3633
	.loc 31 1288 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	pushl	$2
	.cfi_def_cfa_offset 28
	pushl	ksCurThread
	.cfi_def_cfa_offset 32
	call	setThreadState
.LVL4274:
.LBB12701:
.LBB12702:
.LBB12703:
.LBB12704:
	.loc 36 242 0
	movl	600(%ebx), %eax
.LVL4275:
	.loc 36 244 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	je	.L3630
.LVL4276:
.LBB12705:
.LBB12706:
.LBB12707:
.LBB12708:
	.loc 11 1047 0
	andl	$15, 12(%eax)
.LVL4277:
.LBE12708:
.LBE12707:
.LBE12706:
.LBE12705:
.LBE12704:
.LBE12703:
.LBE12702:
.LBE12701:
	.loc 31 1289 0
	xorl	%eax, %eax
.LVL4278:
.LBB12714:
.LBB12713:
.LBB12712:
.LBB12711:
.LBB12710:
.LBB12709:
	.loc 36 224 0
	movl	$0, 600(%ebx)
.LVL4279:
.L3629:
.LBE12709:
.LBE12710:
.LBE12711:
.LBE12712:
.LBE12713:
.LBE12714:
	.loc 31 1290 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL4280:
	ret
.LVL4281:
	.p2align 4,,10
	.p2align 3
.L3633:
	.cfi_restore_state
.LBB12715:
.LBB12716:
	.loc 31 1283 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	pushl	556(%eax)
	.cfi_def_cfa_offset 24
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	pushl	$1283
	.cfi_def_cfa_offset 36
	pushl	$__func__.9498
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL4282:
	addl	$20, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC643
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL4283:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL4284:
	.loc 31 1284 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	$3, %eax
	movl	$3, current_syscall_error+24
.LBE12716:
.LBE12715:
	.loc 31 1290 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL4285:
	ret
.LVL4286:
	.p2align 4,,10
	.p2align 3
.L3630:
	.cfi_restore_state
	.loc 31 1289 0
	xorl	%eax, %eax
.LVL4287:
	jmp	.L3629
.LVL4288:
.L3632:
.LBB12717:
.LBB12700:
	call	cap_thread_cap_get_capTCBPtr.isra.89.part.90
.LVL4289:
.LBE12700:
.LBE12717:
	.cfi_endproc
.LFE825:
	.size	decodeUnbindNotification, .-decodeUnbindNotification
	.section	.text.unlikely
.LCOLDE644:
	.text
.LHOTE644:
	.section	.rodata.str1.1
.LC645:
	.string	"read"
.LC646:
	.string	"write"
.LC647:
	.string	"IOMMU: DMA %s page fault "
.LC648:
	.string	"from bus/dev/fun 0x%x "
.LC649:
	.string	"on address 0x%x:%x "
.LC650:
	.string	"with reason code 0x%x\n"
	.section	.text.unlikely
.LCOLDB651:
	.text
.LHOTB651:
	.p2align 4,,15
	.type	vtd_process_faults, @function
vtd_process_faults:
.LFB860:
	.loc 39 208 0
	.cfi_startproc
.LVL4290:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
.LBB12718:
.LBB12719:
.LBB12720:
.LBB12721:
	.loc 39 94 0
	sall	$12, %eax
.LVL4291:
.LBE12721:
.LBE12720:
.LBE12719:
.LBE12718:
	.loc 39 208 0
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
.LBB12734:
.LBB12730:
.LBB12724:
.LBB12722:
	.loc 39 94 0
	movl	%eax, %esi
.LBE12722:
.LBE12724:
.LBE12730:
.LBE12734:
	.loc 39 208 0
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
.LBB12735:
.LBB12731:
.LBB12725:
.LBB12726:
	.loc 39 94 0
	leal	-57332(%esi), %ebx
.LBE12726:
.LBE12725:
.LBE12731:
.LBE12735:
	.loc 39 208 0
	subl	$60, %esp
	.cfi_def_cfa_offset 80
.LBB12736:
.LBB12732:
.LBB12728:
.LBB12723:
	.loc 39 94 0
	movl	%eax, 44(%esp)
	subl	$57336, %eax
	movl	%eax, 20(%esp)
	movl	-57336(%esi), %eax
.LVL4292:
.LBE12723:
.LBE12728:
.LBB12729:
.LBB12727:
	movl	-57332(%esi), %edx
.LVL4293:
	movl	%ebx, 24(%esp)
.LBE12727:
.LBE12729:
.LBE12732:
.LBE12736:
.LBB12737:
.LBB12738:
	movl	-57292(%esi), %ecx
.LVL4294:
.LBE12738:
.LBE12737:
	.loc 39 224 0
	andl	$2, %ecx
.LVL4295:
	je	.L3634
.LBB12739:
.LBB12733:
	.loc 39 128 0
	andl	$3, %edx
	.loc 39 123 0
	shrl	$24, %eax
	movl	%ebx, %edi
	.loc 39 128 0
	sall	$8, %edx
	orl	%edx, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	%eax, 32(%esp)
.LVL4296:
.LBE12733:
.LBE12739:
.LBB12740:
.LBB12741:
	.loc 39 94 0
	movl	-57332(%esi), %eax
.LVL4297:
.LBE12741:
.LBE12740:
.LBB12742:
.LBB12743:
	movl	-57292(%esi), %ebx
.LBE12743:
.LBE12742:
	.loc 39 225 0
	movzbl	%ah, %eax
	.loc 39 226 0
	movzbl	%bh, %ebx
	.loc 39 225 0
	addl	$1, %eax
	.loc 39 227 0
	movl	%ebx, %ecx
	.loc 39 225 0
	movl	%eax, 28(%esp)
.LVL4298:
	leal	-57344(%esi), %eax
.LVL4299:
	.loc 39 227 0
	sall	$4, %ecx
.LVL4300:
	addl	%edx, %ecx
.LVL4301:
	movl	%eax, 36(%esp)
	leal	-57340(%esi), %eax
	movl	%eax, 40(%esp)
	leal	(%ecx,%edi), %esi
	.p2align 4,,10
	.p2align 3
.L3638:
.LVL4302:
.LBB12744:
.LBB12745:
	.loc 39 94 0
	movl	40(%esp), %edi
.LBE12745:
.LBE12744:
.LBB12749:
.LBB12750:
	movl	20(%esp), %eax
.LBE12750:
.LBE12749:
.LBB12753:
.LBB12746:
	leal	(%ecx,%edi), %edx
.LBE12746:
.LBE12753:
.LBB12754:
.LBB12751:
	addl	%ecx, %eax
.LBE12751:
.LBE12754:
.LBB12755:
.LBB12756:
	addl	36(%esp), %ecx
.LVL4303:
.LBE12756:
.LBE12755:
.LBB12759:
.LBB12752:
	movl	(%eax), %ebp
.LVL4304:
.LBE12752:
.LBE12759:
.LBB12760:
.LBB12761:
	movl	(%esi), %eax
.LBE12761:
.LBE12760:
.LBB12762:
.LBB12747:
	movl	(%edx), %edi
.LBE12747:
.LBE12762:
.LBB12763:
.LBB12757:
	movl	(%ecx), %ecx
.LBE12757:
.LBE12763:
.LBB12764:
.LBB12765:
	movl	(%esi), %edx
.LBE12765:
.LBE12764:
	.loc 39 231 0
	movzwl	%bp, %ebp
.LVL4305:
	.loc 39 238 0
	testl	$1073741824, %eax
	movl	$.LC645, %eax
.LVL4306:
.LBB12766:
.LBB12748:
	.loc 39 94 0
	movl	%edi, 12(%esp)
.LVL4307:
.LBE12748:
.LBE12766:
.LBB12767:
.LBB12758:
	movl	%ecx, 16(%esp)
.LVL4308:
.LBE12758:
.LBE12767:
	.loc 39 236 0
	movzbl	%dl, %edi
.LVL4309:
	.loc 39 238 0
	movl	$.LC646, %edx
	cmove	%edx, %eax
	subl	$8, %esp
	.cfi_def_cfa_offset 88
	pushl	%eax
	.cfi_def_cfa_offset 92
	pushl	$.LC647
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL4310:
	.loc 39 239 0
	popl	%eax
	.cfi_def_cfa_offset 92
	popl	%edx
	.cfi_def_cfa_offset 88
	pushl	%ebp
	.cfi_def_cfa_offset 92
	pushl	$.LC648
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL4311:
	.loc 39 240 0
	addl	$12, %esp
	.cfi_def_cfa_offset 84
	movl	20(%esp), %ecx
	pushl	%ecx
	.cfi_def_cfa_offset 88
	pushl	20(%esp)
	.cfi_def_cfa_offset 92
	pushl	$.LC649
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL4312:
	.loc 39 241 0
	popl	%ecx
	.cfi_def_cfa_offset 92
	popl	%ebp
	.cfi_def_cfa_offset 88
.LVL4313:
	pushl	%edi
	.cfi_def_cfa_offset 92
	pushl	$.LC650
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL4314:
	.loc 39 245 0
	leal	1(%ebx), %eax
	xorl	%edx, %edx
.LBB12768:
.LBB12769:
.LBB12770:
	.loc 39 99 0
	movl	$-2147483648, (%esi)
.LVL4315:
.LBE12770:
.LBE12769:
.LBE12768:
	.loc 39 245 0
	divl	44(%esp)
.LBB12771:
.LBB12772:
	.loc 39 94 0
	movl	40(%esp), %eax
.LBE12772:
.LBE12771:
	.loc 39 246 0
	movl	%edx, %ecx
	.loc 39 245 0
	movl	%edx, %ebx
.LVL4316:
	.loc 39 246 0
	sall	$4, %ecx
.LVL4317:
	addl	48(%esp), %ecx
.LVL4318:
	.loc 39 247 0
	addl	$16, %esp
	.cfi_def_cfa_offset 80
.LBB12774:
.LBB12773:
	.loc 39 94 0
	leal	(%ecx,%eax), %esi
	movl	(%esi), %eax
.LVL4319:
.LBE12773:
.LBE12774:
	.loc 39 247 0
	testl	%eax, %eax
	js	.L3638
.LVL4320:
.LBB12775:
.LBB12776:
	.loc 39 94 0
	movl	44(%esp), %ebx
	movl	-57292(%ebx), %eax
.LVL4321:
.LBE12776:
.LBE12775:
	.loc 39 250 0
	testb	$1, %al
	je	.L3634
.LVL4322:
.LBB12777:
.LBB12778:
	.loc 39 99 0
	movl	$1, -57292(%ebx)
.LVL4323:
.L3634:
.LBE12778:
.LBE12777:
	.loc 39 255 0
	addl	$60, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE860:
	.size	vtd_process_faults, .-vtd_process_faults
	.section	.text.unlikely
.LCOLDE651:
	.text
.LHOTE651:
	.section	.text.unlikely
.LCOLDB652:
	.text
.LHOTB652:
	.p2align 4,,15
	.globl	vtd_handle_fault
	.type	vtd_handle_fault, @function
vtd_handle_fault:
.LFB861:
	.loc 39 258 0
	.cfi_startproc
.LVL4324:
	.loc 39 261 0
	movl	x86KSnumDrhu, %eax
	testl	%eax, %eax
	je	.L3654
	.loc 39 258 0
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	xorl	%ebx, %ebx
	subl	$8, %esp
	.cfi_def_cfa_offset 16
.LVL4325:
	.p2align 4,,10
	.p2align 3
.L3650:
	.loc 39 262 0 discriminator 3
	movl	%ebx, %eax
	.loc 39 261 0 discriminator 3
	addl	$1, %ebx
.LVL4326:
	.loc 39 262 0 discriminator 3
	call	vtd_process_faults
.LVL4327:
	.loc 39 261 0 discriminator 3
	cmpl	%ebx, x86KSnumDrhu
	ja	.L3650
	.loc 39 264 0
	addl	$8, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL4328:
.L3654:
	ret
	.cfi_endproc
.LFE861:
	.size	vtd_handle_fault, .-vtd_handle_fault
	.section	.text.unlikely
.LCOLDE652:
	.text
.LHOTE652:
	.section	.rodata.str1.4
	.align 4
.LC653:
	.string	"Configured cache line size is %d but detected size is %lu\n"
	.section	.boot.text
.LCOLDB654:
.LHOTB654:
	.p2align 4,,15
	.globl	init_vm_state
	.type	init_vm_state, @function
init_vm_state:
.LFB537:
	.loc 20 482 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.loc 20 484 0
	call	getCacheLineSizeBits
.LVL4329:
	movl	%eax, %ecx
	movl	%eax, x86KScacheLineSizeBits
	xorl	%eax, %eax
	.loc 20 485 0
	testl	%ecx, %ecx
	je	.L3656
	.loc 20 489 0
	movl	$1, %eax
	sall	%cl, %eax
.LVL4330:
	.loc 20 490 0
	cmpl	$64, %eax
	je	.L3657
	.loc 20 491 0
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	pushl	%eax
	.cfi_def_cfa_offset 24
	pushl	$64
	.cfi_def_cfa_offset 28
	pushl	$.LC653
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL4331:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.L3657:
.LBB13315:
.LBB13316:
	.loc 20 496 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$x86KStss
	.cfi_def_cfa_offset 32
	call	init_tss
.LVL4332:
	.loc 20 497 0
	popl	%eax
	.cfi_def_cfa_offset 28
	popl	%edx
	.cfi_def_cfa_offset 24
	pushl	$x86KStss
	.cfi_def_cfa_offset 28
	pushl	$x86KSgdt
	.cfi_def_cfa_offset 32
	call	init_gdt
.LVL4333:
.LBB13317:
.LBB13318:
.LBB13319:
.LBB13320:
	.loc 16 191 0
	movl	$int_00, %eax
.LVL4334:
.LBE13320:
.LBE13319:
.LBB13323:
.LBB13324:
	.loc 16 198 0
	xorl	%ecx, %ecx
.LBE13324:
.LBE13323:
.LBB13327:
.LBB13321:
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, x86KSidt+4
.LVL4335:
.LBE13321:
.LBE13327:
.LBB13328:
.LBB13329:
	.loc 16 191 0
	movl	$int_01, %eax
.LVL4336:
.LBE13329:
.LBE13328:
.LBB13332:
.LBB13322:
	.loc 16 198 0
	movl	%edx, x86KSidt
.LBE13322:
.LBE13332:
.LBB13333:
.LBB13330:
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, x86KSidt+12
.LVL4337:
.LBE13330:
.LBE13333:
.LBB13334:
.LBB13335:
	.loc 16 191 0
	movl	$int_02, %eax
.LVL4338:
.LBE13335:
.LBE13334:
.LBB13338:
.LBB13331:
	.loc 16 198 0
	movl	%edx, x86KSidt+8
.LBE13331:
.LBE13338:
.LBB13339:
.LBB13336:
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, x86KSidt+20
.LVL4339:
.LBE13336:
.LBE13339:
.LBB13340:
.LBB13341:
	.loc 16 191 0
	movl	$int_03, %eax
.LVL4340:
.LBE13341:
.LBE13340:
.LBB13344:
.LBB13337:
	.loc 16 198 0
	movl	%edx, x86KSidt+16
.LBE13337:
.LBE13344:
.LBB13345:
.LBB13342:
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, x86KSidt+28
.LVL4341:
.LBE13342:
.LBE13345:
.LBB13346:
.LBB13347:
	.loc 16 191 0
	movl	$int_04, %eax
.LVL4342:
.LBE13347:
.LBE13346:
.LBB13350:
.LBB13343:
	.loc 16 198 0
	movl	%edx, x86KSidt+24
.LBE13343:
.LBE13350:
.LBB13351:
.LBB13348:
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, x86KSidt+36
.LVL4343:
.LBE13348:
.LBE13351:
.LBB13352:
.LBB13353:
	.loc 16 191 0
	movl	$int_05, %eax
.LVL4344:
.LBE13353:
.LBE13352:
.LBB13356:
.LBB13349:
	.loc 16 198 0
	movl	%edx, x86KSidt+32
.LBE13349:
.LBE13356:
.LBB13357:
.LBB13354:
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, x86KSidt+44
.LVL4345:
.LBE13354:
.LBE13357:
.LBB13358:
.LBB13359:
	.loc 16 191 0
	movl	$int_06, %eax
.LVL4346:
.LBE13359:
.LBE13358:
.LBB13362:
.LBB13355:
	.loc 16 198 0
	movl	%edx, x86KSidt+40
.LBE13355:
.LBE13362:
.LBB13363:
.LBB13360:
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$142, %ah
	orl	$524288, %edx
	movl	%eax, x86KSidt+52
.LVL4347:
.LBE13360:
.LBE13363:
.LBB13364:
.LBB13325:
	.loc 16 191 0
	movl	$int_07, %eax
.LVL4348:
.LBE13325:
.LBE13364:
.LBB13365:
.LBB13361:
	.loc 16 198 0
	movl	%edx, x86KSidt+48
.LBE13361:
.LBE13365:
.LBB13366:
.LBB13326:
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+56, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4349:
.LBE13326:
.LBE13366:
.LBB13367:
.LBB13368:
	.loc 16 191 0
	movl	$int_08, %eax
.LVL4350:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+64, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4351:
.LBE13368:
.LBE13367:
.LBB13369:
.LBB13370:
	.loc 16 191 0
	movl	$int_09, %eax
.LVL4352:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+72, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4353:
.LBE13370:
.LBE13369:
.LBB13371:
.LBB13372:
	.loc 16 191 0
	movl	$int_0a, %eax
.LVL4354:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+80, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4355:
.LBE13372:
.LBE13371:
.LBB13373:
.LBB13374:
	.loc 16 191 0
	movl	$int_0b, %eax
.LVL4356:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+88, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4357:
.LBE13374:
.LBE13373:
.LBB13375:
.LBB13376:
	.loc 16 191 0
	movl	$int_0c, %eax
.LVL4358:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+96, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4359:
.LBE13376:
.LBE13375:
.LBB13377:
.LBB13378:
	.loc 16 191 0
	movl	$int_0d, %eax
.LVL4360:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+104, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4361:
.LBE13378:
.LBE13377:
.LBB13379:
.LBB13380:
	.loc 16 191 0
	movl	$int_0e, %eax
.LVL4362:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+112, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4363:
.LBE13380:
.LBE13379:
.LBB13381:
.LBB13382:
	.loc 16 191 0
	movl	$int_0f, %eax
.LVL4364:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+120, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4365:
.LBE13382:
.LBE13381:
.LBB13383:
.LBB13384:
	.loc 16 191 0
	movl	$int_10, %eax
.LVL4366:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+128, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4367:
.LBE13384:
.LBE13383:
.LBB13385:
.LBB13386:
	.loc 16 191 0
	movl	$int_11, %eax
.LVL4368:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+136, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4369:
.LBE13386:
.LBE13385:
.LBB13387:
.LBB13388:
	.loc 16 191 0
	movl	$int_12, %eax
.LVL4370:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+144, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4371:
.LBE13388:
.LBE13387:
.LBB13389:
.LBB13390:
	.loc 16 191 0
	movl	$int_13, %eax
.LVL4372:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+152, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4373:
.LBE13390:
.LBE13389:
.LBB13391:
.LBB13392:
	.loc 16 191 0
	movl	$int_14, %eax
.LVL4374:
	.loc 16 198 0
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+160, %eax
	xorl	%ecx, %ecx
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4375:
.LBE13392:
.LBE13391:
.LBB13393:
.LBB13394:
	.loc 16 191 0
	movl	$int_15, %eax
.LVL4376:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+168, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4377:
.LBE13394:
.LBE13393:
.LBB13395:
.LBB13396:
	.loc 16 191 0
	movl	$int_16, %eax
.LVL4378:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+176, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4379:
.LBE13396:
.LBE13395:
.LBB13397:
.LBB13398:
	.loc 16 191 0
	movl	$int_17, %eax
.LVL4380:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+184, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4381:
.LBE13398:
.LBE13397:
.LBB13399:
.LBB13400:
	.loc 16 191 0
	movl	$int_18, %eax
.LVL4382:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+192, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4383:
.LBE13400:
.LBE13399:
.LBB13401:
.LBB13402:
	.loc 16 191 0
	movl	$int_19, %eax
.LVL4384:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+200, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4385:
.LBE13402:
.LBE13401:
.LBB13403:
.LBB13404:
	.loc 16 191 0
	movl	$int_1a, %eax
.LVL4386:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+208, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4387:
.LBE13404:
.LBE13403:
.LBB13405:
.LBB13406:
	.loc 16 191 0
	movl	$int_1b, %eax
.LVL4388:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+216, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4389:
.LBE13406:
.LBE13405:
.LBB13407:
.LBB13408:
	.loc 16 191 0
	movl	$int_1c, %eax
.LVL4390:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+224, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4391:
.LBE13408:
.LBE13407:
.LBB13409:
.LBB13410:
	.loc 16 191 0
	movl	$int_1d, %eax
.LVL4392:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+232, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4393:
.LBE13410:
.LBE13409:
.LBB13411:
.LBB13412:
	.loc 16 191 0
	movl	$int_1e, %eax
.LVL4394:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+240, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4395:
.LBE13412:
.LBE13411:
.LBB13413:
.LBB13414:
	.loc 16 191 0
	movl	$int_1f, %eax
.LVL4396:
	.loc 16 198 0
	movl	%eax, %edx
	movzwl	%ax, %eax
	shrl	$16, %edx
	movl	%eax, (%esp)
	xorl	%ecx, %ecx
	movl	$x86KSidt+248, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4397:
.LBE13414:
.LBE13413:
.LBB13415:
.LBB13416:
	.loc 16 191 0
	movl	$int_20, %eax
.LVL4398:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+256, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4399:
.LBE13416:
.LBE13415:
.LBB13417:
.LBB13418:
	.loc 16 191 0
	movl	$int_21, %eax
.LVL4400:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+264, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4401:
.LBE13418:
.LBE13417:
.LBB13419:
.LBB13420:
	.loc 16 191 0
	movl	$int_22, %eax
.LVL4402:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+272, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4403:
.LBE13420:
.LBE13419:
.LBB13421:
.LBB13422:
	.loc 16 191 0
	movl	$int_23, %eax
.LVL4404:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+280, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4405:
.LBE13422:
.LBE13421:
.LBB13423:
.LBB13424:
	.loc 16 191 0
	movl	$int_24, %eax
.LVL4406:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+288, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4407:
.LBE13424:
.LBE13423:
.LBB13425:
.LBB13426:
	.loc 16 191 0
	movl	$int_25, %eax
.LVL4408:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+296, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4409:
.LBE13426:
.LBE13425:
.LBB13427:
.LBB13428:
	.loc 16 191 0
	movl	$int_26, %eax
.LVL4410:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+304, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4411:
.LBE13428:
.LBE13427:
.LBB13429:
.LBB13430:
	.loc 16 191 0
	movl	$int_27, %eax
.LVL4412:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+312, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4413:
.LBE13430:
.LBE13429:
.LBB13431:
.LBB13432:
	.loc 16 191 0
	movl	$int_28, %eax
.LVL4414:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+320, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4415:
.LBE13432:
.LBE13431:
.LBB13433:
.LBB13434:
	.loc 16 191 0
	movl	$int_29, %eax
.LVL4416:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+328, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4417:
.LBE13434:
.LBE13433:
.LBB13435:
.LBB13436:
	.loc 16 191 0
	movl	$int_2a, %eax
.LVL4418:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+336, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4419:
.LBE13436:
.LBE13435:
.LBB13437:
.LBB13438:
	.loc 16 191 0
	movl	$int_2b, %eax
.LVL4420:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+344, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4421:
.LBE13438:
.LBE13437:
.LBB13439:
.LBB13440:
	.loc 16 191 0
	movl	$int_2c, %eax
.LVL4422:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+352, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4423:
.LBE13440:
.LBE13439:
.LBB13441:
.LBB13442:
	.loc 16 191 0
	movl	$int_2d, %eax
.LVL4424:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+360, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4425:
.LBE13442:
.LBE13441:
.LBB13443:
.LBB13444:
	.loc 16 191 0
	movl	$int_2e, %eax
.LVL4426:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+368, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4427:
.LBE13444:
.LBE13443:
.LBB13445:
.LBB13446:
	.loc 16 191 0
	movl	$int_2f, %eax
.LVL4428:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+376, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4429:
.LBE13446:
.LBE13445:
.LBB13447:
.LBB13448:
	.loc 16 191 0
	movl	$int_30, %eax
.LVL4430:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+384, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4431:
.LBE13448:
.LBE13447:
.LBB13449:
.LBB13450:
	.loc 16 191 0
	movl	$int_31, %eax
.LVL4432:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+392, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4433:
.LBE13450:
.LBE13449:
.LBB13451:
.LBB13452:
	.loc 16 191 0
	movl	$int_32, %eax
.LVL4434:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+400, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4435:
.LBE13452:
.LBE13451:
.LBB13453:
.LBB13454:
	.loc 16 191 0
	movl	$int_33, %eax
.LVL4436:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+408, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4437:
.LBE13454:
.LBE13453:
.LBB13455:
.LBB13456:
	.loc 16 191 0
	movl	$int_34, %eax
.LVL4438:
	.loc 16 198 0
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+416, %eax
	xorl	%ecx, %ecx
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4439:
.LBE13456:
.LBE13455:
.LBB13457:
.LBB13458:
	.loc 16 191 0
	movl	$int_35, %eax
.LVL4440:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+424, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4441:
.LBE13458:
.LBE13457:
.LBB13459:
.LBB13460:
	.loc 16 191 0
	movl	$int_36, %eax
.LVL4442:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+432, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4443:
.LBE13460:
.LBE13459:
.LBB13461:
.LBB13462:
	.loc 16 191 0
	movl	$int_37, %eax
.LVL4444:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+440, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4445:
.LBE13462:
.LBE13461:
.LBB13463:
.LBB13464:
	.loc 16 191 0
	movl	$int_38, %eax
.LVL4446:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+448, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4447:
.LBE13464:
.LBE13463:
.LBB13465:
.LBB13466:
	.loc 16 191 0
	movl	$int_39, %eax
.LVL4448:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+456, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4449:
.LBE13466:
.LBE13465:
.LBB13467:
.LBB13468:
	.loc 16 191 0
	movl	$int_3a, %eax
.LVL4450:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+464, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4451:
.LBE13468:
.LBE13467:
.LBB13469:
.LBB13470:
	.loc 16 191 0
	movl	$int_3b, %eax
.LVL4452:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+472, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4453:
.LBE13470:
.LBE13469:
.LBB13471:
.LBB13472:
	.loc 16 191 0
	movl	$int_3c, %eax
.LVL4454:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+480, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4455:
.LBE13472:
.LBE13471:
.LBB13473:
.LBB13474:
	.loc 16 191 0
	movl	$int_3d, %eax
.LVL4456:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+488, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4457:
.LBE13474:
.LBE13473:
.LBB13475:
.LBB13476:
	.loc 16 191 0
	movl	$int_3e, %eax
.LVL4458:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+496, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4459:
.LBE13476:
.LBE13475:
.LBB13477:
.LBB13478:
	.loc 16 191 0
	movl	$int_3f, %eax
.LVL4460:
	.loc 16 198 0
	movl	%eax, %edx
	movzwl	%ax, %eax
	shrl	$16, %edx
	movl	%eax, (%esp)
	xorl	%ecx, %ecx
	movl	$x86KSidt+504, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4461:
.LBE13478:
.LBE13477:
.LBB13479:
.LBB13480:
	.loc 16 191 0
	movl	$int_40, %eax
.LVL4462:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+512, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4463:
.LBE13480:
.LBE13479:
.LBB13481:
.LBB13482:
	.loc 16 191 0
	movl	$int_41, %eax
.LVL4464:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+520, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4465:
.LBE13482:
.LBE13481:
.LBB13483:
.LBB13484:
	.loc 16 191 0
	movl	$int_42, %eax
.LVL4466:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+528, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4467:
.LBE13484:
.LBE13483:
.LBB13485:
.LBB13486:
	.loc 16 191 0
	movl	$int_43, %eax
.LVL4468:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+536, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4469:
.LBE13486:
.LBE13485:
.LBB13487:
.LBB13488:
	.loc 16 191 0
	movl	$int_44, %eax
.LVL4470:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+544, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4471:
.LBE13488:
.LBE13487:
.LBB13489:
.LBB13490:
	.loc 16 191 0
	movl	$int_45, %eax
.LVL4472:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+552, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4473:
.LBE13490:
.LBE13489:
.LBB13491:
.LBB13492:
	.loc 16 191 0
	movl	$int_46, %eax
.LVL4474:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+560, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4475:
.LBE13492:
.LBE13491:
.LBB13493:
.LBB13494:
	.loc 16 191 0
	movl	$int_47, %eax
.LVL4476:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+568, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4477:
.LBE13494:
.LBE13493:
.LBB13495:
.LBB13496:
	.loc 16 191 0
	movl	$int_48, %eax
.LVL4478:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+576, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4479:
.LBE13496:
.LBE13495:
.LBB13497:
.LBB13498:
	.loc 16 191 0
	movl	$int_49, %eax
.LVL4480:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+584, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4481:
.LBE13498:
.LBE13497:
.LBB13499:
.LBB13500:
	.loc 16 191 0
	movl	$int_4a, %eax
.LVL4482:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+592, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4483:
.LBE13500:
.LBE13499:
.LBB13501:
.LBB13502:
	.loc 16 191 0
	movl	$int_4b, %eax
.LVL4484:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+600, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4485:
.LBE13502:
.LBE13501:
.LBB13503:
.LBB13504:
	.loc 16 191 0
	movl	$int_4c, %eax
.LVL4486:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+608, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4487:
.LBE13504:
.LBE13503:
.LBB13505:
.LBB13506:
	.loc 16 191 0
	movl	$int_4d, %eax
.LVL4488:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+616, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4489:
.LBE13506:
.LBE13505:
.LBB13507:
.LBB13508:
	.loc 16 191 0
	movl	$int_4e, %eax
.LVL4490:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+624, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4491:
.LBE13508:
.LBE13507:
.LBB13509:
.LBB13510:
	.loc 16 191 0
	movl	$int_4f, %eax
.LVL4492:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+632, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4493:
.LBE13510:
.LBE13509:
.LBB13511:
.LBB13512:
	.loc 16 191 0
	movl	$int_50, %eax
.LVL4494:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+640, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4495:
.LBE13512:
.LBE13511:
.LBB13513:
.LBB13514:
	.loc 16 191 0
	movl	$int_51, %eax
.LVL4496:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+648, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4497:
.LBE13514:
.LBE13513:
.LBB13515:
.LBB13516:
	.loc 16 191 0
	movl	$int_52, %eax
.LVL4498:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+656, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4499:
.LBE13516:
.LBE13515:
.LBB13517:
.LBB13518:
	.loc 16 191 0
	movl	$int_53, %eax
.LVL4500:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+664, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4501:
.LBE13518:
.LBE13517:
.LBB13519:
.LBB13520:
	.loc 16 191 0
	movl	$int_54, %eax
.LVL4502:
	.loc 16 198 0
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+672, %eax
	xorl	%ecx, %ecx
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4503:
.LBE13520:
.LBE13519:
.LBB13521:
.LBB13522:
	.loc 16 191 0
	movl	$int_55, %eax
.LVL4504:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+680, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4505:
.LBE13522:
.LBE13521:
.LBB13523:
.LBB13524:
	.loc 16 191 0
	movl	$int_56, %eax
.LVL4506:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+688, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4507:
.LBE13524:
.LBE13523:
.LBB13525:
.LBB13526:
	.loc 16 191 0
	movl	$int_57, %eax
.LVL4508:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+696, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4509:
.LBE13526:
.LBE13525:
.LBB13527:
.LBB13528:
	.loc 16 191 0
	movl	$int_58, %eax
.LVL4510:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+704, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4511:
.LBE13528:
.LBE13527:
.LBB13529:
.LBB13530:
	.loc 16 191 0
	movl	$int_59, %eax
.LVL4512:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+712, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4513:
.LBE13530:
.LBE13529:
.LBB13531:
.LBB13532:
	.loc 16 191 0
	movl	$int_5a, %eax
.LVL4514:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+720, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4515:
.LBE13532:
.LBE13531:
.LBB13533:
.LBB13534:
	.loc 16 191 0
	movl	$int_5b, %eax
.LVL4516:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+728, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4517:
.LBE13534:
.LBE13533:
.LBB13535:
.LBB13536:
	.loc 16 191 0
	movl	$int_5c, %eax
.LVL4518:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+736, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4519:
.LBE13536:
.LBE13535:
.LBB13537:
.LBB13538:
	.loc 16 191 0
	movl	$int_5d, %eax
.LVL4520:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+744, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4521:
.LBE13538:
.LBE13537:
.LBB13539:
.LBB13540:
	.loc 16 191 0
	movl	$int_5e, %eax
.LVL4522:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+752, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4523:
.LBE13540:
.LBE13539:
.LBB13541:
.LBB13542:
	.loc 16 191 0
	movl	$int_5f, %eax
.LVL4524:
	.loc 16 198 0
	movl	%eax, %edx
	movzwl	%ax, %eax
	shrl	$16, %edx
	movl	%eax, (%esp)
	xorl	%ecx, %ecx
	movl	$x86KSidt+760, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4525:
.LBE13542:
.LBE13541:
.LBB13543:
.LBB13544:
	.loc 16 191 0
	movl	$int_60, %eax
.LVL4526:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+768, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4527:
.LBE13544:
.LBE13543:
.LBB13545:
.LBB13546:
	.loc 16 191 0
	movl	$int_61, %eax
.LVL4528:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+776, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4529:
.LBE13546:
.LBE13545:
.LBB13547:
.LBB13548:
	.loc 16 191 0
	movl	$int_62, %eax
.LVL4530:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+784, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4531:
.LBE13548:
.LBE13547:
.LBB13549:
.LBB13550:
	.loc 16 191 0
	movl	$int_63, %eax
.LVL4532:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+792, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4533:
.LBE13550:
.LBE13549:
.LBB13551:
.LBB13552:
	.loc 16 191 0
	movl	$int_64, %eax
.LVL4534:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+800, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4535:
.LBE13552:
.LBE13551:
.LBB13553:
.LBB13554:
	.loc 16 191 0
	movl	$int_65, %eax
.LVL4536:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+808, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4537:
.LBE13554:
.LBE13553:
.LBB13555:
.LBB13556:
	.loc 16 191 0
	movl	$int_66, %eax
.LVL4538:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+816, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4539:
.LBE13556:
.LBE13555:
.LBB13557:
.LBB13558:
	.loc 16 191 0
	movl	$int_67, %eax
.LVL4540:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+824, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4541:
.LBE13558:
.LBE13557:
.LBB13559:
.LBB13560:
	.loc 16 191 0
	movl	$int_68, %eax
.LVL4542:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+832, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4543:
.LBE13560:
.LBE13559:
.LBB13561:
.LBB13562:
	.loc 16 191 0
	movl	$int_69, %eax
.LVL4544:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+840, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4545:
.LBE13562:
.LBE13561:
.LBB13563:
.LBB13564:
	.loc 16 191 0
	movl	$int_6a, %eax
.LVL4546:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+848, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4547:
.LBE13564:
.LBE13563:
.LBB13565:
.LBB13566:
	.loc 16 191 0
	movl	$int_6b, %eax
.LVL4548:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+856, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4549:
.LBE13566:
.LBE13565:
.LBB13567:
.LBB13568:
	.loc 16 191 0
	movl	$int_6c, %eax
.LVL4550:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+864, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4551:
.LBE13568:
.LBE13567:
.LBB13569:
.LBB13570:
	.loc 16 191 0
	movl	$int_6d, %eax
.LVL4552:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+872, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4553:
.LBE13570:
.LBE13569:
.LBB13571:
.LBB13572:
	.loc 16 191 0
	movl	$int_6e, %eax
.LVL4554:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+880, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4555:
.LBE13572:
.LBE13571:
.LBB13573:
.LBB13574:
	.loc 16 191 0
	movl	$int_6f, %eax
.LVL4556:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+888, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4557:
.LBE13574:
.LBE13573:
.LBB13575:
.LBB13576:
	.loc 16 191 0
	movl	$int_70, %eax
.LVL4558:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+896, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4559:
.LBE13576:
.LBE13575:
.LBB13577:
.LBB13578:
	.loc 16 191 0
	movl	$int_71, %eax
.LVL4560:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+904, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4561:
.LBE13578:
.LBE13577:
.LBB13579:
.LBB13580:
	.loc 16 191 0
	movl	$int_72, %eax
.LVL4562:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+912, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4563:
.LBE13580:
.LBE13579:
.LBB13581:
.LBB13582:
	.loc 16 191 0
	movl	$int_73, %eax
.LVL4564:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+920, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4565:
.LBE13582:
.LBE13581:
.LBB13583:
.LBB13584:
	.loc 16 191 0
	movl	$int_74, %eax
.LVL4566:
	.loc 16 198 0
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+928, %eax
	xorl	%ecx, %ecx
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4567:
.LBE13584:
.LBE13583:
.LBB13585:
.LBB13586:
	.loc 16 191 0
	movl	$int_75, %eax
.LVL4568:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+936, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4569:
.LBE13586:
.LBE13585:
.LBB13587:
.LBB13588:
	.loc 16 191 0
	movl	$int_76, %eax
.LVL4570:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+944, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4571:
.LBE13588:
.LBE13587:
.LBB13589:
.LBB13590:
	.loc 16 191 0
	movl	$int_77, %eax
.LVL4572:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+952, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4573:
.LBE13590:
.LBE13589:
.LBB13591:
.LBB13592:
	.loc 16 191 0
	movl	$int_78, %eax
.LVL4574:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+960, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4575:
.LBE13592:
.LBE13591:
.LBB13593:
.LBB13594:
	.loc 16 191 0
	movl	$int_79, %eax
.LVL4576:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+968, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4577:
.LBE13594:
.LBE13593:
.LBB13595:
.LBB13596:
	.loc 16 191 0
	movl	$int_7a, %eax
.LVL4578:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+976, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4579:
.LBE13596:
.LBE13595:
.LBB13597:
.LBB13598:
	.loc 16 191 0
	movl	$int_7b, %eax
.LVL4580:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+984, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4581:
.LBE13598:
.LBE13597:
.LBB13599:
.LBB13600:
	.loc 16 191 0
	movl	$int_7c, %eax
.LVL4582:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+992, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4583:
.LBE13600:
.LBE13599:
.LBB13601:
.LBB13602:
	.loc 16 191 0
	movl	$int_7d, %eax
.LVL4584:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1000, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4585:
.LBE13602:
.LBE13601:
.LBB13603:
.LBB13604:
	.loc 16 191 0
	movl	$int_7e, %eax
.LVL4586:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1008, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4587:
.LBE13604:
.LBE13603:
.LBB13605:
.LBB13606:
	.loc 16 191 0
	movl	$int_7f, %eax
.LVL4588:
	.loc 16 198 0
	movl	%eax, %edx
	movzwl	%ax, %eax
	shrl	$16, %edx
	movl	%eax, (%esp)
	xorl	%ecx, %ecx
	movl	$x86KSidt+1016, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4589:
.LBE13606:
.LBE13605:
.LBB13607:
.LBB13608:
	.loc 16 191 0
	movl	$int_80, %eax
.LVL4590:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1024, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4591:
.LBE13608:
.LBE13607:
.LBB13609:
.LBB13610:
	.loc 16 191 0
	movl	$int_81, %eax
.LVL4592:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1032, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4593:
.LBE13610:
.LBE13609:
.LBB13611:
.LBB13612:
	.loc 16 191 0
	movl	$int_82, %eax
.LVL4594:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1040, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4595:
.LBE13612:
.LBE13611:
.LBB13613:
.LBB13614:
	.loc 16 191 0
	movl	$int_83, %eax
.LVL4596:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1048, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4597:
.LBE13614:
.LBE13613:
.LBB13615:
.LBB13616:
	.loc 16 191 0
	movl	$int_84, %eax
.LVL4598:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1056, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4599:
.LBE13616:
.LBE13615:
.LBB13617:
.LBB13618:
	.loc 16 191 0
	movl	$int_85, %eax
.LVL4600:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1064, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4601:
.LBE13618:
.LBE13617:
.LBB13619:
.LBB13620:
	.loc 16 191 0
	movl	$int_86, %eax
.LVL4602:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1072, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4603:
.LBE13620:
.LBE13619:
.LBB13621:
.LBB13622:
	.loc 16 191 0
	movl	$int_87, %eax
.LVL4604:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1080, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4605:
.LBE13622:
.LBE13621:
.LBB13623:
.LBB13624:
	.loc 16 191 0
	movl	$int_88, %eax
.LVL4606:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1088, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4607:
.LBE13624:
.LBE13623:
.LBB13625:
.LBB13626:
	.loc 16 191 0
	movl	$int_89, %eax
.LVL4608:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1096, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4609:
.LBE13626:
.LBE13625:
.LBB13627:
.LBB13628:
	.loc 16 191 0
	movl	$int_8a, %eax
.LVL4610:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1104, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4611:
.LBE13628:
.LBE13627:
.LBB13629:
.LBB13630:
	.loc 16 191 0
	movl	$int_8b, %eax
.LVL4612:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1112, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4613:
.LBE13630:
.LBE13629:
.LBB13631:
.LBB13632:
	.loc 16 191 0
	movl	$int_8c, %eax
.LVL4614:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1120, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4615:
.LBE13632:
.LBE13631:
.LBB13633:
.LBB13634:
	.loc 16 191 0
	movl	$int_8d, %eax
.LVL4616:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1128, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4617:
.LBE13634:
.LBE13633:
.LBB13635:
.LBB13636:
	.loc 16 191 0
	movl	$int_8e, %eax
.LVL4618:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1136, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4619:
.LBE13636:
.LBE13635:
.LBB13637:
.LBB13638:
	.loc 16 191 0
	movl	$int_8f, %eax
.LVL4620:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1144, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4621:
.LBE13638:
.LBE13637:
.LBB13639:
.LBB13640:
	.loc 16 191 0
	movl	$int_90, %eax
.LVL4622:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1152, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4623:
.LBE13640:
.LBE13639:
.LBB13641:
.LBB13642:
	.loc 16 191 0
	movl	$int_91, %eax
.LVL4624:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1160, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4625:
.LBE13642:
.LBE13641:
.LBB13643:
.LBB13644:
	.loc 16 191 0
	movl	$int_92, %eax
.LVL4626:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1168, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4627:
.LBE13644:
.LBE13643:
.LBB13645:
.LBB13646:
	.loc 16 191 0
	movl	$int_93, %eax
.LVL4628:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1176, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4629:
.LBE13646:
.LBE13645:
.LBB13647:
.LBB13648:
	.loc 16 191 0
	movl	$int_94, %eax
.LVL4630:
	.loc 16 198 0
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1184, %eax
	xorl	%ecx, %ecx
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4631:
.LBE13648:
.LBE13647:
.LBB13649:
.LBB13650:
	.loc 16 191 0
	movl	$int_95, %eax
.LVL4632:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1192, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4633:
.LBE13650:
.LBE13649:
.LBB13651:
.LBB13652:
	.loc 16 191 0
	movl	$int_96, %eax
.LVL4634:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1200, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4635:
.LBE13652:
.LBE13651:
.LBB13653:
.LBB13654:
	.loc 16 191 0
	movl	$int_97, %eax
.LVL4636:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1208, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4637:
.LBE13654:
.LBE13653:
.LBB13655:
.LBB13656:
	.loc 16 191 0
	movl	$int_98, %eax
.LVL4638:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1216, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4639:
.LBE13656:
.LBE13655:
.LBB13657:
.LBB13658:
	.loc 16 191 0
	movl	$int_99, %eax
.LVL4640:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1224, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4641:
.LBE13658:
.LBE13657:
.LBB13659:
.LBB13660:
	.loc 16 191 0
	movl	$int_9a, %eax
.LVL4642:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1232, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4643:
.LBE13660:
.LBE13659:
.LBB13661:
.LBB13662:
	.loc 16 191 0
	movl	$int_9b, %eax
.LVL4644:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1240, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4645:
.LBE13662:
.LBE13661:
.LBB13663:
.LBB13664:
	.loc 16 191 0
	movl	$int_9c, %eax
.LVL4646:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1248, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4647:
.LBE13664:
.LBE13663:
.LBB13665:
.LBB13666:
	.loc 16 191 0
	movl	$int_9d, %eax
.LVL4648:
	.loc 16 198 0
	xorl	%ecx, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1256, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4649:
.LBE13666:
.LBE13665:
.LBB13667:
.LBB13668:
	.loc 16 191 0
	movl	$int_9e, %eax
.LVL4650:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1264, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4651:
.LBE13668:
.LBE13667:
.LBB13669:
.LBB13670:
	.loc 16 191 0
	movl	$int_9f, %eax
.LVL4652:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1272, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4653:
.LBE13670:
.LBE13669:
.LBB13671:
.LBB13672:
	.loc 16 191 0
	movl	$int_a0, %eax
.LVL4654:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1280, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4655:
.LBE13672:
.LBE13671:
.LBB13673:
.LBB13674:
	.loc 16 191 0
	movl	$int_a1, %eax
.LVL4656:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1288, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4657:
.LBE13674:
.LBE13673:
.LBB13675:
.LBB13676:
	.loc 16 191 0
	movl	$int_a2, %eax
.LVL4658:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1296, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4659:
.LBE13676:
.LBE13675:
.LBB13677:
.LBB13678:
	.loc 16 191 0
	movl	$int_a3, %eax
.LVL4660:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1304, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4661:
.LBE13678:
.LBE13677:
.LBB13679:
.LBB13680:
	.loc 16 191 0
	movl	$int_a4, %eax
.LVL4662:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1312, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4663:
.LBE13680:
.LBE13679:
.LBB13681:
.LBB13682:
	.loc 16 191 0
	movl	$int_a5, %eax
.LVL4664:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1320, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4665:
.LBE13682:
.LBE13681:
.LBB13683:
.LBB13684:
	.loc 16 191 0
	movl	$int_a6, %eax
.LVL4666:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1328, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4667:
.LBE13684:
.LBE13683:
.LBB13685:
.LBB13686:
	.loc 16 191 0
	movl	$int_a7, %eax
.LVL4668:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1336, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4669:
.LBE13686:
.LBE13685:
.LBB13687:
.LBB13688:
	.loc 16 191 0
	movl	$int_a8, %eax
.LVL4670:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1344, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4671:
.LBE13688:
.LBE13687:
.LBB13689:
.LBB13690:
	.loc 16 191 0
	movl	$int_a9, %eax
.LVL4672:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1352, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4673:
.LBE13690:
.LBE13689:
.LBB13691:
.LBB13692:
	.loc 16 191 0
	movl	$int_aa, %eax
.LVL4674:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1360, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4675:
.LBE13692:
.LBE13691:
.LBB13693:
.LBB13694:
	.loc 16 191 0
	movl	$int_ab, %eax
.LVL4676:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1368, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4677:
.LBE13694:
.LBE13693:
.LBB13695:
.LBB13696:
	.loc 16 191 0
	movl	$int_ac, %eax
.LVL4678:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1376, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4679:
.LBE13696:
.LBE13695:
.LBB13697:
.LBB13698:
	.loc 16 191 0
	movl	$int_ad, %eax
.LVL4680:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1384, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4681:
.LBE13698:
.LBE13697:
.LBB13699:
.LBB13700:
	.loc 16 191 0
	movl	$int_ae, %eax
.LVL4682:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1392, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4683:
.LBE13700:
.LBE13699:
.LBB13701:
.LBB13702:
	.loc 16 191 0
	movl	$int_af, %eax
.LVL4684:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1400, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4685:
.LBE13702:
.LBE13701:
.LBB13703:
.LBB13704:
	.loc 16 191 0
	movl	$int_b0, %eax
.LVL4686:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1408, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4687:
.LBE13704:
.LBE13703:
.LBB13705:
.LBB13706:
	.loc 16 191 0
	movl	$int_b1, %eax
.LVL4688:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1416, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4689:
.LBE13706:
.LBE13705:
.LBB13707:
.LBB13708:
	.loc 16 191 0
	movl	$int_b2, %eax
.LVL4690:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1424, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4691:
.LBE13708:
.LBE13707:
.LBB13709:
.LBB13710:
	.loc 16 191 0
	movl	$int_b3, %eax
.LVL4692:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1432, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4693:
.LBE13710:
.LBE13709:
.LBB13711:
.LBB13712:
	.loc 16 191 0
	movl	$int_b4, %eax
.LVL4694:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1440, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4695:
.LBE13712:
.LBE13711:
.LBB13713:
.LBB13714:
	.loc 16 191 0
	movl	$int_b5, %eax
.LVL4696:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1448, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4697:
.LBE13714:
.LBE13713:
.LBB13715:
.LBB13716:
	.loc 16 191 0
	movl	$int_b6, %eax
.LVL4698:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1456, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4699:
.LBE13716:
.LBE13715:
.LBB13717:
.LBB13718:
	.loc 16 191 0
	movl	$int_b7, %eax
.LVL4700:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1464, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4701:
.LBE13718:
.LBE13717:
.LBB13719:
.LBB13720:
	.loc 16 191 0
	movl	$int_b8, %eax
.LVL4702:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1472, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4703:
.LBE13720:
.LBE13719:
.LBB13721:
.LBB13722:
	.loc 16 191 0
	movl	$int_b9, %eax
.LVL4704:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1480, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4705:
.LBE13722:
.LBE13721:
.LBB13723:
.LBB13724:
	.loc 16 191 0
	movl	$int_ba, %eax
.LVL4706:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1488, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4707:
.LBE13724:
.LBE13723:
.LBB13725:
.LBB13726:
	.loc 16 191 0
	movl	$int_bb, %eax
.LVL4708:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1496, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4709:
.LBE13726:
.LBE13725:
.LBB13727:
.LBB13728:
	.loc 16 191 0
	movl	$int_bc, %eax
.LVL4710:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1504, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4711:
.LBE13728:
.LBE13727:
.LBB13729:
.LBB13730:
	.loc 16 191 0
	movl	$int_bd, %eax
.LVL4712:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1512, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4713:
.LBE13730:
.LBE13729:
.LBB13731:
.LBB13732:
	.loc 16 191 0
	movl	$int_be, %eax
.LVL4714:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1520, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4715:
.LBE13732:
.LBE13731:
.LBB13733:
.LBB13734:
	.loc 16 191 0
	movl	$int_bf, %eax
.LVL4716:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1528, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4717:
.LBE13734:
.LBE13733:
.LBB13735:
.LBB13736:
	.loc 16 191 0
	movl	$int_c0, %eax
.LVL4718:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1536, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4719:
.LBE13736:
.LBE13735:
.LBB13737:
.LBB13738:
	.loc 16 191 0
	movl	$int_c1, %eax
.LVL4720:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1544, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4721:
.LBE13738:
.LBE13737:
.LBB13739:
.LBB13740:
	.loc 16 191 0
	movl	$int_c2, %eax
.LVL4722:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1552, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4723:
.LBE13740:
.LBE13739:
.LBB13741:
.LBB13742:
	.loc 16 191 0
	movl	$int_c3, %eax
.LVL4724:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1560, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4725:
.LBE13742:
.LBE13741:
.LBB13743:
.LBB13744:
	.loc 16 191 0
	movl	$int_c4, %eax
.LVL4726:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1568, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4727:
.LBE13744:
.LBE13743:
.LBB13745:
.LBB13746:
	.loc 16 191 0
	movl	$int_c5, %eax
.LVL4728:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1576, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4729:
.LBE13746:
.LBE13745:
.LBB13747:
.LBB13748:
	.loc 16 191 0
	movl	$int_c6, %eax
.LVL4730:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1584, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4731:
.LBE13748:
.LBE13747:
.LBB13749:
.LBB13750:
	.loc 16 191 0
	movl	$int_c7, %eax
.LVL4732:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1592, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4733:
.LBE13750:
.LBE13749:
.LBB13751:
.LBB13752:
	.loc 16 191 0
	movl	$int_c8, %eax
.LVL4734:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1600, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4735:
.LBE13752:
.LBE13751:
.LBB13753:
.LBB13754:
	.loc 16 191 0
	movl	$int_c9, %eax
.LVL4736:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1608, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4737:
.LBE13754:
.LBE13753:
.LBB13755:
.LBB13756:
	.loc 16 191 0
	movl	$int_ca, %eax
.LVL4738:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1616, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4739:
.LBE13756:
.LBE13755:
.LBB13757:
.LBB13758:
	.loc 16 191 0
	movl	$int_cb, %eax
.LVL4740:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1624, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4741:
.LBE13758:
.LBE13757:
.LBB13759:
.LBB13760:
	.loc 16 191 0
	movl	$int_cc, %eax
.LVL4742:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1632, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4743:
.LBE13760:
.LBE13759:
.LBB13761:
.LBB13762:
	.loc 16 191 0
	movl	$int_cd, %eax
.LVL4744:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1640, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4745:
.LBE13762:
.LBE13761:
.LBB13763:
.LBB13764:
	.loc 16 191 0
	movl	$int_ce, %eax
.LVL4746:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1648, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4747:
.LBE13764:
.LBE13763:
.LBB13765:
.LBB13766:
	.loc 16 191 0
	movl	$int_cf, %eax
.LVL4748:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1656, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4749:
.LBE13766:
.LBE13765:
.LBB13767:
.LBB13768:
	.loc 16 191 0
	movl	$int_d0, %eax
.LVL4750:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1664, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4751:
.LBE13768:
.LBE13767:
.LBB13769:
.LBB13770:
	.loc 16 191 0
	movl	$int_d1, %eax
.LVL4752:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1672, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4753:
.LBE13770:
.LBE13769:
.LBB13771:
.LBB13772:
	.loc 16 191 0
	movl	$int_d2, %eax
.LVL4754:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1680, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4755:
.LBE13772:
.LBE13771:
.LBB13773:
.LBB13774:
	.loc 16 191 0
	movl	$int_d3, %eax
.LVL4756:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1688, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4757:
.LBE13774:
.LBE13773:
.LBB13775:
.LBB13776:
	.loc 16 191 0
	movl	$int_d4, %eax
.LVL4758:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1696, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4759:
.LBE13776:
.LBE13775:
.LBB13777:
.LBB13778:
	.loc 16 191 0
	movl	$int_d5, %eax
.LVL4760:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1704, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4761:
.LBE13778:
.LBE13777:
.LBB13779:
.LBB13780:
	.loc 16 191 0
	movl	$int_d6, %eax
.LVL4762:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1712, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4763:
.LBE13780:
.LBE13779:
.LBB13781:
.LBB13782:
	.loc 16 191 0
	movl	$int_d7, %eax
.LVL4764:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1720, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4765:
.LBE13782:
.LBE13781:
.LBB13783:
.LBB13784:
	.loc 16 191 0
	movl	$int_d8, %eax
.LVL4766:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1728, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4767:
.LBE13784:
.LBE13783:
.LBB13785:
.LBB13786:
	.loc 16 191 0
	movl	$int_d9, %eax
.LVL4768:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1736, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4769:
.LBE13786:
.LBE13785:
.LBB13787:
.LBB13788:
	.loc 16 191 0
	movl	$int_da, %eax
.LVL4770:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1744, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4771:
.LBE13788:
.LBE13787:
.LBB13789:
.LBB13790:
	.loc 16 191 0
	movl	$int_db, %eax
.LVL4772:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1752, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4773:
.LBE13790:
.LBE13789:
.LBB13791:
.LBB13792:
	.loc 16 191 0
	movl	$int_dc, %eax
.LVL4774:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1760, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4775:
.LBE13792:
.LBE13791:
.LBB13793:
.LBB13794:
	.loc 16 191 0
	movl	$int_dd, %eax
.LVL4776:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1768, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4777:
.LBE13794:
.LBE13793:
.LBB13795:
.LBB13796:
	.loc 16 191 0
	movl	$int_de, %eax
.LVL4778:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1776, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4779:
.LBE13796:
.LBE13795:
.LBB13797:
.LBB13798:
	.loc 16 191 0
	movl	$int_df, %eax
.LVL4780:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1784, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4781:
.LBE13798:
.LBE13797:
.LBB13799:
.LBB13800:
	.loc 16 191 0
	movl	$int_e0, %eax
.LVL4782:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1792, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4783:
.LBE13800:
.LBE13799:
.LBB13801:
.LBB13802:
	.loc 16 191 0
	movl	$int_e1, %eax
.LVL4784:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1800, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4785:
.LBE13802:
.LBE13801:
.LBB13803:
.LBB13804:
	.loc 16 191 0
	movl	$int_e2, %eax
.LVL4786:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1808, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4787:
.LBE13804:
.LBE13803:
.LBB13805:
.LBB13806:
	.loc 16 191 0
	movl	$int_e3, %eax
.LVL4788:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1816, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4789:
.LBE13806:
.LBE13805:
.LBB13807:
.LBB13808:
	.loc 16 191 0
	movl	$int_e4, %eax
.LVL4790:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1824, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4791:
.LBE13808:
.LBE13807:
.LBB13809:
.LBB13810:
	.loc 16 191 0
	movl	$int_e5, %eax
.LVL4792:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1832, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4793:
.LBE13810:
.LBE13809:
.LBB13811:
.LBB13812:
	.loc 16 191 0
	movl	$int_e6, %eax
.LVL4794:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1840, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4795:
.LBE13812:
.LBE13811:
.LBB13813:
.LBB13814:
	.loc 16 191 0
	movl	$int_e7, %eax
.LVL4796:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1848, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4797:
.LBE13814:
.LBE13813:
.LBB13815:
.LBB13816:
	.loc 16 191 0
	movl	$int_e8, %eax
.LVL4798:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1856, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4799:
.LBE13816:
.LBE13815:
.LBB13817:
.LBB13818:
	.loc 16 191 0
	movl	$int_e9, %eax
.LVL4800:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1864, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4801:
.LBE13818:
.LBE13817:
.LBB13819:
.LBB13820:
	.loc 16 191 0
	movl	$int_ea, %eax
.LVL4802:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1872, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4803:
.LBE13820:
.LBE13819:
.LBB13821:
.LBB13822:
	.loc 16 191 0
	movl	$int_eb, %eax
.LVL4804:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1880, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4805:
.LBE13822:
.LBE13821:
.LBB13823:
.LBB13824:
	.loc 16 191 0
	movl	$int_ec, %eax
.LVL4806:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1888, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4807:
.LBE13824:
.LBE13823:
.LBB13825:
.LBB13826:
	.loc 16 191 0
	movl	$int_ed, %eax
.LVL4808:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1896, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4809:
.LBE13826:
.LBE13825:
.LBB13827:
.LBB13828:
	.loc 16 191 0
	movl	$int_ee, %eax
.LVL4810:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1904, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4811:
.LBE13828:
.LBE13827:
.LBB13829:
.LBB13830:
	.loc 16 191 0
	movl	$int_ef, %eax
.LVL4812:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1912, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4813:
.LBE13830:
.LBE13829:
.LBB13831:
.LBB13832:
	.loc 16 191 0
	movl	$int_f0, %eax
.LVL4814:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1920, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4815:
.LBE13832:
.LBE13831:
.LBB13833:
.LBB13834:
	.loc 16 191 0
	movl	$int_f1, %eax
.LVL4816:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1928, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4817:
.LBE13834:
.LBE13833:
.LBB13835:
.LBB13836:
	.loc 16 191 0
	movl	$int_f2, %eax
.LVL4818:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1936, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4819:
.LBE13836:
.LBE13835:
.LBB13837:
.LBB13838:
	.loc 16 191 0
	movl	$int_f3, %eax
.LVL4820:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1944, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4821:
.LBE13838:
.LBE13837:
.LBB13839:
.LBB13840:
	.loc 16 191 0
	movl	$int_f4, %eax
.LVL4822:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1952, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4823:
.LBE13840:
.LBE13839:
.LBB13841:
.LBB13842:
	.loc 16 191 0
	movl	$int_f5, %eax
.LVL4824:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1960, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4825:
.LBE13842:
.LBE13841:
.LBB13843:
.LBB13844:
	.loc 16 191 0
	movl	$int_f6, %eax
.LVL4826:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1968, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4827:
.LBE13844:
.LBE13843:
.LBB13845:
.LBB13846:
	.loc 16 191 0
	movl	$int_f7, %eax
.LVL4828:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1976, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4829:
.LBE13846:
.LBE13845:
.LBB13847:
.LBB13848:
	.loc 16 191 0
	movl	$int_f8, %eax
.LVL4830:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1984, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4831:
.LBE13848:
.LBE13847:
.LBB13849:
.LBB13850:
	.loc 16 191 0
	movl	$int_f9, %eax
.LVL4832:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+1992, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4833:
.LBE13850:
.LBE13849:
.LBB13851:
.LBB13852:
	.loc 16 191 0
	movl	$int_fa, %eax
.LVL4834:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+2000, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4835:
.LBE13852:
.LBE13851:
.LBB13853:
.LBB13854:
	.loc 16 191 0
	movl	$int_fb, %eax
.LVL4836:
	.loc 16 198 0
	movl	$3, %ecx
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+2008, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4837:
.LBE13854:
.LBE13853:
.LBB13855:
.LBB13856:
	.loc 16 191 0
	movl	$int_fc, %eax
.LVL4838:
.LBE13856:
.LBE13855:
.LBB13859:
.LBB13860:
	.loc 16 198 0
	movl	$3, %ecx
.LBE13860:
.LBE13859:
.LBB13862:
.LBB13857:
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, x86KSidt+2020
.LVL4839:
.LBE13857:
.LBE13862:
.LBB13863:
.LBB13864:
	.loc 16 191 0
	movl	$int_fd, %eax
.LVL4840:
.LBE13864:
.LBE13863:
.LBB13867:
.LBB13858:
	.loc 16 198 0
	movl	%edx, x86KSidt+2016
.LBE13858:
.LBE13867:
.LBB13868:
.LBB13865:
	movzwl	%ax, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	orl	$524288, %edx
	movl	%eax, x86KSidt+2028
.LVL4841:
.LBE13865:
.LBE13868:
.LBB13869:
.LBB13870:
	.loc 16 191 0
	movl	$int_fe, %eax
.LVL4842:
.LBE13870:
.LBE13869:
.LBB13872:
.LBB13866:
	.loc 16 198 0
	movl	%edx, x86KSidt+2024
.LBE13866:
.LBE13872:
.LBB13873:
.LBB13871:
	movzwl	%ax, %edx
	orl	$524288, %edx
	xorw	%ax, %ax
	orb	$238, %ah
	movl	%edx, x86KSidt+2032
	movl	%eax, x86KSidt+2036
.LVL4843:
.LBE13871:
.LBE13873:
.LBB13874:
.LBB13861:
	.loc 16 191 0
	movl	$int_ff, %eax
.LVL4844:
	.loc 16 198 0
	movl	%eax, %edx
	movzwl	%ax, %eax
	movl	%eax, (%esp)
	shrl	$16, %edx
	movl	$x86KSidt+2040, %eax
	call	idt_entry_interrupt_gate_new.constprop.322
.LVL4845:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	$1, %eax
.L3656:
.LBE13861:
.LBE13874:
.LBE13318:
.LBE13317:
.LBE13316:
.LBE13315:
	.loc 20 500 0
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE537:
	.size	init_vm_state, .-init_vm_state
.LCOLDE654:
.LHOTE654:
	.section	.rodata.str1.1
.LC655:
	.string	"ACPI: RSDP paddr=%p\n"
.LC656:
	.string	"ACPI: RSDP vaddr=%p\n"
	.section	.rodata.str1.4
	.align 4
.LC657:
	.string	"BIOS: No ACPI support detected\n"
	.section	.boot.text
.LCOLDB658:
.LHOTB658:
	.p2align 4,,15
	.globl	acpi_init
	.type	acpi_init, @function
acpi_init:
.LFB842:
	.loc 67 234 0
	.cfi_startproc
.LVL4846:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
.LBB13881:
.LBB13882:
	.loc 67 183 0
	movl	$917504, %ebx
.LBE13882:
.LBE13881:
	.loc 67 234 0
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	.loc 67 234 0
	movl	16(%esp), %esi
.LVL4847:
	.p2align 4,,10
	.p2align 3
.L3666:
	movl	$82, %edx
	xorl	%eax, %eax
	jmp	.L3673
.LVL4848:
	.p2align 4,,10
	.p2align 3
.L3669:
	movzbl	acpi_str_rsd(%eax), %edx
.LVL4849:
.L3673:
.LBB13889:
.LBB13887:
.LBB13883:
.LBB13884:
	.loc 66 95 0
	cmpb	%dl, (%ebx,%eax)
	jne	.L3667
	testb	%dl, %dl
	je	.L3668
	.loc 66 93 0
	addl	$1, %eax
.LVL4850:
	cmpl	$8, %eax
	jne	.L3669
.LVL4851:
.L3668:
	leal	20(%ebx), %ecx
.LBE13884:
.LBE13883:
.LBE13887:
.LBE13889:
	.loc 67 234 0
	movl	%ebx, %eax
.LVL4852:
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L3670:
.LVL4853:
.LBB13890:
.LBB13888:
.LBB13885:
.LBB13886:
	.loc 67 171 0
	addb	(%eax), %dl
.LVL4854:
	.loc 67 172 0
	addl	$1, %eax
.LVL4855:
	.loc 67 170 0
	cmpl	%ecx, %eax
	jne	.L3670
.LVL4856:
.LBE13886:
.LBE13885:
	.loc 67 185 0
	testb	%dl, %dl
	je	.L3671
.L3667:
	.loc 67 183 0
	addl	$16, %ebx
.LVL4857:
	cmpl	$1048576, %ebx
	jne	.L3666
.LVL4858:
.LBE13888:
.LBE13890:
	.loc 67 238 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC657
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL4859:
	.loc 67 250 0
	addl	$20, %esp
	.cfi_def_cfa_offset 12
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL4860:
.L3671:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -12
	.cfi_offset 6, -8
	.loc 67 241 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	pushl	%ebx
	.cfi_def_cfa_offset 28
	pushl	$.LC655
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL4861:
	.loc 67 242 0
	xorl	%edx, %edx
	movl	%ebx, %eax
	call	acpi_table_init
.LVL4862:
	movl	%eax, %ebx
.LVL4863:
	.loc 67 243 0
	popl	%eax
	.cfi_def_cfa_offset 28
.LVL4864:
	popl	%edx
	.cfi_def_cfa_offset 24
	pushl	%ebx
	.cfi_def_cfa_offset 28
	pushl	$.LC656
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL4865:
	.loc 67 246 0
	movl	(%ebx), %eax
	movl	%eax, (%esi)
	movl	4(%ebx), %eax
	movl	%eax, 4(%esi)
	movl	8(%ebx), %eax
	movl	%eax, 8(%esi)
	movl	12(%ebx), %eax
	movl	%eax, 12(%esi)
	movl	16(%ebx), %eax
	movl	%eax, 16(%esi)
	movl	20(%ebx), %eax
	movl	%eax, 20(%esi)
	movl	24(%ebx), %eax
	movl	%eax, 24(%esi)
	movl	28(%ebx), %eax
	movl	%eax, 28(%esi)
	movl	32(%ebx), %eax
	movl	%eax, 32(%esi)
	.loc 67 249 0
	movl	%esi, 32(%esp)
	.loc 67 250 0
	addl	$20, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL4866:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	.loc 67 249 0
	jmp	acpi_validate_rsdp
.LVL4867:
	.cfi_endproc
.LFE842:
	.size	acpi_init, .-acpi_init
.LCOLDE658:
.LHOTE658:
	.section	.rodata.str1.4
	.align 4
.LC659:
	.string	"acpi_rsdt_mapped->header.length >= sizeof(acpi_header_t)"
	.section	.rodata.str1.1
.LC660:
	.string	"ACPI: MADT paddr=%p\n"
.LC661:
	.string	"ACPI: MADT vaddr=%p\n"
.LC662:
	.string	"ACPI: MADT apic_addr=0x%x\n"
.LC663:
	.string	"ACPI: MADT flags=0x%x\n"
.LC664:
	.string	"ACPI: MADT_APIC apic_id=0x%x\n"
	.section	.rodata.str1.4
	.align 4
.LC665:
	.string	"ACPI: Not recording this APIC, only support %d\n"
	.align 4
.LC666:
	.string	"ACPI: MADT_x2APIC apic_id=0x%x\n"
	.align 4
.LC667:
	.string	"ACPI: MADT_IOAPIC ioapic_id=%d ioapic_addr=0x%x gsib=%d\n"
	.align 4
.LC668:
	.string	"ACPI: Not recording this IOAPIC, only support %d\n"
	.align 4
.LC669:
	.string	"ACPI: MADT_ISO bus=%d source=%d gsi=%d flags=0x%x\n"
	.section	.rodata.str1.1
.LC670:
	.string	"ACPI: %d CPU(s) detected\n"
	.section	.boot.text
.LCOLDB671:
.LHOTB671:
	.p2align 4,,15
	.globl	acpi_madt_scan
	.type	acpi_madt_scan, @function
acpi_madt_scan:
.LFB844:
	.loc 67 285 0
	.cfi_startproc
.LVL4868:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	.loc 67 294 0
	movl	$1, %edx
	.loc 67 285 0
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 67 294 0
	movl	48(%esp), %eax
	.loc 67 285 0
	movl	56(%esp), %edi
	.loc 67 294 0
	movl	16(%eax), %eax
	call	acpi_table_init
.LVL4869:
	.loc 67 297 0
	movl	$0, (%edi)
	.loc 67 299 0
	movl	4(%eax), %edx
	cmpl	$35, %edx
	jbe	.L3709
	.loc 67 301 0
	subl	$36, %edx
.LVL4870:
	.loc 67 302 0
	shrl	$2, %edx
.LVL4871:
	je	.L3695
	leal	36(%eax), %esi
	movl	$0, 8(%esp)
	leal	36(%eax,%edx,4), %eax
.LVL4872:
	movl	%eax, 4(%esp)
.LVL4873:
	.p2align 4,,10
	.p2align 3
.L3694:
	.loc 67 303 0
	movl	(%esi), %ebx
.LVL4874:
	.loc 67 304 0
	movl	$1, %edx
	movl	%ebx, %eax
	call	acpi_table_init
.LVL4875:
	.loc 67 306 0
	movl	$65, %ecx
	.loc 67 304 0
	movl	%eax, %ebp
.LVL4876:
.LBB13891:
.LBB13892:
	.loc 66 93 0
	xorl	%eax, %eax
.LVL4877:
	.loc 66 95 0
	cmpb	%cl, 0(%ebp,%eax)
	jne	.L3682
.LVL4878:
.L3710:
	testb	%cl, %cl
	je	.L3683
	.loc 66 93 0
	addl	$1, %eax
.LVL4879:
	cmpl	$4, %eax
	je	.L3683
	movzbl	acpi_str_apic(%eax), %ecx
.LVL4880:
	.loc 66 95 0
	cmpb	%cl, 0(%ebp,%eax)
	je	.L3710
.LVL4881:
	.p2align 4,,10
	.p2align 3
.L3682:
	addl	$4, %esi
.LBE13892:
.LBE13891:
	.loc 67 302 0 discriminator 2
	cmpl	%esi, 4(%esp)
	jne	.L3694
.LVL4882:
.L3681:
	.loc 67 381 0
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	movl	16(%esp), %edi
	pushl	%edi
	.cfi_def_cfa_offset 60
	pushl	$.LC670
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL4883:
	.loc 67 384 0
	addl	$44, %esp
	.cfi_def_cfa_offset 20
	movl	%edi, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL4884:
	.p2align 4,,10
	.p2align 3
.L3683:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -20
	.cfi_offset 5, -8
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.loc 67 307 0
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	%ebx
	.cfi_def_cfa_offset 60
	pushl	$.LC660
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL4885:
	.loc 67 308 0
	popl	%eax
	.cfi_def_cfa_offset 60
	popl	%edx
	.cfi_def_cfa_offset 56
	pushl	%ebp
	.cfi_def_cfa_offset 60
	pushl	$.LC661
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL4886:
	.loc 67 309 0
	popl	%ecx
	.cfi_def_cfa_offset 60
	popl	%ebx
	.cfi_def_cfa_offset 56
.LVL4887:
	pushl	36(%ebp)
	.cfi_def_cfa_offset 60
	pushl	$.LC662
	.cfi_def_cfa_offset 64
	.loc 67 312 0
	leal	44(%ebp), %ebx
	.loc 67 309 0
	call	kprintf
.LVL4888:
	.loc 67 310 0
	popl	%eax
	.cfi_def_cfa_offset 60
	popl	%edx
	.cfi_def_cfa_offset 56
	pushl	40(%ebp)
	.cfi_def_cfa_offset 60
	pushl	$.LC663
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL4889:
	.loc 67 314 0
	movl	4(%ebp), %ecx
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	leal	0(%ebp,%ecx), %eax
	cmpl	%eax, %ebx
	jb	.L3693
	jmp	.L3682
	.p2align 4,,10
	.p2align 3
.L3712:
	.loc 67 315 0
	jb	.L3687
	cmpb	$2, %al
	je	.L3688
	cmpb	$9, %al
	jne	.L3685
.LVL4890:
.LBB13893:
	.loc 67 341 0
	cmpl	$1, 8(%ebx)
	je	.L3711
.LVL4891:
	.p2align 4,,10
	.p2align 3
.L3685:
.LBE13893:
	.loc 67 376 0
	movzbl	1(%ebx), %eax
	addl	%eax, %ebx
.LVL4892:
	.loc 67 314 0
	leal	0(%ebp,%ecx), %eax
	cmpl	%eax, %ebx
	jnb	.L3682
.L3693:
	.loc 67 315 0
	movzbl	(%ebx), %eax
	cmpb	$1, %al
	jne	.L3712
	.loc 67 353 0
	pushl	8(%ebx)
	.cfi_def_cfa_offset 52
	pushl	4(%ebx)
	.cfi_def_cfa_offset 56
	movzbl	2(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 60
	pushl	$.LC667
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL4893:
	.loc 67 359 0
	movl	(%edi), %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	cmpl	$1, %eax
	je	.L3713
	.loc 67 362 0
	movl	4(%ebx), %edx
	movl	60(%esp), %ecx
	movl	%edx, (%ecx,%eax,4)
	.loc 67 363 0
	addl	$1, %eax
	movl	%eax, (%edi)
	movl	4(%ebp), %ecx
	jmp	.L3685
	.p2align 4,,10
	.p2align 3
.L3688:
	.loc 67 367 0
	movzwl	8(%ebx), %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	%eax
	.cfi_def_cfa_offset 64
	pushl	4(%ebx)
	.cfi_def_cfa_offset 68
	movzbl	3(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 72
	movzbl	2(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 76
	pushl	$.LC669
	.cfi_def_cfa_offset 80
	call	kprintf
.LVL4894:
	.loc 67 372 0
	addl	$32, %esp
	.cfi_def_cfa_offset 48
	movl	4(%ebp), %ecx
	jmp	.L3685
	.p2align 4,,10
	.p2align 3
.L3687:
.LVL4895:
.LBB13894:
	.loc 67 327 0
	cmpl	$1, 4(%ebx)
	jne	.L3685
	.loc 67 328 0
	movzbl	3(%ebx), %edx
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	%edx
	.cfi_def_cfa_offset 60
.LVL4896:
	movl	%edx, 24(%esp)
	pushl	$.LC664
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL4897:
	.loc 67 329 0
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movl	12(%esp), %edx
	cmpl	$1, 8(%esp)
	je	.L3691
	.loc 67 332 0
	movl	8(%esp), %eax
	movl	52(%esp), %ecx
	movl	%edx, (%ecx,%eax,4)
	.loc 67 333 0
	addl	$1, %eax
	movl	4(%ebp), %ecx
	movl	%eax, 8(%esp)
.LVL4898:
	jmp	.L3685
.LVL4899:
	.p2align 4,,10
	.p2align 3
.L3711:
.LBE13894:
.LBB13895:
	.loc 67 339 0
	movl	4(%ebx), %edx
	.loc 67 342 0
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	%edx
	.cfi_def_cfa_offset 60
.LVL4900:
	movl	%edx, 24(%esp)
	pushl	$.LC666
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL4901:
	.loc 67 343 0
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movl	8(%esp), %eax
	cmpl	$1, %eax
	je	.L3691
	.loc 67 346 0
	movl	52(%esp), %ecx
	movl	12(%esp), %edx
	movl	%edx, (%ecx,%eax,4)
	.loc 67 347 0
	addl	$1, %eax
	movl	4(%ebp), %ecx
	movl	%eax, 8(%esp)
.LVL4902:
	jmp	.L3685
.LVL4903:
	.p2align 4,,10
	.p2align 3
.L3713:
.LBE13895:
	.loc 67 360 0
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	$1
	.cfi_def_cfa_offset 60
	pushl	$.LC668
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL4904:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movl	4(%ebp), %ecx
	jmp	.L3685
.L3691:
.LBB13896:
	.loc 67 330 0
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	$1
	.cfi_def_cfa_offset 60
	pushl	$.LC665
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL4905:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movl	4(%ebp), %ecx
	movl	$1, 8(%esp)
.LVL4906:
	jmp	.L3685
.LVL4907:
.L3695:
.LBE13896:
	.loc 67 296 0
	movl	$0, 8(%esp)
	jmp	.L3681
.LVL4908:
.L3709:
	.loc 67 299 0 discriminator 1
	pushl	$__FUNCTION__.9832
	.cfi_def_cfa_offset 52
	pushl	$299
	.cfi_def_cfa_offset 56
	pushl	$.LC512
	.cfi_def_cfa_offset 60
	pushl	$.LC659
	.cfi_def_cfa_offset 64
	call	_assert_fail
.LVL4909:
	.cfi_endproc
.LFE844:
	.size	acpi_madt_scan, .-acpi_madt_scan
.LCOLDE671:
.LHOTE671:
	.section	.rodata.str1.1
.LC672:
	.string	"ACPI: FADT paddr=%p\n"
.LC673:
	.string	"ACPI: FADT vaddr=%p\n"
.LC674:
	.string	"ACPI: FADT flags=0x%x\n"
	.section	.boot.text
.LCOLDB675:
.LHOTB675:
	.p2align 4,,15
	.globl	acpi_fadt_scan
	.type	acpi_fadt_scan, @function
acpi_fadt_scan:
.LFB845:
	.loc 67 390 0
	.cfi_startproc
.LVL4910:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	.loc 67 397 0
	movl	$1, %edx
	.loc 67 390 0
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	.loc 67 397 0
	movl	32(%esp), %eax
	movl	16(%eax), %eax
	call	acpi_table_init
.LVL4911:
	.loc 67 399 0
	movl	4(%eax), %edx
	cmpl	$35, %edx
	jbe	.L3731
	.loc 67 401 0
	subl	$36, %edx
.LVL4912:
	.loc 67 402 0
	shrl	$2, %edx
.LVL4913:
	je	.L3729
	leal	36(%eax), %ebx
	leal	36(%eax,%edx,4), %esi
.LVL4914:
	.p2align 4,,10
	.p2align 3
.L3720:
	.loc 67 403 0
	movl	(%ebx), %edi
.LVL4915:
	.loc 67 404 0
	movl	$1, %edx
	movl	%edi, %eax
	call	acpi_table_init
.LVL4916:
	.loc 67 406 0
	movl	$70, %edx
	.loc 67 404 0
	movl	%eax, %ebp
.LVL4917:
.LBB13897:
.LBB13898:
	.loc 66 93 0
	xorl	%eax, %eax
.LVL4918:
	.loc 66 95 0
	cmpb	%dl, 0(%ebp,%eax)
	jne	.L3717
.LVL4919:
.L3732:
	testb	%dl, %dl
	je	.L3718
	.loc 66 93 0
	addl	$1, %eax
.LVL4920:
	cmpl	$4, %eax
	je	.L3718
	movzbl	acpi_str_fadt(%eax), %edx
.LVL4921:
	.loc 66 95 0
	cmpb	%dl, 0(%ebp,%eax)
	je	.L3732
.LVL4922:
.L3717:
	addl	$4, %ebx
.LBE13898:
.LBE13897:
	.loc 67 402 0 discriminator 2
	cmpl	%ebx, %esi
	jne	.L3720
.LVL4923:
.L3729:
	.loc 67 420 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	$1, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL4924:
	.p2align 4,,10
	.p2align 3
.L3718:
	.cfi_restore_state
	.loc 67 407 0
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	addl	$4, %ebx
	pushl	%edi
	.cfi_def_cfa_offset 44
	pushl	$.LC672
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL4925:
	.loc 67 408 0
	popl	%eax
	.cfi_def_cfa_offset 44
	popl	%edx
	.cfi_def_cfa_offset 40
	pushl	%ebp
	.cfi_def_cfa_offset 44
	pushl	$.LC673
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL4926:
	.loc 67 409 0
	popl	%ecx
	.cfi_def_cfa_offset 44
	popl	%edi
	.cfi_def_cfa_offset 40
.LVL4927:
	pushl	112(%ebp)
	.cfi_def_cfa_offset 44
	pushl	$.LC674
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL4928:
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 67 402 0
	cmpl	%ebx, %esi
	jne	.L3720
	jmp	.L3729
.LVL4929:
.L3731:
	.loc 67 399 0 discriminator 1
	pushl	$__FUNCTION__.9857
	.cfi_def_cfa_offset 36
	pushl	$399
	.cfi_def_cfa_offset 40
	pushl	$.LC512
	.cfi_def_cfa_offset 44
	pushl	$.LC659
	.cfi_def_cfa_offset 48
	call	_assert_fail
.LVL4930:
	.cfi_endproc
.LFE845:
	.size	acpi_fadt_scan, .-acpi_fadt_scan
.LCOLDE675:
.LHOTE675:
	.section	.rodata.str1.1
.LC676:
	.string	"ACPI: DMAR paddr=%p\n"
.LC677:
	.string	"ACPI: DMAR vaddr=%p\n"
	.section	.rodata.str1.4
	.align 4
.LC678:
	.string	"ACPI: IOMMU host address width: %d\n"
	.align 4
.LC679:
	.string	"ACPI: too many IOMMUs, disabling IOMMU support\n"
	.align 4
.LC680:
	.string	"ACPI: DMAR_DRHD reg_base exceeds 32 bit, disabling IOMMU support\n"
	.align 4
.LC681:
	.string	"ACPI: RMRR device scope: non-PCI-Endpoint-Devices not supported yet, disabling IOMMU support\n"
	.align 4
.LC682:
	.string	"ACPI: RMRR device scope: devices behind bridges not supported yet, disabling IOMMU support\n"
	.align 4
.LC683:
	.string	"ACPI: RMRR device above 4GiB, disabling IOMMU support\n"
	.align 4
.LC684:
	.string	"ACPI: Too many RMRR entries, disabling IOMMU support\n"
	.align 4
.LC685:
	.string	"\tACPI: registering RMRR entry for region for device: bus=0x%x dev=0x%x fun=0x%x\n"
	.align 4
.LC686:
	.string	"ACPI: Unknown DMA remapping structure type: %x\n"
	.section	.rodata.str1.1
.LC687:
	.string	"ACPI: %d IOMMUs detected\n"
	.section	.boot.text
.LCOLDB688:
.LHOTB688:
	.p2align 4,,15
	.globl	acpi_dmar_scan
	.type	acpi_dmar_scan, @function
acpi_dmar_scan:
.LFB846:
	.loc 67 430 0
	.cfi_startproc
.LVL4931:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	.loc 67 446 0
	movl	$1, %edx
	.loc 67 430 0
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$60, %esp
	.cfi_def_cfa_offset 80
	.loc 67 430 0
	movl	84(%esp), %eax
	movl	%eax, 40(%esp)
	movl	88(%esp), %eax
	movl	%eax, %edi
	movl	%eax, 28(%esp)
	movl	92(%esp), %eax
	movl	%eax, 36(%esp)
	movl	96(%esp), %eax
	movl	%eax, 44(%esp)
	.loc 67 446 0
	movl	80(%esp), %eax
	movl	16(%eax), %eax
	call	acpi_table_init
.LVL4932:
	.loc 67 448 0
	movl	$0, (%edi)
.LVL4933:
	.loc 67 451 0
	movl	4(%eax), %edx
	cmpl	$35, %edx
	jbe	.L3770
	.loc 67 452 0
	subl	$36, %edx
.LVL4934:
	.loc 67 453 0
	shrl	$2, %edx
.LVL4935:
	je	.L3757
	leal	36(%eax), %edi
	xorl	%ebp, %ebp
	leal	36(%eax,%edx,4), %eax
.LVL4936:
	movl	%edi, 20(%esp)
	movl	%eax, 32(%esp)
	movl	%ebp, 8(%esp)
.LVL4937:
.L3756:
	.loc 67 454 0
	movl	20(%esp), %eax
	.loc 67 455 0
	movl	$1, %edx
	.loc 67 454 0
	movl	(%eax), %ebx
.LVL4938:
	.loc 67 455 0
	movl	%ebx, %eax
	call	acpi_table_init
.LVL4939:
	.loc 67 457 0
	movl	$68, %edx
	.loc 67 455 0
	movl	%eax, %ecx
	movl	%eax, 24(%esp)
.LVL4940:
.LBB13899:
.LBB13900:
	.loc 66 93 0
	xorl	%eax, %eax
.LVL4941:
	.loc 66 95 0
	cmpb	%dl, (%ecx,%eax)
	jne	.L3736
.LVL4942:
.L3771:
	testb	%dl, %dl
	je	.L3737
	.loc 66 93 0
	addl	$1, %eax
.LVL4943:
	cmpl	$4, %eax
	je	.L3737
	movzbl	acpi_str_dmar(%eax), %edx
.LVL4944:
	.loc 66 95 0
	cmpb	%dl, (%ecx,%eax)
	je	.L3771
.LVL4945:
.L3736:
	addl	$4, 20(%esp)
	movl	20(%esp), %eax
.LBE13900:
.LBE13899:
	.loc 67 453 0 discriminator 2
	cmpl	%eax, 32(%esp)
	jne	.L3756
	movl	8(%esp), %ebp
.LVL4946:
.L3735:
	.loc 67 549 0
	movl	44(%esp), %eax
	movl	%ebp, 384(%eax)
	.loc 67 550 0
	movl	28(%esp), %eax
	movl	(%eax), %eax
	movl	$.LC687, 80(%esp)
	movl	%eax, 84(%esp)
	.loc 67 551 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 67 550 0
	jmp	kprintf
.LVL4947:
	.p2align 4,,10
	.p2align 3
.L3737:
	.cfi_restore_state
	.loc 67 458 0
	subl	$8, %esp
	.cfi_def_cfa_offset 88
	pushl	%ebx
	.cfi_def_cfa_offset 92
	pushl	$.LC676
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL4948:
	.loc 67 459 0
	popl	%ebx
	.cfi_def_cfa_offset 92
.LVL4949:
	popl	%esi
	.cfi_def_cfa_offset 88
	movl	32(%esp), %edi
	pushl	%edi
	.cfi_def_cfa_offset 92
	pushl	$.LC677
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL4950:
	.loc 67 460 0
	popl	%ebp
	.cfi_def_cfa_offset 92
	.loc 67 461 0
	leal	48(%edi), %ebp
	.loc 67 460 0
	popl	%eax
	.cfi_def_cfa_offset 88
	movzbl	36(%edi), %eax
	addl	$1, %eax
	pushl	%eax
	.cfi_def_cfa_offset 92
	pushl	$.LC678
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL4951:
	.loc 67 463 0
	movl	4(%edi), %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 80
	leal	(%edi,%eax), %edx
	cmpl	%edx, %ebp
	jnb	.L3736
	.loc 67 464 0
	movzwl	0(%ebp), %edx
	cmpw	$1, %dx
	je	.L3740
.L3772:
	jb	.L3741
	cmpw	$2, %dx
	jne	.L3766
	movzwl	2(%ebp), %edx
.L3743:
	.loc 67 463 0
	movl	24(%esp), %edi
	.loc 67 545 0
	addl	%edx, %ebp
.LVL4952:
	.loc 67 463 0
	leal	(%edi,%eax), %edx
	cmpl	%edx, %ebp
	jnb	.L3736
	.loc 67 464 0
	movzwl	0(%ebp), %edx
	cmpw	$1, %dx
	jne	.L3772
.L3740:
.LVL4953:
	.loc 67 489 0
	movl	12(%ebp), %edx
	testl	%edx, %edx
	jne	.L3747
	.loc 67 489 0 is_stmt 0 discriminator 1
	movl	20(%ebp), %eax
	testl	%eax, %eax
	jne	.L3747
.LVL4954:
	.loc 67 499 0 is_stmt 1 discriminator 1
	cmpb	$1, 24(%ebp)
	.loc 67 497 0 discriminator 1
	leal	24(%ebp), %ebx
.LVL4955:
	.loc 67 499 0 discriminator 1
	jne	.L3750
	.loc 67 506 0
	cmpb	$8, 25(%ebp)
	ja	.L3751
	movl	8(%esp), %eax
	movl	44(%esp), %edi
	movl	%eax, 16(%esp)
	leal	(%eax,%eax,2), %eax
	leal	(%edi,%eax,4), %edi
	jmp	.L3752
.LVL4956:
	.p2align 4,,10
	.p2align 3
.L3753:
	.loc 67 525 0 discriminator 2
	pushl	%eax
	.cfi_def_cfa_offset 84
	pushl	%ecx
	.cfi_def_cfa_offset 88
	pushl	%edx
	.cfi_def_cfa_offset 92
	pushl	$.LC685
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL4957:
	.loc 67 532 0 discriminator 2
	movl	8(%ebp), %eax
	.loc 67 531 0 discriminator 2
	movl	%esi, (%edi)
	.loc 67 496 0 discriminator 2
	movzwl	2(%ebp), %edx
	.loc 67 534 0 discriminator 2
	addl	$1, 24(%esp)
.LVL4958:
	movl	24(%esp), %ecx
.LVL4959:
	.loc 67 496 0 discriminator 2
	subl	32(%esp), %ecx
.LVL4960:
	addl	$16, %esp
	.cfi_def_cfa_offset 80
	.loc 67 532 0 discriminator 2
	movl	%eax, 4(%edi)
	.loc 67 533 0 discriminator 2
	movl	16(%ebp), %eax
	movl	%eax, 8(%edi)
	.loc 67 496 0 discriminator 2
	leal	-32(%edx), %eax
	shrl	$3, %eax
	cmpl	%ecx, %eax
	jb	.L3768
	.loc 67 497 0
	addl	$8, %ebx
.LVL4961:
	.loc 67 499 0
	cmpb	$1, (%ebx)
	jne	.L3750
	addl	$12, %edi
	.loc 67 506 0
	cmpb	$8, 1(%ebx)
	ja	.L3751
.LVL4962:
.L3752:
	.loc 67 514 0
	movzbl	5(%ebx), %edx
	movzbl	6(%ebx), %ecx
	movzbl	7(%ebx), %eax
	.loc 67 513 0
	movl	%edx, %esi
	sall	$8, %esi
	movl	%esi, 12(%esp)
	leal	0(,%ecx,8), %esi
	orl	12(%esp), %esi
	orl	%eax, %esi
.LVL4963:
	.loc 67 520 0
	cmpl	$32, 8(%esp)
	jne	.L3753
	.loc 67 521 0
	subl	$12, %esp
	.cfi_def_cfa_offset 92
	pushl	$.LC684
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL4964:
	.loc 67 522 0
	movl	44(%esp), %eax
	.loc 67 523 0
	addl	$16, %esp
	.cfi_def_cfa_offset 80
	.loc 67 522 0
	movl	$0, (%eax)
.LVL4965:
.L3733:
	.loc 67 551 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL4966:
	ret
.LVL4967:
	.p2align 4,,10
	.p2align 3
.L3766:
	.cfi_restore_state
	.loc 67 543 0
	subl	$8, %esp
	.cfi_def_cfa_offset 88
	pushl	%edx
	.cfi_def_cfa_offset 92
	pushl	$.LC686
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL4968:
	movzwl	2(%ebp), %edx
	addl	$16, %esp
	.cfi_def_cfa_offset 80
.L3768:
	movl	24(%esp), %eax
	movl	4(%eax), %eax
	jmp	.L3743
	.p2align 4,,10
	.p2align 3
.L3741:
	.loc 67 467 0
	movl	28(%esp), %eax
	movl	(%eax), %eax
	cmpl	36(%esp), %eax
	je	.L3773
	.loc 67 476 0
	movl	12(%ebp), %ecx
	.loc 67 473 0
	movl	8(%ebp), %edx
.LVL4969:
	.loc 67 476 0
	testl	%ecx, %ecx
	jne	.L3774
	.loc 67 482 0
	movl	40(%esp), %edi
	movl	%edx, (%edi,%eax,4)
	.loc 67 483 0
	movl	28(%esp), %edi
	addl	$1, %eax
	movzwl	2(%ebp), %edx
.LVL4970:
	movl	%eax, (%edi)
.LVL4971:
	movl	24(%esp), %eax
.LVL4972:
	movl	4(%eax), %eax
	.loc 67 484 0
	jmp	.L3743
.LVL4973:
	.p2align 4,,10
	.p2align 3
.L3750:
	.loc 67 501 0
	subl	$12, %esp
	.cfi_def_cfa_offset 92
	pushl	$.LC681
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL4974:
	.loc 67 502 0
	movl	44(%esp), %eax
	.loc 67 503 0
	addl	$16, %esp
	.cfi_def_cfa_offset 80
	.loc 67 502 0
	movl	$0, (%eax)
	.loc 67 551 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL4975:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL4976:
	ret
.LVL4977:
	.p2align 4,,10
	.p2align 3
.L3751:
	.cfi_restore_state
	.loc 67 508 0
	subl	$12, %esp
	.cfi_def_cfa_offset 92
	pushl	$.LC682
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL4978:
	.loc 67 509 0
	movl	44(%esp), %eax
	.loc 67 510 0
	addl	$16, %esp
	.cfi_def_cfa_offset 80
	.loc 67 509 0
	movl	$0, (%eax)
	.loc 67 551 0
	addl	$60, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL4979:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL4980:
	ret
.LVL4981:
.L3747:
	.cfi_restore_state
	.loc 67 491 0
	subl	$12, %esp
	.cfi_def_cfa_offset 92
	pushl	$.LC683
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL4982:
	.loc 67 492 0
	movl	44(%esp), %eax
	.loc 67 493 0
	addl	$16, %esp
	.cfi_def_cfa_offset 80
	.loc 67 492 0
	movl	$0, (%eax)
	.loc 67 493 0
	jmp	.L3733
.LVL4983:
.L3773:
	.loc 67 468 0
	subl	$12, %esp
	.cfi_def_cfa_offset 92
	pushl	$.LC679
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL4984:
	.loc 67 470 0
	movl	44(%esp), %eax
	.loc 67 471 0
	addl	$16, %esp
	.cfi_def_cfa_offset 80
	.loc 67 470 0
	movl	$0, (%eax)
	.loc 67 471 0
	jmp	.L3733
.LVL4985:
.L3774:
	.loc 67 477 0
	subl	$12, %esp
	.cfi_def_cfa_offset 92
	pushl	$.LC680
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL4986:
	.loc 67 479 0
	movl	44(%esp), %eax
	.loc 67 480 0
	addl	$16, %esp
	.cfi_def_cfa_offset 80
	.loc 67 479 0
	movl	$0, (%eax)
	.loc 67 480 0
	jmp	.L3733
.LVL4987:
.L3757:
	.loc 67 449 0
	xorl	%ebp, %ebp
	jmp	.L3735
.LVL4988:
.L3770:
	.loc 67 451 0 discriminator 1
	pushl	$__FUNCTION__.9881
	.cfi_def_cfa_offset 84
	pushl	$451
	.cfi_def_cfa_offset 88
	pushl	$.LC512
	.cfi_def_cfa_offset 92
	pushl	$.LC659
	.cfi_def_cfa_offset 96
	call	_assert_fail
.LVL4989:
	.cfi_endproc
.LFE846:
	.size	acpi_dmar_scan, .-acpi_dmar_scan
.LCOLDE688:
.LHOTE688:
	.section	.text.unlikely
.LCOLDB689:
	.text
.LHOTB689:
	.p2align 4,,15
	.globl	putDebugChar
	.type	putDebugChar, @function
putDebugChar:
.LFB869:
	.loc 40 48 0
	.cfi_startproc
.LVL4990:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 40 48 0
	movl	16(%esp), %ebx
	.loc 40 49 0
	jmp	.L3777
	.p2align 4,,10
	.p2align 3
.L3785:
	.loc 40 49 0 is_stmt 0 discriminator 1
	addl	$5, %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	movzwl	%ax, %eax
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	in8
.LVL4991:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testb	$32, %al
	jne	.L3784
.L3777:
	.loc 40 49 0 discriminator 2
	movzwl	x86KSdebugPort, %eax
	testw	%ax, %ax
	jne	.L3785
.L3776:
	.loc 40 50 0 is_stmt 1
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	movzbl	%bl, %ebx
	pushl	%ebx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	out8
.LVL4992:
	.loc 40 51 0
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L3784:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -8
	movzwl	x86KSdebugPort, %eax
	jmp	.L3776
	.cfi_endproc
.LFE869:
	.size	putDebugChar, .-putDebugChar
	.section	.text.unlikely
.LCOLDE689:
	.text
.LHOTE689:
	.section	.text.unlikely
.LCOLDB690:
	.text
.LHOTB690:
	.p2align 4,,15
	.type	putEncodedChar, @function
putEncodedChar:
.LFB569:
	.file 74 "/home/axjllt/Desktop/ori_refos/kernel/src/arch/x86/machine/capdl.c"
	.loc 74 65 0
	.cfi_startproc
.LVL4993:
	subl	$28, %esp
	.cfi_def_cfa_offset 32
	.loc 74 66 0
	cmpb	$-69, %al
	je	.L3788
	cmpb	$-1, %al
	je	.L3789
	cmpb	$-86, %al
	je	.L3795
	.loc 74 80 0
	cmpb	$19, %al
	jbe	.L3796
	.loc 74 84 0
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	movzbl	%al, %eax
	pushl	%eax
	.cfi_def_cfa_offset 48
	call	putDebugChar
.LVL4994:
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 74 87 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL4995:
	.p2align 4,,10
	.p2align 3
.L3795:
	.cfi_restore_state
	.loc 74 68 0
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	$170
	.cfi_def_cfa_offset 48
	call	putDebugChar
.LVL4996:
	.loc 74 69 0
	movl	$161, (%esp)
	call	putDebugChar
.LVL4997:
	.loc 74 70 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
.L3786:
	.loc 74 87 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL4998:
	.p2align 4,,10
	.p2align 3
.L3789:
	.cfi_restore_state
	.loc 74 72 0
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	$170
	.cfi_def_cfa_offset 48
	call	putDebugChar
.LVL4999:
	.loc 74 73 0
	movl	$160, (%esp)
	call	putDebugChar
.LVL5000:
	.loc 74 74 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 74 87 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL5001:
	.p2align 4,,10
	.p2align 3
.L3788:
	.cfi_restore_state
	.loc 74 76 0
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	$170
	.cfi_def_cfa_offset 48
	call	putDebugChar
.LVL5002:
	.loc 74 77 0
	movl	$162, (%esp)
	call	putDebugChar
.LVL5003:
	.loc 74 78 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 74 87 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
.LVL5004:
	.p2align 4,,10
	.p2align 3
.L3796:
	.cfi_restore_state
	movl	%eax, 12(%esp)
	.loc 74 81 0
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	$170
	.cfi_def_cfa_offset 48
	call	putDebugChar
.LVL5005:
	.loc 74 82 0
	movl	28(%esp), %eax
	addl	$20, %eax
	movzbl	%al, %eax
	movl	%eax, (%esp)
	call	putDebugChar
.LVL5006:
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	jmp	.L3786
	.cfi_endproc
.LFE569:
	.size	putEncodedChar, .-putEncodedChar
	.section	.text.unlikely
.LCOLDE690:
	.text
.LHOTE690:
	.section	.text.unlikely
.LCOLDB691:
	.text
.LHOTB691:
	.p2align 4,,15
	.type	sendCNode, @function
sendCNode:
.LFB580:
	.loc 74 246 0
	.cfi_startproc
.LVL5007:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	.loc 74 249 0
	movl	%edx, %ecx
	.loc 74 246 0
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	.loc 74 249 0
	movl	$1, %ebx
	.loc 74 246 0
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 74 249 0
	sall	%cl, %ebx
	movl	%ebx, 8(%esp)
	movl	$0, 4(%esp)
	testl	%ebx, %ebx
	je	.L3797
	movl	%eax, %esi
	jmp	.L3813
.LVL5008:
	.p2align 4,,10
	.p2align 3
.L3811:
	addl	$1, 4(%esp)
.LVL5009:
	addl	$16, %esi
	movl	4(%esp), %eax
.LVL5010:
	cmpl	8(%esp), %eax
	je	.L3797
.LVL5011:
.L3813:
.LBB13919:
	.loc 74 250 0
	movl	(%esi), %edi
.LVL5012:
.LBB13920:
.LBB13921:
	.loc 11 2202 0
	movl	%edi, %ecx
	.loc 11 2203 0
	movl	%edi, %edx
	movl	%edi, %eax
	.loc 11 2202 0
	andl	$14, %ecx
	.loc 11 2203 0
	andl	$15, %edx
	movzbl	%al, %eax
	cmpl	$14, %ecx
	cmovne	%edx, %eax
.LVL5013:
.LBE13921:
.LBE13920:
	.loc 74 251 0
	testl	%eax, %eax
	je	.L3811
.LVL5014:
.LBB13922:
.LBB13923:
.LBB13924:
.LBB13925:
.LBB13926:
	.loc 11 739 0
	movl	8(%esi), %edx
.LBE13926:
.LBE13925:
	.loc 74 115 0
	xorl	%ebx, %ebx
.LBB13928:
.LBB13927:
	.loc 11 739 0
	andl	$-8, %edx
.LBE13927:
.LBE13928:
	.loc 74 113 0
	movl	%edx, %ebp
.LVL5015:
	.loc 74 115 0
	testl	%edx, %edx
	jne	.L3814
	jmp	.L3804
.LVL5016:
	.p2align 4,,10
	.p2align 3
.L3807:
.LBB13929:
.LBB13930:
	.loc 11 739 0
	movl	8(%ebp), %ebp
.LVL5017:
.LBE13930:
.LBE13929:
	.loc 74 115 0
	andl	$-8, %ebp
.LVL5018:
	je	.L3823
.L3814:
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	%esi
	.cfi_def_cfa_offset 60
	pushl	%ebp
	.cfi_def_cfa_offset 64
	call	isMDBParentOf
.LVL5019:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	testl	%eax, %eax
	je	.L3807
	movl	%ebp, %ebx
.L3804:
.LBE13924:
.LBE13923:
.LBE13922:
	.loc 74 250 0
	movl	4(%esi), %eax
	xorl	%ebp, %ebp
.LVL5020:
	movl	%eax, 12(%esp)
.LVL5021:
.L3806:
.LBB13939:
.LBB13931:
.LBB13932:
	.loc 74 107 0
	movl	4(%esp), %eax
	movl	%ebp, %ecx
	addl	$8, %ebp
	shrl	%cl, %eax
	movzbl	%al, %eax
	call	putEncodedChar
.LVL5022:
	.loc 74 106 0
	cmpl	$32, %ebp
	jne	.L3806
	xorl	%ecx, %ecx
	movl	%ecx, %ebp
.L3808:
.LBE13932:
.LBE13931:
.LBB13933:
.LBB13934:
	.loc 74 107 0
	movl	%ebp, %ecx
	movl	%edi, %eax
	addl	$8, %ebp
	shrl	%cl, %eax
	movzbl	%al, %eax
	call	putEncodedChar
.LVL5023:
	.loc 74 106 0
	cmpl	$32, %ebp
	jne	.L3808
	movl	12(%esp), %ebp
	xorl	%edi, %edi
.LVL5024:
.L3809:
.LBE13934:
.LBE13933:
.LBB13935:
.LBB13936:
	.loc 74 107 0
	movl	%edi, %ecx
	movl	%ebp, %eax
	addl	$8, %edi
	shrl	%cl, %eax
	movzbl	%al, %eax
	call	putEncodedChar
.LVL5025:
	.loc 74 106 0
	cmpl	$32, %edi
	jne	.L3809
	xorl	%edi, %edi
.L3810:
.LBE13936:
.LBE13935:
.LBB13937:
.LBB13938:
	.loc 74 107 0
	movl	%edi, %ecx
	movl	%ebx, %eax
	addl	$8, %edi
	shrl	%cl, %eax
	movzbl	%al, %eax
	call	putEncodedChar
.LVL5026:
	.loc 74 106 0
	cmpl	$32, %edi
	jne	.L3810
	jmp	.L3811
.LVL5027:
	.p2align 4,,10
	.p2align 3
.L3823:
	movl	%eax, %ebx
	jmp	.L3804
.LVL5028:
	.p2align 4,,10
	.p2align 3
.L3797:
.LBE13938:
.LBE13937:
.LBE13939:
.LBE13919:
	.loc 74 259 0
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE580:
	.size	sendCNode, .-sendCNode
	.section	.text.unlikely
.LCOLDE691:
	.text
.LHOTE691:
	.section	.text.unlikely
.LCOLDB692:
	.text
.LHOTB692:
	.p2align 4,,15
	.globl	getDebugChar
	.type	getDebugChar, @function
getDebugChar:
.LFB870:
	.loc 40 55 0
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	.p2align 4,,10
	.p2align 3
.L3825:
	.loc 40 56 0 discriminator 1
	movzwl	x86KSdebugPort, %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	addl	$5, %eax
	movzwl	%ax, %eax
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	in8
.LVL5029:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testb	$1, %al
	je	.L3825
	.loc 40 57 0
	movzwl	x86KSdebugPort, %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	in8
.LVL5030:
	.loc 40 58 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE870:
	.size	getDebugChar, .-getDebugChar
	.section	.text.unlikely
.LCOLDE692:
	.text
.LHOTE692:
	.section	.text.unlikely
.LCOLDB693:
	.text
.LHOTB693:
	.p2align 4,,15
	.type	getDecodedChar, @function
getDecodedChar:
.LFB568:
	.loc 74 29 0
	.cfi_startproc
.LVL5031:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	%eax, %ebx
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 74 31 0
	call	getDebugChar
.LVL5032:
	.loc 74 32 0
	cmpb	$-1, %al
	je	.L3833
	.loc 74 35 0
	cmpb	$-86, %al
	je	.L3844
.LVL5033:
.L3832:
	.loc 74 59 0
	movb	%al, (%ebx)
	.loc 74 60 0
	xorl	%eax, %eax
.L3831:
	.loc 74 62 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL5034:
	ret
.LVL5035:
	.p2align 4,,10
	.p2align 3
.L3844:
	.cfi_restore_state
.LBB13942:
.LBB13943:
	.loc 74 36 0
	call	getDebugChar
.LVL5036:
	.loc 74 37 0
	cmpb	$-1, %al
	je	.L3833
	.loc 74 40 0
	cmpb	$-95, %al
	je	.L3835
	cmpb	$-94, %al
	je	.L3836
	cmpb	$-96, %al
	je	.L3845
	.loc 74 51 0
	subl	$20, %eax
.LVL5037:
	cmpb	$19, %al
	jbe	.L3832
.LVL5038:
.L3833:
.LBE13943:
.LBE13942:
	.loc 74 62 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	.loc 74 33 0
	movl	$1, %eax
	.loc 74 62 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL5039:
	ret
.LVL5040:
	.p2align 4,,10
	.p2align 3
.L3836:
	.cfi_restore_state
.LBB13945:
.LBB13944:
	.loc 74 48 0
	movb	$-69, (%ebx)
	.loc 74 57 0
	xorl	%eax, %eax
.LVL5041:
	jmp	.L3831
.LVL5042:
	.p2align 4,,10
	.p2align 3
.L3835:
	.loc 74 42 0
	movb	$-86, (%ebx)
	.loc 74 57 0
	xorl	%eax, %eax
.LVL5043:
	jmp	.L3831
.LVL5044:
	.p2align 4,,10
	.p2align 3
.L3845:
	.loc 74 45 0
	movb	$-1, (%ebx)
	.loc 74 57 0
	xorl	%eax, %eax
.LVL5045:
	jmp	.L3831
.LBE13944:
.LBE13945:
	.cfi_endproc
.LFE568:
	.size	getDecodedChar, .-getDecodedChar
	.section	.text.unlikely
.LCOLDE693:
	.text
.LHOTE693:
	.section	.text.unlikely
.LCOLDB694:
	.text
.LHOTB694:
	.p2align 4,,15
	.type	getArg, @function
getArg:
.LFB570:
	.loc 74 90 0
	.cfi_startproc
.LVL5046:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	movl	%eax, %esi
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	.loc 74 93 0
	movl	$4, %ebx
	.loc 74 90 0
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 74 93 0
	movl	$0, (%eax)
.LVL5047:
.L3848:
	.loc 74 95 0
	leal	15(%esp), %eax
	call	getDecodedChar
.LVL5048:
	testl	%eax, %eax
	jne	.L3849
	.loc 74 98 0 discriminator 2
	movl	(%esi), %ecx
	movzbl	15(%esp), %edx
	sall	$8, %ecx
	orl	%ecx, %edx
	.loc 74 94 0 discriminator 2
	subl	$1, %ebx
.LVL5049:
	.loc 74 98 0 discriminator 2
	movl	%edx, (%esi)
.LVL5050:
	.loc 74 94 0 discriminator 2
	jne	.L3848
	.loc 74 101 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL5051:
	ret
.LVL5052:
	.p2align 4,,10
	.p2align 3
.L3849:
	.cfi_restore_state
	addl	$20, %esp
	.cfi_def_cfa_offset 12
	.loc 74 96 0
	movl	$1, %eax
	.loc 74 101 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL5053:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
.LVL5054:
	ret
	.cfi_endproc
.LFE570:
	.size	getArg, .-getArg
	.section	.text.unlikely
.LCOLDE694:
	.text
.LHOTE694:
	.section	.text.unlikely
.LCOLDB695:
	.text
.LHOTB695:
	.p2align 4,,15
	.globl	capDL
	.type	capDL, @function
capDL:
.LFB583:
	.loc 74 273 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
.L3854:
.LBB14051:
	.loc 74 279 0 discriminator 1
	call	getDebugChar
.LVL5055:
	movb	%al, 23(%esp)
	.loc 74 280 0 discriminator 1
	cmpb	$-1, %al
	jne	.L3854
.L3923:
.LVL5056:
	.loc 74 282 0
	leal	23(%esp), %eax
	call	getDecodedChar
.LVL5057:
	.loc 74 283 0
	testl	%eax, %eax
	jne	.L3923
	.loc 74 286 0
	movzbl	23(%esp), %eax
.LVL5058:
	addl	$16, %eax
	cmpb	$10, %al
	ja	.L3854
	movzbl	%al, %eax
	jmp	*.L3858(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L3858:
	.long	.L3857
	.long	.L3859
	.long	.L3860
	.long	.L3861
	.long	.L3862
	.long	.L3863
	.long	.L3864
	.long	.L3865
	.long	.L3866
	.long	.L3867
	.long	.L3868
	.text
.L3867:
.LVL5059:
.LBB14052:
.LBB14053:
.LBB14054:
	.loc 74 107 0
	movl	$225, %eax
	call	putEncodedChar
.LVL5060:
	xorl	%eax, %eax
	call	putEncodedChar
.LVL5061:
	xorl	%eax, %eax
	call	putEncodedChar
.LVL5062:
	xorl	%eax, %eax
	call	putEncodedChar
.LVL5063:
.L3904:
.LBE14054:
.LBE14053:
.LBE14052:
.LBB14055:
.LBB14056:
.LBB14057:
.LBB14058:
.LBB14059:
	xorl	%eax, %eax
	call	putEncodedChar
.LVL5064:
	xorl	%eax, %eax
	call	putEncodedChar
.LVL5065:
	xorl	%eax, %eax
	call	putEncodedChar
.LVL5066:
	xorl	%eax, %eax
	call	putEncodedChar
.LVL5067:
.L3976:
.LBE14059:
.LBE14058:
.LBE14057:
.LBE14056:
.LBE14055:
	.loc 74 384 0
	subl	$12, %esp
	.cfi_def_cfa_offset 76
	pushl	$187
	.cfi_def_cfa_offset 80
	call	putDebugChar
.LVL5068:
	.loc 74 387 0
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	jmp	.L3854
.LVL5069:
.L3866:
.LBB14066:
	.loc 74 339 0
	leal	28(%esp), %eax
	call	getArg
.LVL5070:
	.loc 74 340 0
	testl	%eax, %eax
	jne	.L3923
	.loc 74 343 0
	movl	28(%esp), %eax
.LVL5071:
	movzbl	%ah, %edx
	movzbl	%al, %eax
.LVL5072:
	sall	$4, %edx
	addl	x86KSvtdRootTable, %edx
	sall	$4, %eax
	movl	(%edx), %edx
	andl	$-4096, %edx
	movl	-536870912(%edx,%eax), %eax
.LVL5073:
.LBB14065:
.LBB14064:
	.loc 74 207 0
	testb	$1, %al
	je	.L3904
.LVL5074:
.LBB14060:
.LBB14061:
	.loc 61 98 0
	andl	$-4096, %eax
	xorl	%ebx, %ebx
	movl	%eax, %esi
.LVL5075:
.L3905:
.LBE14061:
.LBE14060:
.LBB14062:
.LBB14063:
	.loc 74 107 0
	movl	%ebx, %ecx
	movl	%esi, %eax
	addl	$8, %ebx
	shrl	%cl, %eax
	movzbl	%al, %eax
	call	putEncodedChar
.LVL5076:
	.loc 74 106 0
	cmpl	$32, %ebx
	jne	.L3905
	jmp	.L3976
	.p2align 4,,10
	.p2align 3
.L3865:
.LBE14063:
.LBE14062:
.LBE14064:
.LBE14065:
.LBE14066:
.LBB14067:
	.loc 74 324 0
	leal	24(%esp), %eax
	call	getArg
.LVL5077:
	.loc 74 325 0
	testl	%eax, %eax
	jne	.L3923
	.loc 74 328 0
	leal	28(%esp), %eax
.LVL5078:
	call	getArg
.LVL5079:
	.loc 74 329 0
	testl	%eax, %eax
	jne	.L3923
	.loc 74 332 0
	movl	28(%esp), %eax
.LVL5080:
.LBB14068:
.LBB14069:
	.loc 74 175 0
	xorl	%ebx, %ebx
.LBE14069:
.LBE14068:
	.loc 74 332 0
	movl	24(%esp), %edi
.LVL5081:
	movl	%eax, 12(%esp)
.LVL5082:
.L3902:
.LBB14084:
.LBB14082:
.LBB14070:
	.loc 74 176 0
	movl	(%edi,%ebx,8), %esi
.LVL5083:
	.loc 74 177 0
	testl	$-4096, %esi
	je	.L3896
	.loc 74 176 0
	movl	4(%edi,%ebx,8), %eax
	xorl	%ebp, %ebp
	movl	%eax, 8(%esp)
.LVL5084:
.L3897:
.LBB14071:
.LBB14072:
	.loc 74 107 0
	movl	%ebp, %ecx
	movl	%ebx, %eax
	addl	$8, %ebp
	shrl	%cl, %eax
	movzbl	%al, %eax
	call	putEncodedChar
.LVL5085:
	.loc 74 106 0
	cmpl	$32, %ebp
	jne	.L3897
	xorl	%ebp, %ebp
.L3898:
.LBE14072:
.LBE14071:
.LBB14073:
.LBB14074:
	.loc 74 107 0
	movl	%ebp, %ecx
	movl	%esi, %eax
	addl	$8, %ebp
	shrl	%cl, %eax
	movzbl	%al, %eax
	call	putEncodedChar
.LVL5086:
	.loc 74 106 0
	cmpl	$32, %ebp
	jne	.L3898
	xorl	%esi, %esi
.LVL5087:
.L3899:
.LBE14074:
.LBE14073:
.LBB14075:
.LBB14076:
	.loc 74 107 0
	movl	8(%esp), %eax
	movl	%esi, %ecx
	addl	$8, %esi
	shrl	%cl, %eax
	movzbl	%al, %eax
	call	putEncodedChar
.LVL5088:
	.loc 74 106 0
	cmpl	$32, %esi
	jne	.L3899
.LBE14076:
.LBE14075:
	.loc 74 183 0
	movl	12(%esp), %eax
	cmpl	x86KSnumIOPTLevels, %eax
	je	.L3981
.LVL5089:
.LBB14077:
.LBB14078:
	.loc 74 107 0
	xorl	%eax, %eax
.LVL5090:
.L3979:
	call	putEncodedChar
.LVL5091:
	xorl	%eax, %eax
	call	putEncodedChar
.LVL5092:
	xorl	%eax, %eax
	call	putEncodedChar
.LVL5093:
	xorl	%eax, %eax
	call	putEncodedChar
.LVL5094:
.L3896:
.LBE14078:
.LBE14077:
.LBE14070:
	.loc 74 175 0
	addl	$1, %ebx
.LVL5095:
	cmpl	$512, %ebx
	jne	.L3902
	jmp	.L3976
.LVL5096:
	.p2align 4,,10
	.p2align 3
.L3864:
.LBE14082:
.LBE14084:
.LBE14067:
.LBB14086:
	.loc 74 312 0
	leal	28(%esp), %eax
	call	getArg
.LVL5097:
	.loc 74 313 0
	testl	%eax, %eax
	jne	.L3923
	.loc 74 316 0
	movl	28(%esp), %ebp
.LVL5098:
.LBB14087:
.LBB14088:
	.loc 74 161 0
	xorl	%esi, %esi
.LVL5099:
.L3889:
.LBB14089:
	.loc 74 162 0
	movl	0(%ebp,%esi,4), %edi
.LVL5100:
	.loc 74 163 0
	xorl	%ebx, %ebx
	testl	%edi, %edi
	je	.L3893
.L3940:
.LBB14090:
.LBB14091:
	.loc 74 107 0
	movl	%ebx, %ecx
	movl	%esi, %eax
	addl	$8, %ebx
	shrl	%cl, %eax
	movzbl	%al, %eax
	call	putEncodedChar
.LVL5101:
	.loc 74 106 0
	cmpl	$32, %ebx
	jne	.L3940
.LVL5102:
.LBE14091:
.LBE14090:
	.loc 74 165 0
	xorl	%ebx, %ebx
.LVL5103:
.L3892:
.LBB14092:
.LBB14093:
	.loc 74 107 0
	movl	%ebx, %ecx
	movl	%edi, %eax
	addl	$8, %ebx
	shrl	%cl, %eax
	movzbl	%al, %eax
	call	putEncodedChar
.LVL5104:
	.loc 74 106 0
	cmpl	$32, %ebx
	jne	.L3892
.LVL5105:
.L3893:
.LBE14093:
.LBE14092:
.LBE14089:
	.loc 74 161 0
	addl	$1, %esi
.LVL5106:
	cmpl	$1024, %esi
	jne	.L3889
	jmp	.L3976
.LVL5107:
.L3860:
.LBE14088:
.LBE14087:
.LBE14086:
.LBB14094:
	.loc 74 358 0
	leal	28(%esp), %eax
	call	getArg
.LVL5108:
	.loc 74 359 0
	testl	%eax, %eax
	jne	.L3923
.LVL5109:
.LBB14095:
.LBB14096:
	.loc 74 233 0
	movl	28(%esp), %eax
.LVL5110:
.LBB14097:
.LBB14098:
	.loc 11 869 0
	movl	4(%eax), %ebx
.LVL5111:
.LBE14098:
.LBE14097:
	.loc 74 234 0
	movl	(%eax), %edi
	andl	$-16, %edi
.LVL5112:
	.loc 74 235 0
	andl	$-16, %ebx
.LVL5113:
	je	.L3976
	.loc 74 238 0
	cmpl	%edi, %ebx
	je	.L3917
.LVL5114:
.L3919:
	.loc 74 239 0
	xorl	%esi, %esi
.LVL5115:
.L3918:
.LBB14099:
.LBB14100:
	.loc 74 107 0
	movl	%esi, %ecx
	movl	%ebx, %eax
	addl	$8, %esi
	shrl	%cl, %eax
	movzbl	%al, %eax
	call	putEncodedChar
.LVL5116:
	.loc 74 106 0
	cmpl	$32, %esi
	jne	.L3918
.LVL5117:
.LBE14100:
.LBE14099:
	.loc 74 240 0
	movl	652(%ebx), %ebx
.LVL5118:
	.loc 74 238 0
	cmpl	%ebx, %edi
	jne	.L3919
.L3917:
.LVL5119:
	.loc 74 242 0
	xorl	%ebx, %ebx
.LVL5120:
.L3920:
.LBB14101:
.LBB14102:
	.loc 74 107 0
	movl	%ebx, %ecx
	movl	%edi, %eax
	addl	$8, %ebx
	shrl	%cl, %eax
	movzbl	%al, %eax
	call	putEncodedChar
.LVL5121:
	.loc 74 106 0
	cmpl	$32, %ebx
	jne	.L3920
	jmp	.L3976
.LVL5122:
.L3862:
.LBE14102:
.LBE14101:
.LBE14096:
.LBE14095:
.LBE14094:
.LBB14103:
.LBB14104:
	.loc 74 263 0
	movl	intStateIRQNode, %eax
	movl	$8, %edx
.L3975:
	call	sendCNode
.LVL5123:
	jmp	.L3976
.L3857:
.LBE14104:
.LBE14103:
.LBB14105:
	.loc 74 290 0
	leal	28(%esp), %eax
	call	getArg
.LVL5124:
	.loc 74 291 0
	testl	%eax, %eax
	jne	.L3923
	.loc 74 294 0
	movl	28(%esp), %ebp
.LVL5125:
.LBB14106:
.LBB14107:
	.loc 74 127 0
	xorl	%esi, %esi
.LVL5126:
.LBB14108:
	.loc 74 128 0
	movl	0(%ebp,%esi,4), %edi
.LVL5127:
	.loc 74 130 0
	testl	$128, %edi
	je	.L3982
.LVL5128:
.L3871:
	.loc 74 133 0
	testl	$-2097152, %edi
	je	.L3875
.LVL5129:
.L3978:
	testl	$1, %edi
	je	.L3875
.LVL5130:
	.loc 74 134 0
	testl	$4, %edi
	je	.L3875
.LVL5131:
	.loc 74 137 0
	cmpl	$895, %esi
	ja	.L3875
	xorl	%ebx, %ebx
.L3877:
.LBB14109:
.LBB14110:
	.loc 74 107 0
	movl	%ebx, %ecx
	movl	%esi, %eax
	addl	$8, %ebx
	shrl	%cl, %eax
	movzbl	%al, %eax
	call	putEncodedChar
.LVL5132:
	.loc 74 106 0
	cmpl	$32, %ebx
	jne	.L3877
	xorl	%ebx, %ebx
.L3878:
.LBE14110:
.LBE14109:
.LBB14111:
.LBB14112:
	.loc 74 107 0
	movl	%ebx, %ecx
	movl	%edi, %eax
	addl	$8, %ebx
	shrl	%cl, %eax
	movzbl	%al, %eax
	call	putEncodedChar
.LVL5133:
	.loc 74 106 0
	cmpl	$32, %ebx
	jne	.L3878
.LVL5134:
.L3875:
.LBE14112:
.LBE14111:
.LBE14108:
	.loc 74 127 0
	addl	$1, %esi
.LVL5135:
	cmpl	$1024, %esi
	je	.L3976
.L3980:
.LBB14113:
	.loc 74 128 0
	movl	0(%ebp,%esi,4), %edi
.LVL5136:
	.loc 74 130 0
	testl	$128, %edi
	jne	.L3871
.L3982:
.LVL5137:
	testl	$-4096, %edi
	jne	.L3978
.LVL5138:
.LBE14113:
	.loc 74 127 0
	addl	$1, %esi
.LVL5139:
	cmpl	$1024, %esi
	jne	.L3980
	jmp	.L3976
.LVL5140:
	.p2align 4,,10
	.p2align 3
.L3868:
.LBE14107:
.LBE14106:
.LBE14105:
	.loc 74 395 0
	subl	$12, %esp
	.cfi_def_cfa_offset 76
	pushl	$187
	.cfi_def_cfa_offset 80
	call	putDebugChar
.LVL5141:
.LBE14051:
	.loc 74 403 0
	addl	$60, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5142:
.L3863:
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -20
	.cfi_offset 5, -8
	.cfi_offset 6, -16
	.cfi_offset 7, -12
.LBB14134:
.LBB14114:
	.loc 74 301 0
	leal	28(%esp), %eax
	call	getArg
.LVL5143:
	.loc 74 302 0
	testl	%eax, %eax
	jne	.L3923
	.loc 74 305 0
	movl	28(%esp), %ebp
.LVL5144:
.LBB14115:
.LBB14116:
	.loc 74 148 0
	xorl	%ebx, %ebx
.LVL5145:
.L3882:
.LBB14117:
	.loc 74 149 0
	movl	0(%ebp,%ebx,4), %esi
.LVL5146:
	.loc 74 150 0
	testl	$-4096, %esi
	je	.L3884
.LVL5147:
	testl	$1, %esi
	je	.L3884
.LVL5148:
	testl	$4, %esi
	je	.L3884
	xorl	%edi, %edi
.L3885:
.LBB14118:
.LBB14119:
	.loc 74 107 0
	movl	%edi, %ecx
	movl	%ebx, %eax
	addl	$8, %edi
	shrl	%cl, %eax
	movzbl	%al, %eax
	call	putEncodedChar
.LVL5149:
	.loc 74 106 0
	cmpl	$32, %edi
	jne	.L3885
	xorl	%edi, %edi
.L3886:
.LBE14119:
.LBE14118:
.LBB14120:
.LBB14121:
	.loc 74 107 0
	movl	%edi, %ecx
	movl	%esi, %eax
	addl	$8, %edi
	shrl	%cl, %eax
	movzbl	%al, %eax
	call	putEncodedChar
.LVL5150:
	.loc 74 106 0
	cmpl	$32, %edi
	jne	.L3886
.LVL5151:
.L3884:
.LBE14121:
.LBE14120:
.LBE14117:
	.loc 74 148 0
	addl	$1, %ebx
.LVL5152:
	cmpl	$1024, %ebx
	jne	.L3882
	jmp	.L3976
.LVL5153:
.L3861:
.LBE14116:
.LBE14115:
.LBE14114:
.LBB14122:
	.loc 74 369 0
	leal	24(%esp), %eax
	call	getArg
.LVL5154:
	.loc 74 370 0
	testl	%eax, %eax
	jne	.L3923
	.loc 74 373 0
	leal	28(%esp), %eax
.LVL5155:
	call	getArg
.LVL5156:
	.loc 74 374 0
	testl	%eax, %eax
	jne	.L3923
	.loc 74 378 0
	movl	28(%esp), %edx
	movl	24(%esp), %eax
.LVL5157:
	jmp	.L3975
	.p2align 4,,10
	.p2align 3
.L3859:
.LBE14122:
.LBB14123:
.LBB14124:
	.loc 74 218 0
	movl	ksCurThread, %esi
.LVL5158:
	xorl	%ebx, %ebx
.LVL5159:
.L3907:
.LBB14125:
.LBB14126:
	.loc 74 107 0
	movl	%ebx, %ecx
	movl	%esi, %eax
	addl	$8, %ebx
	shrl	%cl, %eax
	movzbl	%al, %eax
	call	putEncodedChar
.LVL5160:
	.loc 74 106 0
	cmpl	$32, %ebx
	jne	.L3907
	movl	$ksReadyQueues+4, %edi
.LVL5161:
	.p2align 4,,10
	.p2align 3
.L3909:
.LBE14126:
.LBE14125:
.LBB14127:
	.loc 74 220 0
	movl	-4(%edi), %esi
.LVL5162:
	.loc 74 221 0
	testl	%esi, %esi
	je	.L3914
	.loc 74 222 0
	cmpl	%esi, (%edi)
	je	.L3925
	.p2align 4,,10
	.p2align 3
.L3912:
.LVL5163:
	.loc 74 223 0
	xorl	%ebx, %ebx
.LVL5164:
.L3911:
.LBB14128:
.LBB14129:
	.loc 74 107 0
	movl	%ebx, %ecx
	movl	%esi, %eax
	addl	$8, %ebx
	shrl	%cl, %eax
	movzbl	%al, %eax
	call	putEncodedChar
.LVL5165:
	.loc 74 106 0
	cmpl	$32, %ebx
	jne	.L3911
.LVL5166:
.LBE14129:
.LBE14128:
	.loc 74 224 0
	movl	644(%esi), %esi
.LVL5167:
	.loc 74 222 0
	movl	(%edi), %ebx
	cmpl	%ebx, %esi
	jne	.L3912
.L3910:
.LVL5168:
	.loc 74 226 0
	xorl	%esi, %esi
.LVL5169:
.L3913:
.LBB14130:
.LBB14131:
	.loc 74 107 0
	movl	%esi, %ecx
	movl	%ebx, %eax
	addl	$8, %esi
	shrl	%cl, %eax
	movzbl	%al, %eax
	call	putEncodedChar
.LVL5170:
	.loc 74 106 0
	cmpl	$32, %esi
	jne	.L3913
.LVL5171:
.L3914:
	addl	$8, %edi
.LBE14131:
.LBE14130:
.LBE14127:
	.loc 74 219 0
	cmpl	$ksReadyQueues+2052, %edi
	jne	.L3909
	jmp	.L3976
.LVL5172:
.L3925:
.LBB14132:
	.loc 74 222 0
	movl	%esi, %ebx
	jmp	.L3910
.LVL5173:
.L3981:
.LBE14132:
.LBE14124:
.LBE14123:
.LBB14133:
.LBB14085:
.LBB14083:
.LBB14081:
.LBB14079:
.LBB14080:
	.loc 74 107 0
	movl	$1, %eax
	jmp	.L3979
.LBE14080:
.LBE14079:
.LBE14081:
.LBE14083:
.LBE14085:
.LBE14133:
.LBE14134:
	.cfi_endproc
.LFE583:
	.size	capDL, .-capDL
	.section	.text.unlikely
.LCOLDE695:
	.text
.LHOTE695:
	.section	.rodata.str1.1
.LC696:
	.string	"inactive"
.LC697:
	.string	"running"
.LC698:
	.string	"restart"
.LC699:
	.string	"blocked on recv"
.LC700:
	.string	"blocked on send"
.LC701:
	.string	"blocked on reply"
.LC702:
	.string	"blocked on ntfn"
.LC703:
	.string	"idle"
.LC704:
	.string	"Dumping all tcbs!\n"
	.section	.rodata.str1.4
	.align 4
.LC705:
	.string	"Name                                    \tState          \tIP                  \t Prio\n"
	.align 4
.LC706:
	.string	"--------------------------------------------------------------------------------------\n"
	.section	.rodata.str1.1
.LC707:
	.string	"%40s\t"
	.section	.rodata.str1.4
	.align 4
.LC708:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/include/api/debug.h"
	.section	.rodata.str1.1
.LC709:
	.string	"Unknown thread state"
.LC710:
	.string	"%15s\t%p\t%20lu\n"
	.section	.rodata.str1.4
	.align 4
.LC711:
	.string	"Debug halt syscall from user thread %p\n"
	.align 4
.LC712:
	.string	"Debug snapshot syscall from user thread %p\n"
	.align 4
.LC713:
	.string	"SysDebugNameThread: cap is not a TCB, halting"
	.align 4
.LC714:
	.string	"SysDebugNameThread: Failed to lookup IPC buffer, halting"
	.align 4
.LC715:
	.string	"SysDebugNameThread: Name too long, halting"
	.section	.text.unlikely
.LCOLDB716:
	.text
.LHOTB716:
	.p2align 4,,15
	.globl	handleUnknownSyscall
	.type	handleUnknownSyscall, @function
handleUnknownSyscall:
.LFB399:
	.loc 73 63 0
	.cfi_startproc
.LVL5174:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	.loc 73 63 0
	movl	32(%esp), %eax
	.loc 73 65 0
	cmpl	$-9, %eax
	je	.L4034
	.loc 73 69 0
	cmpl	$-10, %eax
	je	.L4035
	.loc 73 77 0
	cmpl	$-11, %eax
	je	.L4036
	.loc 73 81 0
	cmpl	$-13, %eax
	je	.L4037
	.loc 73 86 0
	cmpl	$-12, %eax
	je	.L4038
	.loc 73 94 0
	cmpl	$-14, %eax
	je	.L4039
.LVL5175:
	.loc 73 194 0
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	.loc 73 193 0
	movl	%eax, current_fault+4
	.loc 73 194 0
	pushl	ksCurThread
	.cfi_def_cfa_offset 48
	.loc 73 193 0
	movl	$2, current_fault
	.loc 73 194 0
	call	handleFault
.LVL5176:
	.loc 73 196 0
	call	schedule
.LVL5177:
	.loc 73 197 0
	call	activateThread
.LVL5178:
	.loc 73 199 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
.L4023:
	.loc 73 200 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L4039:
	.cfi_restore_state
.LBB14178:
	.loc 73 99 0
	movl	ksCurThread, %eax
	.loc 73 100 0
	movl	%esp, %edx
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	pushl	516(%eax)
	.cfi_def_cfa_offset 40
	pushl	%eax
	.cfi_def_cfa_offset 44
	pushl	%edx
	.cfi_def_cfa_offset 48
	call	lookupCapAndSlot
	.cfi_def_cfa_offset 44
.LVL5179:
	movl	16(%esp), %ebx
.LVL5180:
.LBB14179:
.LBB14180:
	.loc 11 2202 0
	addl	$12, %esp
	.cfi_def_cfa_offset 32
	movl	%ebx, %ecx
	.loc 11 2203 0
	movl	%ebx, %edx
	movzbl	%bl, %eax
	.loc 11 2202 0
	andl	$14, %ecx
	.loc 11 2203 0
	andl	$15, %edx
	cmpl	$14, %ecx
	cmovne	%edx, %eax
.LVL5181:
.LBE14180:
.LBE14179:
	.loc 73 103 0
	cmpl	$12, %eax
	jne	.L4040
	.loc 73 108 0
	movl	ksCurThread, %esi
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	pushl	%esi
	.cfi_def_cfa_offset 44
	pushl	$1
	.cfi_def_cfa_offset 48
	call	lookupIPCBuffer
.LVL5182:
	addl	$16, %esp
	.cfi_def_cfa_offset 32
.LVL5183:
	.loc 73 109 0
	movl	%eax, %edx
	addl	$4, %edx
.LVL5184:
	je	.L4009
	leal	484(%eax), %ecx
	jmp	.L4010
.LVL5185:
	.p2align 4,,10
	.p2align 3
.L4012:
	addl	$1, %edx
.LVL5186:
.LBB14181:
.LBB14182:
	.loc 37 20 0
	cmpl	%ecx, %edx
	je	.L4011
.LVL5187:
.L4010:
	cmpb	$0, (%edx)
	jne	.L4012
.LVL5188:
.LBE14182:
.LBE14181:
.LBB14183:
.LBB14184:
	.loc 11 2768 0
	movl	%ebx, %edx
	andl	$15, %edx
	cmpl	$12, %edx
	jne	.L4041
.LVL5189:
.LBE14184:
.LBE14183:
.LBB14186:
.LBB14187:
.LBB14188:
.LBB14189:
	.loc 37 27 0
	movzbl	4(%eax), %edx
.LBE14189:
.LBE14188:
.LBE14187:
.LBE14186:
	.loc 73 119 0
	movl	%ebx, %esi
	andl	$-16, %esi
.LVL5190:
.LBB14196:
.LBB14194:
	.loc 31 1581 0
	leal	668(%esi), %ebx
.LVL5191:
.LBB14192:
.LBB14190:
	.loc 37 27 0
	testb	%dl, %dl
	je	.L4042
	.loc 37 28 0
	movb	%dl, 668(%esi)
.LVL5192:
	movl	$1, %edx
	jmp	.L4019
.LVL5193:
	.p2align 4,,10
	.p2align 3
.L4016:
	movb	%cl, (%ebx,%edx)
.LVL5194:
	addl	$1, %edx
.LVL5195:
	.loc 37 27 0
	cmpl	$99, %edx
	je	.L4015
.LVL5196:
.L4019:
	movzbl	4(%eax,%edx), %ecx
	testb	%cl, %cl
	jne	.L4016
.LVL5197:
.L4015:
	.loc 37 30 0
	movb	$0, 668(%esi,%edx)
.LVL5198:
.LBE14190:
.LBE14192:
.LBE14194:
.LBE14196:
.LBE14178:
	.loc 73 200 0
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	xorl	%eax, %eax
.LVL5199:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L4034:
	.cfi_restore_state
.LVL5200:
.LBB14199:
.LBB14200:
	.loc 15 36 0
	movl	ksCurThread, %eax
.LBE14200:
.LBE14199:
.LBB14202:
.LBB14203:
	.loc 41 21 0
	subl	$12, %esp
	.cfi_def_cfa_offset 44
.LBE14203:
.LBE14202:
.LBB14205:
.LBB14201:
	.loc 15 36 0
	movl	516(%eax), %ebx
.LVL5201:
.LBE14201:
.LBE14205:
.LBB14206:
.LBB14204:
	.loc 41 21 0
	movzbl	%bl, %eax
	pushl	%eax
	.cfi_def_cfa_offset 48
	call	putConsoleChar
.LVL5202:
	.loc 41 22 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	cmpb	$10, %bl
	jne	.L4023
	.loc 41 23 0
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	$13
	.cfi_def_cfa_offset 48
	call	putConsoleChar
.LVL5203:
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	jmp	.L4023
.LVL5204:
	.p2align 4,,10
	.p2align 3
.L4038:
.LBE14204:
.LBE14206:
.LBB14207:
	.loc 73 87 0
	movl	ksCurThread, %eax
	.loc 73 88 0
	movl	%esp, %edx
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	pushl	516(%eax)
	.cfi_def_cfa_offset 40
	pushl	%eax
	.cfi_def_cfa_offset 44
	pushl	%edx
	.cfi_def_cfa_offset 48
	call	lookupCapAndSlot
	.cfi_def_cfa_offset 44
.LVL5205:
	movl	16(%esp), %eax
.LVL5206:
.LBB14208:
.LBB14209:
	.loc 11 2202 0
	addl	$12, %esp
	.cfi_def_cfa_offset 32
	movl	%eax, %ecx
	.loc 11 2203 0
	movl	%eax, %edx
	movzbl	%al, %eax
.LVL5207:
	.loc 11 2202 0
	andl	$14, %ecx
	.loc 11 2203 0
	andl	$15, %edx
.LVL5208:
	cmpl	$14, %ecx
	cmovne	%edx, %eax
.LVL5209:
.LBE14209:
.LBE14208:
.LBB14210:
.LBB14211:
	.loc 15 30 0
	movl	ksCurThread, %edx
	movl	%eax, 516(%edx)
.LVL5210:
	jmp	.L4023
	.p2align 4,,10
	.p2align 3
.L4035:
.LBE14211:
.LBE14210:
.LBE14207:
.LBB14212:
.LBB14213:
	.loc 42 130 0
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC704
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL5211:
	.loc 42 131 0
	movl	$.LC705, (%esp)
	call	kprintf
.LVL5212:
	.loc 42 132 0
	movl	$.LC706, (%esp)
	call	kprintf
.LVL5213:
.LBB14214:
	.loc 42 133 0
	movl	ksDebugTCBs, %ebx
.LVL5214:
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	testl	%ebx, %ebx
	je	.L4023
	.p2align 4,,10
	.p2align 3
.L3999:
.LVL5215:
.LBB14215:
.LBB14216:
	.loc 42 88 0
	leal	668(%ebx), %eax
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	pushl	%eax
	.cfi_def_cfa_offset 44
	pushl	$.LC707
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL5216:
	.loc 42 90 0
	movl	588(%ebx), %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	andl	$15, %eax
	cmpl	$7, %eax
	ja	.L3989
	jmp	*.L3991(,%eax,4)
	.section	.rodata
	.align 4
	.align 4
.L3991:
	.long	.L3990
	.long	.L3992
	.long	.L4020
	.long	.L3994
	.long	.L3995
	.long	.L3996
	.long	.L3997
	.long	.L3998
	.text
.LVL5217:
	.p2align 4,,10
	.p2align 3
.L4037:
.LBE14216:
.LBE14215:
.LBE14214:
.LBE14213:
.LBE14212:
	.loc 73 82 0
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	pushl	ksCurThread
	.cfi_def_cfa_offset 44
	pushl	$.LC712
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL5218:
	.loc 73 83 0
	call	capDL
.LVL5219:
	.loc 73 84 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	jmp	.L4023
.LVL5220:
	.p2align 4,,10
	.p2align 3
.L4020:
.LBB14223:
.LBB14222:
.LBB14221:
.LBB14219:
.LBB14217:
	.loc 42 98 0
	movl	$.LC698, %eax
	.p2align 4,,10
	.p2align 3
.L3993:
.LVL5221:
	.loc 42 124 0
	pushl	628(%ebx)
	.cfi_def_cfa_offset 36
	pushl	556(%ebx)
	.cfi_def_cfa_offset 40
	pushl	%eax
	.cfi_def_cfa_offset 44
	pushl	$.LC710
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL5222:
.LBE14217:
.LBE14219:
	.loc 42 133 0
	movl	660(%ebx), %ebx
.LVL5223:
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	testl	%ebx, %ebx
	jne	.L3999
	jmp	.L4023
.LVL5224:
	.p2align 4,,10
	.p2align 3
.L3992:
.LBB14220:
.LBB14218:
	.loc 42 95 0
	movl	$.LC697, %eax
	jmp	.L3993
	.p2align 4,,10
	.p2align 3
.L3990:
	.loc 42 92 0
	movl	$.LC696, %eax
	jmp	.L3993
	.p2align 4,,10
	.p2align 3
.L3998:
.LVL5225:
	.loc 42 118 0
	movl	$.LC703, %eax
	jmp	.L3993
.LVL5226:
	.p2align 4,,10
	.p2align 3
.L3997:
	.loc 42 110 0
	movl	$.LC702, %eax
	jmp	.L3993
.LVL5227:
	.p2align 4,,10
	.p2align 3
.L3996:
	.loc 42 107 0
	movl	$.LC701, %eax
	jmp	.L3993
.LVL5228:
	.p2align 4,,10
	.p2align 3
.L3995:
	.loc 42 104 0
	movl	$.LC700, %eax
	jmp	.L3993
.LVL5229:
	.p2align 4,,10
	.p2align 3
.L3994:
	.loc 42 101 0
	movl	$.LC699, %eax
	jmp	.L3993
.LVL5230:
	.p2align 4,,10
	.p2align 3
.L3989:
	.loc 42 121 0
	pushl	$__func__.5129
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	pushl	$121
	.cfi_def_cfa_offset 40
	pushl	$.LC708
	.cfi_def_cfa_offset 44
	pushl	$.LC709
	.cfi_def_cfa_offset 48
	call	_fail
.LVL5231:
	.p2align 4,,10
	.p2align 3
.L4011:
	.cfi_restore_state
.LBE14218:
.LBE14220:
.LBE14221:
.LBE14222:
.LBE14223:
.LBB14224:
	.loc 73 116 0
	leal	668(%esi), %eax
.LVL5232:
	subl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	pushl	556(%esi)
	.cfi_def_cfa_offset 40
	pushl	%eax
	.cfi_def_cfa_offset 44
	pushl	%esi
	.cfi_def_cfa_offset 48
	pushl	$116
	.cfi_def_cfa_offset 52
	pushl	$__func__.5507
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	$.LC111
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL5233:
	addl	$20, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC715
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL5234:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL5235:
	.loc 73 117 0
	call	halt
.LVL5236:
.L4042:
	.cfi_restore_state
.LBB14197:
.LBB14195:
.LBB14193:
.LBB14191:
	.loc 37 27 0
	xorl	%edx, %edx
	jmp	.L4015
.LVL5237:
.L4036:
.LBE14191:
.LBE14193:
.LBE14195:
.LBE14197:
.LBE14224:
	.loc 73 78 0
	pushl	%ecx
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	pushl	%ecx
	.cfi_def_cfa_offset 40
	pushl	ksCurThread
	.cfi_def_cfa_offset 44
	pushl	$.LC711
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL5238:
	.loc 73 79 0
	call	halt
.LVL5239:
.L4040:
	.cfi_restore_state
.LBB14225:
	.loc 73 104 0
	movl	ksCurThread, %eax
	pushl	%edx
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	pushl	556(%eax)
	.cfi_def_cfa_offset 40
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	pushl	$104
	.cfi_def_cfa_offset 52
	pushl	$__func__.5507
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	$.LC111
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL5240:
	addl	$20, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC713
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL5241:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL5242:
	.loc 73 105 0
	call	halt
.LVL5243:
.L4009:
	.cfi_restore_state
	.loc 73 110 0
	pushl	%eax
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	leal	668(%esi), %eax
	pushl	556(%esi)
	.cfi_def_cfa_offset 40
	pushl	%eax
	.cfi_def_cfa_offset 44
	pushl	%esi
	.cfi_def_cfa_offset 48
	pushl	$110
	.cfi_def_cfa_offset 52
	pushl	$__func__.5507
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	$.LC111
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL5244:
	addl	$20, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC714
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL5245:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL5246:
	.loc 73 111 0
	call	halt
.LVL5247:
.L4041:
	.cfi_restore_state
.LBB14198:
.LBB14185:
	call	cap_thread_cap_get_capTCBPtr.isra.89.part.90
.LVL5248:
.LBE14185:
.LBE14198:
.LBE14225:
	.cfi_endproc
.LFE399:
	.size	handleUnknownSyscall, .-handleUnknownSyscall
	.section	.text.unlikely
.LCOLDE716:
	.text
.LHOTE716:
	.section	.text.unlikely
.LCOLDB717:
	.text
.LHOTB717:
	.p2align 4,,15
	.globl	ioapic_init
	.type	ioapic_init, @function
ioapic_init:
.LFB874:
	.file 75 "/home/axjllt/Desktop/ori_refos/kernel/src/plat/pc99/machine/ioapic.c"
	.loc 75 79 0
	.cfi_startproc
.LVL5249:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	.loc 75 81 0
	movl	28(%esp), %eax
	movl	%eax, num_ioapics
	.loc 75 82 0
	movl	24(%esp), %eax
	movl	(%eax), %edi
	.loc 75 84 0
	movl	28(%esp), %eax
	.loc 75 82 0
	movl	%edi, ioapic_target_cpu
.LVL5250:
	sall	$24, %edi
	.loc 75 84 0
	testl	%eax, %eax
	je	.L4043
	movl	$-61440, %ebx
	xorl	%ebp, %ebp
.LVL5251:
	.p2align 4,,10
	.p2align 3
.L4048:
	leal	16(%ebx), %ecx
	movl	$17, %eax
	.p2align 4,,10
	.p2align 3
.L4045:
.LBB14240:
.LBB14241:
.LBB14242:
.LBB14243:
	.loc 75 48 0
	movl	%eax, (%ebx)
.LBE14243:
.LBE14242:
.LBB14244:
.LBB14245:
	.loc 75 53 0
	movl	(%ecx), %edx
.LBE14245:
.LBE14244:
	.loc 75 66 0
	leal	-1(%eax), %esi
.LVL5252:
	.loc 75 67 0
	andl	$16777215, %edx
	orl	%edi, %edx
.LVL5253:
.LBB14246:
.LBB14247:
	.loc 75 48 0
	movl	%edx, (%ecx)
.LVL5254:
.LBE14247:
.LBE14246:
.LBB14248:
.LBB14249:
	movl	%esi, (%ebx)
.LVL5255:
.LBE14249:
.LBE14248:
.LBB14250:
.LBB14251:
	.loc 75 53 0
	movl	(%ecx), %edx
.LVL5256:
.LBE14251:
.LBE14250:
	.loc 75 72 0
	xorw	%dx, %dx
	orl	$65536, %edx
	movl	%edx, ioredtbl_state-34(%eax,%eax)
.LVL5257:
	addl	$2, %eax
.LBB14252:
.LBB14253:
	.loc 75 48 0
	movl	%edx, (%ecx)
.LVL5258:
.LBE14253:
.LBE14252:
	.loc 75 64 0
	cmpl	$65, %eax
	jne	.L4045
.LBE14241:
.LBE14240:
	.loc 75 84 0 discriminator 3
	addl	$1, %ebp
.LVL5259:
	addl	$4096, %ebx
	cmpl	%ebp, 28(%esp)
	jne	.L4048
.LVL5260:
.L4043:
	.loc 75 88 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE874:
	.size	ioapic_init, .-ioapic_init
	.section	.text.unlikely
.LCOLDE717:
	.text
.LHOTE717:
	.section	.rodata.str1.4
	.align 4
.LC718:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/plat/pc99/machine/ioapic.c"
	.align 4
.LC719:
	.string	"(ioredtbl_state[index] & 0xff) != 0"
	.section	.text.unlikely
.LCOLDB720:
	.text
.LHOTB720:
	.p2align 4,,15
	.globl	ioapic_mask
	.type	ioapic_mask, @function
ioapic_mask:
.LFB875:
	.loc 75 91 0
	.cfi_startproc
.LVL5261:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	.loc 75 91 0
	movl	20(%esp), %eax
.LVL5262:
	movl	24(%esp), %edx
	.loc 75 93 0
	cmpl	num_ioapics, %eax
	jnb	.L4052
	cmpl	$23, %edx
	ja	.L4052
	.loc 75 97 0
	movl	16(%esp), %ebx
	.loc 75 92 0
	leal	(%eax,%eax,2), %ecx
	leal	(%edx,%ecx,8), %ecx
	.loc 75 97 0
	testl	%ebx, %ebx
	jne	.L4057
	.loc 75 100 0
	movl	ioredtbl_state(,%ecx,4), %ebx
	movl	%ebx, %esi
	andl	$-65537, %esi
	movl	%esi, ioredtbl_state(,%ecx,4)
	.loc 75 103 0
	testb	%bl, %bl
	je	.L4058
.L4055:
	.loc 75 105 0
	leal	16(%edx,%edx), %edx
.LVL5263:
.LBB14264:
.LBB14265:
	.loc 75 48 0
	addl	$1048561, %eax
.LVL5264:
	sall	$12, %eax
	movl	%edx, (%eax)
.LVL5265:
.LBE14265:
.LBE14264:
	.loc 75 106 0
	movl	ioredtbl_state(,%ecx,4), %edx
.LVL5266:
.LBB14266:
.LBB14267:
	.loc 75 48 0
	movl	%edx, 16(%eax)
.LVL5267:
.L4052:
.LBE14267:
.LBE14266:
	.loc 75 107 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.LVL5268:
	.p2align 4,,10
	.p2align 3
.L4057:
	.cfi_restore_state
	.loc 75 98 0
	orl	$65536, ioredtbl_state(,%ecx,4)
	jmp	.L4055
.L4058:
.LVL5269:
.LBB14268:
.LBB14269:
	.loc 75 103 0
	pushl	$__FUNCTION__.10138
	.cfi_def_cfa_offset 20
	pushl	$103
	.cfi_def_cfa_offset 24
	pushl	$.LC718
	.cfi_def_cfa_offset 28
	pushl	$.LC719
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL5270:
.LBE14269:
.LBE14268:
	.cfi_endproc
.LFE875:
	.size	ioapic_mask, .-ioapic_mask
	.section	.text.unlikely
.LCOLDE720:
	.text
.LHOTE720:
	.section	.rodata.str1.4
	.align 4
.LC721:
	.string	"Invalid IOAPIC %ld, only have %ld"
	.align 4
.LC722:
	.string	"Invalid IOAPIC pin %ld, there are %d pins"
	.align 4
.LC723:
	.string	"Level should be 0 or 1, not %d"
	.align 4
.LC724:
	.string	"Polarity should be 0 or 1, not %d"
	.section	.text.unlikely
.LCOLDB725:
	.text
.LHOTB725:
	.p2align 4,,15
	.globl	ioapic_decode_map_pin_to_vector
	.type	ioapic_decode_map_pin_to_vector, @function
ioapic_decode_map_pin_to_vector:
.LFB876:
	.loc 75 111 0
	.cfi_startproc
.LVL5271:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 75 111 0
	movl	16(%esp), %ebx
	.loc 75 112 0
	cmpl	%ebx, num_ioapics
	jbe	.L4067
	.loc 75 119 0
	cmpl	$23, 20(%esp)
	ja	.L4068
	.loc 75 127 0
	cmpl	$1, 24(%esp)
	jbe	.L4063
	.loc 75 128 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	pushl	556(%eax)
	.cfi_def_cfa_offset 24
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	pushl	$128
	.cfi_def_cfa_offset 36
	pushl	$__func__.10146
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL5272:
	addl	$24, %esp
	.cfi_def_cfa_offset 24
	pushl	32(%esp)
	.cfi_def_cfa_offset 28
	pushl	$.LC723
	.cfi_def_cfa_offset 32
.L4066:
	.loc 75 135 0
	call	kprintf
.LVL5273:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL5274:
	.loc 75 139 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	$3, %eax
	.loc 75 136 0
	movl	$4, current_syscall_error+24
	.loc 75 137 0
	movl	$0, current_syscall_error+8
	.loc 75 138 0
	movl	$1, current_syscall_error+12
.L4061:
	.loc 75 142 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L4068:
	.cfi_restore_state
	.loc 75 120 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	pushl	556(%eax)
	.cfi_def_cfa_offset 24
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	pushl	$120
	.cfi_def_cfa_offset 36
	pushl	$__func__.10146
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL5275:
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	pushl	$24
	.cfi_def_cfa_offset 24
	pushl	28(%esp)
	.cfi_def_cfa_offset 28
	pushl	$.LC722
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL5276:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL5277:
	.loc 75 124 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	$3, %eax
	.loc 75 121 0
	movl	$4, current_syscall_error+24
	.loc 75 122 0
	movl	$0, current_syscall_error+8
	.loc 75 123 0
	movl	$23, current_syscall_error+12
	.loc 75 142 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L4067:
	.cfi_restore_state
	.loc 75 113 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	pushl	556(%eax)
	.cfi_def_cfa_offset 24
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	pushl	$113
	.cfi_def_cfa_offset 36
	pushl	$__func__.10146
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL5278:
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	pushl	num_ioapics
	.cfi_def_cfa_offset 24
	pushl	%ebx
	.cfi_def_cfa_offset 28
	pushl	$.LC721
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL5279:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL5280:
	.loc 75 116 0
	movl	num_ioapics, %eax
	.loc 75 117 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	.loc 75 114 0
	movl	$4, current_syscall_error+24
	.loc 75 115 0
	movl	$0, current_syscall_error+8
	.loc 75 116 0
	subl	$1, %eax
	movl	%eax, current_syscall_error+12
	.loc 75 142 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	.loc 75 117 0
	movl	$3, %eax
	.loc 75 142 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L4063:
	.cfi_restore_state
	.loc 75 141 0
	xorl	%eax, %eax
	.loc 75 134 0
	cmpl	$1, 28(%esp)
	jbe	.L4061
	.loc 75 135 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	pushl	556(%eax)
	.cfi_def_cfa_offset 24
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	pushl	$135
	.cfi_def_cfa_offset 36
	pushl	$__func__.10146
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL5281:
	addl	$24, %esp
	.cfi_def_cfa_offset 24
	pushl	36(%esp)
	.cfi_def_cfa_offset 28
	pushl	$.LC724
	.cfi_def_cfa_offset 32
	jmp	.L4066
	.cfi_endproc
.LFE876:
	.size	ioapic_decode_map_pin_to_vector, .-ioapic_decode_map_pin_to_vector
	.section	.text.unlikely
.LCOLDE725:
	.text
.LHOTE725:
	.section	.text.unlikely
.LCOLDB726:
	.text
.LHOTB726:
	.p2align 4,,15
	.globl	ioapic_map_pin_to_vector
	.type	ioapic_map_pin_to_vector, @function
ioapic_map_pin_to_vector:
.LFB877:
	.loc 75 146 0
	.cfi_startproc
.LVL5282:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	.loc 75 146 0
	movl	16(%esp), %edx
	movl	12(%esp), %eax
.LVL5283:
	.loc 75 151 0
	leal	16(%edx,%edx), %esi
	.loc 75 150 0
	leal	(%eax,%eax,2), %ecx
.LBB14270:
.LBB14271:
	.loc 75 48 0
	addl	$1048561, %eax
.LBE14271:
.LBE14270:
	.loc 75 150 0
	leal	(%edx,%ecx,8), %ebx
.LVL5284:
.LBB14274:
.LBB14272:
	.loc 75 48 0
	sall	$12, %eax
.LBE14272:
.LBE14274:
	.loc 75 154 0
	movl	ioapic_target_cpu, %ecx
	.loc 75 151 0
	leal	1(%esi), %edx
.LVL5285:
.LBB14275:
.LBB14273:
	.loc 75 48 0
	movl	%edx, (%eax)
.LVL5286:
.LBE14273:
.LBE14275:
.LBB14276:
.LBB14277:
	.loc 75 53 0
	movl	16(%eax), %edx
.LVL5287:
.LBE14277:
.LBE14276:
	.loc 75 154 0
	sall	$24, %ecx
	.loc 75 152 0
	andl	$16777215, %edx
.LVL5288:
	.loc 75 154 0
	orl	%ecx, %edx
.LVL5289:
	.loc 75 157 0
	movl	24(%esp), %ecx
.LBB14278:
.LBB14279:
	.loc 75 48 0
	movl	%edx, 16(%eax)
.LVL5290:
.LBE14279:
.LBE14278:
	.loc 75 157 0
	movl	28(%esp), %edx
.LVL5291:
	sall	$13, %ecx
	orl	$65536, %edx
	orl	%ecx, %edx
	movl	20(%esp), %ecx
	sall	$15, %ecx
	orl	%ecx, %edx
	movl	%edx, ioredtbl_state(,%ebx,4)
.LVL5292:
.LBB14280:
.LBB14281:
	.loc 75 48 0
	movl	%esi, (%eax)
.LVL5293:
.LBE14281:
.LBE14280:
.LBB14282:
.LBB14283:
	.loc 75 53 0
	movl	16(%eax), %edx
.LVL5294:
.LBE14283:
.LBE14282:
	.loc 75 164 0
	xorw	%dx, %dx
	orl	ioredtbl_state(,%ebx,4), %edx
	movl	%edx, ioredtbl_state(,%ebx,4)
.LVL5295:
.LBB14284:
.LBB14285:
	.loc 75 48 0
	movl	%edx, 16(%eax)
.LVL5296:
.LBE14285:
.LBE14284:
	.loc 75 166 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
.LVL5297:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE877:
	.size	ioapic_map_pin_to_vector, .-ioapic_map_pin_to_vector
	.section	.text.unlikely
.LCOLDE726:
	.text
.LHOTE726:
	.section	.boot.text
.LCOLDB727:
.LHOTB727:
	.p2align 4,,15
	.globl	pic_remap_irqs
	.type	pic_remap_irqs, @function
pic_remap_irqs:
.LFB878:
	.loc 4 23 0
	.cfi_startproc
.LVL5298:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$16, %esp
	.cfi_def_cfa_offset 24
	.loc 4 23 0
	movl	24(%esp), %ebx
	.loc 4 24 0
	pushl	$17
	.cfi_def_cfa_offset 28
	pushl	$32
	.cfi_def_cfa_offset 32
	call	out8
.LVL5299:
	.loc 4 25 0
	popl	%eax
	.cfi_def_cfa_offset 28
	popl	%edx
	.cfi_def_cfa_offset 24
	pushl	$17
	.cfi_def_cfa_offset 28
	pushl	$160
	.cfi_def_cfa_offset 32
	call	out8
.LVL5300:
	.loc 4 26 0
	popl	%ecx
	.cfi_def_cfa_offset 28
	popl	%eax
	.cfi_def_cfa_offset 24
	movzbl	%bl, %eax
	.loc 4 27 0
	addl	$8, %ebx
	.loc 4 26 0
	pushl	%eax
	.cfi_def_cfa_offset 28
	.loc 4 27 0
	movzbl	%bl, %ebx
	.loc 4 26 0
	pushl	$33
	.cfi_def_cfa_offset 32
	call	out8
.LVL5301:
	.loc 4 27 0
	popl	%eax
	.cfi_def_cfa_offset 28
	popl	%edx
	.cfi_def_cfa_offset 24
	pushl	%ebx
	.cfi_def_cfa_offset 28
	pushl	$161
	.cfi_def_cfa_offset 32
	call	out8
.LVL5302:
	.loc 4 28 0
	popl	%ecx
	.cfi_def_cfa_offset 28
	popl	%ebx
	.cfi_def_cfa_offset 24
	pushl	$4
	.cfi_def_cfa_offset 28
	pushl	$33
	.cfi_def_cfa_offset 32
	call	out8
.LVL5303:
	.loc 4 29 0
	popl	%eax
	.cfi_def_cfa_offset 28
	popl	%edx
	.cfi_def_cfa_offset 24
	pushl	$2
	.cfi_def_cfa_offset 28
	pushl	$161
	.cfi_def_cfa_offset 32
	call	out8
.LVL5304:
	.loc 4 30 0
	popl	%ecx
	.cfi_def_cfa_offset 28
	popl	%ebx
	.cfi_def_cfa_offset 24
	pushl	$1
	.cfi_def_cfa_offset 28
	pushl	$33
	.cfi_def_cfa_offset 32
	call	out8
.LVL5305:
	.loc 4 31 0
	popl	%eax
	.cfi_def_cfa_offset 28
	popl	%edx
	.cfi_def_cfa_offset 24
	pushl	$1
	.cfi_def_cfa_offset 28
	pushl	$161
	.cfi_def_cfa_offset 32
	call	out8
.LVL5306:
	.loc 4 32 0
	popl	%ecx
	.cfi_def_cfa_offset 28
	popl	%ebx
	.cfi_def_cfa_offset 24
	pushl	$0
	.cfi_def_cfa_offset 28
	pushl	$33
	.cfi_def_cfa_offset 32
	call	out8
.LVL5307:
	.loc 4 33 0
	popl	%eax
	.cfi_def_cfa_offset 28
	popl	%edx
	.cfi_def_cfa_offset 24
	pushl	$0
	.cfi_def_cfa_offset 28
	pushl	$161
	.cfi_def_cfa_offset 32
	call	out8
.LVL5308:
	.loc 4 34 0
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE878:
	.size	pic_remap_irqs, .-pic_remap_irqs
.LCOLDE727:
.LHOTE727:
.LCOLDB728:
.LHOTB728:
	.p2align 4,,15
	.globl	pic_disable
	.type	pic_disable, @function
pic_disable:
.LFB879:
	.loc 4 37 0
	.cfi_startproc
	subl	$20, %esp
	.cfi_def_cfa_offset 24
	.loc 4 40 0
	pushl	$255
	.cfi_def_cfa_offset 28
	pushl	$33
	.cfi_def_cfa_offset 32
	call	out8
.LVL5309:
	.loc 4 41 0
	popl	%eax
	.cfi_def_cfa_offset 28
	popl	%edx
	.cfi_def_cfa_offset 24
	pushl	$255
	.cfi_def_cfa_offset 28
	pushl	$161
	.cfi_def_cfa_offset 32
	call	out8
.LVL5310:
	.loc 4 42 0
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE879:
	.size	pic_disable, .-pic_disable
.LCOLDE728:
.LHOTE728:
	.section	.rodata.str1.4
	.align 4
.LC729:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/plat/pc99/machine/pic.c"
	.section	.rodata.str1.1
.LC730:
	.string	"irq <= irq_isa_max"
	.section	.text.unlikely
.LCOLDB731:
	.text
.LHOTB731:
	.p2align 4,,15
	.globl	pic_mask_irq
	.type	pic_mask_irq, @function
pic_mask_irq:
.LFB880:
	.loc 4 47 0
	.cfi_startproc
.LVL5311:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	.loc 4 47 0
	movl	20(%esp), %ecx
	movl	16(%esp), %edx
	.loc 4 52 0
	cmpb	$15, %cl
	ja	.L4082
	.loc 4 54 0
	cmpb	$7, %cl
	jbe	.L4083
	.loc 4 58 0
	subl	$8, %ecx
	movl	$1, %ebx
	movl	$161, %esi
	sall	%cl, %ebx
.LVL5312:
	.loc 4 62 0
	testl	%edx, %edx
	jne	.L4084
.L4079:
	.loc 4 67 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	notl	%ebx
.LVL5313:
	pushl	%esi
	.cfi_def_cfa_offset 32
	call	in8
.LVL5314:
	andl	%ebx, %eax
	movzbl	%al, %eax
.L4081:
	movl	%esi, 32(%esp)
	movl	%eax, 36(%esp)
	.loc 4 69 0
	addl	$20, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	.loc 4 67 0
	jmp	out8
.LVL5315:
	.p2align 4,,10
	.p2align 3
.L4083:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -12
	.cfi_offset 6, -8
	.loc 4 55 0
	movl	$1, %ebx
	movl	$33, %esi
	sall	%cl, %ebx
.LVL5316:
	.loc 4 62 0
	testl	%edx, %edx
	je	.L4079
.L4084:
	.loc 4 64 0
	subl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 28
	pushl	%esi
	.cfi_def_cfa_offset 32
	call	in8
.LVL5317:
	orl	%eax, %ebx
.LVL5318:
	movzbl	%bl, %eax
	jmp	.L4081
.L4082:
	.cfi_restore_state
.LVL5319:
.LBB14288:
.LBB14289:
	.loc 4 52 0
	pushl	$__FUNCTION__.10168
	.cfi_def_cfa_offset 20
	pushl	$52
	.cfi_def_cfa_offset 24
	pushl	$.LC729
	.cfi_def_cfa_offset 28
	pushl	$.LC730
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL5320:
.LBE14289:
.LBE14288:
	.cfi_endproc
.LFE880:
	.size	pic_mask_irq, .-pic_mask_irq
	.section	.text.unlikely
.LCOLDE731:
	.text
.LHOTE731:
	.section	.rodata.str1.4
	.align 4
.LC732:
	.string	"(((~0x8000u >> 15 ) | 0x0) & v32) == ((0 && (v32 & (1u << (31)))) ? 0x0 : 0)"
	.section	.text.unlikely
.LCOLDB733:
	.text
.LHOTB733:
	.p2align 4,,15
	.type	maskInterrupt, @function
maskInterrupt:
.LFB369:
	.loc 49 123 0
	.cfi_startproc
.LVL5321:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 49 124 0
	cmpb	$15, %dl
	jbe	.L4092
	.loc 49 131 0
	leal	-16(%edx), %ecx
	cmpb	$107, %cl
	ja	.L4085
.LBB14312:
	.loc 49 132 0
	movzbl	%dl, %ebx
	movl	x86KSIRQState+4(,%ebx,8), %esi
	movl	x86KSIRQState(,%ebx,8), %edi
.LVL5322:
	.loc 49 133 0
	movl	%esi, %edx
.LVL5323:
	shrl	$28, %edx
	cmpl	$1, %edx
	jne	.L4085
.LBB14313:
	.loc 49 137 0
	movl	%esi, %edx
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	andl	$8126464, %edx
	shrl	$18, %edx
	pushl	%edx
	.cfi_def_cfa_offset 40
	movl	%esi, %edx
	andl	$260046848, %edx
	shrl	$23, %edx
	pushl	%edx
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	movl	%eax, 28(%esp)
	call	ioapic_mask
.LVL5324:
.LBB14314:
.LBB14315:
	.loc 11 1877 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	movl	12(%esp), %eax
	testl	$131070, %eax
	jne	.L4093
	.loc 11 1880 0
	sall	$15, %eax
	.loc 11 1879 0
	andl	$-32769, %esi
.LVL5325:
.LBE14315:
.LBE14314:
.LBB14318:
.LBB14319:
	.loc 49 118 0
	movl	%edi, x86KSIRQState(,%ebx,8)
.LBE14319:
.LBE14318:
.LBB14321:
.LBB14316:
	.loc 11 1880 0
	movzwl	%ax, %eax
	orl	%esi, %eax
.LVL5326:
.LBE14316:
.LBE14321:
.LBB14322:
.LBB14320:
	.loc 49 118 0
	movl	%eax, x86KSIRQState+4(,%ebx,8)
.LVL5327:
.L4085:
.LBE14320:
.LBE14322:
.LBE14313:
.LBE14312:
	.loc 49 155 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL5328:
	ret
.LVL5329:
	.p2align 4,,10
	.p2align 3
.L4092:
	.cfi_restore_state
	.loc 49 126 0
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	movzbl	%dl, %edx
	pushl	%edx
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	call	pic_mask_irq
.LVL5330:
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 49 155 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL5331:
.L4093:
	.cfi_restore_state
.LBB14325:
.LBB14324:
.LBB14323:
.LBB14317:
	.loc 11 1877 0
	pushl	$__FUNCTION__.2099
	.cfi_def_cfa_offset 36
	pushl	$1877
	.cfi_def_cfa_offset 40
	pushl	$.LC154
	.cfi_def_cfa_offset 44
	pushl	$.LC732
	.cfi_def_cfa_offset 48
	call	_assert_fail
.LVL5332:
.LBE14317:
.LBE14323:
.LBE14324:
.LBE14325:
	.cfi_endproc
.LFE369:
	.size	maskInterrupt, .-maskInterrupt
	.section	.text.unlikely
.LCOLDE733:
	.text
.LHOTE733:
	.section	.text.unlikely
.LCOLDB734:
	.text
.LHOTB734:
	.p2align 4,,15
	.globl	invokeIRQHandler_AckIRQ
	.type	invokeIRQHandler_AckIRQ, @function
invokeIRQHandler_AckIRQ:
.LFB764:
	.loc 35 146 0
	.cfi_startproc
.LVL5333:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 35 146 0
	movl	16(%esp), %eax
.LVL5334:
.LBB14340:
.LBB14341:
	.loc 49 124 0
	cmpb	$15, %al
	jbe	.L4100
	.loc 49 131 0
	leal	-16(%eax), %edx
	cmpb	$107, %dl
	ja	.L4094
.LBB14342:
	.loc 49 132 0
	movzbl	%al, %ebx
	movl	x86KSIRQState+4(,%ebx,8), %esi
	movl	x86KSIRQState(,%ebx,8), %edi
.LVL5335:
	.loc 49 133 0
	movl	%esi, %eax
.LVL5336:
	shrl	$28, %eax
	cmpl	$1, %eax
	jne	.L4094
.LBB14343:
	.loc 49 137 0
	movl	%esi, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	andl	$8126464, %eax
	shrl	$18, %eax
	pushl	%eax
	.cfi_def_cfa_offset 24
	movl	%esi, %eax
.LBB14344:
.LBB14345:
	.loc 11 1879 0
	andl	$-32769, %esi
.LVL5337:
.LBE14345:
.LBE14344:
	.loc 49 137 0
	andl	$260046848, %eax
.LVL5338:
	shrl	$23, %eax
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	$0
	.cfi_def_cfa_offset 32
	call	ioapic_mask
.LVL5339:
.LBB14346:
.LBB14347:
	.loc 49 118 0
	movl	%edi, x86KSIRQState(,%ebx,8)
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.LVL5340:
	movl	%esi, x86KSIRQState+4(,%ebx,8)
.LVL5341:
.L4094:
.LBE14347:
.LBE14346:
.LBE14343:
.LBE14342:
.LBE14341:
.LBE14340:
	.loc 35 148 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL5342:
	ret
.LVL5343:
	.p2align 4,,10
	.p2align 3
.L4100:
	.cfi_restore_state
.LBB14349:
.LBB14348:
	.loc 49 126 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	movzbl	%al, %eax
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	$0
	.cfi_def_cfa_offset 32
	call	pic_mask_irq
.LVL5344:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.LBE14348:
.LBE14349:
	.loc 35 148 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE764:
	.size	invokeIRQHandler_AckIRQ, .-invokeIRQHandler_AckIRQ
	.section	.text.unlikely
.LCOLDE734:
	.text
.LHOTE734:
	.section	.text.unlikely
.LCOLDB735:
	.text
.LHOTB735:
	.p2align 4,,15
	.globl	deletedIRQHandler
	.type	deletedIRQHandler, @function
deletedIRQHandler:
.LFB768:
	.loc 35 183 0
	.cfi_startproc
.LVL5345:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 35 183 0
	movl	16(%esp), %eax
.LVL5346:
.LBB14366:
.LBB14367:
	.loc 35 266 0
	movzbl	%al, %ebx
	movl	$0, intStateIRQTable(,%ebx,4)
.LVL5347:
.LBB14368:
.LBB14369:
	.loc 49 124 0
	cmpb	$15, %al
	jbe	.L4107
	.loc 49 131 0
	subl	$16, %eax
.LVL5348:
	cmpb	$107, %al
	ja	.L4101
.LBB14370:
	.loc 49 132 0
	movl	x86KSIRQState+4(,%ebx,8), %esi
	movl	x86KSIRQState(,%ebx,8), %edi
.LVL5349:
	.loc 49 133 0
	movl	%esi, %eax
	shrl	$28, %eax
	cmpl	$1, %eax
	jne	.L4101
.LBB14371:
	.loc 49 137 0
	movl	%esi, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	andl	$8126464, %eax
	shrl	$18, %eax
	pushl	%eax
	.cfi_def_cfa_offset 24
	movl	%esi, %eax
.LBB14372:
.LBB14373:
	.loc 11 1880 0
	orl	$32768, %esi
.LVL5350:
.LBE14373:
.LBE14372:
	.loc 49 137 0
	andl	$260046848, %eax
.LVL5351:
	shrl	$23, %eax
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	$1
	.cfi_def_cfa_offset 32
	call	ioapic_mask
.LVL5352:
.LBB14374:
.LBB14375:
	.loc 49 118 0
	movl	%edi, x86KSIRQState(,%ebx,8)
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.LVL5353:
	movl	%esi, x86KSIRQState+4(,%ebx,8)
.LVL5354:
.L4101:
.LBE14375:
.LBE14374:
.LBE14371:
.LBE14370:
.LBE14369:
.LBE14368:
.LBE14367:
.LBE14366:
	.loc 35 185 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL5355:
	ret
.LVL5356:
	.p2align 4,,10
	.p2align 3
.L4107:
	.cfi_restore_state
.LBB14379:
.LBB14378:
.LBB14377:
.LBB14376:
	.loc 49 126 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	pushl	%ebx
	.cfi_def_cfa_offset 28
	pushl	$1
	.cfi_def_cfa_offset 32
	call	pic_mask_irq
.LVL5357:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.LBE14376:
.LBE14377:
.LBE14378:
.LBE14379:
	.loc 35 185 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL5358:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE768:
	.size	deletedIRQHandler, .-deletedIRQHandler
	.section	.text.unlikely
.LCOLDE735:
	.text
.LHOTE735:
	.section	.text.unlikely
.LCOLDB736:
	.text
.LHOTB736:
	.p2align 4,,15
	.globl	invokeIRQControl
	.type	invokeIRQControl, @function
invokeIRQControl:
.LFB762:
	.loc 35 87 0
	.cfi_startproc
.LVL5359:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
.LVL5360:
	.loc 35 87 0
	movl	16(%esp), %eax
.LBB14404:
.LBB14405:
	.loc 35 266 0
	movzbl	%al, %ebx
	movl	$1, intStateIRQTable(,%ebx,4)
.LVL5361:
.LBB14406:
.LBB14407:
	.loc 49 124 0
	cmpb	$15, %al
	jbe	.L4114
	.loc 49 131 0
	subl	$16, %eax
	cmpb	$107, %al
	ja	.L4110
.LBB14408:
	.loc 49 132 0
	movl	x86KSIRQState+4(,%ebx,8), %esi
	movl	x86KSIRQState(,%ebx,8), %edi
.LVL5362:
	.loc 49 133 0
	movl	%esi, %eax
	shrl	$28, %eax
	cmpl	$1, %eax
	jne	.L4110
.LBB14409:
	.loc 49 137 0
	movl	%esi, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	andl	$8126464, %eax
	shrl	$18, %eax
	pushl	%eax
	.cfi_def_cfa_offset 24
	movl	%esi, %eax
.LBB14410:
.LBB14411:
	.loc 11 1879 0
	andl	$-32769, %esi
.LVL5363:
.LBE14411:
.LBE14410:
	.loc 49 137 0
	andl	$260046848, %eax
.LVL5364:
	shrl	$23, %eax
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	$0
	.cfi_def_cfa_offset 32
	call	ioapic_mask
.LVL5365:
.LBB14412:
.LBB14413:
	.loc 49 118 0
	movl	%edi, x86KSIRQState(,%ebx,8)
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.LVL5366:
	movl	%esi, x86KSIRQState+4(,%ebx,8)
.LVL5367:
.L4110:
.LBE14413:
.LBE14412:
.LBE14409:
.LBE14408:
.LBE14407:
.LBE14406:
.LBE14405:
.LBE14404:
	.loc 35 89 0
	pushl	20(%esp)
	.cfi_def_cfa_offset 20
.LBB14417:
.LBB14418:
	.loc 11 3371 0
	movl	$30, %eax
.LVL5368:
.LBE14418:
.LBE14417:
	.loc 35 89 0
	pushl	28(%esp)
	.cfi_def_cfa_offset 24
	pushl	%ebx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	cteInsert
.LVL5369:
	.loc 35 91 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	.loc 35 92 0
	xorl	%eax, %eax
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL5370:
	ret
.LVL5371:
	.p2align 4,,10
	.p2align 3
.L4114:
	.cfi_restore_state
.LBB14419:
.LBB14416:
.LBB14415:
.LBB14414:
	.loc 49 126 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	pushl	%ebx
	.cfi_def_cfa_offset 28
	pushl	$0
	.cfi_def_cfa_offset 32
	call	pic_mask_irq
.LVL5372:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	jmp	.L4110
.LBE14414:
.LBE14415:
.LBE14416:
.LBE14419:
	.cfi_endproc
.LFE762:
	.size	invokeIRQControl, .-invokeIRQControl
	.section	.text.unlikely
.LCOLDE736:
	.text
.LHOTE736:
	.section	.rodata.str1.4
	.align 4
.LC737:
	.string	"Rejecting request for IRQ %u. IRQ is greater than maxIRQ."
	.align 4
.LC738:
	.string	"Rejecting request for IRQ %u. Already active."
	.align 4
.LC739:
	.string	"Target slot for new IRQ Handler cap invalid: cap %lu, IRQ %u."
	.align 4
.LC740:
	.string	"Target slot for new IRQ Handler cap not empty: cap %lu, IRQ %u."
	.section	.text.unlikely
.LCOLDB741:
	.text
.LHOTB741:
	.p2align 4,,15
	.globl	decodeIRQControlInvocation
	.type	decodeIRQControlInvocation, @function
decodeIRQControlInvocation:
.LFB761:
	.loc 35 31 0
	.cfi_startproc
.LVL5373:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
.LVL5374:
	.loc 35 31 0
	movl	64(%esp), %eax
	movl	68(%esp), %edx
	movl	72(%esp), %esi
	movl	88(%esp), %ebx
	.loc 35 32 0
	cmpl	$23, %eax
	je	.L4135
	.loc 35 81 0
	movl	%ebx, 88(%esp)
.LVL5375:
	movl	%esi, 72(%esp)
.LVL5376:
	movl	%edx, 68(%esp)
.LVL5377:
	movl	%eax, 64(%esp)
.LVL5378:
	.loc 35 83 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 35 81 0
	jmp	Arch_decodeIRQControlInvocation
.LVL5379:
	.p2align 4,,10
	.p2align 3
.L4135:
	.cfi_restore_state
	movl	76(%esp), %eax
.LBB14420:
	.loc 35 40 0 discriminator 1
	cmpl	$2, %edx
	jbe	.L4128
	testl	%eax, %eax
	je	.L4128
.LVL5380:
.LBB14421:
.LBB14422:
	.loc 56 31 0
	movl	ksCurThread, %edx
.LVL5381:
.LBB14423:
.LBB14424:
	.loc 15 36 0
	movl	532(%edx), %edi
.LVL5382:
.LBE14424:
.LBE14423:
.LBE14422:
.LBE14421:
.LBB14425:
.LBB14426:
.LBB14427:
.LBB14428:
	movl	536(%edx), %ebp
.LVL5383:
.LBE14428:
.LBE14427:
.LBE14426:
.LBE14425:
.LBB14429:
.LBB14430:
	.loc 56 34 0
	testl	%ebx, %ebx
	je	.L4136
.LBE14430:
.LBE14429:
	.loc 35 49 0
	movl	4(%eax), %edx
.LVL5384:
	movl	(%eax), %eax
.LBB14433:
.LBB14431:
	.loc 56 35 0
	movl	12(%ebx), %ecx
.LVL5385:
.LBE14431:
.LBE14433:
	.loc 35 49 0
	movl	%edx, 12(%esp)
.LVL5386:
	movl	%eax, 8(%esp)
.LBB14434:
.LBB14435:
	.loc 27 45 0
	cmpl	$15, %edi
	ja	.L4137
.L4121:
.LVL5387:
.LBE14435:
.LBE14434:
.LBB14437:
.LBB14438:
	.loc 35 260 0
	movl	%edi, %eax
.LVL5388:
	movzbl	%al, %edi
.LVL5389:
.LBE14438:
.LBE14437:
	.loc 35 57 0
	movl	intStateIRQTable(,%edi,4), %eax
.LVL5390:
	testl	%eax, %eax
	je	.L4122
	.loc 35 59 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 68
	.loc 35 58 0
	movl	$9, current_syscall_error+24
	.loc 35 59 0
	pushl	556(%eax)
	.cfi_def_cfa_offset 72
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 76
	pushl	%eax
	.cfi_def_cfa_offset 80
	pushl	$59
	.cfi_def_cfa_offset 84
	pushl	$__func__.8943
	.cfi_def_cfa_offset 88
	pushl	$0
	.cfi_def_cfa_offset 92
	pushl	$.LC111
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL5391:
	addl	$24, %esp
	.cfi_def_cfa_offset 72
	pushl	%edi
	.cfi_def_cfa_offset 76
	pushl	$.LC738
	.cfi_def_cfa_offset 80
.LVL5392:
.L4134:
	.loc 35 73 0
	call	kprintf
.LVL5393:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL5394:
	.loc 35 75 0
	addl	$16, %esp
	.cfi_def_cfa_offset 64
.LBB14439:
.LBB14440:
	.loc 33 878 0
	movl	$3, %ecx
.LVL5395:
.LBE14440:
.LBE14439:
	.loc 35 75 0
	jmp	.L4132
.LVL5396:
	.p2align 4,,10
	.p2align 3
.L4128:
	.loc 35 41 0
	movl	$7, current_syscall_error+24
	.loc 35 42 0
	movl	$3, %ecx
.L4132:
.LBE14420:
	.loc 35 83 0
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%ecx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5397:
	.p2align 4,,10
	.p2align 3
.L4137:
	.cfi_restore_state
.LBB14451:
.LBB14445:
.LBB14436:
	movl	%edi, %eax
.LVL5398:
	movl	%ecx, 20(%esp)
	call	Arch_checkIRQ.part.58
.LVL5399:
.LBE14436:
.LBE14445:
	.loc 35 52 0
	movl	20(%esp), %ecx
	testl	%eax, %eax
	movl	%eax, 16(%esp)
	je	.L4121
	.loc 35 53 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 68
	pushl	556(%eax)
	.cfi_def_cfa_offset 72
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 76
	pushl	%eax
	.cfi_def_cfa_offset 80
	pushl	$53
	.cfi_def_cfa_offset 84
	pushl	$__func__.8943
	.cfi_def_cfa_offset 88
	pushl	$0
	.cfi_def_cfa_offset 92
	pushl	$.LC111
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL5400:
	movl	%edi, %eax
	addl	$24, %esp
	.cfi_def_cfa_offset 72
	movzbl	%al, %edi
.LVL5401:
	pushl	%edi
	.cfi_def_cfa_offset 76
	pushl	$.LC737
	.cfi_def_cfa_offset 80
	call	kprintf
.LVL5402:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL5403:
	.loc 35 54 0
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	movl	16(%esp), %ecx
	jmp	.L4132
	.p2align 4,,10
	.p2align 3
.L4122:
.LVL5404:
.LBB14446:
.LBB14447:
	.loc 62 128 0
	leal	24(%esp), %eax
	subl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 72
	pushl	%ecx
	.cfi_def_cfa_offset 76
	pushl	%ebp
	.cfi_def_cfa_offset 80
	pushl	28(%esp)
	.cfi_def_cfa_offset 84
	pushl	28(%esp)
	.cfi_def_cfa_offset 88
	pushl	$0
	.cfi_def_cfa_offset 92
	pushl	%eax
	.cfi_def_cfa_offset 96
	call	lookupSlotForCNodeOp
	.cfi_def_cfa_offset 92
.LVL5405:
	movl	52(%esp), %ecx
	movl	56(%esp), %ebp
.LVL5406:
.LBE14447:
.LBE14446:
	.loc 35 64 0
	addl	$28, %esp
	.cfi_def_cfa_offset 64
	testl	%ecx, %ecx
	jne	.L4138
.LVL5407:
	movl	0(%ebp), %eax
.LVL5408:
.LBB14448:
.LBB14443:
.LBB14441:
.LBB14442:
	.loc 11 2202 0
	movl	%eax, %ecx
.LVL5409:
	.loc 11 2203 0
	movl	%eax, %edx
	movzbl	%al, %eax
.LVL5410:
	.loc 11 2202 0
	andl	$14, %ecx
	.loc 11 2203 0
	andl	$15, %edx
.LVL5411:
	cmpl	$14, %ecx
	cmovne	%edx, %eax
.LVL5412:
.LBE14442:
.LBE14441:
	.loc 33 876 0
	testl	%eax, %eax
	je	.L4126
.LBE14443:
.LBE14448:
	.loc 35 73 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 68
.LBB14449:
.LBB14444:
	.loc 33 877 0
	movl	$8, current_syscall_error+24
.LVL5413:
.LBE14444:
.LBE14449:
	.loc 35 73 0
	pushl	556(%eax)
	.cfi_def_cfa_offset 72
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 76
	pushl	%eax
	.cfi_def_cfa_offset 80
	pushl	$74
	.cfi_def_cfa_offset 84
	pushl	$__func__.8943
	.cfi_def_cfa_offset 88
	pushl	$0
	.cfi_def_cfa_offset 92
	pushl	$.LC111
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL5414:
	addl	$28, %esp
	.cfi_def_cfa_offset 68
	pushl	%edi
	.cfi_def_cfa_offset 72
	pushl	488(%ebx)
	.cfi_def_cfa_offset 76
	pushl	$.LC740
	.cfi_def_cfa_offset 80
	jmp	.L4134
.LVL5415:
	.p2align 4,,10
	.p2align 3
.L4126:
	.cfi_restore_state
	.loc 35 78 0
	subl	$8, %esp
	.cfi_def_cfa_offset 72
	pushl	$2
	.cfi_def_cfa_offset 76
	pushl	ksCurThread
	.cfi_def_cfa_offset 80
	call	setThreadState
.LVL5416:
	.loc 35 79 0
	movl	%esi, 88(%esp)
	movl	%ebp, 84(%esp)
	movl	%edi, 80(%esp)
.LBE14451:
	.loc 35 83 0
	addl	$60, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
.LVL5417:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LVL5418:
.LBB14452:
	.loc 35 79 0
	jmp	invokeIRQControl
.LVL5419:
	.p2align 4,,10
	.p2align 3
.L4138:
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -20
	.cfi_offset 5, -8
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.loc 35 65 0
	movl	ksCurThread, %eax
	movl	%ecx, 8(%esp)
	subl	$4, %esp
	.cfi_def_cfa_offset 68
	pushl	556(%eax)
	.cfi_def_cfa_offset 72
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 76
	pushl	%eax
	.cfi_def_cfa_offset 80
	pushl	$66
	.cfi_def_cfa_offset 84
	pushl	$__func__.8943
	.cfi_def_cfa_offset 88
	pushl	$0
	.cfi_def_cfa_offset 92
	pushl	$.LC111
	.cfi_def_cfa_offset 96
	call	kprintf
.LVL5420:
	addl	$28, %esp
	.cfi_def_cfa_offset 68
	pushl	%edi
	.cfi_def_cfa_offset 72
	pushl	488(%ebx)
	.cfi_def_cfa_offset 76
	pushl	$.LC739
	.cfi_def_cfa_offset 80
	call	kprintf
.LVL5421:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL5422:
	.loc 35 67 0
	addl	$16, %esp
	.cfi_def_cfa_offset 64
	movl	8(%esp), %ecx
.LVL5423:
	jmp	.L4132
.LVL5424:
.L4136:
.LBB14450:
.LBB14432:
	call	getSyscallArg.part.152
.LVL5425:
.LBE14432:
.LBE14450:
.LBE14452:
	.cfi_endproc
.LFE761:
	.size	decodeIRQControlInvocation, .-decodeIRQControlInvocation
	.section	.text.unlikely
.LCOLDE741:
	.text
.LHOTE741:
	.section	.text.unlikely
.LCOLDB742:
	.text
.LHOTB742:
	.p2align 4,,15
	.globl	setIRQState
	.type	setIRQState, @function
setIRQState:
.LFB771:
	.loc 35 265 0
	.cfi_startproc
.LVL5426:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 35 265 0
	movl	32(%esp), %edx
	movl	36(%esp), %eax
	.loc 35 267 0
	testl	%edx, %edx
	.loc 35 266 0
	movzbl	%al, %ebx
	movl	%edx, intStateIRQTable(,%ebx,4)
	.loc 35 267 0
	sete	%dl
	movzbl	%dl, %edx
.LVL5427:
.LBB14467:
.LBB14468:
	.loc 49 124 0
	cmpb	$15, %al
	jbe	.L4145
	.loc 49 131 0
	subl	$16, %eax
.LVL5428:
	cmpb	$107, %al
	ja	.L4139
.LBB14469:
	.loc 49 132 0
	movl	x86KSIRQState+4(,%ebx,8), %esi
	movl	x86KSIRQState(,%ebx,8), %edi
.LVL5429:
	.loc 49 133 0
	movl	%esi, %eax
	shrl	$28, %eax
	cmpl	$1, %eax
	jne	.L4139
.LBB14470:
	.loc 49 137 0
	movl	%esi, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	andl	$8126464, %eax
	shrl	$18, %eax
	pushl	%eax
	.cfi_def_cfa_offset 40
	movl	%esi, %eax
.LBB14471:
.LBB14472:
	.loc 11 1879 0
	andl	$-32769, %esi
.LVL5430:
.LBE14472:
.LBE14471:
	.loc 49 137 0
	andl	$260046848, %eax
.LVL5431:
	shrl	$23, %eax
	pushl	%eax
	.cfi_def_cfa_offset 44
	pushl	%edx
	.cfi_def_cfa_offset 48
	movl	%edx, 28(%esp)
	call	ioapic_mask
.LVL5432:
.LBB14475:
.LBB14473:
	.loc 11 1880 0
	movl	28(%esp), %edx
.LBE14473:
.LBE14475:
.LBB14476:
.LBB14477:
	.loc 49 118 0
	movl	%edi, x86KSIRQState(,%ebx,8)
	addl	$16, %esp
	.cfi_def_cfa_offset 32
.LBE14477:
.LBE14476:
.LBB14479:
.LBB14474:
	.loc 11 1880 0
	sall	$15, %edx
	orl	%edx, %esi
.LVL5433:
.LBE14474:
.LBE14479:
.LBB14480:
.LBB14478:
	.loc 49 118 0
	movl	%esi, x86KSIRQState+4(,%ebx,8)
.LVL5434:
.L4139:
.LBE14478:
.LBE14480:
.LBE14470:
.LBE14469:
.LBE14468:
.LBE14467:
	.loc 35 268 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL5435:
	ret
.LVL5436:
	.p2align 4,,10
	.p2align 3
.L4145:
	.cfi_restore_state
.LBB14483:
.LBB14481:
	.loc 49 126 0
	movl	%ebx, 36(%esp)
.LVL5437:
	movl	%edx, 32(%esp)
.LVL5438:
.LBE14481:
.LBE14483:
	.loc 35 268 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LBB14484:
.LBB14482:
	.loc 49 126 0
	jmp	pic_mask_irq
.LVL5439:
.LBE14482:
.LBE14484:
	.cfi_endproc
.LFE771:
	.size	setIRQState, .-setIRQState
	.section	.text.unlikely
.LCOLDE742:
	.text
.LHOTE742:
	.section	.text.unlikely
.LCOLDB743:
	.text
.LHOTB743:
	.p2align 4,,15
	.type	emptySlot, @function
emptySlot:
.LFB737:
	.loc 33 602 0
	.cfi_startproc
.LVL5440:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	(%eax), %ecx
.LVL5441:
.LBB14527:
.LBB14528:
	.loc 11 2202 0
	movl	%ecx, %esi
	.loc 11 2203 0
	movl	%ecx, %ebx
	movzbl	%cl, %ecx
.LVL5442:
	.loc 11 2202 0
	andl	$14, %esi
	.loc 11 2203 0
	andl	$15, %ebx
.LVL5443:
	cmpl	$14, %esi
	cmovne	%ebx, %ecx
.LVL5444:
.LBE14528:
.LBE14527:
	.loc 33 603 0
	testl	%ecx, %ecx
	je	.L4146
.LVL5445:
.LBB14529:
.LBB14530:
	.loc 33 607 0
	movl	12(%eax), %edi
.LVL5446:
	.loc 33 611 0
	movl	8(%eax), %ecx
.LBB14531:
.LBB14532:
	.loc 11 664 0
	movl	%edi, %ebx
	andl	$-8, %ebx
.LVL5447:
.LBE14532:
.LBE14531:
	.loc 33 611 0
	andl	$-8, %ecx
.LVL5448:
	je	.L4151
.LVL5449:
.LBB14533:
.LBB14534:
	.loc 11 677 0
	movl	12(%ecx), %esi
	andl	$7, %esi
	orl	%ebx, %esi
	movl	%esi, 12(%ecx)
.LVL5450:
.L4151:
.LBE14534:
.LBE14533:
	.loc 33 614 0
	testl	%ebx, %ebx
	je	.L4152
.LVL5451:
.LBB14535:
.LBB14536:
	.loc 11 761 0
	movl	8(%ebx), %esi
	andl	$7, %esi
	orl	%ecx, %esi
	movl	%esi, 8(%ebx)
	movl	12(%ebx), %esi
	orl	%esi, %edi
.LVL5452:
.LBE14536:
.LBE14535:
.LBB14537:
.LBB14538:
	.loc 11 733 0
	andl	$-2, %esi
	movl	%edi, %ecx
.LVL5453:
.LBE14538:
.LBE14537:
	.loc 33 618 0
	andl	$1, %ecx
.LVL5454:
.LBB14540:
.LBB14539:
	.loc 11 733 0
	orl	%esi, %ecx
.LVL5455:
	movl	%ecx, 12(%ebx)
.LVL5456:
.L4152:
.LBE14539:
.LBE14540:
	.loc 33 621 0
	movl	$0, (%eax)
	movl	$0, 4(%eax)
.LVL5457:
	.loc 33 622 0
	movl	$0, 8(%eax)
	movl	$0, 12(%eax)
	.loc 33 624 0
	cmpb	$-1, %dl
	je	.L4146
.LVL5458:
.LBB14541:
.LBB14542:
.LBB14543:
	.loc 35 266 0
	movzbl	%dl, %ebx
.LVL5459:
	movl	$0, intStateIRQTable(,%ebx,4)
.LVL5460:
.LBB14544:
.LBB14545:
	.loc 49 124 0
	cmpb	$15, %dl
	jbe	.L4164
	.loc 49 131 0
	subl	$16, %edx
.LVL5461:
	cmpb	$107, %dl
	ja	.L4146
.LBB14546:
	.loc 49 132 0
	movl	x86KSIRQState+4(,%ebx,8), %esi
	movl	x86KSIRQState(,%ebx,8), %edi
.LVL5462:
	.loc 49 133 0
	movl	%esi, %eax
.LVL5463:
	shrl	$28, %eax
	cmpl	$1, %eax
	jne	.L4146
.LBB14547:
	.loc 49 137 0
	movl	%esi, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	andl	$8126464, %eax
	shrl	$18, %eax
	pushl	%eax
	.cfi_def_cfa_offset 24
	movl	%esi, %eax
.LBB14548:
.LBB14549:
	.loc 11 1880 0
	orl	$32768, %esi
.LVL5464:
.LBE14549:
.LBE14548:
	.loc 49 137 0
	andl	$260046848, %eax
.LVL5465:
	shrl	$23, %eax
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	$1
	.cfi_def_cfa_offset 32
	call	ioapic_mask
.LVL5466:
.LBB14550:
.LBB14551:
	.loc 49 118 0
	movl	%edi, x86KSIRQState(,%ebx,8)
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.LVL5467:
	movl	%esi, x86KSIRQState+4(,%ebx,8)
.LVL5468:
.L4146:
.LBE14551:
.LBE14550:
.LBE14547:
.LBE14546:
.LBE14545:
.LBE14544:
.LBE14543:
.LBE14542:
.LBE14541:
.LBE14530:
.LBE14529:
	.loc 33 628 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL5469:
	ret
.LVL5470:
	.p2align 4,,10
	.p2align 3
.L4164:
	.cfi_restore_state
.LBB14558:
.LBB14557:
.LBB14556:
.LBB14555:
.LBB14554:
.LBB14553:
.LBB14552:
	.loc 49 126 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
	pushl	%ebx
	.cfi_def_cfa_offset 28
	pushl	$1
	.cfi_def_cfa_offset 32
	call	pic_mask_irq
.LVL5471:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	jmp	.L4146
.LBE14552:
.LBE14553:
.LBE14554:
.LBE14555:
.LBE14556:
.LBE14557:
.LBE14558:
	.cfi_endproc
.LFE737:
	.size	emptySlot, .-emptySlot
	.section	.text.unlikely
.LCOLDE743:
	.text
.LHOTE743:
	.section	.rodata.str1.4
	.align 4
.LC744:
	.string	"finaliseCap should only return Zombie or NullCap"
	.align 4
.LC745:
	.string	"capRemovable(fc_ret.remainder, slot) && fc_ret.irq == irqInvalid"
	.section	.text.unlikely
.LCOLDB746:
	.text
.LHOTB746:
	.p2align 4,,15
	.globl	cteDeleteOne
	.type	cteDeleteOne, @function
cteDeleteOne:
.LFB742:
	.loc 33 768 0
	.cfi_startproc
.LVL5472:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 33 768 0
	movl	32(%esp), %ebx
	movl	(%ebx), %eax
.LVL5473:
.LBB14593:
.LBB14594:
	.loc 11 2202 0
	movl	%eax, %ecx
	.loc 11 2203 0
	movl	%eax, %edx
	movzbl	%al, %eax
.LVL5474:
	.loc 11 2202 0
	andl	$14, %ecx
	.loc 11 2203 0
	andl	$15, %edx
.LVL5475:
	cmpl	$14, %ecx
	cmovne	%edx, %eax
.LVL5476:
.LBE14594:
.LBE14593:
	.loc 33 770 0
	testl	%eax, %eax
	jne	.L4191
	.loc 33 784 0
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L4191:
	.cfi_restore_state
.LBB14595:
	.loc 33 777 0
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	%ebx
	.cfi_def_cfa_offset 48
	call	isFinalCapability
.LVL5477:
	addl	$16, %esp
	.cfi_def_cfa_offset 32
.LVL5478:
	.loc 33 778 0
	leal	4(%esp), %edx
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	$1
	.cfi_def_cfa_offset 48
	pushl	%eax
	.cfi_def_cfa_offset 52
	pushl	4(%ebx)
	.cfi_def_cfa_offset 56
	pushl	(%ebx)
	.cfi_def_cfa_offset 60
	pushl	%edx
	.cfi_def_cfa_offset 64
	call	finaliseCap
	.cfi_def_cfa_offset 60
.LVL5479:
	movl	32(%esp), %ecx
	movl	36(%esp), %eax
.LVL5480:
.LBB14596:
.LBB14597:
.LBB14598:
.LBB14599:
	.loc 11 2202 0
	addl	$28, %esp
	.cfi_def_cfa_offset 32
	movl	%ecx, %edi
	.loc 11 2203 0
	movl	%ecx, %edx
	movzbl	%cl, %esi
	.loc 11 2202 0
	andl	$14, %edi
	.loc 11 2203 0
	andl	$15, %edx
	cmpl	$14, %edi
	cmove	%esi, %edx
.LVL5481:
.LBE14599:
.LBE14598:
	.loc 33 633 0
	testl	%edx, %edx
	je	.L4172
	cmpl	$46, %edx
	jne	.L4189
.LVL5482:
.LBB14600:
.LBB14601:
.LBB14602:
.LBB14603:
.LBB14604:
.LBB14605:
.LBB14606:
	.loc 11 3434 0
	cmpl	$46, %esi
	jne	.L4192
	.loc 11 3437 0
	andl	$16128, %ecx
.LVL5483:
	shrl	$8, %ecx
.LVL5484:
.LBE14606:
.LBE14605:
	.loc 54 103 0
	cmpl	$32, %ecx
	je	.L4175
.LVL5485:
.LBE14604:
.LBE14603:
	.loc 54 113 0
	andl	$31, %ecx
	movl	$1, %edx
	addl	$1, %ecx
	sall	%cl, %edx
	leal	-1(%edx), %ecx
	negl	%edx
	andl	%eax, %ecx
.LVL5486:
.L4179:
.LBE14602:
.LBE14601:
	.loc 33 639 0
	testl	%ecx, %ecx
	je	.L4172
.LVL5487:
.LBE14600:
.LBE14597:
.LBE14596:
	.loc 33 780 0
	andl	%eax, %edx
	cmpl	%edx, %ebx
	jne	.L4177
	cmpl	$1, %ecx
	jne	.L4177
.LVL5488:
.L4172:
	.loc 33 780 0 is_stmt 0 discriminator 2
	cmpb	$-1, 12(%esp)
	jne	.L4177
.LBE14595:
	.loc 33 784 0 is_stmt 1
	addl	$16, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
.LBB14623:
	.loc 33 782 0
	movl	%ebx, %eax
.LVL5489:
	movl	$255, %edx
.LBE14623:
	.loc 33 784 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LBB14624:
	.loc 33 782 0
	jmp	emptySlot
.LVL5490:
	.p2align 4,,10
	.p2align 3
.L4189:
	.cfi_restore_state
.LBB14621:
.LBB14619:
.LBB14615:
.LBB14616:
	.loc 33 642 0
	pushl	$__func__.8740
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	pushl	$642
	.cfi_def_cfa_offset 40
	pushl	$.LC381
	.cfi_def_cfa_offset 44
	pushl	$.LC744
	.cfi_def_cfa_offset 48
	call	_fail
.LVL5491:
	.p2align 4,,10
	.p2align 3
.L4175:
	.cfi_restore_state
.LBE14616:
.LBE14615:
.LBB14617:
.LBB14613:
.LBB14611:
	.loc 54 113 0
	movl	%eax, %ecx
	movl	$-32, %edx
	andl	$31, %ecx
.LVL5492:
	jmp	.L4179
.LVL5493:
.L4177:
.LBE14611:
.LBE14613:
.LBE14617:
.LBE14619:
.LBE14621:
.LBE14624:
.LBB14625:
.LBB14626:
.LBB14627:
	.loc 33 780 0
	pushl	$__FUNCTION__.8778
	.cfi_remember_state
	.cfi_def_cfa_offset 36
	pushl	$781
	.cfi_def_cfa_offset 40
	pushl	$.LC381
	.cfi_def_cfa_offset 44
	pushl	$.LC745
	.cfi_def_cfa_offset 48
	call	_assert_fail
.LVL5494:
.L4192:
	.cfi_restore_state
.LBE14627:
.LBE14626:
.LBE14625:
.LBB14628:
.LBB14622:
.LBB14620:
.LBB14618:
.LBB14614:
.LBB14612:
.LBB14610:
.LBB14609:
.LBB14608:
.LBB14607:
	call	cap_zombie_cap_get_capZombieType.isra.120.part.121
.LVL5495:
.LBE14607:
.LBE14608:
.LBE14609:
.LBE14610:
.LBE14612:
.LBE14614:
.LBE14618:
.LBE14620:
.LBE14622:
.LBE14628:
	.cfi_endproc
.LFE742:
	.size	cteDeleteOne, .-cteDeleteOne
	.section	.text.unlikely
.LCOLDE746:
	.text
.LHOTE746:
	.section	.rodata.str1.4
	.align 4
.LC747:
	.string	"thread_state_get_tsType(receiver->tcbState) == ThreadState_BlockedOnReply"
	.section	.text.unlikely
.LCOLDB748:
	.text
.LHOTB748:
	.p2align 4,,15
	.globl	doReplyTransfer
	.type	doReplyTransfer, @function
doReplyTransfer:
.LFB685:
	.loc 32 120 0
	.cfi_startproc
.LVL5496:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 32 120 0
	movl	20(%esp), %ebx
	movl	16(%esp), %esi
	movl	24(%esp), %edi
	.loc 32 121 0
	movl	588(%ebx), %eax
	andl	$15, %eax
	cmpl	$5, %eax
	jne	.L4199
	.loc 32 124 0
	testb	$7, 604(%ebx)
	jne	.L4195
	.loc 32 125 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	%ebx
	.cfi_def_cfa_offset 32
	pushl	$1
	.cfi_def_cfa_offset 36
	pushl	$0
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	%esi
	.cfi_def_cfa_offset 48
	call	doIPCTransfer
.LVL5497:
	.loc 32 127 0
	addl	$20, %esp
	.cfi_def_cfa_offset 28
	pushl	%edi
	.cfi_def_cfa_offset 32
	call	cteDeleteOne
.LVL5498:
	.loc 32 128 0
	popl	%ecx
	.cfi_def_cfa_offset 28
	popl	%esi
	.cfi_def_cfa_offset 24
	pushl	$1
	.cfi_def_cfa_offset 28
.L4198:
.LBB14648:
.LBB14649:
.LBB14650:
	.loc 32 138 0
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	setThreadState
.LVL5499:
.LBB14651:
.LBB14652:
	.loc 32 409 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	%ebx, %eax
	movl	$1, %edx
.LBE14652:
.LBE14651:
.LBE14650:
.LBE14649:
.LBE14648:
	.loc 32 144 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LBB14659:
.LBB14657:
.LBB14655:
.LBB14654:
.LBB14653:
	.loc 32 409 0
	jmp	possibleSwitchTo
.LVL5500:
	.p2align 4,,10
	.p2align 3
.L4195:
	.cfi_restore_state
.LBE14653:
.LBE14654:
	.loc 32 134 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	%edi
	.cfi_def_cfa_offset 32
	call	cteDeleteOne
.LVL5501:
	.loc 32 135 0
	popl	%eax
	.cfi_def_cfa_offset 28
	popl	%edx
	.cfi_def_cfa_offset 24
	pushl	%esi
	.cfi_def_cfa_offset 28
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	handleFaultReply
.LVL5502:
	.loc 32 137 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	.loc 32 136 0
	movl	$0, 604(%ebx)
	movl	$0, 608(%ebx)
	.loc 32 137 0
	testl	%eax, %eax
	jne	.L4200
	.loc 32 141 0
	movl	$0, 20(%esp)
	movl	%ebx, 16(%esp)
.LBE14655:
.LBE14657:
.LBE14659:
	.loc 32 144 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL5503:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.LVL5504:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
.LVL5505:
.LBB14660:
.LBB14658:
.LBB14656:
	.loc 32 141 0
	jmp	setThreadState
.LVL5506:
	.p2align 4,,10
	.p2align 3
.L4200:
	.cfi_restore_state
	.loc 32 138 0
	subl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pushl	$2
	.cfi_def_cfa_offset 28
	jmp	.L4198
.LVL5507:
.L4199:
	.cfi_restore_state
.LBE14656:
.LBE14658:
.LBE14660:
	.loc 32 121 0 discriminator 1
	pushl	$__FUNCTION__.8318
	.cfi_def_cfa_offset 20
	pushl	$122
	.cfi_def_cfa_offset 24
	pushl	$.LC365
	.cfi_def_cfa_offset 28
	pushl	$.LC747
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL5508:
	.cfi_endproc
.LFE685:
	.size	doReplyTransfer, .-doReplyTransfer
	.section	.text.unlikely
.LCOLDE748:
	.text
.LHOTE748:
	.section	.rodata.str1.4
	.align 4
.LC749:
	.string	"/home/axjllt/Desktop/ori_refos/kernel/src/api/syscall.c"
	.align 4
.LC750:
	.string	"caller != NODE_STATE(ksCurThread)"
	.align 4
.LC751:
	.string	"Attempted reply operation when no reply cap present."
	.align 4
.LC752:
	.string	"handleReply: invalid caller cap"
	.section	.text.unlikely
.LCOLDB753:
	.text
.LHOTB753:
	.p2align 4,,15
	.type	handleReply, @function
handleReply:
.LFB403:
	.loc 73 307 0
	.cfi_startproc
	.loc 73 311 0
	movl	ksCurThread, %ecx
	.loc 73 307 0
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 73 311 0
	movl	%ecx, %eax
	andl	$-1024, %eax
	leal	48(%eax), %ebx
.LVL5509:
	.loc 73 312 0
	movl	48(%eax), %eax
.LVL5510:
.LBB14661:
.LBB14662:
	.loc 11 2202 0
	movl	%eax, %edi
	.loc 11 2203 0
	movl	%eax, %esi
	movzbl	%al, %edx
	.loc 11 2202 0
	andl	$14, %edi
	.loc 11 2203 0
	andl	$15, %esi
	cmpl	$14, %edi
	cmovne	%esi, %edx
.LVL5511:
.LBE14662:
.LBE14661:
	.loc 73 314 0
	testl	%edx, %edx
	je	.L4205
	cmpl	$8, %edx
	jne	.L4204
.LVL5512:
.LBB14663:
.LBB14664:
.LBB14665:
	.loc 11 2636 0
	cmpl	$8, %esi
	jne	.L4211
.LVL5513:
.LBE14665:
.LBE14664:
	.loc 73 318 0
	testb	$16, %al
	jne	.L4204
	.loc 73 321 0
	andl	$-32, %eax
.LVL5514:
	.loc 73 324 0
	cmpl	%eax, %ecx
	je	.L4212
	.loc 73 325 0
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	pushl	%ebx
	.cfi_def_cfa_offset 24
.LVL5515:
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	%ecx
	.cfi_def_cfa_offset 32
	call	doReplyTransfer
.LVL5516:
	.loc 73 326 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
.LBE14663:
	.loc 73 338 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL5517:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL5518:
	.p2align 4,,10
	.p2align 3
.L4204:
	.cfi_restore_state
	.loc 73 337 0
	pushl	$__func__.5538
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	$337
	.cfi_def_cfa_offset 24
	pushl	$.LC749
	.cfi_def_cfa_offset 28
	pushl	$.LC752
	.cfi_def_cfa_offset 32
	call	_fail
.LVL5519:
	.p2align 4,,10
	.p2align 3
.L4205:
	.cfi_restore_state
	.loc 73 330 0
	leal	668(%ecx), %eax
.LVL5520:
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	pushl	556(%ecx)
	.cfi_def_cfa_offset 24
.LVL5521:
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	%ecx
	.cfi_def_cfa_offset 32
	pushl	$330
	.cfi_def_cfa_offset 36
	pushl	$__func__.5538
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL5522:
	addl	$20, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC751
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL5523:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL5524:
	.loc 73 331 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	.loc 73 338 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL5525:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL5526:
.L4211:
	.cfi_restore_state
.LBB14668:
.LBB14667:
.LBB14666:
	call	cap_reply_cap_get_capReplyMaster.isra.92.part.93
.LVL5527:
.L4212:
.LBE14666:
.LBE14667:
	.loc 73 324 0 discriminator 1
	pushl	$__FUNCTION__.5536
	.cfi_def_cfa_offset 20
.LVL5528:
	pushl	$324
	.cfi_def_cfa_offset 24
	pushl	$.LC749
	.cfi_def_cfa_offset 28
	pushl	$.LC750
	.cfi_def_cfa_offset 32
	call	_assert_fail
.LVL5529:
.LBE14668:
	.cfi_endproc
.LFE403:
	.size	handleReply, .-handleReply
	.section	.text.unlikely
.LCOLDE753:
	.text
.LHOTE753:
	.section	.text.unlikely
.LCOLDB754:
	.text
.LHOTB754:
	.p2align 4,,15
	.globl	performInvocation_Reply
	.type	performInvocation_Reply, @function
performInvocation_Reply:
.LFB797:
	.loc 45 633 0
	.cfi_startproc
.LVL5530:
	subl	$16, %esp
	.cfi_def_cfa_offset 20
	.loc 45 634 0
	pushl	24(%esp)
	.cfi_def_cfa_offset 24
	pushl	24(%esp)
	.cfi_def_cfa_offset 28
	pushl	ksCurThread
	.cfi_def_cfa_offset 32
	call	doReplyTransfer
.LVL5531:
	.loc 45 636 0
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE797:
	.size	performInvocation_Reply, .-performInvocation_Reply
	.section	.text.unlikely
.LCOLDE754:
	.text
.LHOTE754:
	.section	.rodata.str1.4
	.align 4
.LC755:
	.string	"endpoint_ptr_get_state(epptr) != EPState_Idle"
	.section	.text.unlikely
.LCOLDB756:
	.text
.LHOTB756:
	.p2align 4,,15
	.globl	cancelIPC
	.type	cancelIPC, @function
cancelIPC:
.LFB758:
	.loc 64 225 0
	.cfi_startproc
.LVL5532:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 64 225 0
	movl	48(%esp), %eax
.LVL5533:
	movl	588(%eax), %edx
.LVL5534:
	.loc 64 228 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$5, %ecx
	je	.L4217
	ja	.L4218
	cmpl	$3, %ecx
	jb	.L4215
.LVL5535:
.LBB14697:
	.loc 64 235 0
	andl	$-16, %edx
.LVL5536:
	movl	(%edx), %ecx
.LVL5537:
	.loc 64 238 0
	testb	$3, %cl
	je	.L4236
.LVL5538:
.LBB14698:
.LBB14699:
	.loc 64 27 0
	movl	%ecx, %edi
	movl	4(%edx), %ebx
.LVL5539:
	andl	$-16, %edi
	movl	%edi, 12(%esp)
.LBE14699:
.LBE14698:
.LBB14701:
.LBB14702:
	.loc 31 227 0
	movl	656(%eax), %edi
.LBE14702:
.LBE14701:
.LBB14705:
.LBB14700:
	.loc 64 26 0
	movl	%ebx, %esi
	andl	$-16, %esi
.LVL5540:
.LBE14700:
.LBE14705:
.LBB14706:
.LBB14703:
	.loc 31 227 0
	testl	%edi, %edi
	je	.L4222
	.loc 31 228 0
	movl	652(%eax), %ebp
	movl	%ebp, 652(%edi)
	movl	652(%eax), %ebp
.LVL5541:
.L4223:
	.loc 31 233 0
	testl	%ebp, %ebp
	je	.L4229
	.loc 31 234 0
	movl	%edi, 656(%ebp)
.LVL5542:
.L4224:
.LBE14703:
.LBE14706:
.LBB14707:
.LBB14708:
.LBB14709:
.LBB14710:
	.loc 11 880 0
	testl	$15, %esi
	jne	.L4237
	.loc 11 882 0
	movl	%esi, %edi
	andl	$15, %ebx
.LVL5543:
	andl	$-16, %edi
	orl	%edi, %ebx
	movl	%ebx, 4(%edx)
.LVL5544:
.LBE14710:
.LBE14709:
.LBB14712:
.LBB14713:
	.loc 11 899 0
	testb	$15, 12(%esp)
	jne	.L4238
	.loc 11 901 0
	movl	12(%esp), %ebx
	andl	$15, %ecx
.LVL5545:
	andl	$-16, %ebx
	orl	%ebx, %ecx
.LVL5546:
.LBE14713:
.LBE14712:
.LBE14708:
.LBE14707:
	.loc 64 245 0
	testl	%esi, %esi
	je	.L4239
.L4235:
	.loc 64 249 0
	subl	$8, %esp
	.cfi_def_cfa_offset 56
.LBB14718:
.LBB14719:
	.loc 11 919 0
	movl	%ecx, (%edx)
.LVL5547:
.LBE14719:
.LBE14718:
	.loc 64 249 0
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	%eax
	.cfi_def_cfa_offset 64
	call	setThreadState
.LVL5548:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.LBE14697:
	.loc 64 276 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5549:
	.p2align 4,,10
	.p2align 3
.L4218:
	.cfi_restore_state
	.loc 64 228 0
	cmpl	$6, %ecx
	jne	.L4215
.LVL5550:
	.loc 64 254 0
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	andl	$-16, %edx
	pushl	%edx
	.cfi_def_cfa_offset 60
	pushl	%eax
	.cfi_def_cfa_offset 64
	call	cancelSignal
.LVL5551:
	.loc 64 256 0
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.LVL5552:
.L4215:
	.loc 64 276 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5553:
	.p2align 4,,10
	.p2align 3
.L4217:
	.cfi_restore_state
.LBB14724:
	.loc 64 261 0
	movl	$0, 604(%eax)
	movl	$0, 608(%eax)
.LVL5554:
	andl	$-1024, %eax
.LVL5555:
.LBB14725:
.LBB14726:
	.loc 11 664 0
	movl	44(%eax), %eax
.LVL5556:
.LBE14726:
.LBE14725:
	.loc 64 267 0
	andl	$-8, %eax
.LVL5557:
	je	.L4215
	.loc 64 270 0
	movl	%eax, 48(%esp)
.LVL5558:
.LBE14724:
	.loc 64 276 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LBB14727:
	.loc 64 270 0
	jmp	cteDeleteOne
.LVL5559:
	.p2align 4,,10
	.p2align 3
.L4239:
	.cfi_restore_state
.LBE14727:
.LBB14728:
.LBB14721:
.LBB14720:
	.loc 11 919 0
	andl	$-4, %ecx
	jmp	.L4235
.LVL5560:
	.p2align 4,,10
	.p2align 3
.L4229:
.LBE14720:
.LBE14721:
.LBB14722:
.LBB14704:
	.loc 31 227 0
	movl	%edi, 12(%esp)
.LVL5561:
	jmp	.L4224
.LVL5562:
	.p2align 4,,10
	.p2align 3
.L4222:
	.loc 31 230 0
	movl	652(%eax), %esi
.LVL5563:
	movl	%esi, %ebp
	jmp	.L4223
.LVL5564:
.L4236:
.LBE14704:
.LBE14722:
	.loc 64 238 0 discriminator 1
	pushl	$__FUNCTION__.8891
	.cfi_remember_state
	.cfi_def_cfa_offset 52
	pushl	$238
	.cfi_def_cfa_offset 56
	pushl	$.LC391
	.cfi_def_cfa_offset 60
	pushl	$.LC755
	.cfi_def_cfa_offset 64
	call	_assert_fail
.LVL5565:
.L4237:
	.cfi_restore_state
.LBB14723:
.LBB14717:
.LBB14715:
.LBB14711:
	call	endpoint_ptr_set_epQueue_head.isra.239.part.240
.LVL5566:
.L4238:
.LBE14711:
.LBE14715:
.LBB14716:
.LBB14714:
	call	endpoint_ptr_set_epQueue_tail.isra.241.part.242
.LVL5567:
.LBE14714:
.LBE14716:
.LBE14717:
.LBE14723:
.LBE14728:
	.cfi_endproc
.LFE758:
	.size	cancelIPC, .-cancelIPC
	.section	.text.unlikely
.LCOLDE756:
	.text
.LHOTE756:
	.section	.text.unlikely
.LCOLDB757:
	.text
.LHOTB757:
	.p2align 4,,15
	.globl	suspend
	.type	suspend, @function
suspend:
.LFB682:
	.loc 32 83 0
	.cfi_startproc
.LVL5568:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$20, %esp
	.cfi_def_cfa_offset 28
	.loc 32 83 0
	movl	28(%esp), %ebx
	.loc 32 84 0
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	cancelIPC
.LVL5569:
	.loc 32 85 0
	popl	%eax
	.cfi_def_cfa_offset 28
	popl	%edx
	.cfi_def_cfa_offset 24
	pushl	$0
	.cfi_def_cfa_offset 28
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	setThreadState
.LVL5570:
	.loc 32 86 0
	movl	%ebx, 32(%esp)
	.loc 32 87 0
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	.loc 32 86 0
	jmp	tcbSchedDequeue
.LVL5571:
	.cfi_endproc
.LFE682:
	.size	suspend, .-suspend
	.section	.text.unlikely
.LCOLDE757:
	.text
.LHOTE757:
	.section	.text.unlikely
.LCOLDB758:
	.text
.LHOTB758:
	.p2align 4,,15
	.globl	invokeTCB_Suspend
	.type	invokeTCB_Suspend, @function
invokeTCB_Suspend:
.LFB826:
	.loc 31 1296 0
	.cfi_startproc
.LVL5572:
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	.loc 31 1297 0
	pushl	28(%esp)
	.cfi_def_cfa_offset 32
	call	suspend
.LVL5573:
	.loc 31 1299 0
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE826:
	.size	invokeTCB_Suspend, .-invokeTCB_Suspend
	.section	.text.unlikely
.LCOLDE758:
	.text
.LHOTE758:
	.section	.text.unlikely
.LCOLDB759:
	.text
.LHOTB759:
	.p2align 4,,15
	.globl	invokeTCB_ReadRegisters
	.type	invokeTCB_ReadRegisters, @function
invokeTCB_ReadRegisters:
.LFB830:
	.loc 31 1449 0
	.cfi_startproc
.LVL5574:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 31 1454 0
	movl	ksCurThread, %esi
.LVL5575:
	.loc 31 1456 0
	movl	52(%esp), %edx
	.loc 31 1449 0
	movl	48(%esp), %edi
	movl	56(%esp), %ebx
	.loc 31 1456 0
	testl	%edx, %edx
	jne	.L4279
.L4245:
	.loc 31 1465 0
	movl	64(%esp), %eax
	testl	%eax, %eax
	je	.L4246
.LBB14744:
	.loc 31 1468 0
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	%esi
	.cfi_def_cfa_offset 60
	pushl	$1
	.cfi_def_cfa_offset 64
	call	lookupIPCBuffer
.LVL5576:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.LVL5577:
.LBB14745:
.LBB14746:
	.loc 15 30 0
	movl	$0, 516(%esi)
.LVL5578:
.LBE14746:
.LBE14745:
	.loc 31 1472 0
	testl	%ebx, %ebx
	je	.L4254
.LVL5579:
.LBB14747:
.LBB14748:
	.loc 15 30 0
	movl	556(%edi), %edx
	movl	%edx, 532(%esi)
.LVL5580:
.LBE14748:
.LBE14747:
	.loc 31 1472 0
	cmpl	$1, %ebx
	jbe	.L4255
.LVL5581:
.LBB14751:
.LBB14749:
	.loc 15 30 0
	movl	580(%edi), %edx
.LBE14749:
.LBE14751:
	.loc 31 1477 0
	testl	%eax, %eax
.LBB14752:
.LBB14750:
	.loc 15 30 0
	movl	%edx, 536(%esi)
.LVL5582:
.LBE14750:
.LBE14752:
	.loc 31 1477 0
	setne	%dl
	movl	%edx, %ebp
	cmpl	$2, %ebx
	jbe	.L4256
	testb	%dl, %dl
	jne	.L4280
.L4256:
	.loc 31 1472 0
	movl	$2, %edx
.LVL5583:
.L4248:
	.loc 31 1491 0
	movl	%ebp, %ecx
	movl	$0, 12(%esp)
	testb	%cl, %cl
	je	.L4253
.LVL5584:
.L4252:
	movl	$0, 12(%esp)
	.loc 31 1492 0
	cmpl	$10, %ebx
	jbe	.L4253
.LVL5585:
.LBB14753:
.LBB14754:
	.loc 15 36 0 discriminator 1
	movl	560(%edi), %ecx
.LVL5586:
.LBE14754:
.LBE14753:
	.loc 31 1494 0 discriminator 1
	movl	%ecx, 44(%eax)
.LVL5587:
	.loc 31 1493 0 discriminator 1
	cmpl	$11, %ebx
	je	.L4259
.LVL5588:
.LBB14757:
.LBB14755:
	.loc 15 36 0
	movl	548(%edi), %ecx
.LVL5589:
.LBE14755:
.LBE14757:
	.loc 31 1494 0
	movl	%ecx, 48(%eax)
.LVL5590:
	.loc 31 1493 0
	cmpl	$12, %ebx
	je	.L4260
.LVL5591:
.LBB14758:
.LBB14756:
	.loc 15 36 0
	movl	552(%edi), %ecx
.LVL5592:
.LBE14756:
.LBE14758:
	.loc 31 1493 0
	movl	$3, 12(%esp)
	.loc 31 1494 0
	movl	%ecx, 52(%eax)
.LVL5593:
.L4253:
.LBB14759:
.LBB14760:
	.loc 15 30 0
	addl	12(%esp), %edx
.LVL5594:
	movl	%edx, 528(%esi)
.LVL5595:
.L4246:
.LBE14760:
.LBE14759:
.LBE14744:
	.loc 31 1502 0
	subl	$8, %esp
	.cfi_def_cfa_offset 56
	pushl	$1
	.cfi_def_cfa_offset 60
	pushl	%esi
	.cfi_def_cfa_offset 64
	call	setThreadState
.LVL5596:
	.loc 31 1505 0
	addl	$44, %esp
	.cfi_def_cfa_offset 20
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL5597:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5598:
	.p2align 4,,10
	.p2align 3
.L4279:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -20
	.cfi_offset 5, -8
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.loc 31 1457 0
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	%edi
	.cfi_def_cfa_offset 64
	call	suspend
.LVL5599:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L4245
.LVL5600:
	.p2align 4,,10
	.p2align 3
.L4280:
.LBB14763:
	.loc 31 1477 0 discriminator 2
	movl	$16, %ecx
	movl	$2, %edx
	jmp	.L4249
.LVL5601:
	.p2align 4,,10
	.p2align 3
.L4250:
	movl	frameRegisters(,%edx,4), %ecx
.LVL5602:
.L4249:
.LBB14761:
.LBB14762:
	.loc 15 36 0 discriminator 2
	movl	512(%edi,%ecx,4), %ecx
.LBE14762:
.LBE14761:
	.loc 31 1479 0 discriminator 2
	addl	$1, %edx
.LVL5603:
	movl	%ecx, (%eax,%edx,4)
.LVL5604:
	.loc 31 1478 0 discriminator 2
	cmpl	%edx, %ebx
	jbe	.L4252
	cmpl	$9, %edx
	jbe	.L4250
	jmp	.L4252
.LVL5605:
	.p2align 4,,10
	.p2align 3
.L4254:
	.loc 31 1472 0
	xorl	%edx, %edx
.LVL5606:
.L4247:
	.loc 31 1477 0
	testl	%eax, %eax
	setne	%cl
	movl	%ecx, %ebp
	jmp	.L4248
.LVL5607:
	.p2align 4,,10
	.p2align 3
.L4255:
	.loc 31 1472 0
	movl	$1, %edx
	jmp	.L4247
.LVL5608:
.L4259:
	.loc 31 1493 0
	movl	$1, 12(%esp)
	jmp	.L4253
.LVL5609:
.L4260:
	movl	$2, 12(%esp)
	jmp	.L4253
.LBE14763:
	.cfi_endproc
.LFE830:
	.size	invokeTCB_ReadRegisters, .-invokeTCB_ReadRegisters
	.section	.text.unlikely
.LCOLDE759:
	.text
.LHOTE759:
	.section	.rodata.str1.4
	.align 4
.LC760:
	.string	"TCB ReadRegisters: Truncated message."
	.align 4
.LC761:
	.string	"TCB ReadRegisters: Attempted to read an invalid number of registers (%d)."
	.align 4
.LC762:
	.string	"TCB ReadRegisters: Attempted to read our own registers."
	.section	.text.unlikely
.LCOLDB763:
	.text
.LHOTB763:
	.p2align 4,,15
	.globl	decodeReadRegisters
	.type	decodeReadRegisters, @function
decodeReadRegisters:
.LFB816:
	.loc 31 796 0
	.cfi_startproc
.LVL5610:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	.loc 31 800 0
	cmpl	$1, 40(%esp)
	.loc 31 796 0
	movl	32(%esp), %edx
	movl	44(%esp), %ebp
	.loc 31 800 0
	jbe	.L4288
.LVL5611:
.LBB14764:
.LBB14765:
	.loc 56 31 0
	movl	ksCurThread, %eax
.LVL5612:
.LBE14765:
.LBE14764:
.LBB14769:
.LBB14770:
.LBB14771:
.LBB14772:
	.loc 15 36 0
	movl	536(%eax), %esi
.LVL5613:
.LBE14772:
.LBE14771:
.LBE14770:
.LBE14769:
	.loc 31 809 0
	leal	-1(%esi), %ecx
	cmpl	$12, %ecx
	ja	.L4289
.LVL5614:
.LBB14773:
.LBB14774:
	.loc 11 2768 0
	movl	%edx, %ecx
	andl	$15, %ecx
	cmpl	$12, %ecx
	jne	.L4290
.LVL5615:
.LBE14774:
.LBE14773:
	.loc 31 821 0
	movl	%edx, %ebx
	andl	$-16, %ebx
.LVL5616:
	.loc 31 822 0
	cmpl	%eax, %ebx
	je	.L4291
.LBB14776:
.LBB14768:
.LBB14766:
.LBB14767:
	.loc 15 36 0
	movl	532(%eax), %edi
.LBE14767:
.LBE14766:
.LBE14768:
.LBE14776:
	.loc 31 828 0
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	pushl	$2
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	call	setThreadState
.LVL5617:
	.loc 31 829 0
	movl	%ebp, 64(%esp)
	andl	$1, %edi
	movl	%esi, 56(%esp)
	movl	%edi, 52(%esp)
	movl	%ebx, 48(%esp)
	movl	$0, 60(%esp)
	.loc 31 833 0
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL5618:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 31 829 0
	jmp	invokeTCB_ReadRegisters
.LVL5619:
	.p2align 4,,10
	.p2align 3
.L4289:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -20
	.cfi_offset 5, -8
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.loc 31 810 0
	leal	668(%eax), %edx
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	pushl	556(%eax)
	.cfi_def_cfa_offset 40
	pushl	%edx
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	pushl	$811
	.cfi_def_cfa_offset 52
	pushl	$__func__.9395
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	$.LC111
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL5620:
	addl	$24, %esp
	.cfi_def_cfa_offset 40
	pushl	%esi
	.cfi_def_cfa_offset 44
	pushl	$.LC761
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL5621:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL5622:
	.loc 31 816 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 31 833 0
	movl	$3, %eax
	.loc 31 812 0
	movl	$4, current_syscall_error+24
	.loc 31 813 0
	movl	$1, current_syscall_error+8
	.loc 31 814 0
	movl	$13, current_syscall_error+12
	.loc 31 833 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L4288:
	.cfi_restore_state
	.loc 31 801 0
	movl	ksCurThread, %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	pushl	556(%eax)
	.cfi_def_cfa_offset 40
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	pushl	$801
	.cfi_def_cfa_offset 52
	pushl	$__func__.9395
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	$.LC111
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL5623:
	addl	$20, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC760
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL5624:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL5625:
	.loc 31 803 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 31 833 0
	movl	$3, %eax
	.loc 31 802 0
	movl	$7, current_syscall_error+24
	.loc 31 833 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5626:
	.p2align 4,,10
	.p2align 3
.L4291:
	.cfi_restore_state
	.loc 31 823 0
	leal	668(%ebx), %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	pushl	556(%ebx)
	.cfi_def_cfa_offset 40
	pushl	%eax
	.cfi_def_cfa_offset 44
	pushl	%ebx
	.cfi_def_cfa_offset 48
	pushl	$823
	.cfi_def_cfa_offset 52
	pushl	$__func__.9395
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	$.LC111
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL5627:
	addl	$20, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC762
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL5628:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL5629:
	.loc 31 825 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 31 833 0
	movl	$3, %eax
	.loc 31 824 0
	movl	$3, current_syscall_error+24
	.loc 31 833 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL5630:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5631:
.L4290:
	.cfi_restore_state
.LBB14777:
.LBB14775:
	call	cap_thread_cap_get_capTCBPtr.isra.89.part.90
.LVL5632:
.LBE14775:
.LBE14777:
	.cfi_endproc
.LFE816:
	.size	decodeReadRegisters, .-decodeReadRegisters
	.section	.text.unlikely
.LCOLDE763:
	.text
.LHOTE763:
	.section	.text.unlikely
.LCOLDB764:
	.text
.LHOTB764:
	.p2align 4,,15
	.globl	restart
	.type	restart, @function
restart:
.LFB683:
	.loc 32 91 0
	.cfi_startproc
.LVL5633:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$8, %esp
	.cfi_def_cfa_offset 16
	.loc 32 91 0
	movl	16(%esp), %ebx
.LVL5634:
.LBB14794:
.LBB14795:
.LBB14796:
	.loc 11 422 0
	movl	588(%ebx), %ecx
	andl	$15, %ecx
	cmpl	$6, %ecx
	ja	.L4292
	movl	$1, %eax
	sall	%cl, %eax
	testb	$121, %al
	je	.L4292
.LVL5635:
.LBE14796:
.LBE14795:
.LBE14794:
.LBB14797:
.LBB14798:
	.loc 32 93 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	cancelIPC
.LVL5636:
	.loc 32 94 0
	movl	%ebx, (%esp)
	call	setupReplyMaster
.LVL5637:
	.loc 32 95 0
	popl	%eax
	.cfi_def_cfa_offset 28
	popl	%edx
	.cfi_def_cfa_offset 24
	pushl	$2
	.cfi_def_cfa_offset 28
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	setThreadState
.LVL5638:
.LBB14799:
.LBB14800:
	.loc 31 80 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	testb	$1, 592(%ebx)
	je	.L4299
.LVL5639:
.LBE14800:
.LBE14799:
.LBE14798:
.LBE14797:
	.loc 32 99 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
.LBB14816:
.LBB14811:
.LBB14802:
.LBB14803:
	.loc 32 415 0
	movl	%ebx, %eax
.LBE14803:
.LBE14802:
.LBE14811:
.LBE14816:
	.loc 32 99 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL5640:
.LBB14817:
.LBB14812:
.LBB14807:
.LBB14804:
	.loc 32 415 0
	xorl	%edx, %edx
	jmp	possibleSwitchTo
.LVL5641:
	.p2align 4,,10
	.p2align 3
.L4292:
	.cfi_restore_state
.LBE14804:
.LBE14807:
.LBE14812:
.LBE14817:
	.loc 32 99 0
	addl	$8, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL5642:
	ret
.LVL5643:
	.p2align 4,,10
	.p2align 3
.L4299:
	.cfi_restore_state
.LBB14818:
.LBB14813:
.LBB14808:
.LBB14801:
	movl	%ebx, %eax
	call	tcbSchedEnqueue.part.263
.LVL5644:
.LBE14801:
.LBE14808:
.LBE14813:
.LBE14818:
	addl	$8, %esp
	.cfi_def_cfa_offset 8
.LBB14819:
.LBB14814:
.LBB14809:
.LBB14805:
	.loc 32 415 0
	movl	%ebx, %eax
	xorl	%edx, %edx
.LBE14805:
.LBE14809:
.LBE14814:
.LBE14819:
	.loc 32 99 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
.LVL5645:
.LBB14820:
.LBB14815:
.LBB14810:
.LBB14806:
	.loc 32 415 0
	jmp	possibleSwitchTo
.LVL5646:
.LBE14806:
.LBE14810:
.LBE14815:
.LBE14820:
	.cfi_endproc
.LFE683:
	.size	restart, .-restart
	.section	.text.unlikely
.LCOLDE764:
	.text
.LHOTE764:
	.section	.text.unlikely
.LCOLDB765:
	.text
.LHOTB765:
	.p2align 4,,15
	.globl	invokeTCB_Resume
	.type	invokeTCB_Resume, @function
invokeTCB_Resume:
.LFB827:
	.loc 31 1303 0
	.cfi_startproc
.LVL5647:
	subl	$24, %esp
	.cfi_def_cfa_offset 28
	.loc 31 1304 0
	pushl	28(%esp)
	.cfi_def_cfa_offset 32
	call	restart
.LVL5648:
	.loc 31 1306 0
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE827:
	.size	invokeTCB_Resume, .-invokeTCB_Resume
	.section	.text.unlikely
.LCOLDE765:
	.text
.LHOTE765:
	.section	.text.unlikely
.LCOLDB766:
	.text
.LHOTB766:
	.p2align 4,,15
	.globl	invokeTCB_CopyRegisters
	.type	invokeTCB_CopyRegisters, @function
invokeTCB_CopyRegisters:
.LFB829:
	.loc 31 1390 0
	.cfi_startproc
.LVL5649:
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	.loc 31 1391 0
	movl	24(%esp), %eax
	.loc 31 1390 0
	movl	16(%esp), %ebx
	movl	20(%esp), %esi
	.loc 31 1391 0
	testl	%eax, %eax
	jne	.L4323
	.loc 31 1395 0
	movl	28(%esp), %ecx
	testl	%ecx, %ecx
	jne	.L4324
.L4304:
	.loc 31 1399 0
	movl	32(%esp), %edx
	testl	%edx, %edx
	je	.L4305
	movl	$frameRegisters+4, %edx
	.loc 31 1399 0 is_stmt 0 discriminator 3
	movl	$11, %eax
	jmp	.L4307
.LVL5650:
	.p2align 4,,10
	.p2align 3
.L4325:
	movl	(%edx), %eax
	addl	$4, %edx
.L4307:
.LVL5651:
.LBB14821:
.LBB14822:
.LBB14823:
	.loc 15 36 0 is_stmt 1 discriminator 3
	subl	$-128, %eax
	movl	(%esi,%eax,4), %ecx
.LVL5652:
.LBE14823:
.LBE14822:
.LBB14824:
.LBB14825:
	.loc 15 30 0 discriminator 3
	movl	%ecx, (%ebx,%eax,4)
.LVL5653:
.LBE14825:
.LBE14824:
	.loc 31 1404 0 discriminator 3
	cmpl	$frameRegisters+40, %edx
	jne	.L4325
.LVL5654:
.LBB14826:
.LBB14827:
.LBB14828:
	.loc 15 30 0
	movl	556(%ebx), %eax
	movl	%eax, 568(%ebx)
.LVL5655:
.L4305:
.LBE14828:
.LBE14827:
.LBE14826:
.LBE14821:
	.loc 31 1413 0
	movl	36(%esp), %eax
	testl	%eax, %eax
	je	.L4308
.LVL5656:
.LBB14829:
.LBB14830:
.LBB14831:
	.loc 15 36 0 discriminator 1
	movl	560(%esi), %eax
.LVL5657:
.LBE14831:
.LBE14830:
.LBB14834:
.LBB14835:
	.loc 15 30 0 discriminator 1
	movl	%eax, 560(%ebx)
.LVL5658:
.LBE14835:
.LBE14834:
.LBB14838:
.LBB14832:
	.loc 15 36 0 discriminator 1
	movl	548(%esi), %eax
.LVL5659:
.LBE14832:
.LBE14838:
.LBB14839:
.LBB14836:
	.loc 15 30 0 discriminator 1
	movl	%eax, 548(%ebx)
.LVL5660:
.LBE14836:
.LBE14839:
.LBB14840:
.LBB14833:
	.loc 15 36 0 discriminator 1
	movl	552(%esi), %eax
.LVL5661:
.LBE14833:
.LBE14840:
.LBB14841:
.LBB14837:
	.loc 15 30 0 discriminator 1
	movl	%eax, 552(%ebx)
.LVL5662:
.L4308:
.LBE14837:
.LBE14841:
.LBE14829:
	.loc 31 1431 0
	cmpl	ksCurThread, %ebx
	je	.L4326
	.loc 31 1438 0
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L4323:
	.cfi_restore_state
	.loc 31 1392 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	%esi
	.cfi_def_cfa_offset 32
	call	suspend
.LVL5663:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	.loc 31 1395 0
	movl	28(%esp), %ecx
	testl	%ecx, %ecx
	je	.L4304
.L4324:
	.loc 31 1396 0
	subl	$12, %esp
	.cfi_def_cfa_offset 28
	pushl	%ebx
	.cfi_def_cfa_offset 32
	call	restart
.LVL5664:
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	jmp	.L4304
	.p2align 4,,10
	.p2align 3
.L4326:
	.loc 31 1434 0
	call	rescheduleRequired
.LVL5665:
	.loc 31 1438 0
	addl	$4, %esp
	.cfi_def_cfa_offset 12
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE829:
	.size	invokeTCB_CopyRegisters, .-invokeTCB_CopyRegisters
	.section	.text.unlikely
.LCOLDE766:
	.text
.LHOTE766:
	.section	.rodata.str1.4
	.align 4
.LC767:
	.string	"TCB CopyRegisters: Truncated message."
	.align 4
.LC768:
	.string	"TCB CopyRegisters: Invalid source TCB."
	.section	.text.unlikely
.LCOLDB769:
	.text
.LHOTB769:
	.p2align 4,,15
	.globl	decodeCopyRegisters
	.type	decodeCopyRegisters, @function
decodeCopyRegisters:
.LFB815:
	.loc 31 751 0
	.cfi_startproc
.LVL5666:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	movl	44(%esp), %eax
	.loc 31 751 0
	movl	32(%esp), %esi
.LVL5667:
	movl	40(%esp), %edx
	.loc 31 757 0
	testl	%eax, %eax
	je	.L4336
	testl	%edx, %edx
	je	.L4336
.LVL5668:
	.loc 31 767 0
	movl	(%eax), %eax
.LVL5669:
.LBB14842:
.LBB14843:
	.loc 56 31 0
	movl	ksCurThread, %ecx
.LVL5670:
.LBE14843:
.LBE14842:
.LBB14847:
.LBB14848:
	.loc 11 2202 0
	movl	%eax, %edi
	.loc 11 2203 0
	movl	%eax, %ebx
	movzbl	%al, %edx
	.loc 11 2202 0
	andl	$14, %edi
	.loc 11 2203 0
	andl	$15, %ebx
	cmpl	$14, %edi
	cmovne	%ebx, %edx
.LBE14848:
.LBE14847:
	.loc 31 769 0
	cmpl	$12, %edx
	je	.L4338
	.loc 31 772 0
	leal	668(%ecx), %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	pushl	556(%ecx)
	.cfi_def_cfa_offset 40
	pushl	%eax
	.cfi_def_cfa_offset 44
	pushl	%ecx
	.cfi_def_cfa_offset 48
	pushl	$772
	.cfi_def_cfa_offset 52
	pushl	$__func__.9382
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	$.LC111
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL5671:
	addl	$20, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC768
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL5672:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL5673:
	.loc 31 775 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 31 787 0
	movl	$3, %eax
	.loc 31 773 0
	movl	$2, current_syscall_error+24
	.loc 31 774 0
	movl	$1, current_syscall_error+4
	.loc 31 787 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5674:
	.p2align 4,,10
	.p2align 3
.L4336:
	.cfi_restore_state
	.loc 31 758 0
	movl	ksCurThread, %eax
.LVL5675:
	subl	$4, %esp
	.cfi_def_cfa_offset 36
	pushl	556(%eax)
	.cfi_def_cfa_offset 40
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 44
	pushl	%eax
	.cfi_def_cfa_offset 48
	pushl	$758
	.cfi_def_cfa_offset 52
	pushl	$__func__.9382
	.cfi_def_cfa_offset 56
	pushl	$0
	.cfi_def_cfa_offset 60
	pushl	$.LC111
	.cfi_def_cfa_offset 64
	call	kprintf
.LVL5676:
	addl	$20, %esp
	.cfi_def_cfa_offset 44
	pushl	$.LC767
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL5677:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL5678:
	.loc 31 760 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 31 787 0
	movl	$3, %eax
	.loc 31 759 0
	movl	$7, current_syscall_error+24
	.loc 31 787 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L4338:
	.cfi_restore_state
.LVL5679:
.LBB14849:
.LBB14850:
	.loc 11 2768 0
	cmpl	$12, %ebx
	jne	.L4335
.LBE14850:
.LBE14849:
.LBB14852:
.LBB14846:
.LBB14844:
.LBB14845:
	.loc 15 36 0
	movl	532(%ecx), %edi
.LBE14845:
.LBE14844:
.LBE14846:
.LBE14852:
	.loc 31 778 0
	subl	$8, %esp
	.cfi_def_cfa_offset 40
	.loc 31 770 0
	andl	$-16, %eax
.LVL5680:
.LBB14853:
.LBB14854:
	.loc 11 2768 0
	movl	%esi, %ebp
.LBE14854:
.LBE14853:
	.loc 31 778 0
	pushl	$2
	.cfi_def_cfa_offset 44
	.loc 31 770 0
	movl	%eax, %ebx
.LVL5681:
.LBB14858:
.LBB14855:
	.loc 11 2768 0
	andl	$15, %ebp
.LBE14855:
.LBE14858:
	.loc 31 778 0
	pushl	%ecx
	.cfi_def_cfa_offset 48
	call	setThreadState
.LVL5682:
.LBB14859:
.LBB14856:
	.loc 11 2768 0
	addl	$16, %esp
	.cfi_def_cfa_offset 32
.LBE14856:
.LBE14859:
	.loc 31 779 0
	movl	%edi, %ecx
	movl	%edi, %edx
	movl	%edi, %eax
	andl	$8, %ecx
	andl	$4, %edx
	andl	$2, %eax
	andl	$1, %edi
.LVL5683:
.LBB14860:
.LBB14857:
	.loc 11 2768 0
	cmpl	$12, %ebp
	jne	.L4335
.LVL5684:
.LBE14857:
.LBE14860:
	.loc 31 779 0
	andl	$-16, %esi
	movl	%edi, 40(%esp)
	movl	%ebx, 36(%esp)
	movl	%esi, 32(%esp)
	movl	$0, 56(%esp)
	movl	%ecx, 52(%esp)
	movl	%edx, 48(%esp)
	movl	%eax, 44(%esp)
.LVL5685:
	.loc 31 787 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL5686:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 31 779 0
	jmp	invokeTCB_CopyRegisters
.LVL5687:
.L4335:
	.cfi_restore_state
.LBB14861:
.LBB14851:
	call	cap_thread_cap_get_capTCBPtr.isra.89.part.90
.LVL5688:
.LBE14851:
.LBE14861:
	.cfi_endproc
.LFE815:
	.size	decodeCopyRegisters, .-decodeCopyRegisters
	.section	.text.unlikely
.LCOLDE769:
	.text
.LHOTE769:
	.section	.text.unlikely
.LCOLDB770:
	.text
.LHOTB770:
	.p2align 4,,15
	.globl	invokeTCB_WriteRegisters
	.type	invokeTCB_WriteRegisters, @function
invokeTCB_WriteRegisters:
.LFB831:
	.loc 31 1510 0
	.cfi_startproc
.LVL5689:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$13, %esi
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$12, %esp
	.cfi_def_cfa_offset 32
	.loc 31 1510 0
	movl	40(%esp), %eax
	movl	32(%esp), %edi
	movl	48(%esp), %ebp
	cmpl	$13, %eax
	cmovbe	%eax, %esi
.LVL5690:
	.loc 31 1527 0
	testl	%esi, %esi
	je	.L4340
.LVL5691:
.LBB14888:
.LBB14889:
	.loc 56 34 0
	testl	%ebp, %ebp
	je	.L4341
	movl	$11, %ebx
	xorl	%ecx, %ecx
	jmp	.L4342
.LVL5692:
	.p2align 4,,10
	.p2align 3
.L4343:
.LBE14889:
.LBE14888:
.LBB14892:
.LBB14893:
	.loc 26 37 0
	cmpl	$16, %ebx
	jne	.L4344
.LVL5693:
	andl	$3799, %eax
.LVL5694:
	.loc 26 45 0
	orl	$514, %eax
.LVL5695:
.L4344:
.LBE14893:
.LBE14892:
	.loc 31 1527 0
	addl	$1, %ecx
.LVL5696:
.LBB14900:
.LBB14901:
	.loc 15 30 0
	movl	%eax, 512(%edi,%ebx,4)
.LVL5697:
.LBE14901:
.LBE14900:
	.loc 31 1527 0
	cmpl	$9, %ecx
	ja	.L4352
.L4366:
	cmpl	%esi, %ecx
	jnb	.L4352
	movl	frameRegisters(,%ecx,4), %ebx
.LVL5698:
.L4342:
.LBB14903:
.LBB14898:
.LBB14894:
.LBB14895:
	.loc 5 48 0
	leal	-9(%ebx), %edx
.LBE14895:
.LBE14894:
.LBE14898:
.LBE14903:
.LBB14904:
.LBB14890:
	.loc 56 35 0
	movl	12(%ebp,%ecx,4), %eax
.LVL5699:
.LBE14890:
.LBE14904:
.LBB14905:
.LBB14899:
.LBB14897:
.LBB14896:
	.loc 5 48 0
	cmpl	$1, %edx
	ja	.L4343
	call	Mode_sanitiseRegister.part.55
.LVL5700:
.LBE14896:
.LBE14897:
.LBE14899:
.LBE14905:
	.loc 31 1527 0
	addl	$1, %ecx
.LBB14906:
.LBB14902:
	.loc 15 30 0
	movl	%eax, 512(%edi,%ebx,4)
.LVL5701:
.LBE14902:
.LBE14906:
	.loc 31 1527 0
	cmpl	$9, %ecx
	jbe	.L4366
	.p2align 4,,10
	.p2align 3
.L4352:
	.loc 31 1527 0 is_stmt 0 discriminator 3
	movl	$10, %ecx
.LVL5702:
.L4347:
	.loc 31 1534 0 is_stmt 1 discriminator 3
	cmpl	%ecx, %esi
	jbe	.L4340
.LVL5703:
	.loc 31 1535 0
	movl	gpRegisters-40(,%ecx,4), %ebx
.LBB14907:
.LBB14908:
	.loc 56 35 0
	movl	12(%ebp,%ecx,4), %eax
.LVL5704:
.LBE14908:
.LBE14907:
.LBB14909:
.LBB14910:
.LBB14911:
.LBB14912:
	.loc 5 48 0
	leal	-9(%ebx), %edx
	cmpl	$1, %edx
	jbe	.L4367
.LVL5705:
.LBE14912:
.LBE14911:
	.loc 26 37 0
	cmpl	$16, %ebx
	jne	.L4346
.LVL5706:
	andl	$3799, %eax
.LVL5707:
	.loc 26 45 0
	orl	$514, %eax
.LVL5708:
.L4346:
	addl	$1, %ecx
.LBE14910:
.LBE14909:
.LBB14916:
.LBB14917:
	.loc 15 30 0
	movl	%eax, 512(%edi,%ebx,4)
.LVL5709:
.LBE14917:
.LBE14916:
	.loc 31 1534 0
	cmpl	$13, %ecx
	jne	.L4347
.L4340:
.LVL5710:
.LBB14918:
.LBB14919:
.LBB14920:
	.loc 15 30 0
	movl	556(%edi), %eax
	movl	%eax, 568(%edi)
.LVL5711:
.LBE14920:
.LBE14919:
.LBE14918:
	.loc 31 1552 0
	movl	36(%esp), %eax
	testl	%eax, %eax
	jne	.L4368
	.loc 31 1556 0
	cmpl	ksCurThread, %edi
	je	.L4369
.L4356:
	.loc 31 1563 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL5712:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5713:
	.p2align 4,,10
	.p2align 3
.L4367:
	.cfi_restore_state
.LBB14921:
.LBB14915:
.LBB14914:
.LBB14913:
	call	Mode_sanitiseRegister.part.55
.LVL5714:
	jmp	.L4346
.LVL5715:
	.p2align 4,,10
	.p2align 3
.L4368:
.LBE14913:
.LBE14914:
.LBE14915:
.LBE14921:
	.loc 31 1553 0
	subl	$12, %esp
	.cfi_def_cfa_offset 44
	pushl	%edi
	.cfi_def_cfa_offset 48
	call	restart
.LVL5716:
	addl	$16, %esp
	.cfi_def_cfa_offset 32
	.loc 31 1556 0
	cmpl	ksCurThread, %edi
	jne	.L4356
.L4369:
	.loc 31 1559 0
	call	rescheduleRequired
.LVL5717:
	.loc 31 1563 0
	addl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL5718:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5719:
.L4341:
	.cfi_restore_state
.LBB14922:
.LBB14891:
	call	getSyscallArg.part.152
.LVL5720:
.LBE14891:
.LBE14922:
	.cfi_endproc
.LFE831:
	.size	invokeTCB_WriteRegisters, .-invokeTCB_WriteRegisters
	.section	.text.unlikely
.LCOLDE770:
	.text
.LHOTE770:
	.section	.rodata.str1.4
	.align 4
.LC771:
	.string	"TCB WriteRegisters: Truncated message."
	.align 4
.LC772:
	.string	"TCB WriteRegisters: Message too short for requested write size (%d/%d)."
	.align 4
.LC773:
	.string	"TCB WriteRegisters: Attempted to write our own registers."
	.section	.text.unlikely
.LCOLDB774:
	.text
.LHOTB774:
	.p2align 4,,15
	.globl	decodeWriteRegisters
	.type	decodeWriteRegisters, @function
decodeWriteRegisters:
.LFB817:
	.loc 31 841 0
	.cfi_startproc
.LVL5721:
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 31 841 0
	movl	24(%esp), %eax
	movl	16(%esp), %ecx
	.loc 31 846 0
	cmpl	$1, %eax
	jbe	.L4378
.LVL5722:
.LBB14923:
.LBB14924:
	.loc 56 31 0
	movl	ksCurThread, %edx
.LVL5723:
.LBE14924:
.LBE14923:
	.loc 31 855 0
	leal	-2(%eax), %ebx
.LBB14928:
.LBB14929:
.LBB14930:
.LBB14931:
	.loc 15 36 0
	movl	536(%edx), %esi
.LVL5724:
.LBE14931:
.LBE14930:
.LBE14929:
.LBE14928:
	.loc 31 855 0
	cmpl	%esi, %ebx
	jb	.L4379
.LVL5725:
.LBB14932:
.LBB14933:
	.loc 11 2768 0
	movl	%ecx, %eax
	andl	$15, %eax
	cmpl	$12, %eax
	jne	.L4380
.LVL5726:
.LBE14933:
.LBE14932:
	.loc 31 864 0
	andl	$-16, %ecx
	movl	%ecx, %ebx
.LVL5727:
	.loc 31 865 0
	cmpl	%edx, %ecx
	je	.L4381
	.loc 31 871 0
	subl	$8, %esp
	.cfi_def_cfa_offset 24
.LBB14935:
.LBB14927:
.LBB14925:
.LBB14926:
	.loc 15 36 0
	movl	532(%edx), %edi
.LBE14926:
.LBE14925:
.LBE14927:
.LBE14935:
	.loc 31 871 0
	pushl	$2
	.cfi_def_cfa_offset 28
	pushl	%edx
	.cfi_def_cfa_offset 32
	call	setThreadState
.LVL5728:
	.loc 31 872 0
	popl	%eax
	.cfi_def_cfa_offset 28
	pushl	40(%esp)
	.cfi_def_cfa_offset 32
	andl	$1, %edi
	pushl	$0
	.cfi_def_cfa_offset 36
	pushl	%esi
	.cfi_def_cfa_offset 40
	pushl	%edi
	.cfi_def_cfa_offset 44
	pushl	%ebx
	.cfi_def_cfa_offset 48
	call	invokeTCB_WriteRegisters
.LVL5729:
	addl	$32, %esp
	.cfi_def_cfa_offset 16
	.loc 31 875 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL5730:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL5731:
	.p2align 4,,10
	.p2align 3
.L4379:
	.cfi_restore_state
	.loc 31 856 0
	leal	668(%edx), %eax
.LVL5732:
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	pushl	556(%edx)
	.cfi_def_cfa_offset 24
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	%edx
	.cfi_def_cfa_offset 32
	pushl	$857
	.cfi_def_cfa_offset 36
	pushl	$__func__.9407
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL5733:
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	pushl	%esi
	.cfi_def_cfa_offset 24
	pushl	%ebx
	.cfi_def_cfa_offset 28
	pushl	$.LC772
	.cfi_def_cfa_offset 32
.L4377:
	call	kprintf
.LVL5734:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL5735:
	.loc 31 859 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	$3, %eax
	.loc 31 858 0
	movl	$7, current_syscall_error+24
	.loc 31 875 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL5736:
	.p2align 4,,10
	.p2align 3
.L4378:
	.cfi_restore_state
	.loc 31 847 0
	movl	ksCurThread, %eax
.LVL5737:
	subl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pushl	556(%eax)
	.cfi_def_cfa_offset 24
	leal	668(%eax), %edx
	pushl	%edx
	.cfi_def_cfa_offset 28
	pushl	%eax
	.cfi_def_cfa_offset 32
	pushl	$847
	.cfi_def_cfa_offset 36
	pushl	$__func__.9407
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL5738:
	addl	$20, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC771
	.cfi_def_cfa_offset 32
	jmp	.L4377
.LVL5739:
	.p2align 4,,10
	.p2align 3
.L4381:
	.cfi_restore_state
	.loc 31 866 0
	leal	668(%ecx), %eax
	subl	$4, %esp
	.cfi_def_cfa_offset 20
	pushl	556(%ecx)
	.cfi_def_cfa_offset 24
	pushl	%eax
	.cfi_def_cfa_offset 28
	pushl	%ecx
	.cfi_def_cfa_offset 32
	pushl	$866
	.cfi_def_cfa_offset 36
	pushl	$__func__.9407
	.cfi_def_cfa_offset 40
	pushl	$0
	.cfi_def_cfa_offset 44
	pushl	$.LC111
	.cfi_def_cfa_offset 48
	call	kprintf
.LVL5740:
	addl	$20, %esp
	.cfi_def_cfa_offset 28
	pushl	$.LC773
	.cfi_def_cfa_offset 32
	call	kprintf
.LVL5741:
	movl	$.LC113, (%esp)
	call	kprintf
.LVL5742:
	.loc 31 868 0
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	movl	$3, %eax
	.loc 31 867 0
	movl	$3, current_syscall_error+24
	.loc 31 875 0
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
.LVL5743:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
.LVL5744:
.L4380:
	.cfi_restore_state
.LBB14936:
.LBB14934:
	call	cap_thread_cap_get_capTCBPtr.isra.89.part.90
.LVL5745:
.LBE14934:
.LBE14936:
	.cfi_endproc
.LFE817:
	.size	decodeWriteRegisters, .-decodeWriteRegisters
	.section	.text.unlikely
.LCOLDE774:
	.text
.LHOTE774:
	.section	.text.unlikely
.LCOLDB775:
	.text
.LHOTB775:
	.p2align 4,,15
	.globl	sendSignal
	.type	sendSignal, @function
sendSignal:
.LFB775:
	.loc 36 51 0
	.cfi_startproc
.LVL5746:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	.loc 36 51 0
	movl	48(%esp), %ecx
	movl	52(%esp), %esi
	movl	(%ecx), %edx
.LVL5747:
	.loc 36 52 0
	movl	%edx, %eax
	andl	$3, %eax
	cmpl	$1, %eax
	je	.L4384
	jb	.L4385
	cmpl	$2, %eax
	jne	.L4382
.LVL5748:
.LBB14982:
.LBB14983:
.LBB14984:
	.loc 11 1067 0
	orl	%esi, 8(%ecx)
.LVL5749:
.L4382:
.LBE14984:
.LBE14983:
.LBE14982:
	.loc 36 121 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L4385:
	.cfi_restore_state
.LVL5750:
.LBB14985:
	.loc 36 56 0
	movl	12(%ecx), %ebx
	andl	$-16, %ebx
.LVL5751:
	je	.L4387
.LVL5752:
	.loc 36 57 0
	movl	588(%ebx), %eax
	andl	$15, %eax
	cmpl	$3, %eax
	je	.L4401
.LVL5753:
.L4387:
.LBB14986:
.LBB14987:
.LBB14988:
	.loc 11 1124 0
	andl	$-4, %edx
.LBE14988:
.LBE14987:
.LBB14990:
.LBB14991:
	.loc 11 1067 0
	movl	%esi, 8(%ecx)
.LBE14991:
.LBE14990:
.LBB14992:
.LBB14989:
	.loc 11 1124 0
	orl	$2, %edx
	movl	%edx, (%ecx)
.LVL5754:
.LBE14989:
.LBE14992:
.LBE14986:
.LBE14985:
	.loc 36 121 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL5755:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL5756:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
.LVL5757:
	.p2align 4,,10
	.p2align 3
.L4384:
	.cfi_restore_state
	movl	4(%ecx), %eax
.LBB14993:
.LBB14994:
.LBB14995:
	.loc 36 29 0
	movl	%edx, %edi
	andl	$-16, %edi
	movl	%edi, 8(%esp)
.LBE14995:
.LBE14994:
	.loc 36 94 0
	movl	%eax, %ebx
	movl	%eax, 12(%esp)
.LVL5758:
	andl	$-16, %ebx
.LVL5759:
	je	.L4402
.LVL5760:
.LBB14996:
.LBB14997:
	.loc 31 227 0
	movl	656(%ebx), %edi
.LVL5761:
	.loc 31 228 0
	movl	652(%ebx), %eax
	.loc 31 227 0
	testl	%edi, %edi
	je	.L4390
	.loc 31 228 0
	movl	%eax, 652(%edi)
	movl	652(%ebx), %ebp
	movl	%ebx, %eax
.LVL5762:
.L4391:
	.loc 31 233 0
	testl	%ebp, %ebp
	je	.L4397
	.loc 31 234 0
	movl	%edi, 656(%ebp)
.LVL5763:
.L4392:
.LBE14997:
.LBE14996:
.LBB14999:
.LBB15000:
.LBB15001:
.LBB15002:
	.loc 11 1084 0
	testb	$15, %al
	jne	.L4403
	.loc 11 1086 0
	movl	12(%esp), %edi
	movl	%eax, %ebp
	andl	$-16, %ebp
	andl	$15, %edi
	orl	%ebp, %edi
	movl	%edi, 4(%ecx)
.LVL5764:
.LBE15002:
.LBE15001:
.LBB15004:
.LBB15005:
	.loc 11 1103 0
	testb	$15, 8(%esp)
	jne	.L4404
	.loc 11 1105 0
	movl	8(%esp), %edi
	andl	$15, %edx
.LVL5765:
	andl	$-16, %edi
	orl	%edi, %edx
.LVL5766:
.LBE15005:
.LBE15004:
.LBE15000:
.LBE14999:
	.loc 36 101 0
	testl	%eax, %eax
	je	.L4405
.L4399:
.LBB15010:
.LBB15011:
	.loc 11 1123 0
	movl	%edx, (%ecx)
.LVL5767:
.LBE15011:
.LBE15010:
	.loc 36 105 0
	subl	$8, %esp
	.cfi_def_cfa_offset 56
.LVL5768:
.L4400:
	pushl	$1
	.cfi_def_cfa_offset 60
	pushl	%ebx
	.cfi_def_cfa_offset 64
	call	setThreadState
.LVL5769:
.LBB15013:
.LBB15014:
	.loc 15 30 0
	movl	%esi, 516(%ebx)
.LVL5770:
.LBE15014:
.LBE15013:
.LBE14993:
	.loc 36 121 0
	addl	$44, %esp
	.cfi_def_cfa_offset 20
.LBB15024:
.LBB15015:
.LBB15016:
	.loc 32 415 0
	movl	%ebx, %eax
.LBE15016:
.LBE15015:
.LBE15024:
	.loc 36 121 0
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL5771:
.LBB15025:
.LBB15019:
.LBB15017:
	.loc 32 415 0
	xorl	%edx, %edx
.LBE15017:
.LBE15019:
.LBE15025:
	.loc 36 121 0
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
.LBB15026:
.LBB15020:
.LBB15018:
	.loc 32 415 0
	jmp	possibleSwitchTo
.LVL5772:
	.p2align 4,,10
	.p2align 3
.L4405:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -20
	.cfi_offset 5, -8
	.cfi_offset 6, -16
	.cfi_offset 7, -12
.LBE15018:
.LBE15020:
.LBB15021:
.LBB15012:
	.loc 11 1123 0
	andl	$-4, %edx
	jmp	.L4399
.LVL5773:
	.p2align 4,,10
	.p2align 3
.L4401:
.LBE15012:
.LBE15021:
.LBE15026:
.LBB15027:
	.loc 36 59 0
	subl	$12, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 60
	pushl	%ebx
	.cfi_def_cfa_offset 64
	call	cancelIPC
.LVL5774:
	.loc 36 60 0
	popl	%eax
	.cfi_def_cfa_offset 60
	popl	%edx
	.cfi_def_cfa_offset 56
	jmp	.L4400
.LVL5775:
	.p2align 4,,10
	.p2align 3
.L4390:
	.cfi_restore_state
.LBE15027:
.LBB15028:
.LBB15022:
.LBB14998:
	.loc 31 230 0
	movl	%eax, %ebp
	jmp	.L4391
	.p2align 4,,10
	.p2align 3
.L4397:
	.loc 31 227 0
	movl	%edi, 8(%esp)
.LVL5776:
	jmp	.L4392
.LVL5777:
.L4403:
.LBE14998:
.LBE15022:
.LBB15023:
.LBB15009:
.LBB15007:
.LBB15003:
	call	notification_ptr_set_ntfnQueue_head.isra.248.part.249
.LVL5778:
.L4404:
.LBE15003:
.LBE15007:
.LBB15008:
.LBB15006:
	call	notification_ptr_set_ntfnQueue_tail.isra.250.part.251
.LVL5779:
.L4402:
.LBE15006:
.LBE15008:
.LBE15009:
.LBE15023:
	.loc 36 94 0 discriminator 1
	pushl	$__FUNCTION__.9021
	.cfi_def_cfa_offset 52
	pushl	$94
	.cfi_def_cfa_offset 56
	pushl	$.LC148
	.cfi_def_cfa_offset 60
	pushl	$.LC556
	.cfi_def_cfa_offset 64
	call	_assert_fail
.LVL5780:
.LBE15028:
	.cfi_endproc
.LFE775:
	.size	sendSignal, .-sendSignal
	.section	.text.unlikely
.LCOLDE775:
	.text
.LHOTE775:
	.section	.text.unlikely
.LCOLDB776:
	.text
.LHOTB776:
	.p2align 4,,15
	.globl	performInvocation_Notification
	.type	performInvocation_Notification, @function
performInvocation_Notification:
.LFB796:
	.loc 45 625 0
	.cfi_startproc
.LVL5781:
	subl	$20, %esp
	.cfi_def_cfa_offset 24
	.loc 45 626 0
	pushl	28(%esp)
	.cfi_def_cfa_offset 28
	pushl	28(%esp)
	.cfi_def_cfa_offset 32
	call	sendSignal
.LVL5782:
	.loc 45 629 0
	xorl	%eax, %eax
	addl	$28, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE796:
	.size	performInvocation_Notification, .-performInvocation_Notification
	.section	.text.unlikely
.LCOLDE776:
	.text
.LHOTE776:
	.section	.text.unlikely
.LCOLDB777:
	.text
.LHOTB777:
	.p2align 4,,15
	.globl	invokeIRQHandler_SetIRQHandler
	.type	invokeIRQHandler_SetIRQHandler, @function
invokeIRQHandler_SetIRQHandler:
.LFB765:
	.loc 35 152 0
	.cfi_startproc
.LVL5783:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$24, %esp
	.cfi_def_cfa_offset 44
	.loc 35 155 0
	movzbl	44(%esp), %ebx
	.loc 35 152 0
	movl	48(%esp), %esi
.LVL5784:
	movl	52(%esp), %edi
.LVL5785:
	movl	56(%esp), %ebp
	.loc 35 155 0
	sall	$4, %ebx
	addl	intStateIRQNode, %ebx
.LVL5786:
	.loc 35 157 0
	pushl	%ebx
	.cfi_def_cfa_offset 48
	call	cteDeleteOne
.LVL5787:
	.loc 35 158 0
	movl	%ebx, 60(%esp)
	movl	%ebp, 56(%esp)
	movl	%esi, 48(%esp)
	movl	%edi, 52(%esp)
	.loc 35 159 0
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
.LVL5788:
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
.LVL5789:
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	.loc 35 158 0
	jmp	cteInsert
.LVL5790:
	.cfi_endproc
.LFE765:
	.size	invokeIRQHandler_SetIRQHandler, .-invokeIRQHandler_SetIRQHandler
	.section	.text.unlikely
.LCOLDE777:
	.text
.LHOTE777:
	.section	.text.unlikely
.LCOLDB778:
	.text
.LHOTB778:
	.p2align 4,,15
	.globl	deletingIRQHandler
	.type	deletingIRQHandler, @function
deletingIRQHandler:
.LFB767:
	.loc 35 173 0
	.cfi_startproc
.LVL5791:
	.loc 35 178 0
	movzbl	4(%esp), %eax
	sall	$4, %eax
	addl	intStateIRQNode, %eax
.LVL5792:
	movl	%eax, 4(%esp)
.LVL5793:
	jmp	cteDeleteOne
.LVL5794:
	.cfi_endproc
.LFE767:
	.size	deletingIRQHandler, .-deletingIRQHandler
	.section	.text.unlikely
.LCOLDE778:
	.text
.LHOTE778:
	.section	.text.unlikely
.LCOLDB779:
	.text
.LHOTB779:
	.p2align 4,,15
	.globl	invokeIRQHandler_ClearIRQHandler
	.type	invokeIRQHandler_ClearIRQHandler, @function
invokeIRQHandler_ClearIRQHandler:
.LFB1196:
	.cfi_startproc
	jmp	deletingIRQHandler
	.cfi_endproc
.LFE1196:
	.size	invokeIRQHandler_ClearIRQHandler, .-invokeIRQHandler_ClearIRQHandler
	.section	.text.unlikely
.LCOLDE779:
	.text
.LHOTE779:
	.section	.rodata.str1.4
	.align 4
.LC780:
	.string	"finaliseCap: failed to finalise immediately."
	.section	.text.unlikely
.LCOLDB781:
	.text
.LHOTB781:
	.p2align 4,,15
	.globl	finaliseCap
	.type	finaliseCap, @function
finaliseCap:
.LFB786:
	.loc 45 100 0
	.cfi_startproc
.LVL5795:
	.loc 45 100 0
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	52(%esp), %edx
	.loc 45 100 0
	movl	48(%esp), %ebx
.LVL5796:
.LBB15092:
.LBB15093:
.LBB15094:
.LBB15095:
	.loc 11 2202 0
	movl	%edx, %ecx
	andl	$14, %ecx
	cmpl	$14, %ecx
	je	.L4413
.LVL5797:
.LBE15095:
.LBE15094:
.LBE15093:
.LBE15092:
.LBB15096:
.LBB15097:
	.loc 11 2203 0
	movl	%edx, %eax
	andl	$15, %eax
.LBE15097:
.LBE15096:
	.loc 45 103 0
	testb	$1, %dl
	jne	.L4414
.L4418:
	movl	56(%esp), %esi
	.loc 45 109 0
	cmpl	$6, %eax
	je	.L4420
	ja	.L4421
	testl	%eax, %eax
	je	.L4431
	cmpl	$4, %eax
	jne	.L4419
	.loc 45 111 0
	movl	60(%esp), %eax
	testl	%eax, %eax
	je	.L4431
.LVL5798:
.LBB15099:
.LBB15100:
	.loc 11 2358 0
	andl	$15, %edx
	cmpl	$4, %edx
	jne	.L4475
.LBE15100:
.LBE15099:
	.loc 45 112 0
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	andl	$-16, %esi
	pushl	%esi
	.cfi_def_cfa_offset 64
	call	cancelAllIPC
.LVL5799:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
.LVL5800:
	.p2align 4,,10
	.p2align 3
.L4431:
	.loc 45 203 0
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
	movb	$-1, 8(%ebx)
.LVL5801:
.L4412:
	.loc 45 204 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret	$4
	.p2align 4,,10
	.p2align 3
.L4421:
	.cfi_restore_state
	.loc 45 109 0
	cmpl	$8, %eax
	je	.L4431
	cmpl	$62, %eax
	je	.L4431
.L4419:
	.loc 45 138 0
	movl	64(%esp), %eax
	testl	%eax, %eax
	jne	.L4476
.LVL5802:
.LBB15102:
.LBB15103:
	.loc 11 2203 0
	movl	%edx, %edi
	movzbl	%dl, %ebp
	andl	$15, %edi
	cmpl	$14, %ecx
	movl	%edi, %eax
	cmove	%ebp, %eax
.LVL5803:
.LBE15103:
.LBE15102:
	.loc 45 142 0
	cmpl	$12, %eax
	je	.L4432
	jbe	.L4477
	cmpl	$30, %eax
	je	.L4435
	cmpl	$46, %eax
	jne	.L4431
.LVL5804:
	.loc 45 186 0
	movl	%edx, (%ebx)
	movl	%esi, 4(%ebx)
	movb	$-1, 8(%ebx)
	jmp	.L4412
.LVL5805:
	.p2align 4,,10
	.p2align 3
.L4413:
.LBB15104:
.LBB15098:
	.loc 11 2204 0
	movzbl	%dl, %eax
.LBE15098:
.LBE15104:
	.loc 45 103 0
	testb	$1, %dl
	je	.L4418
.L4414:
	.loc 45 104 0
	leal	4(%esp), %eax
	pushl	60(%esp)
	.cfi_def_cfa_offset 52
	pushl	60(%esp)
	.cfi_def_cfa_offset 56
	pushl	60(%esp)
	.cfi_def_cfa_offset 60
	pushl	%eax
	.cfi_def_cfa_offset 64
	call	Arch_finaliseCap
	.cfi_def_cfa_offset 60
.LVL5806:
	.loc 45 106 0
	movb	$-1, 8(%ebx)
	movl	16(%esp), %eax
	movl	%eax, (%ebx)
	movl	20(%esp), %eax
	addl	$12, %esp
	.cfi_def_cfa_offset 48
	movl	%eax, 4(%ebx)
	.loc 45 204 0
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret	$4
.LVL5807:
	.p2align 4,,10
	.p2align 3
.L4420:
	.cfi_restore_state
	.loc 45 120 0
	movl	60(%esp), %eax
	testl	%eax, %eax
	je	.L4431
.LVL5808:
.LBB15105:
.LBB15106:
.LBB15107:
	.loc 11 2576 0
	movl	%edx, %eax
	andl	$15, %eax
	cmpl	$6, %eax
	jne	.L4478
.LVL5809:
.LBE15107:
.LBE15106:
	.loc 45 121 0
	andl	$-16, %edx
.LVL5810:
	movl	12(%edx), %eax
.LVL5811:
.LBB15109:
.LBB15110:
	.loc 36 233 0
	movl	%eax, %ecx
	andl	$-16, %ecx
.LVL5812:
	je	.L4427
.LVL5813:
.LBB15111:
.LBB15112:
.LBB15113:
.LBB15114:
	.loc 11 1047 0
	andl	$15, %eax
	movl	%eax, 12(%edx)
.LVL5814:
.LBE15114:
.LBE15113:
	.loc 36 224 0
	movl	$0, 600(%ecx)
.LVL5815:
.L4427:
.LBE15112:
.LBE15111:
.LBE15110:
.LBE15109:
	.loc 45 124 0
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	%edx
	.cfi_def_cfa_offset 64
	call	cancelAllSignals
.LVL5816:
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	jmp	.L4431
.LVL5817:
	.p2align 4,,10
	.p2align 3
.L4477:
.LBE15105:
	.loc 45 142 0
	cmpl	$10, %eax
	jne	.L4431
	.loc 45 144 0
	movl	60(%esp), %ebp
	testl	%ebp, %ebp
	je	.L4431
.LVL5818:
.LBB15116:
.LBB15117:
	.loc 11 2738 0
	cmpl	$10, %edi
	jne	.L4479
.LBE15117:
.LBE15116:
.LBB15120:
.LBB15121:
	.loc 11 2701 0
	andl	$8126464, %esi
.LBE15121:
.LBE15120:
.LBB15123:
.LBB15118:
	.loc 11 2741 0
	andl	$-32, %edx
.LVL5819:
.LBE15118:
.LBE15123:
	.loc 45 152 0
	movb	$-1, 8(%ebx)
.LBB15124:
.LBB15122:
	.loc 11 2701 0
	shrl	$18, %esi
.LVL5820:
.LBE15122:
.LBE15124:
	.loc 45 152 0
	leal	1(%esi), %ecx
.LVL5821:
	movl	%esi, %eax
	sall	$8, %eax
	orl	$46, %eax
.LVL5822:
	movl	%eax, (%ebx)
	movl	$1, %eax
.LVL5823:
	movl	%eax, %edi
	sall	%cl, %edi
	movl	%esi, %ecx
.LVL5824:
	sall	%cl, %eax
	subl	$1, %edi
	xorl	%edx, %eax
	andl	%edi, %eax
	xorl	%eax, %edx
.LVL5825:
	movl	%edx, 4(%ebx)
	jmp	.L4412
.LVL5826:
	.p2align 4,,10
	.p2align 3
.L4435:
	.loc 45 189 0
	movl	60(%esp), %eax
	testl	%eax, %eax
	je	.L4431
.LVL5827:
.LBB15125:
.LBB15126:
.LBB15127:
	.loc 11 3377 0
	cmpl	$30, %ebp
	jne	.L4480
.LVL5828:
.LBE15127:
.LBE15126:
.LBB15129:
.LBB15130:
	.loc 35 178 0
	movl	%esi, %eax
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	movzbl	%al, %eax
	sall	$4, %eax
	addl	intStateIRQNode, %eax
	pushl	%eax
	.cfi_def_cfa_offset 64
	call	cteDeleteOne
.LVL5829:
.LBE15130:
.LBE15129:
	.loc 45 196 0
	movl	%esi, %eax
	movl	$0, (%ebx)
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	movl	$0, 4(%ebx)
	movb	%al, 8(%ebx)
	jmp	.L4412
.LVL5830:
	.p2align 4,,10
	.p2align 3
.L4432:
.LBE15125:
	.loc 45 158 0
	movl	60(%esp), %ecx
	testl	%ecx, %ecx
	je	.L4431
.LVL5831:
.LBB15132:
.LBB15133:
.LBB15134:
	.loc 11 2768 0
	cmpl	$12, %edi
	jne	.L4481
.LVL5832:
.LBE15134:
.LBE15133:
	.loc 45 162 0
	movl	%edx, %esi
	.loc 45 164 0
	movl	%edx, %edi
	.loc 45 162 0
	andl	$-16, %esi
.LVL5833:
	.loc 45 164 0
	andl	$-1024, %edi
.LVL5834:
.LBB15136:
.LBB15137:
	.loc 36 242 0
	movl	600(%esi), %eax
.LVL5835:
	.loc 36 244 0
	testl	%eax, %eax
	je	.L4439
.LVL5836:
.LBB15138:
.LBB15139:
.LBB15140:
.LBB15141:
	.loc 11 1047 0
	andl	$15, 12(%eax)
.LVL5837:
.LBE15141:
.LBE15140:
	.loc 36 224 0
	movl	$0, 600(%esi)
.LVL5838:
.L4439:
.LBE15139:
.LBE15138:
.LBE15137:
.LBE15136:
	.loc 45 166 0
	subl	$12, %esp
	.cfi_def_cfa_offset 60
	pushl	%esi
	.cfi_def_cfa_offset 64
	call	suspend
.LVL5839:
	.loc 45 168 0
	movl	%esi, (%esp)
	call	tcbDebugRemove
.LVL5840:
.LBB15142:
.LBB15143:
.LBB15144:
	.loc 6 72 0
	addl	$16, %esp
	.cfi_def_cfa_offset 48
	cmpl	ksActiveFPUState, %esi
	je	.L4482
.L4440:
.LVL5841:
.LBE15144:
.LBE15143:
.LBE15142:
	.loc 45 178 0
	xorl	$6, %edi
.LVL5842:
	movl	$8238, (%ebx)
	movl	%edi, 4(%ebx)
	movb	$-1, 8(%ebx)
	jmp	.L4412
.LVL5843:
.L4482:
.LBB15153:
.LBB15152:
.LBB15151:
.LBB15145:
.LBB15146:
.LBB15147:
.LBB15148:
	.loc 24 108 0
#APP
# 108 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h" 1
	clts
# 0 "" 2
.LVL5844:
#NO_APP
.LBE15148:
.LBE15147:
.LBB15149:
.LBB15150:
	.loc 24 70 0
#APP
# 70 "/home/axjllt/Desktop/ori_refos/kernel/include/arch/x86/arch/machine/fpu.h" 1
	fxsave (%esi)
# 0 "" 2
#NO_APP
.LBE15150:
.LBE15149:
.LBE15146:
.LBE15145:
	call	fpuThreadDelete.part.56
.LVL5845:
	jmp	.L4440
.LVL5846:
.L4476:
.LBE15151:
.LBE15152:
.LBE15153:
.LBE15132:
	.loc 45 139 0
	pushl	$__func__.9104
	.cfi_remember_state
	.cfi_def_cfa_offset 52
	pushl	$139
	.cfi_def_cfa_offset 56
	pushl	$.LC411
	.cfi_def_cfa_offset 60
	pushl	$.LC780
	.cfi_def_cfa_offset 64
	call	_fail
.LVL5847:
.L4475:
	.cfi_restore_state
.LBB15155:
.LBB15101:
	call	cap_endpoint_cap_get_capEPPtr.part.117
.LVL5848:
.L4481:
.LBE15101:
.LBE15155:
.LBB15156:
.LBB15154:
.LBB15135:
	call	cap_thread_cap_get_capTCBPtr.isra.89.part.90
.LVL5849:
.L4478:
.LBE15135:
.LBE15154:
.LBE15156:
.LBB15157:
.LBB15115:
.LBB15108:
	call	cap_notification_cap_get_capNtfnPtr.isra.97.part.98
.LVL5850:
.L4479:
.LBE15108:
.LBE15115:
.LBE15157:
.LBB15158:
.LBB15119:
	call	cap_cnode_cap_get_capCNodePtr.isra.118.part.119
.LVL5851:
.L4480:
.LBE15119:
.LBE15158:
.LBB15159:
.LBB15131:
.LBB15128:
	call	cap_irq_handler_cap_get_capIRQ.part.259
.LVL5852:
.LBE15128:
.LBE15131:
.LBE15159:
	.cfi_endproc
.LFE786:
	.size	finaliseCap, .-finaliseCap
	.section	.text.unlikely
.LCOLDE781:
	.text
.LHOTE781:
	.section	.text.unlikely
.LCOLDB782:
	.text
.LHOTB782:
	.p2align 4,,15
	.globl	deleteCallerCap
	.type	deleteCallerCap, @function
deleteCallerCap:
.LFB811:
	.loc 31 278 0
	.cfi_startproc
.LVL5853:
	.loc 31 283 0
	movl	4(%esp), %eax
	andl	$-1024, %eax
	addl	$48, %eax
.LVL5854:
	movl	%eax, 4(%esp)
.LVL5855:
	jmp	cteDeleteOne
.LVL5856:
	.cfi_endproc
.LFE811:
	.section	.text.unlikely
