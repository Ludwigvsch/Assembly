		label	L806_more__hla_ byte
		db	079h
		label	L807_data__hla_ dword
		rb	4
		label	L808_average__hla_ dword
		dd	 0.00000000e+00
		label	L809_previous_average__hla_ dword
		dd	 0.00000000e+00
		label	L810_n__hla_ dword
		dd	 0.00000000e+00
		label	L811_one__hla_ dword
		dd	 1.00000000e+00
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
