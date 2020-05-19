nnoremap <leader>e :call ViewPreprocessorOutput()<CR>

setlocal foldlevel=2
setlocal foldmethod=syntax

nnoremap <leader>a :syntax region AucsComments start='\v//#\[' end='\v//#\]' fold<CR>

function! ViewPreprocessorOutput()     
    " Redirecting stderr to stdout and losing stdout
    let output = system('g++ ' . bufname('%') . ' -E -o - 2>1')

    vsplit __Compiler_Output__
    wincmd L
    normal! ggdG
    setlocal filetype=compileroutput
    setlocal buftype=nofile

    call append(0, split(output, '\v\n'))
endfunction

" Apparently if this isn't here, somehow syntax is turned off again...
"syntax on

TagbarOpen
