-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*tmux.conf" },
  command = "execute 'silent !tmux source <afile> --silent'",
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { ".bash*" },
  command = "execute 'silent !source <afile> --silent'",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
  pattern = { "*.mdx", "*.md" },
  callback = function()
    vim.cmd([[set filetype=markdown wrap linebreak nolist nospell]])
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

-- change the gen model
vim.api.nvim_create_user_command("ChangeModel", function()
  vim.ui.input({ prompt = "Enter new model: " }, function(input)
    if input and input ~= "" then
      require("gen").model = input
      print("Model changed to: " .. input)
    else
      print("No model name provided. Model not changed.")
    end
  end)
end, {})
