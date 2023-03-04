-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.clipboard = "unnamedplus" -- allows access to system clipboard
vim.opt.shiftwidth = 4 -- number of spaces inserted for indentation
vim.opt.tabstop = 4 -- number of spaces that a <tab> represents
vim.opt.softtabstop = 4
vim.opt.expandtab = false -- don't replace tabs with spaces
vim.opt.wrap = false -- don't wrap long content on next line
vim.opt.relativenumber = true -- show relative line number to the cursor
vim.opt.swapfile = false -- temporary copy of your opened buffer
vim.opt.shiftwidth = 4 -- number of spaces inserted for indentation
vim.opt.scrolloff = 8 -- minimum number of lines to keep above and below cursor
vim.opt.cursorline = true -- highlight line where the cursor is located
-- vim.opt.colorcolumn = "80" -- column highlighted with hl-ColorColumn
vim.opt.showmode = false -- remove messages like insert, replace, etc...
vim.opt.smartindent = true -- indent automatically for c-like languages
vim.opt.splitbelow = true -- add split below current one
vim.opt.splitright = true -- add split to the right of current one
-- vim.opt.lazyredraw = true         -- don't redraw screen while executing macros, etc...
vim.opt.list = true -- show hidden whitespace characters
vim.opt.listchars = { -- list of hidden characters
  tab = "» ",
  trail = "•",
  precedes = "←",
  extends = "→",
  eol = "↲",
  space = " ",
}
vim.opt.laststatus = 3 -- always and ONLY the last window
vim.opt.winbar = "%=%m %f" -- determine contents of top window bar
vim.opt.cmdheight = 0 -- hide command-line bar when not used

vim.opt.guicursor = ""
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.wildmode = "longest:full,full"
vim.opt.scrollback = 100000
vim.opt.scrolloff = 8
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }

-- disable plugins

vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1

vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1

vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
