		label	L806_X_Value__hla_ word
		dw 	00h
		label	L807_Y_Value__hla_ word
		dw 	00h
		label	L808_Z_Value__hla_ word
		dw 	00h
		label	L810_dReturnAddress__hla_ dword
		rb	4
		label	L811_temp_Number__hla_ word
		dw 	00h
		label	L812_temp_EAX__hla_ dword
		dd	00h
		label	L813_temp_EBX__hla_ dword
		dd	00h
		label	L814_temp_ECX__hla_ dword
		dd	00h
		label	L815_temp_EDX__hla_ dword
		dd	00h
		label	L816_temp_ESI__hla_ dword
		dd	00h
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
