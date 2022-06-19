		label	L806_a__hla_ dword
		rb	4
		label	L807_b__hla_ dword
		rb	4
		label	L808_c__hla_ dword
		rb	4
		label	L809_x1__hla_ dword
		rb	4
		label	L810_x2__hla_ dword
		rb	4
		label	L811_sqrtd__hla_ dword
		rb	4
		label	L812_zero__hla_ dword
		dd	 0.00000000e+00
		label	L813_two__hla_ dword
		dd	 2.00000000e+00
		label	L814_four__hla_ dword
		dd	 4.00000000e+00
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
