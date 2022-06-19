		label	L806_value1__hla_ word
		rb	2
		label	L807_value2__hla_ word
		rb	2
		label	L808_value3__hla_ word
		rb	2
		label	L809_sum__hla_ word
		dw 	00h
		label	L810_flag__hla_ word
		dw 	00h
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
