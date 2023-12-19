-- Keymaps are automatically loaded on the VeryLazy event Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Better viewing and keymap
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "g,", "g,zvzz")
vim.keymap.set("n", "g;", "g;zvzz")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "Y", "y$")

-- Select all
vim.keymap.set("n", "==", "gg<S-v>G")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- move out
vim.keymap.set("i", "<C-e>", "<C-o>A")
-- Quickfixlist
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- chmod
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })
-- Better escape using jk in insert and terminal mode
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("t", "jk", "<C-\\><C-n>")

-- Insert blank line
vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "Insert line bklow" })
vim.keymap.set("n", "<leader>O", "O<Esc>", { desc = "Insert line above" })

-- Paste over currently selected text without yanking it
vim.keymap.set("v", "p", '"_dP', { desc = "Paste over selected text" })

vim.keymap.set("n", "<Leader>sO", ":source %<CR>", { desc = "Source File" })
vim.keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "Telescope buffers" })

-- clipboard
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to clipboard" })

--copy file name and path
vim.keymap.set("n", "<leader>cn", '<cmd>let @+ = expand("%")<CR>', { desc = "Copy File Name" })
vim.keymap.set("n", "<leader>cp", '<cmd>let @+ = expand("%:p")<CR>', { desc = "Copy File Path" })

-- Dismiss Noice Message
vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })

-- window management
vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "other-window" })
vim.keymap.set("n", "<leader>wh", "<C-W>h", { desc = "left-window" })
vim.keymap.set("n", "<leader>wl", "<C-W>l", { desc = "right-window" })
vim.keymap.set("n", "<leader>wd", "<C-W>d", { desc = "delete-window" })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "split-window-below" })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "split-window-right" })
vim.keymap.set("n", "<leader>wH", "<C-W>5<", { desc = "expand-window-left" })
vim.keymap.set("n", "<leader>wJ", ":resize +5", { desc = "expand-window-below" })
vim.keymap.set("n", "<leader>wL", "<C-W>5>", { desc = "expand-window-right" })
vim.keymap.set("n", "<leader>wK", ":resize -5", { desc = "expand-window-up" })
vim.keymap.set("n", "=", "<C-W>=", { desc = "balance-window" })
