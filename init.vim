lua << EOF
vim.g.mapleader = " "

-- Install Plugins
local Plug = vim.fn["plug#"]
vim.call('plug#begin', '~/.local/share/nvim/plugged')
  Plug('junegunn/goyo.vim')
  Plug('nvim-tree/nvim-tree.lua')
  Plug('pseewald/vim-anyfold')
  Plug('tpope/vim-markdown')
  Plug('catppuccin/nvim', { ['as'] = 'catppuccin' })
vim.call('plug#end')

-- Appearance
vim.g.markdown_fenced_languages = { 'html', 'python', 'ruby', 'vim' }

vim.api.nvim_set_option_value("syntax", "on", {})
vim.api.nvim_set_option_value("autoindent", true, {})
vim.api.nvim_set_option_value("scrolloff", 999, {})
vim.api.nvim_set_option_value("foldmethod", "indent", {})
vim.api.nvim_command("colorscheme catppuccin-mocha")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.md", "*.txt" },
  callback = function()
    vim.api.nvim_set_option_value("wrap", true, {})
    vim.api.nvim_set_option_value("linebreak", true, {})
    vim.api.nvim_set_option_value("nolist", true, {})
    vim.api.nvim_set_option_value("ft", "markdown", {})
  end
})

vim.api.nvim_create_autocmd("BufRead", {
  callback = function()
    vim.api.nvim_command("AnyFoldActivate")
  end
})

-- https://arisweedler.medium.com/tab-settings-in-vim-1ea0863c5990
vim.api.nvim_set_option_value("ts", 2, {})
vim.api.nvim_set_option_value("sts", 2, {})
vim.api.nvim_set_option_value("sw", 2, {})
vim.api.nvim_set_option_value("et", true, {})

-- Navigation & keybinds --
local nv = { "n", "v" }

vim.keymap.set(nv, "q", "b")
vim.keymap.set(nv, "w", "gk")
vim.keymap.set(nv, "e", "w")
vim.keymap.set(nv, "a", "h")
vim.keymap.set(nv, "s", "gj")
vim.keymap.set(nv, "d", "l")

vim.keymap.set(nv, "=", "<C-W>=<CR>")
vim.keymap.set(nv, "<Up>", "<C-W><C-K>")
vim.keymap.set(nv, "<Left>", "<C-W><C-H>")
vim.keymap.set(nv, "<Down>", "<C-W><C-J>")
vim.keymap.set(nv, "<Right>", "<C-W><C-L>")
vim.keymap.set(nv, "<Leader>g", ":Goyo<CR>")

-- Editor functionality --
vim.api.nvim_set_option_value("backspace", "indent,eol,start", {})
vim.api.nvim_set_option_value("clipboard", "unnamed", {})
vim.api.nvim_set_option_value("splitbelow", true, {})
vim.api.nvim_set_option_value("splitright", true, {})

vim.keymap.set(nv, "\\", ":noh<CR>") 
vim.keymap.set(nv, "<Leader>w", ":w<CR>")
vim.keymap.set(nv, "<Leader>q", ":q<CR>")
vim.keymap.set(nv, "r", "d")
vim.keymap.set(nv, "rr", "dd")

vim.keymap.set(nv, "<Leader>cl", ":colorscheme catppuccin-latte<CR>")
vim.keymap.set(nv, "<Leader>cd", ":colorscheme catppuccin-mocha<CR>")

vim.keymap.set(nv, "<Leader>e", ":NvimTreeToggle<CR>")

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
