setl noexpandtab
setl shiftwidth=4
setl textwidth=80
setl linebreak
setl smarttab

let maplocalleader='t'

" Setting the conceal level
set conceallevel=3
set concealcursor=nvic

" I'd like to make a mapping that creates a blank header
nnoremap <localleader>h :call InsertHeader()<CR>
inoremap <C-h> <Esc>:call InsertHeader()<CR>i

nnoremap <CR> :call OpenExample()<CR>

nnoremap <Right> :tabnext<CR>
nnoremap <Left> :tabprevious<CR>

function! InsertHeader()
    call inputsave()
    let topic = input('Header: ')
    call inputrestore()

    call append(line('.'), [ '', 
                           \ '================================================================================',
                           \ l:topic,
                           \ '================================================================================',
                           \ ''])
    +5
endfunction

function! OpenExample()
    let line = getline(line('.'))
    let index = match(line, '\v[[:alpha:]][[:alnum:]_]*\.(h|cpp)')
    let file = line[index:]

    echom 'File: ' . file

    if -1 == index
        finish
    endif

    execute 'vsplit +find\ ' . file

endfunction

