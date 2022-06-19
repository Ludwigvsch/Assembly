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

		include	'Swapper.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'Swapper.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'Swapper.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'Swapper.consts.inc'

		include	'Swapper.ro.inc'

; Code begins here:
L809_swapper__hla_:
		mov	dword ptr [L812_temp_EAX__hla_+0], eax	;/* temp_EAX */
		mov	dword ptr [L813_temp_EBX__hla_+0], ebx	;/* temp_EBX */
		mov	dword ptr [L814_temp_ECX__hla_+0], ecx	;/* temp_ECX */
		mov	dword ptr [L815_temp_EDX__hla_+0], edx	;/* temp_EDX */
		mov	dword ptr [L816_temp_ESI__hla_+0], esi	;/* temp_ESI */
		pop	dword ptr [L810_dReturnAddress__hla_+0]	;/* dReturnAddress */
		pop	ebx
		pop	ecx
		pop	edx
		push	dword ptr [L810_dReturnAddress__hla_+0]	;/* dReturnAddress */
		push	dword ptr [L812_temp_EAX__hla_+0]	;/* temp_EAX */
		push	dword ptr [L813_temp_EBX__hla_+0]	;/* temp_EBX */
		push	dword ptr [L814_temp_ECX__hla_+0]	;/* temp_ECX */
		push	dword ptr [L815_temp_EDX__hla_+0]	;/* temp_EDX */
		push	dword ptr [L816_temp_ESI__hla_+0]	;/* temp_ESI */

L817_firstCheck__hla_:
		mov	esi, [ecx+0]	;/* [ecx] */
		cmp	[edx+0], si	;/* [edx] */
		jg	L818_firstSwap__hla_

L819_secondCheck__hla_:
		mov	esi, [ecx+0]	;/* [ecx] */
		cmp	si, [ebx+0]	;/* [ebx] */
		jg	L820_secondSwap__hla_
		jmp	L821_endSwaps__hla_

L818_firstSwap__hla_:
		mov	eax, [edx+0]	;/* [edx] */
		mov	word ptr [L811_temp_Number__hla_+0], ax	;/* temp_Number */
		mov	eax, [ecx+0]	;/* [ecx] */
		mov	[edx+0], ax	;/* [edx] */
		mov	ax, word ptr [L811_temp_Number__hla_+0]	;/* temp_Number */
		mov	[ecx+0], ax	;/* [ecx] */
		jmp	L819_secondCheck__hla_

L820_secondSwap__hla_:
		mov	eax, [ebx+0]	;/* [ebx] */
		mov	word ptr [L811_temp_Number__hla_+0], ax	;/* temp_Number */
		mov	eax, [ecx+0]	;/* [ecx] */
		mov	[ebx+0], ax	;/* [ebx] */
		mov	ax, word ptr [L811_temp_Number__hla_+0]	;/* temp_Number */
		mov	[ecx+0], ax	;/* [ecx] */
		jmp	L817_firstCheck__hla_

L821_endSwaps__hla_:
		pop	eax
		pop	ebx
		pop	ecx
		pop	edx
		pop	esi
		ret
xL809_swapper__hla___hla_:
;L809_swapper__hla_ endp




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


		push	L835_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L806_X_Value__hla_+0], ax	;/* X_Value */
		pop	eax
		push	L857_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L807_Y_Value__hla_+0], ax	;/* Y_Value */
		pop	eax
		push	L879_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L808_Z_Value__hla_+0], ax	;/* Z_Value */
		pop	eax
		lea	eax, word ptr [L806_X_Value__hla_+0]	;/* X_Value */
		push	eax
		lea	eax, word ptr [L807_Y_Value__hla_+0]	;/* Y_Value */
		push	eax
		lea	eax, word ptr [L808_Z_Value__hla_+0]	;/* Z_Value */
		push	eax
		call	L809_swapper__hla_
		push	L901_str__hla_
		call	STDOUT_PUTS	; puts
		push	word 00h
		push	word ptr [L808_Z_Value__hla_+0]	; Z_Value
		call	STDOUT_PUTI16	; puti16
		push	L915_str__hla_
		call	STDOUT_PUTS	; puts
		push	word 00h
		push	word ptr [L807_Y_Value__hla_+0]	; Y_Value
		call	STDOUT_PUTI16	; puti16
		push	L929_str__hla_
		call	STDOUT_PUTS	; puts
		push	word 00h
		push	word ptr [L806_X_Value__hla_+0]	; X_Value
		call	STDOUT_PUTI16	; puti16
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


