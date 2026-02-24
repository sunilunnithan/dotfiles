-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_colorscheme = "catppuccin"

-- backup
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undo"
vim.opt.undofile = true

-- open splits in a more natural direction
-- https://vimtricks.com/p/open-splits-more-naturally/
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.conceallevel = 0 -- don't hide my json strings
