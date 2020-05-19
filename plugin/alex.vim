" Alex Davis
" Custom commands I use to build and run code
function! BuildCode()
    wa
    call inputsave()
    let target = input('Make target: ')
    call inputrestore()
    silent execute 'make -s -C ' . g:gMakePath . '/Release ' . l:target
    cwin
    redraw!
endfunction

function! RunCode()
    call inputsave()
    let target = input('Executable: ', '', 'file')
    call inputrestore()
    execute 'term ' . l:target
endfunction

function! DiffPrep()
    colorscheme murphy

    " Now alter our custom highlighting
    hi DiffAdd      ctermbg=DarkBlue
    hi DiffDelete   ctermbg=DarkGray
    hi DiffChange   ctermbg=Black
    hi DiffText     ctermbg=DarkCyan

    " Configure the diff options to ignore whitespace
    set diffopt+=iwhite
    set diffopt+=vertical

    nnoremap <Space>   /<<<<<CR>

    nnoremap <C-Left>  :diffget LO<CR>
    nnoremap <C-Up>    :diffget BA<CR>
    nnoremap <C-Right> :diffget RE<CR>

    " nnoremap <C-D>     :qa<CR>
    " nnoremap <C-W>     :wqa<CR>
    " nnoremap <C-E>     :cq<CR>

    " Clear normal mappings
    augroup Normal
        au!
    augroup END

    " Introduce Diff mappings
    augroup Diff
    augroup END

endfunction

function! NormalPrep()
    colorscheme ron

    if AcquireGPath()
    else
        let &path="./**," . &path
    endif

    nnoremap <leader>> :tabn<CR>
    nnoremap <leader>< :tabp<CR>

    nnoremap <C-Left>  :tabprevious<CR>
    nnoremap <C-Right> :tabnext<CR>

    " Clear Diff mappings
    augroup Diff
        au!
    augroup END

    " Introduce Normal mappings
    augroup Normal
        au!
        
        " Tagbar
        au FileType cpp nnoremap <leader>t :TagbarOpen fj<CR>
        "au FileType cpp execute 'TagbarOpen'
    augroup END
endfunction

" Adding an exclamation here in case we start sourcing the file
" multiple times over a sesion... which I have done.
function! ToggleSourceHeader()
    let extension = expand("%:e")
    let root      = expand("%:r")

    if extension ==# "h"
        execute ':e ' . root . '.cpp'
    elseif extension ==# "cpp"
        execute ':e ' . root . '.h'
    endif
endfunction

function! GenerateTags(tagFilename, rootDir, files)
    silent execute "!cd " . a:rootDir . " && ctags -o " . a:tagFilename . " -R . " . a:files
    let &tags=a:rootDir . '/' . a:tagFilename
endfunction

function! AcquireGPath()
    let l:tmpGPath=system("git rev-parse --show-toplevel")

    if strlen(l:tmpGPath)
        " type ':help substitute()' for documentation
        let g:gPath=substitute(l:tmpGPath, '\n\+$', '', '')
        let g:gMakePath=g:gPath
        return 1
    else
        let g:gMakePath='.'
    endif

    return 0
endfunction

" Internally sets the gPath variable for the head of the git repo we're in
if AcquireGPath()
    let g:tagsFileRoot="rps.tags"
    let g:fullTagsFile=g:gPath . "/" . g:tagsFileRoot

    if filereadable(g:fullTagsFile) 
        let &tags=g:fullTagsFile
    endif

    let &path=g:gPath . "/**," . &path

    au FileType cpp nnoremap <leader>g :execute 'call GenerateTags("' . g:tagsFileRoot . '", "' . g:gPath . '", "*.cpp *.h")'<CR>
else
    let g:tagsFileRoot="local.tags"
    au FileType cpp nnoremap <leader>g :execute 'call GenerateTags("' . g:tagsFileRoot . '", ".", "*.cpp *.h")'<CR>
endif

" Attempting to toggle diff themes when we switch to diff mode from within a
" file (i.e. thorugh fugitive)
if &diff 
    call DiffPrep()
else 
    call NormalPrep()
endif

" Visual Studio-esque C++ mappings
au FileType cpp map <F9> :call ToggleSourceHeader()<CR>

au FileType cpp nnoremap <F4> :call RunCode()<CR>
au FileType cpp nnoremap <F5> :silent execute "!gdb -tui --ex='start' --args ./main.out"<CR><C-L>

au FileType cpp nnoremap <F7> :call BuildCode()<CR>

" Terminal
if v:version >= 800
    au TerminalOpen * setlocal nonumber
endif

