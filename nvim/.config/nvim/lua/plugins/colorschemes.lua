return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      local tokyonight = require("tokyonight")

      tokyonight.setup({
        style = "night",
        terminal_colors = true,
      })
      tokyonight.load()
    end,
  },
  { "rebelot/kanagawa.nvim", event = "VeryLazy" },
  { "AlexvZyl/nordic.nvim", event = "VeryLazy" },
  { "navarasu/onedark.nvim", event = "VeryLazy" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    event = "VeryLazy",
  },
  { "EdenEast/nightfox.nvim", event = "VeryLazy" },
  { "shaunsingh/oxocarbon.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
}
