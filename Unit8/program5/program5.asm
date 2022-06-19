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

		include	'program5.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'program5.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'program5.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'program5.consts.inc'

		include	'program5.ro.inc'

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


		push	L821_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L806_n__hla_+0], eax	;/* n */
		pop	eax
		mov	ecx, 1
		push	L843_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_n__hla_+0]	; (type int32 n)
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
		jmp	L854_continue__hla_
L854_while__hla_:
		mov	eax, 1

		jmp	L856_StartFor__hla_
L856_for__hla_:
		push	eax
		call	STDOUT_PUTI32	; puti32
L856_continue__hla_:
		add	eax, 1

L856_StartFor__hla_:
		cmp	eax, ecx	
		jbe	L856_for__hla_
L856_exitloop__hla_:

		add	ecx, 1
L854_continue__hla_:
		cmp	ecx, dword ptr [L806_n__hla_+0]	
		jle	L854_while__hla_
L854_exitloop__hla_:

QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


