hi!   link   Define        GruvboxOrange
" Generic type
hi!   link   rubyType      GruvboxYellowBold
" Generic statement
hi!   link   Statement     GruvboxRedBold
" Floating point constant: 2.3e10
hi!   link   Float         GruvboxPurple
" Number constant: 234, 0xff
hi!   link   Number        GruvboxPurple
hi!   link   String        GruvboxGreen
" Boolean constant: true, false
hi!   link   Boolean       GruvboxPurpleBold
" sizeof, "+", "*", etc.
hi!   link   Operator      GruvboxOrangeBold
" Variable name
hi!   link   Identifier    GruvboxBlue
" if, then, else, endif, switch
hi!   link   Conditional   GruvboxRedBold
" Any other keyword
hi!   link   Keyword       GruvboxRedBold
" Generic constant
hi!   link   Constant      GruvboxPurple
hi!   link   Special       GruvboxOrangeBold

hi! link goStatement GruvboxPurple
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi! link rubyHeredocDelimiter Special
" Same as Default; extend, private, protected, public
hi! link Macro GruvboxAquaBold
"do end
hi! link rubyControl Statement
" method_name
hi! link rubyMethodName Statement
" class; class_name
hi! link rubyClass Define
hi! link rubyClassName rubyType
" module; module_name
hi! link rubyModule Define
hi! link rubyModuleName rubyType
" def
hi! link rubyDefine GruvboxOrange
" float 3.14; int
hi! link rubyFloat Float
hi! link rubyInteger Number
" Boolean
hi! link rubyBoolean Boolean
hi! link rubyBooleanOperator Operator
hi! link rubyEnglishBooleanOperator Operator
" Global variable; Constant
hi! link rubyGlobalVariable Identifier
hi! link rubyConstant rubyType
" if else
hi! link rubyConditional Conditional
hi! link rubyConditionalModifier Conditional
hi! link rubyExceptionHandler Conditional
hi! link rubyExceptionHandler2 Conditional
" class variable
hi! link rubyClassVariable Identifier
hi! link rubyKeyword Keyword
hi! link rubyPredefinedVariable Identifier
hi! link rubyPredefinedConstant Identifier
" Symbol
hi! link rubySymbol Constant
" String
hi! link rubyString String
" Operator
hi! link rubyOperator Operator
hi! link rubyDefinedOperator Operator
" String delimiter ', "
hi! link rubyStringDelimiter GruvboxGreenBold
" Symbol delimiter %i
hi! link rubyPercentSymbolDelimiter	GruvboxPurpleBold
" String delimiter %w, %q 
hi! link rubyPercentStringDelimiter GruvboxOrangeBold
" Regexp %r
hi! link rubyPercentRegexpDelimiter	GruvboxRedBold
" String interpolation #{var}
hi! link rubyInterpolationDelimiter GruvboxOrange
hi! link rubyRepeat GruvboxRedBold
hi! link rubyRepeatModifier rubyRepeat

"""""""""""""""""""""""""""""""""""""""""""""""""
hi! link rubyIdentifier GruvboxYellow
hi! link rubyAttribute GruvboxYellow
hi! link rubyException GruvboxRedBold
"""""""""""""""""""""""""""""""""""""""""""""""""

hi! link rubyTernaryOperator Operator
hi! link rubyArithmeticOperator Operator
hi! link rubyComparisonOperator Operator
hi! link rubyBitwiseOperator Operator
hi! link rubyRangeOperator Operator
hi! link rubyAssignmentOperator Operator
hi! link rubyEqualityOperator Operator

hi! link rubyPseudoOperator Operator
hi! link rubyDotOperator Operator
hi! link rubyScopeOperator Operator
hi! link rubySuperClassOperator Operator
hi! link rubyEigenClassOperator Operator
hi! link rubyLambdaOperator Operator
hi! link rubyDoubleSplatOperator Operator
hi! link rubySplatOperator Operator
hi! link rubyProcOperator Operator
hi! link rubyBeginEnd Operator
hi! link rubyEval Operator
hi! link rubyPseudoVariable Operator
hi! link rubyCapitalizedMethod NONE
