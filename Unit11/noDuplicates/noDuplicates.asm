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

		include	'noDuplicates.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'noDuplicates.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'noDuplicates.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'noDuplicates.consts.inc'

		include	'noDuplicates.ro.inc'

; Code begins here:
L809_noDuplicates__hla_:
		pop	dword ptr [L810_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	word ptr [ebp+8]	;/* z */
		pop	word ptr [ebp+12]	;/* y */
		pop	word ptr [ebp+16]	;/* x */
		push	dword ptr [L810_iReturnAddress__hla_+0]	;/* iReturnAddress */
		push	bx
		mov	bx, word ptr [ebp+16]	;/* x */
		cmp	word ptr [ebp+12], bx	;/* y */
		je	L811_ret_false__hla_
		mov	bx, word ptr [ebp+12]	;/* y */
		cmp	word ptr [ebp+8], bx	;/* z */
		je	L811_ret_false__hla_
		mov	bx, word ptr [ebp+16]	;/* x */
		cmp	word ptr [ebp+8], bx	;/* z */
		je	L811_ret_false__hla_
		jmp	L812_ret_true__hla_

L812_ret_true__hla_:
		mov	al, 1
		jmp	L813_finish__hla_

L811_ret_false__hla_:
		mov	al, 0
		jmp	L813_finish__hla_

L813_finish__hla_:
		pop	bx
		ret
xL809_noDuplicates__hla___hla_:
;L809_noDuplicates__hla_ endp




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


		push	L827_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L806_x_input__hla_+0], ax	;/* x_input */
		pop	eax
		push	L849_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L807_y_input__hla_+0], ax	;/* y_input */
		pop	eax
		push	L871_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L808_z_input__hla_+0], ax	;/* z_input */
		pop	eax
		push	word ptr [L806_x_input__hla_+0]	;/* x_input */
		push	word ptr [L807_y_input__hla_+0]	;/* y_input */
		push	word ptr [L808_z_input__hla_+0]	;/* z_input */
		call	L809_noDuplicates__hla_
		push	L893_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI8	; puti8
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


