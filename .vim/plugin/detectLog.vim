" Alex Davis
" Provides a universal function for segregating files with similar extensions
" while still respecting those files 'ftdetect' folders

function! GetLogFileType()
    if expand("%:p") =~? '\vaucs'
        return 'aucs'
    else
        return 'muskrat'
    endif
endfunction
