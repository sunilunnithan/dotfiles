-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.env.VSCODE then
  vim.g.vscode = true
end

-- vim.loader = false
if vim.loader then
  vim.loader.enable()
end

require("utils.globals")
require("config.lazy")
require("config.workflow")

_G.lv = require("lazyvim.util")
