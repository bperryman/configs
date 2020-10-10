
" Setting this stuff up
"
" First off change to a package directory
"     mkdir -p ${HOME}/.vim/pack/my-packages/start
"     cd ${HOME}/.vim/pack/my-packages/start
"
" atomified - color scheme
"     git clone https://github.com/Siphalor/vim-atomified.git
" airline:
"     git clone https://github.com/vim-airline/vim-airline.git
" syntastic:
"     git clone https://github.com/vim-syntastic/syntastic.git
" julia:
"     git clone git://github.com/JuliaEditorSupport/julia-vim.git
" rust:
"     git clone https://github.com/rust-lang/rust.vim.git
" go:
"     git clone https://github.com/fatih/vim-go.git
" elixir:
"     git clone https://github.com/elixir-lang/vim-elixir.git
"     git clone https://github.com/slashmili/alchemist.vim.git
" vim slime:
"     git clone https://github.com/jpalardy/vim-slime.git
" 

set ic
set ai
set sm
set ts=4
set sw=4
set nowrap
set expandtab

set path=**,,

map <F2> :set sw=2:set ts=2
map <F4> :set sw=4:set ts=4
map <F8> :set sw=8:set ts=8

" Configuration for tmux in vim-slime
let g:slime_target = "tmux"

" Configuration for splits and windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Configuration for code folding - can use space to collapse/expand
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

filetype plugin indent on
syntax enable
syntax on

" configuration for python and to make it better to work with in vim
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" A bit of configuration for go
let mapleader = ","
let $PATH .= ':' . $HOME . '/go/bin:' . $HOME . '/opt/go/bin'
let $GOROOT = $HOME . '/opt/go'
let $GOPATH = $HOME . '/go:' . $HOME . '/learning/go:' . $HOME . '/goprojects'

let g:go_fmt_command = "goimports"
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>v <Plug>(go-vet)


" Configuration for airline
" let g:airline_powerline_fonts = 1

" Configuration for erlang and elixir
let $PATH .= ':' . $HOME . '/opt/erlang/bin:' . $HOME . '/opt/elixir/bin'

" Syntatic setup - to be reviewed
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" configuration for rust
" This next line is probably more of a work-around than it should be
autocmd FileType rust let g:syntastic_rust_checkers = ['rustc']
let $PATH .= ':' . $HOME . '/.cargo/bin'
let g:rustfmt_autosave = 1


let g:slime_target = "tmux"


" Finally setus up for GUI stuff
if has("gui_running")
    set lines=45
    set columns=95
    set guifont=Menlo-Regular:h13
endif

colorscheme atomified

