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

-- chmod
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })
-- Better escape using jk in insert and terminal mode
vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("t", "jk", "<C-\\><C-n>")

-- Insert blank line
-- vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "Insert line below" })
-- vim.keymap.set("n", "<leader>O", "O<Esc>", { desc = "Insert line above" })

-- Paste over currently selected text without yanking it
vim.keymap.set("v", "p", '"_dP', { desc = "Paste over selected text" })

vim.keymap.set("n", "<Leader>sO", ":source %<CR>", { desc = "Source File" })
vim.keymap.set("n", "<Leader>sx", ":.lua<CR>", { desc = "Execute current line" })
vim.keymap.set("v", "<Leader>sx", ":lua<CR>", { desc = "Execute selected line" })

-- clipboard
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to clipboard" })

--copy file name and path
vim.keymap.set("n", "<leader>cn", '<cmd>let @+ = expand("%")<CR>', { desc = "Copy File Name" })
vim.keymap.set("n", "<leader>cp", '<cmd>let @+ = expand("%:p")<CR>', { desc = "Copy File Path" })

-- Execute macro over a visual region.
vim.keymap.set("x", "@", function()
  return ":norm @" .. vim.fn.getcharstr() .. "<cr>"
end, { expr = true })

--Octo
vim.keymap.set("n", "<leader>go", "<cmd>Octo<CR>", { desc = "Octo" })
-- tmux runner
vim.keymap.set("n", "<leader>vf", "<cmd>VtrFocusRunner<CR>", { desc = "Focus Vtr Tmux Pane" })
vim.keymap.set("n", "<leader>vo", "<cmd>VtrOpenRunner<CR>", { desc = "Open Vtr Tmux Pane" })
vim.keymap.set("n", "<leader>va", "<cmd>VtrAttachToPane<CR>", { desc = "Attach to Tmux Pane" })
vim.keymap.set("n", "<leader>vl", "<cmd>VtrSendLinesToRunner<CR>", { desc = "Send Lines to Tmux Pane" })
vim.keymap.set("v", "<leader>vl", "<cmd>'<,'>VtrSendLinesToRunner<CR>", { desc = "Send Lines to Tmux Pane" })
vim.keymap.set("n", "<leader>vv", "<cmd>VtrSendCommandToRunner<CR>", { desc = "Send Command to Tmux Pane" })
vim.keymap.set("n", ";v", "<cmd>VtrSendCommandToRunner<CR>", { desc = "Send Command to Tmux Pane" })
vim.keymap.set(
  "n",
  "<leader>v-",
  "<cmd>VtrOpenRunner { 'orientation' : 'v', 'percentage' : 30}<CR>",
  { desc = "Open Vtr Pane Bottom" }
)
vim.keymap.set(
  "n",
  "<leader>v|",
  "<cmd>VtrOpenRunner { 'orientation' : 'h', 'percentage' : 30}<CR>",
  { desc = "Open Vtr Pane Right" }
)
vim.keymap.set("n", "<leader>vk", "<cmd>VtrKillRunner<CR>", { desc = "Kill Vtr Runner Pane" })

-- additional search

vim.keymap.set(
  "n",
  "<leader>sN",
  "<cmd>FzfLua live_grep cwd=~/notes/personal/SunilSB/ <CR>",
  { desc = "Grep Personal Notes" }
)
