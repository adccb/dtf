" formatting stuff
set number
set nowrap
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set autochdir
set clipboard=unnamed
set backspace=2
set splitbelow
set splitright

" colors
syntax on
set cursorline
highlight clear LineNr
set foldmethod=syntax
colorscheme 1989
hi Folded guibg=none ctermbg=none guifg=darkgrey ctermfg=darkgrey gui=italic cterm=italic
hi CursorLine gui=underline cterm=underline
hi MatchParen guibg=none ctermbg=none gui=bold cterm=bold
hi ColorColumn guibg=none ctermbg=none guifg=240 ctermfg=240
hi htmlArg gui=italic cterm=italic
hi Comment gui=italic cterm=italic
hi Type gui=italic cterm=italic
hi TabLineFill guibg=darkgrey ctermfg=darkgrey guifg=lightgrey ctermbg=lightgrey

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'raimondi/delimitmate'
Plug 'moll/vim-node'
Plug 'flowtype/vim-flow'
Plug 'ElmCast/elm-vim'
call plug#end()

" remappings
let mapleader = "\<Space>"
noremap e w
noremap q b

noremap d l
noremap w gk
noremap s gj
noremap a h

noremap j h
noremap k j
noremap l k
noremap ; l

noremap = <C-W>=<CR>

nnoremap <Up> <C-W><C-K>
nnoremap <Left> <C-W><C-H>
nnoremap <Down> <C-W><C-J>
nnoremap <Right> <C-W><C-L>

noremap \ :noh<CR>

tnoremap <Esc> <C-\><C-n>

" plugins!
autocmd vimenter * NERDTree
autocmd FileType nerdtree nnoremap <buffer> s j
let g:NERDTreeMapOpenSplit = 'q'
let g:NERDTreeMapOpenVSplit = 'e'
let g:NERDTreeIgnore = ['pycache']
let g:NERDTreeMinimalUI = 1

" uncomment this line to quit when the only remaining 
" window is the nerdtree pane.
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" clear collisions from wasd-ing
noremap r d
noremap rr dd

" save and quit commands
noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>
noremap <Leader>e :NERDTreeToggle<CR>

" flow
let g:javascript_plugin_flow = 1

" markdown
au BufRead,BufNewFile *.md,*.markdown,*.txt set wrap linebreak nolist

" vim-prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql Prettier

