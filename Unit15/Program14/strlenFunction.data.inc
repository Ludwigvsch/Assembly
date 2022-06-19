		label	L807_dReturnAddress__hla_ dword
		rb	4
		label	L808_wDIRegister__hla_ word
		dw 	00h
		label	L809_wDXRegister__hla_ word
		dw 	00h
		label	L810_dEAXRegister__hla_ dword
		dd	00h
		label	L811_dEBXRegister__hla_ dword
		dd	00h
		label	L812_dECXRegister__hla_ dword
		dd	00h
		label	L813_sData__hla_ dword
		rb	4
		label	L817_dReturnAddress__hla_ dword
		rb	4
		label	L818_wDXRegister__hla_ word
		dw 	00h
		label	L819_dEBXRegister__hla_ dword
		dd	00h
		label	L822_string_Data__hla_ byte
		db	061h
		db	062h
		db	063h
		db	064h
		db	065h
		db	066h
		db	067h
		db	068h
		db	069h
		db	06ah
		db	06bh
		db	06ch
		db	06dh
		db	06eh
		db	06fh
		db	070h
		db	071h
		db	072h
		db	073h
		db	074h
		db	075h
		db	076h
		db	077h
		db	078h
		db	079h
		db	07ah
		db	030h
		label	L823_base_String_Address__hla_ dword
		dd	00h
		label	L824_string_Data_Length__hla_ word
		dw 	01ah
		label	L826_dReturnAddress__hla_ dword
		rb	4
		label	L827_wDXRegister__hla_ word
		dw 	00h
		label	L828_dEBXRegister__hla_ dword
		dd	00h
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
