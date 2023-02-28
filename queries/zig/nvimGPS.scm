; Struct
((Decl
	(VarDecl
		variable_type_function: (IDENTIFIER) @class-name)) @scope-root)

; Function
((Decl
	(FnProto
		function: (IDENTIFIER) @function-name)) @scope-root)

; Test
((TestDecl
	((STRINGLITERALSINGLE) @function-name)) @scope-root)
