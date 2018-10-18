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
"colorscheme 1989
hi Folded ctermbg=none ctermfg=darkgrey cterm=italic
hi CursorLine cterm=underline
hi MatchParen ctermbg=none cterm=bold
hi ColorColumn ctermbg=none ctermfg=240
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type cterm=italic

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'raimondi/delimitmate'
Plug 'moll/vim-node'
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

" plugins!
autocmd vimenter * NERDTree
autocmd FileType nerdtree nnoremap <buffer> s j
let g:NERDTreeMapOpenSplit = 'q'
let g:NERDTreeMapOpenVSplit = 'e'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" clear collisions from wasd-ing
noremap r d
noremap rr dd

" save and quit commands
noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>

" markdown
au BufRead,BufNewFile *.md,*.markdown,*.txt set wrap linebreak nolist

" vim-prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql Prettier

