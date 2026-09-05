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

-- Copy a file:line[:line] reference (plus an optional note) for pasting into AI chats
local function copy_ref(opts)
  -- "%" is the current buffer's file name; ":." makes it relative to the cwd
  local path = vim.fn.expand("%:.")
  local ref = path

  if opts.visual then
    -- '< and '> are only set after leaving visual mode, so read the live selection:
    local start_line = vim.fn.line("v")
    local end_line = vim.fn.line(".")
    if start_line > end_line then
      start_line, end_line = end_line, start_line
    end
    ref = path .. ":" .. start_line .. ":" .. end_line
  end

  local note = vim.fn.input("Prompt (optional): ")
  if note ~= "" then
    ref = ref .. " " .. note
  end

  vim.fn.setreg("+", ref)
  vim.notify("Copied: " .. ref)
end

vim.keymap.set("n", "<leader>ar", function()
  copy_ref({})
end, { desc = "Copy File Reference" })

vim.keymap.set("v", "<leader>ar", function()
  copy_ref({ visual = true })
end, { desc = "Copy File Reference (with line range)" })

-- Execute macro over a visual region.
vim.keymap.set("x", "@", function()
  return ":norm @" .. vim.fn.getcharstr() .. "<cr>"
end, { expr = true })

--Octo
vim.keymap.set("n", "<leader>go", "<cmd>Octo<CR>", { desc = "Octo" })

-- Diff current buffer against main
vim.keymap.set("n", "<leader>gm", ":Gitsigns diffthis main<cr>", { silent = true, desc = "Diff against main" })

-- additional search

vim.keymap.set(
  "n",
  "<leader>sN",
  "<cmd>FzfLua live_grep cwd=~/notes/personal/SunilSB/ <CR>",
  { desc = "Grep Personal Notes" }
)
