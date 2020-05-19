" Alex Davis
" Various settings for plugins

" airline
let g:airline_powerline_fonts = 1
set laststatus=2

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"
let g:airline_symbols.linenr = '#'

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

let g:airline_theme='molokai'

" ctrlp
let g:ctrlp_map = '<C-p>'
let g:ctrlp_by_filename = 1
set wildignore+=*.o,*.d

" NERDTree
nnoremap <leader>b :NERDTreeFocus<CR>
nnoremap <leader>n :NERDTreeToggle<CR>


" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'c'    : ['#(pwd)'],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#F#W'],
      \'x'    : '#(date)',
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}

" Vimux
nnoremap <leader>vw :call VimuxOpenRunner()<CR>


