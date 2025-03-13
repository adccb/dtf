call plug#begin('~/.local/share/nvim/plugged')
  let mapleader = "\<Space>"

  " --- basic vim config ---
    " --- movement & saving ---
      noremap q b
      noremap w gk
      noremap e w
      noremap a h
      noremap s gj
      noremap d l
      noremap r d
      noremap rr dd
      noremap <Leader>w :w<CR>
      noremap <Leader>q :q<CR>

    " --- splits ---
      set splitbelow
      set splitright
      nnoremap = <C-W>=<CR>
      nnoremap <Up> <C-W><C-K>
      nnoremap <Left> <C-W><C-H>
      nnoremap <Down> <C-W><C-J>
      nnoremap <Right> <C-W><C-L>
    
    " --- colors & displays ---
      syntax on
      noremap \ :noh<CR>

      hi CursorLine cterm=underline
      hi Folded     cterm=italic
      hi htmlArg    cterm=italic
      hi Comment    cterm=italic
      hi Type       cterm=italic
      hi SignColumn ctermbg=none

      Plug 'catppuccin/nvim', { 'as': 'catppuccin' } " {{
        nnoremap <Leader>cl :colorscheme catppuccin-latte<CR>
        nnoremap <Leader>cd :colorscheme catppuccin-mocha<CR>
      " }}

  " --- editor tools integrations ---
    Plug 'eslint/eslint'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' } " {{
      let g:prettier#autoformat = 0
      au BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue Prettier
    " }}

  " --- vim quality of life
    set nowrap
    set autoindent
    set ts=2 sts=2 sw=2 et " https://arisweedler.medium.com/tab-settings-in-vim-1ea0863c5990
    set scrolloff=999 " keep the cursor in the center of the page
    set backspace=indent,eol,start
    set clipboard=unnamed
    set fillchars=eob:\  " removes the ~ from empty lines

    Plug 'nvim-tree/nvim-tree.lua' " {{
      noremap <Leader>e :NvimTreeToggle<CR>
    " }}
    Plug 'https://github.com/junegunn/goyo.vim'
    Plug 'https://github.com/junegunn/limelight.vim' " {{
      let g:limelight_conceal_ctermfg = 'darkgray'
      autocmd! User GoyoEnter Limelight
      autocmd! User GoyoLeave Limelight!
      nnoremap <Leader>g :Goyo<CR>
    " }}
    Plug 'pseewald/vim-anyfold' " {{
      au Filetype * AnyFoldActivate
      set foldmethod=indent
    " }}
    Plug 'tpope/vim-markdown' " {{
      let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'vim']
      au BufRead,BufNewFile *.md,*.markdown,*.txt,*.mdx set wrap linebreak nolist ft=markdown 
    " }} 
call plug#end()

lua << EOF
require("nvim-tree").setup({
  on_attach = function ()
    local api = require "nvim-tree.api"

    -- recreate defaults
    vim.keymap.set("n", "<CR>", api.node.open.edit)

    -- custom mappings
    vim.keymap.set("n", "c", api.fs.create)
    vim.keymap.set("n", "m", api.fs.rename_basename)
    vim.keymap.set("n", "<Leader>b", api.node.open.horizontal)
    vim.keymap.set("n", "<Leader>r", api.node.open.vertical)
    vim.keymap.set("n", "t", api.node.open.tab)
    vim.keymap.set("n", "I", api.tree.toggle_hidden_filter)
  end,
  filters = {
    dotfiles = true,
  },
})
EOF


colorscheme catppuccin-mocha
