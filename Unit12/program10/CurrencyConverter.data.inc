		label	L806_usd__hla_ dword
		rb	4
		label	L807_britishPounds__hla_ dword
		rb	4
		label	L808_mexicanPesos__hla_ dword
		rb	4
		label	L809_usdToBritishPounds__hla_ dword
		dd	 7.40300000e-01
		label	L810_usdToMexicanPesos__hla_ dword
		dd	 2.05646997e+03
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
