		label	L806_iValue1__hla_ word
		dw 	00h
		label	L807_iValue2__hla_ word
		dw 	00h
		label	L808_iValue3__hla_ word
		dw 	00h
		label	L810_dReturnAddress__hla_ dword
		rb	4
		label	L811_iTemporary__hla_ dword
		rb	4
		label	L812_ismallest__hla_ word
		dw 	00h
		label	L813_dEDXRegister__hla_ dword
		dd	00h
		label	L814_dECXRegister__hla_ dword
		dd	00h
		label	L815_dEBXRegister__hla_ dword
		dd	00h
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
