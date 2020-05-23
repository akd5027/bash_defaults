" Maintainer: Alex Davis

" If this syntax is already defined, just move on
if exists("b:current_syntax")
    finish
endif

" Our Colors
hi LectHeader       ctermfg=Black       ctermbg=LightGray
hi LectSubHeader    ctermfg=Black       ctermbg=DarkGray
hi LectSpecial      ctermfg=LightBlue
hi LectTopical      ctermfg=DarkBlue
hi LectFile         ctermfg=Magenta
hi LectList         ctermfg=Brown
hi LectCode         ctermfg=DarkGray

syn match   synLectSubHeader '\v\={5}.*'
syn match   synLectHeader '\v\={80}\n.*\n\={80}'

syn match   synLectFile   '\v[[:alpha:]][[:alnum:]_]*\.(h|cpp)'
syn keyword synLectSpecial EXAMPLE

syn match synLectIncludeGuards '\vInclude[[:space:]\n]Guards'

syn match synLectList '\v^\t.*'

syn region synLectShortCode start='\v`' end='\v`' keepend contains=synLectShortCodeStart,synLectShortCodeEnd
syn match  synLectShortCodeStart '\v`' contained conceal
syn match  synLectShortCodeEnd '\v`' contained conceal

syn region synLectCode start='\v^```' end='\v```$' keepend contains=synLectCodeStart,synLectCodeEnd
syn match  synLectCodeStart '\v```' contained conceal
syn match  synLectCodeEnd '\v```' contained conceal

hi def link synLectHeader           LectHeader
hi def link synLectSubHeader        LectSubHeader
hi def link synLectSpecial          LectSpecial
hi def link synLectIncludeGuards    LectTopical
hi def link synLectFile             LectFile
hi def link synLectList             LectList
hi def link synLectCode             LectCode
hi def link synLectShortCode        LectCode


