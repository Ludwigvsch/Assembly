		label	L806_a__hla_ dword
		rb	4
		label	L808_returnAddress__hla_ dword
		rb	4
		label	L809_some__hla_ dword
		dd	 9.60000000e+01
		label	L810_extensive__hla_ dword
		dd	 1.11000000e+02
		label	L811_devastating__hla_ dword
		dd	 1.30000000e+02
		label	L812_catastrophic__hla_ dword
		dd	 1.57000000e+02
		label	L813_verycat__hla_ dword
		dd	 1.58000000e+02
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
