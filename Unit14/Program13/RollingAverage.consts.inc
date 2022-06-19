
		align	4
		label	L829_len__hla_ word
		dd	012h
		dd	012h
		label	L829_str__hla_ byte
		db	"enter data point: "
		db	0

		db	0

		align	4
		label	L851_len__hla_ word
		dd	012h
		dd	012h
		label	L851_str__hla_ byte
		db	"rolling average = "
		db	0

		db	0

		align	4
		label	L869_len__hla_ word
		dd	0bh
		dd	0bh
		label	L869_str__hla_ byte
		db	"more data? "
		db	0


		align	4
		label	L883_len__hla_ word
		dd	018h
		dd	018h
		label	L883_str__hla_ byte
		db	"final rolling average = "
		db	0

		db	0
		db	0
		db	0
