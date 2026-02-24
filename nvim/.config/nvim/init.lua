-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.env.VSCODE then
  vim.g.vscode = true
end

-- vim.loader = false
if vim.loader then
  vim.loader.enable()
end

_G.dd = function(...)
  require("utils.debug").dump(...)
end
_G.bt = function(...)
  require("utils.debug").bt(...)
end
vim.print = _G.dd

require("utils.globals")
require("config.lazy")
require("config.workflow")

_G.lv = require("lazyvim.util")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("utils").version()
  end,
})
