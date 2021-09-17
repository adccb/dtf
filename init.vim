"{{ text formatting
set nowrap
set number
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set autochdir
set scrolloff=999

" makes backspace work across line endings etc
set backspace=2

" make system clipboard available to y and p
set clipboard=unnamed

" new splits below and to the right
set splitbelow
set splitright
"}}

"{{ this should maybe be its own color scheme soon?
hi Folded guibg=none ctermbg=none guifg=darkgrey ctermfg=darkgrey gui=italic cterm=italic
hi CursorLine gui=underline cterm=underline
hi MatchParen guibg=none ctermbg=none gui=bold cterm=bold
hi ColorColumn guibg=none ctermbg=none guifg=240 ctermfg=240
hi htmlArg gui=italic cterm=italic
hi Comment gui=italic cterm=italic
hi Type gui=italic cterm=italic
hi TabLineFill guibg=darkgrey ctermfg=darkgrey guifg=lightgrey ctermbg=lightgrey
highlight clear LineNr

highlight GitGutterAdd          ctermfg=2 ctermbg=none cterm=bold
highlight GitGutterAddLineNr    ctermfg=2 ctermbg=none cterm=bold
highlight GitGutterChange       ctermfg=3 ctermbg=none cterm=bold
highlight GitGutterChangeLineNr ctermfg=3 ctermbg=none cterm=bold
highlight GitGutterDelete       ctermfg=1 ctermbg=none cterm=bold
highlight GitGutterDeleteLineNr ctermfg=1 ctermbg=none cterm=bold
highlight SignColumn ctermbg=none
"}}

syntax on
set cursorline
set foldmethod=syntax

call plug#begin('~/.local/share/nvim/plugged')
"{{ javascript/typescript/coffeescript
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'moll/vim-node'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'kchmck/vim-coffee-script'
Plug 'mustache/vim-mustache-handlebars'
Plug 'eslint/eslint'
Plug 'martinda/Jenkinsfile-vim-syntax'
"}}

"{{ editor stuff
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'jeetsukumaran/vim-buffergator'
" Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'raimondi/delimitmate'
"}}

"{{ markdown and utilities
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"}}
call plug#end()

"{{ movement keys and other niceties
let mapleader = "\<Space>"
noremap e w
noremap q b

noremap d l
noremap w gk
noremap s gj
noremap a h

noremap j h
noremap k gj
noremap l gk
noremap ; l

noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>
noremap <Leader>e :NERDTreeToggle<CR>

noremap = <C-W>=<CR>

nnoremap <Up> <C-W><C-K>
nnoremap <Left> <C-W><C-H>
nnoremap <Down> <C-W><C-J>
nnoremap <Right> <C-W><C-L>

noremap \ :noh<CR>

noremap gn :set number!<CR>

" clear collisions from wasd-ing
noremap r d
noremap rr dd
"}}

"{{ statusline explorations
let g:gitgutter_preview_win_floating = 0
let g:gitgutter_preview_win_location = 'tabnew'
autocmd VimEnter * GitGutterEnable
autocmd VimEnter * GitGutterLineNrHighlightsEnable

function! StatusLine()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('| hi uwu | added %d | modified %d | deleted %d |', a, m, r)
endfunction

"set statusline+=%{StatusLine()}
set foldtext=gitgutter#fold#foldtext()
"}}

"{{ NERDTree config
"autocmd vimenter * NERDTree
autocmd FileType nerdtree nnoremap <buffer> s j
let g:NERDTreeMapOpenSplit = 'q'
let g:NERDTreeMapOpenVSplit = 'e'
let g:NERDTreeIgnore = ['pycache', 'node_modules', '.pyc$']
let g:NERDTreeMinimalUI = 1
"}}

"{{ vim-prettier config
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql Prettier
"}}

"{{ filetype stuff
au BufRead,BufNewFile *.md,*.markdown,*.txt set wrap linebreak nolist
"}}

