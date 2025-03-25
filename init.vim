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
  Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })
  Plug('junegunn/fzf.vim')
  Plug('tpope/vim-dispatch')
  Plug('tpope/vim-rails')
  Plug('nvim-lualine/lualine.nvim')
  Plug('nvim-treesitter/nvim-treesitter')
vim.call('plug#end')

-- Appearance
vim.g.markdown_fenced_languages = { 'html', 'python', 'ruby', 'vim' }
vim.opt.fillchars = {eob = " "}

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
vim.keymap.set(nv, "W", "<C-W><C-K>")
vim.keymap.set(nv, "A", "<C-W><C-H>")
vim.keymap.set(nv, "S", "<C-W><C-J>")
vim.keymap.set(nv, "D", "<C-W><C-L>")

vim.keymap.set(nv, "<Leader>g", ":Goyo<CR>")

-- Editor functionality --
vim.api.nvim_set_option_value("backspace", "indent,eol,start", {})
vim.api.nvim_set_option_value("clipboard", "unnamed", {})
vim.api.nvim_set_option_value("splitbelow", true, {})
vim.api.nvim_set_option_value("splitright", true, {})

vim.keymap.set(nv, "\\", ":noh<CR>") 
vim.keymap.set(nv, "<Leader>w", ":w<CR>")
vim.keymap.set(nv, "<Leader>q", ":q<CR>")
vim.keymap.set(nv, "<Leader>f", ":Files<CR>")

-- vim-rails --
vim.keymap.set(nv, "<Leader>gm", ":Emodel<CR>")
vim.keymap.set(nv, "<Leader>gc", ":Econtroller<CR>")

vim.keymap.set(nv, "r", "d")
vim.keymap.set(nv, "rr", "dd")

vim.keymap.set(nv, "<Leader>cl", ":colorscheme catppuccin-latte<CR>")
vim.keymap.set(nv, "<Leader>cd", ":colorscheme catppuccin-mocha<CR>")

vim.keymap.set(nv, "<Leader>t", ":NvimTreeToggle<CR>")

require("nvim-tree").setup({
  renderer = {
    icons = {
      show = {
        file = false,
        folder = true,
        git = false,
        folder_arrow = false,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        }
      }
    }
  },
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

require('lualine').setup {
  options = {
    theme = 'catppuccin-mocha',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = { statusline = {"NvimTree"} },
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {
        'branch',
        icons_enabled = false
      },
    },
    lualine_c = {'filename' },
    lualine_x = {'filetype'},
    lualine_y = {'diff'},
    lualine_z = {'location'}
  },
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "vim", "ruby" },
  auto_install = false,
  highlight = {
    enable = true,
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
  },
}
EOF
