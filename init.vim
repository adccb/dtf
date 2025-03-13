let mapleader = "\<Space>"

call plug#begin('~/.local/share/nvim/plugged')
  " -- Appearance --
  Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
  Plug 'https://github.com/junegunn/goyo.vim'
  Plug 'https://github.com/junegunn/limelight.vim'

  " -- Functionality --
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'pseewald/vim-anyfold'
  Plug 'tpope/vim-markdown'
call plug#end()

hi CursorLine cterm=underline
hi Folded     cterm=italic
hi Comment    cterm=italic
hi Type       cterm=italic

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
au Filetype * AnyFoldActivate
au BufRead,BufNewFile *.md,*.markdown,*.txt,*.mdx set wrap linebreak nolist ft=markdown 

lua << EOF
-- Appearance
vim.g.limelight_conceal_ctermfg = 'darkgray'                  -- Limelight
vim.g.markdown_fenced_languages = { 'html', 'python',         -- Markdown language highlighting
                                    'ruby', 'vim' }

vim.api.nvim_set_option_value("syntax", "on", {})             -- syntax highlighting
vim.api.nvim_set_option_value("autoindent", true, {})         -- auto-indent
vim.api.nvim_set_option_value("scrolloff", 999, {})           -- keep cursor in center of page
vim.api.nvim_set_option_value("foldmethod", "indent", {})     -- syntax highlighting
vim.api.nvim_set_option_value("ts", 2, {})                    -- https://arisweedler.medium.com/tab-settings-in-vim-1ea0863c5990
vim.api.nvim_set_option_value("sts", 2, {})
vim.api.nvim_set_option_value("sw", 2, {})
vim.api.nvim_set_option_value("et", true, {})

-- Navigation & keybinds --
vim.keymap.set("n", "q", "b")
vim.keymap.set("n", "w", "gk")
vim.keymap.set("n", "e", "w")

vim.keymap.set("n", "a", "h")
vim.keymap.set("n", "s", "gj")
vim.keymap.set("n", "d", "l")

vim.keymap.set("n", "=", "<C-W>=<CR>")
vim.keymap.set("n", "<Up>", "<C-W><C-K>")
vim.keymap.set("n", "<Left>", "<C-W><C-H>")
vim.keymap.set("n", "<Down>", "<C-W><C-J>")
vim.keymap.set("n", "<Right>", "<C-W><C-L>")

vim.keymap.set("n", "<Leader>g", ":Goyo<CR>")

-- Editor functionality --
vim.api.nvim_set_option_value("backspace", "indent,eol,start", {}) -- backspace over newlines
vim.api.nvim_set_option_value("clipboard", "unnamed", {})          -- share system clipboard
vim.api.nvim_set_option_value("splitbelow", true, {})
vim.api.nvim_set_option_value("splitright", true, {})

vim.keymap.set("n", "\\", ":noh<CR>") 
vim.keymap.set("n", "<Leader>w", ":w<CR>")
vim.keymap.set("n", "<Leader>q", ":q<CR>")
vim.keymap.set("n", "r", "d")
vim.keymap.set("n", "rr", "dd")

vim.keymap.set("n", "<Leader>cl", ":colorscheme catppuccin-latte<CR>")
vim.keymap.set("n", "<Leader>cd", ":colorscheme catppuccin-mocha<CR>")

vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>")

require("nvim-tree").setup({
  on_attach = function ()
    local api = require "nvim-tree.api"

    vim.keymap.set("n", "<CR>", api.node.open.edit)
    vim.keymap.set("n", "c", api.fs.create)
    vim.keymap.set("n", "m", api.fs.rename_basename)
    vim.keymap.set("n", "<Leader>b", api.node.open.horizontal)
    vim.keymap.set("n", "<Leader>r", api.node.open.vertical)
    vim.keymap.set("n", "t", api.node.open.tab)
  end,
})
EOF


colorscheme catppuccin-mocha
