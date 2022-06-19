; Assembly code emitted by HLA compiler
; Version 1.76 build 9932 (prototype)
; HLA compiler written by Randall Hyde
; FASM compatible output

		format	MS COFF


offset32	equ	 
ptr	equ	 

macro global [symbol]
{
 local isextrn
 if defined symbol & ~ defined isextrn
   public symbol
 else if used symbol
   extrn symbol
   isextrn = 1
 end if
}

macro global2 [symbol,type]
{
 local isextrn
 if defined symbol & ~ defined isextrn
   public symbol
 else if used symbol
   extrn symbol:type
   isextrn = 1
 end if
}


ExceptionPtr__hla_	equ	fs:0

		include	'makeSmallest.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'makeSmallest.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'makeSmallest.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'makeSmallest.consts.inc'

		include	'makeSmallest.ro.inc'

; Code begins here:
L809_makeSmallest__hla_:
		mov	dword ptr [L815_dEBXRegister__hla_+0], ebx	;/* dEBXRegister */
		mov	dword ptr [L814_dECXRegister__hla_+0], ecx	;/* dECXRegister */
		mov	dword ptr [L813_dEDXRegister__hla_+0], edx	;/* dEDXRegister */
		pop	dword ptr [L810_dReturnAddress__hla_+0]	;/* dReturnAddress */
		pop	edx
		pop	ecx
		pop	ebx
		push	dword ptr [L810_dReturnAddress__hla_+0]	;/* dReturnAddress */
		push	dword ptr [L813_dEDXRegister__hla_+0]	;/* dEDXRegister */
		push	dword ptr [L814_dECXRegister__hla_+0]	;/* dECXRegister */
		push	dword ptr [L815_dEBXRegister__hla_+0]	;/* dEBXRegister */
		push	dword ptr [ebx+0]	;/* [ebx] */
		pop	dword ptr [ebp+16]	;/* i */
		push	dword ptr [ecx+0]	;/* [ecx] */
		pop	dword ptr [ebp+12]	;/* j */
		push	dword ptr [edx+0]	;/* [edx] */
		pop	dword ptr [ebp+8]	;/* k */
		mov	ax, [ebx+0]	;/* [ebx] */
		cmp	ax, [ecx+0]	;/* [ecx] */
		jl	L816_ismallerthanj__hla_
		push	word ptr [ecx+0]	;/* [ecx] */
		pop	word ptr [L812_ismallest__hla_+0]	;/* ismallest */
		jmp	L817_secondPart__hla_

L816_ismallerthanj__hla_:
		push	word ptr [ebx+0]	;/* [ebx] */
		pop	word ptr [L812_ismallest__hla_+0]	;/* ismallest */

L817_secondPart__hla_:
		mov	ax, 0
		mov	ax, word ptr [L812_ismallest__hla_+0]	;/* ismallest */
		cmp	ax, [edx+0]	;/* [edx] */
		jl	L818_finished__hla_
		push	word ptr [edx+0]	;/* [edx] */
		pop	word ptr [L812_ismallest__hla_+0]	;/* ismallest */
		jmp	L818_finished__hla_

L818_finished__hla_:
		push	word ptr [L812_ismallest__hla_+0]	;/* ismallest */
		pop	word ptr [ebx+0]	;/* [ebx] */
		push	word ptr [L812_ismallest__hla_+0]	;/* ismallest */
		pop	word ptr [ecx+0]	;/* [ecx] */
		push	word ptr [L812_ismallest__hla_+0]	;/* ismallest */
		pop	word ptr [edx+0]	;/* [edx] */
		pop	dword ptr [L815_dEBXRegister__hla_+0]	;/* dEBXRegister */
		pop	dword ptr [L814_dECXRegister__hla_+0]	;/* dECXRegister */
		pop	dword ptr [L813_dEDXRegister__hla_+0]	;/* dEDXRegister */
		mov	ebx, dword ptr [L815_dEBXRegister__hla_+0]	;/* dEBXRegister */
		mov	ecx, dword ptr [L814_dECXRegister__hla_+0]	;/* dECXRegister */
		mov	edx, dword ptr [L813_dEDXRegister__hla_+0]	;/* dEDXRegister */
		ret
xL809_makeSmallest__hla___hla_:
;L809_makeSmallest__hla_ endp




;/* HWexcept__hla_ gets called when Windows raises the exception. */

HWexcept__hla_ :
		jmp	HardwareException__hla_
;HWexcept__hla_  endp

DfltExHndlr__hla_:
		jmp	DefaultExceptionHandler__hla_
;DfltExHndlr__hla_ endp



_HLAMain       :


;/* Set up the Structured Exception Handler record */
;/* for this program. */

		call	BuildExcepts__hla_
		pushd	0		;/* No Dynamic Link. */
		mov	ebp, esp	;/* Pointer to Main's locals */
		push	ebp		;/* Main's display. */


		push	L832_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L806_iValue1__hla_+0], ax	;/* iValue1 */
		pop	eax
		push	L854_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L807_iValue2__hla_+0], ax	;/* iValue2 */
		pop	eax
		push	L876_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L808_iValue3__hla_+0], ax	;/* iValue3 */
		pop	eax
		lea	eax, word ptr [L806_iValue1__hla_+0]	;/* iValue1 */
		push	eax
		lea	eax, word ptr [L807_iValue2__hla_+0]	;/* iValue2 */
		push	eax
		lea	eax, word ptr [L808_iValue3__hla_+0]	;/* iValue3 */
		push	eax
		call	L809_makeSmallest__hla_
		push	L898_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L912_str__hla_
		call	STDOUT_PUTS	; puts
		push	word 00h
		push	word ptr [L806_iValue1__hla_+0]	; (type int16 iValue1)
		call	STDOUT_PUTI16	; puti16
		push	L941_str__hla_
		call	STDOUT_PUTS	; puts
		push	L955_str__hla_
		call	STDOUT_PUTS	; puts
		push	word 00h
		push	word ptr [L807_iValue2__hla_+0]	; (type int16 iValue2)
		call	STDOUT_PUTI16	; puti16
		push	L984_str__hla_
		call	STDOUT_PUTS	; puts
		push	L998_str__hla_
		call	STDOUT_PUTS	; puts
		push	word 00h
		push	word ptr [L808_iValue3__hla_+0]	; (type int16 iValue3)
		call	STDOUT_PUTI16	; puti16
		push	L1027_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


