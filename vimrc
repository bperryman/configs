" Setting this stuff up
"
" First off change to a package directory
"     mkdir -p ${HOME}/.vim/pack/plugins/start
"     cd ${HOME}/.vim/pack/plugins/start
"
" atomified - color scheme
"     git clone https://github.com/Siphalor/vim-atomified.git
" airline:
"     git clone https://github.com/vim-airline/vim-airline.git
" syntastic:
"     git clone https://github.com/vim-syntastic/syntastic.git
" tagbar:
"     git clone https://github.com/preservim/tagbar.git
" julia:
"     git clone git://github.com/JuliaEditorSupport/julia-vim.git
" rust:
"     git clone --depth 1 https://github.com/rust-lang/rust.vim.git
"     git clone --depth 1 https://github.com/prabirshrestha/async.vim
"     git clone --depth 1 https://github.com/prabirshrestha/vim-lsp
"     git clone --depth 1 https://github.com/prabirshrestha/asyncomplete.vim
"     git clone --depth 1 https://github.com/prabirshrestha/asyncomplete-lsp.vim
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

" *** INITIAL MISC CONFIGURATION AND SETUP ***
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

" *** TAGBAR ***
" Configuration for tagbar
map <F8> :TagbarToggle<CR>


" *** PYTHON ***
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" *** GO ***
let mapleader = ","
let $PATH .= ':' . $HOME . '/vimgo/bin:' . $HOME . '/go/bin:' . $HOME . '/opt/go/bin'
let $GOROOT = $HOME . '/opt/go'
let $GOPATH = $HOME . '/vimgo:' . $HOME . '/go'

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

" *** ERLANG & ELIXIR ***
let $PATH .= ':' . $HOME . '/opt/erlang/bin:' . $HOME . '/opt/elixir/bin'

" *** SYNTATIC ***
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" *** RUST ***
" This next line is probably more of a work-around than it should be
autocmd FileType rust let g:syntastic_rust_checkers = ['rustc']
let $PATH .= ':' . $HOME . '/.cargo/bin'
let g:rustfmt_autosave = 1
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif



" Finally setup up for GUI stuff
if has("gui_running")
    set lines=60
    set columns=120
    " set guifont=Menlo-Regular:h13
    " set guifont=Ubuntu\ Mono\ 16
endif

" Last but not least make it pretty!
colorscheme atomified

