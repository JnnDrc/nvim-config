" Vim syntax file
" Language: BNF (Backus-Naur Form)
" Filenames: *.bnf, *.ebnf

if exists("b:current_syntax")
  finish
endif

" Case insensitive (BNF is typically case-insensitive for keywords)
syn case ignore

" Comments (-- or //)
syn match bnfComment "\v\s*[-][-].*$" 
syn match bnfComment "\v\s*[/][/].*$"

" Non-terminal symbols (enclosed in angle brackets)
syn region bnfNonTerminal start="<" end=">" contains=bnfSpecial

" Terminal symbols (quoted strings)
syn region bnfTerminal start='"' end='"'
syn region bnfTerminal start="'" end="'"

" Special characters and operators
syn match bnfOperator "::="
syn match bnfOperator ":="  " because i'm to lazy to write ::= every time
syn match bnfOperator "="
syn match bnfOperator "|"
syn match bnfOperator "\*"
syn match bnfOperator "+"
syn match bnfOperator "?"
syn match bnfOperator "\[" 
syn match bnfOperator "\]"
syn match bnfOperator "{"
syn match bnfOperator "}"

" Numbers (if present as terminals)
syn match bnfNumber "\<\d\+\>"

" Keywords (common BNF/EBNF keywords)
syn keyword bnfKeyword START TERMINAL IGNORE COMMENT syntax rule

" Special escapes in strings
syn match bnfSpecial "\\[ntr\"\\]" contained containedin=bnfTerminal

" Delimiters
syn match bnfDelimiter "[();,]"

" Whitespace - not highlighted but important for matching
syn match bnfWhitespace "\s\+"

" Define highlighting
hi def link bnfComment Comment
hi def link bnfNonTerminal Identifier
hi def link bnfTerminal String
hi def link bnfOperator Operator
hi def link bnfNumber Number
hi def link bnfKeyword Keyword
hi def link bnfSpecial SpecialChar
hi def link bnfDelimiter Delimiter

let b:current_syntax = "bnf"

" Optional: Folding for BNF rules
if exists("bnf_folding")
  syn region bnfRule start="^\s*<[^>]*>\s*::=" end=";.*$" fold transparent
  set foldmethod=syntax
endif
