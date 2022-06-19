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

		include	'Hurrican.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'Hurrican.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'Hurrican.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'Hurrican.consts.inc'

		include	'Hurrican.ro.inc'

; Code begins here:
L807_hurrican__hla_:
		pop	dword ptr [L808_returnAddress__hla_+0]	;/* returnAddress */
		pop	dword ptr [ebp+8]	;/* windspeed */
		push	dword ptr [L808_returnAddress__hla_+0]	;/* returnAddress */
		push	dword ptr [ebp+8]	;/* windspeed */
		mov	al, 0
		push	dword ptr [L806_a__hla_+0]	;/* a */
		pop	dword ptr [ebp+8]	;/* windspeed */
		finit
		fld	dword ptr [L809_some__hla_+0]	;/* some */
		fld	dword ptr [ebp+8]	;/* windspeed */
		fcomp
		fstsw	ax
		sahf
		setb	al
		cmp	al, 1
		je	L814_print1__hla_
		jmp	L815_checkforextensive__hla_

L814_print1__hla_:
		mov	al, 1
		push	L829_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI8	; puti8
		jmp	L830_ExitSequence__hla_

L815_checkforextensive__hla_:
		finit
		fld	dword ptr [L810_extensive__hla_+0]	;/* extensive */
		fld	dword ptr [ebp+8]	;/* windspeed */
		fcomp
		fstsw	ax
		sahf
		setb	al
		cmp	al, 1
		je	L831_print2__hla_
		jmp	L832_checkfordevastating__hla_

L831_print2__hla_:
		mov	al, 2
		push	L846_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI8	; puti8
		jmp	L830_ExitSequence__hla_

L832_checkfordevastating__hla_:
		finit
		fld	dword ptr [L811_devastating__hla_+0]	;/* devastating */
		fld	dword ptr [ebp+8]	;/* windspeed */
		fcomp
		fstsw	ax
		sahf
		setb	al
		cmp	al, 1
		je	L847_print3__hla_
		jmp	L848_checkforcatastrophic__hla_

L847_print3__hla_:
		mov	al, 3
		push	L862_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI8	; puti8
		jmp	L830_ExitSequence__hla_

L848_checkforcatastrophic__hla_:
		finit
		fld	dword ptr [L812_catastrophic__hla_+0]	;/* catastrophic */
		fld	dword ptr [ebp+8]	;/* windspeed */
		fcomp
		fstsw	ax
		sahf
		setb	al
		cmp	al, 1
		je	L863_print4__hla_
		jmp	L864_checkforvery__hla_

L863_print4__hla_:
		mov	al, 4
		push	L878_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI8	; puti8
		jmp	L830_ExitSequence__hla_

L864_checkforvery__hla_:

L879_print5__hla_:
		mov	al, 5
		push	L893_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI8	; puti8
		jmp	L830_ExitSequence__hla_

L830_ExitSequence__hla_:
xL807_hurrican__hla___hla_:
;L807_hurrican__hla_ endp




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


		push	L907_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L806_a__hla_+0]	;/* a */
		pop	eax
		call	L807_hurrican__hla_
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


