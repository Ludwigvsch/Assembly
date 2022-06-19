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

		include	'isIncreasing.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'isIncreasing.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'isIncreasing.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'isIncreasing.consts.inc'

		include	'isIncreasing.ro.inc'

; Code begins here:
L809_isDecreasing__hla_:
		pop	dword ptr [L810_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	dword ptr [ebp+8]	;/* k */
		pop	dword ptr [ebp+12]	;/* j */
		pop	dword ptr [ebp+16]	;/* i */
		push	dword ptr [L810_iReturnAddress__hla_+0]	;/* iReturnAddress */
		push	ebx
		mov	ebx, dword ptr [ebp+12]	;/* j */
		cmp	dword ptr [ebp+16], ebx	;/* i */
		jg	L811_first_pass__hla_
		jmp	L812_ret_false__hla_

L811_first_pass__hla_:
		mov	ebx, dword ptr [ebp+8]	;/* k */
		cmp	dword ptr [ebp+12], ebx	;/* j */
		jg	L813_ret_true__hla_
		jmp	L812_ret_false__hla_

L813_ret_true__hla_:
		mov	eax, 1
		jmp	L814_finish__hla_

L812_ret_false__hla_:
		mov	eax, 0
		jmp	L814_finish__hla_

L814_finish__hla_:
		pop	ebx
		ret
xL809_isDecreasing__hla___hla_:
;L809_isDecreasing__hla_ endp




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


		push	L828_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L806_i_input__hla_+0], eax	;/* i_input */
		pop	eax
		push	L850_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L807_j_input__hla_+0], eax	;/* j_input */
		pop	eax
		push	L872_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L808_k_input__hla_+0], eax	;/* k_input */
		pop	eax
		push	dword ptr [L806_i_input__hla_+0]	;/* i_input */
		push	dword ptr [L807_j_input__hla_+0]	;/* j_input */
		push	dword ptr [L808_k_input__hla_+0]	;/* k_input */
		call	L809_isDecreasing__hla_
		push	L894_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI32	; puti32
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


