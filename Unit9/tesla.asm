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

		include	'tesla.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'tesla.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'tesla.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'tesla.consts.inc'

		include	'tesla.ro.inc'

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


		push	L819_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETW	; getw
		mov	[esp+0], ax	;/* [esp] */
		pop	eax
		mov	bx, ax
		and	ah, 2
		shr	ah, 1
		cmp	ah, 1
		je	L828_L1__hla_
		push	L842_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L847_L2__hla_

L828_L1__hla_:
		push	L861_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln

L847_L2__hla_:
		mov	ax, bx
		and	ah, 1
		cmp	ah, 1
		je	L866_L3__hla_
		push	L880_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L885_L4__hla_

L866_L3__hla_:
		push	L899_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln

L885_L4__hla_:
		mov	ax, bx
		and	al, 192
		shr	al, 6
		cmp	al, 0
		jne	L904_L5__hla_
		push	L918_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L919_L8__hla_

L904_L5__hla_:
		cmp	al, 1
		jne	L920_L6__hla_
		push	L934_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L919_L8__hla_

L920_L6__hla_:
		cmp	al, 2
		jne	L935_L7__hla_
		push	L949_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L919_L8__hla_

L935_L7__hla_:
		push	L963_str__hla_
		call	STDOUT_PUTS	; puts

L919_L8__hla_:
		mov	ax, bx
		and	al, 48
		shr	al, 4
		cmp	al, 0
		jne	L964_L9__hla_
		push	L978_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L979_L12__hla_

L964_L9__hla_:
		cmp	al, 1
		jne	L980_L10__hla_
		push	L994_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L979_L12__hla_

L980_L10__hla_:
		cmp	al, 2
		jne	L995_L11__hla_
		push	L1009_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L979_L12__hla_

L995_L11__hla_:
		push	L1023_str__hla_
		call	STDOUT_PUTS	; puts

L979_L12__hla_:
		mov	ax, bx
		and	al, 12
		shr	al, 2
		cmp	al, 0
		jne	L1024_L13__hla_
		push	L1038_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L1039_L16__hla_

L1024_L13__hla_:
		cmp	al, 1
		jne	L1040_L14__hla_
		push	L1054_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L1039_L16__hla_

L1040_L14__hla_:
		cmp	al, 2
		jne	L1055_L15__hla_
		push	L1069_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L1039_L16__hla_

L1055_L15__hla_:
		push	L1083_str__hla_
		call	STDOUT_PUTS	; puts

L1039_L16__hla_:
		mov	ax, bx
		and	al, 3
		cmp	al, 0
		jne	L1084_L17__hla_
		push	L1098_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L1099_L20__hla_

L1084_L17__hla_:
		cmp	al, 1
		jne	L1100_L18__hla_
		push	L1114_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L1099_L20__hla_

L1100_L18__hla_:
		cmp	al, 2
		jne	L1115_L19__hla_
		push	L1129_str__hla_
		call	STDOUT_PUTS	; puts
		jmp	L1099_L20__hla_

L1115_L19__hla_:
		push	L1143_str__hla_
		call	STDOUT_PUTS	; puts

L1099_L20__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


