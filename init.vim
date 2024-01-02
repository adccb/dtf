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
set background=dark

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
au BufRead,BufNewFile *.md,*.markdown,*.txt,*.mdx set wrap linebreak nolist ft=markdown 

" ---- plugins ----
call plug#begin('~/.local/share/nvim/plugged')
  Plug 'raimondi/delimitmate'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'neovim/nvim-lspconfig'
  Plug 'purescript-contrib/purescript-vim'
  Plug 'ElmCast/elm-vim'
  Plug 'tpope/vim-vinegar'

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
  Plug 'sonph/onehalf', { 'rtp': 'vim' }
  Plug 'tpope/vim-markdown'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'https://github.com/sonjapeterson/1989.vim'
  Plug 'https://github.com/junegunn/goyo.vim'
  Plug 'https://github.com/junegunn/limelight.vim' " {{
    let g:limelight_conceal_ctermfg = 'darkgray'
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
    nnoremap <Leader>g :Goyo<CR>
  " }}
  
  Plug 'rakr/vim-two-firewatch' " {{
  " }}
call plug#end()

lua << EOF
require'lspconfig'.tsserver.setup({})

vim.g.lualine=true
if vim.g.lualine then
  require('lualine').setup({
  options = {
      icons_enabled = true,
      theme = 'dracula',
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
end

require("nvim-tree").setup({
  on_attach = function ()
    local api = require "nvim-tree.api"

    -- recreate defaults
    vim.keymap.set("n", "<CR>", api.node.open.edit)

    -- custom mappings
    vim.keymap.set("n", "c", api.tree.change_root_to_node)
    vim.keymap.set("n", "n", api.fs.create)
    vim.keymap.set("n", "m", api.fs.rename_basename)
    vim.keymap.set("n", "q", api.node.open.horizontal)
    vim.keymap.set("n", "e", api.node.open.vertical)
    vim.keymap.set("n", "t", api.node.open.tab)
    vim.keymap.set("n", "i", api.tree.toggle_hidden_filter)
  end,
  filters = {
    dotfiles = true,
  },
})

-- vim.cmd("colorscheme two-firewatch")
EOF
