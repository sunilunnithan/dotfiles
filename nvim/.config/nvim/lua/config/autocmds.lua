-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { ".bash*" },
  command = "execute 'silent !source <afile> --silent'",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
  pattern = { "*.mdx", "*.md" },
  callback = function()
    vim.cmd([[set filetype=markdown wrap linebreak nolist nospell conceallevel=2]])
  end,
})

vim.api.nvim_create_autocmd({ "BufRead" }, {
  pattern = { "*.conf" },
  callback = function()
    vim.cmd([[set filetype=sh]])
  end,
})

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Auto-close neo-tree when focus moves away from it into a real window,
-- e.g. <C-w>l back to the code without opening a new file. Skip floating
-- windows (neo-tree's own rename/create input prompts) and other neo-tree
-- windows so those interactions aren't interrupted.
vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    if vim.bo.filetype ~= "neo-tree" then
      return
    end
    vim.schedule(function()
      local win = vim.api.nvim_get_current_win()
      if vim.api.nvim_win_get_config(win).relative ~= "" then
        return
      end
      if vim.bo.filetype == "neo-tree" then
        return
      end
      require("neo-tree.command").execute({ action = "close" })
    end)
  end,
})
