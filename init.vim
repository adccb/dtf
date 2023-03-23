" ---- general settings ----
syntax on                       " syntax on
set nowrap                      " no wrap
set ts=2 sts=2 sw=2 et          " https://arisweedler.medium.com/tab-settings-in-vim-1ea0863c5990
set autoindent                  " autoindent
set scrolloff=999               " keep the cursor in the center of the page
set backspace=indent,eol,start  " so backspace works across line endings
set clipboard=unnamed           " shared clipboard between system and vim
set splitbelow                  " new splits to the bottom
set splitright                  " new vsplits to the right
set scl=yes                     " make the signcolumn always appear

" ---- highlights and stuff ----
hi CursorLine cterm=underline
hi Folded  cterm=italic ctermfg=darkgrey
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type    cterm=italic
hi SignColumn ctermbg=none

" ---- movement ----
noremap q b
noremap w gk
noremap e w
noremap a h
noremap s gj
noremap d l

nnoremap <Up> <C-W><C-K>
nnoremap <Left> <C-W><C-H>
nnoremap <Down> <C-W><C-J>
nnoremap <Right> <C-W><C-L>

" ---- keycommands ----
let mapleader = "\<Space>"
noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>
noremap <Leader>e :NvimTreeToggle<CR>
noremap \ :noh<CR>
noremap = <C-W>=<CR>
noremap r d
noremap rr dd

" ---- autocommands ----
au BufRead,BufNewFile *.md,*.markdown,*.txt set wrap linebreak nolist

" ---- plugins ----
call plug#begin('~/.local/share/nvim/plugged')
  Plug 'raimondi/delimitmate'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'neovim/nvim-lspconfig'

  " js/ts specifics
  Plug 'eslint/eslint'
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'moll/vim-node'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' } " {{
    let g:prettier#autoformat = 0
    au BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue Prettier
  " }}
  
  " presentation
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'https://github.com/sonjapeterson/1989.vim'
  Plug 'https://github.com/junegunn/goyo.vim'
  Plug 'https://github.com/junegunn/limelight.vim' " {{
    let g:limelight_conceal_ctermfg = 'darkgray'
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
    nnoremap <Leader>g :Goyo<CR>
  " }}
call plug#end()

lua << EOF
require'lspconfig'.tsserver.setup({})

require('lualine').setup({
options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {},
    lualine_z = {'location'}
  },
})

require("nvim-tree").setup({
  view = {
    mappings = {
      list = {
        { key = "c", action = "cd" },
        { key = "u", action = "dir_up" },
        { key = "n", action = "create" },
        { key = "m", action = "rename" },
        { key = "q", action = "split" },
        { key = "e", action = "vsplit" },
        { key = "t", action = "tabnew" },
        { key = "i", action = "toggle_dotfiles" },
        { key = "s", action = "" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF
