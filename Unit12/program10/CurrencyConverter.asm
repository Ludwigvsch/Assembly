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

		include	'CurrencyConverter.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'CurrencyConverter.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'CurrencyConverter.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'CurrencyConverter.consts.inc'

		include	'CurrencyConverter.ro.inc'

; Code begins here:



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


		push	L824_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L806_usd__hla_+0]	;/* usd */
		pop	eax
		finit
		fld	dword ptr [L806_usd__hla_+0]	;/* usd */
		fld	dword ptr [L809_usdToBritishPounds__hla_+0]	;/* usdToBritishPounds */
		fmulp
		fstp	dword ptr [L807_britishPounds__hla_+0]	;/* britishPounds */
		finit
		fld	dword ptr [L806_usd__hla_+0]	;/* usd */
		fld	dword ptr [L810_usdToMexicanPesos__hla_+0]	;/* usdToMexicanPesos */
		fmulp
		fstp	dword ptr [L808_mexicanPesos__hla_+0]	;/* mexicanPesos */
		push	L846_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_britishPounds__hla_+0]	; britishPounds
		push	dword 06h
		push	dword 02h
		call	STDOUT_PUTR32	; putr32
		push	L860_str__hla_
		call	STDOUT_PUTS	; puts
		push	L874_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L808_mexicanPesos__hla_+0]	; mexicanPesos
		push	dword 09h
		push	dword 02h
		call	STDOUT_PUTR32	; putr32
		push	L888_str__hla_
		call	STDOUT_PUTS	; puts
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


