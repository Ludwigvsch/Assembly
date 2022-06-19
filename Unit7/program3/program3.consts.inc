
		align	4
		label	L820_len__hla_ word
		dd	020h
		dd	020h
		label	L820_str__hla_ byte
		db	"Gimme a decimal value to print: "
		db	0

		db	0
		db	0
		db	0

		align	4
		label	L848_len__hla_ word
		dd	0fh
		dd	0fh
		label	L848_str__hla_ byte
		db	" in binary is: "
		db	0


		align	4
		label	L862_len__hla_ word
		dd	01h
		dd	01h
		label	L862_str__hla_ byte
		db	"_"
		db	0

		db	0
		db	0
