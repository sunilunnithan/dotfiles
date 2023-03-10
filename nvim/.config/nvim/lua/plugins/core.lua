return {
  "milisims/nvim-luaref",
  "tpope/vim-surround",
  "godlygeek/tabular", -- Quickly align text by pattern
  "tpope/vim-repeat", -- Repeat actions better
  "tpope/vim-abolish", -- Cool things with words!
  "tpope/vim-characterize", -- ?
  "tpope/vim-scriptease",
  "romainl/vim-qf",
  {
    "nvim-tree/nvim-web-devicons",
    config = { default = true },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = true,
  },
  { "nacro90/numb.nvim", event = "BufReadPre", config = true },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = true,
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    enabled = true,
    config = { default = true }, -- same as config = true
  },
  {
    "monaqa/dial.nvim",
    event = "BufReadPre",
    config = function()
      vim.api.nvim_set_keymap("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
      vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
      vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
      vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
      vim.api.nvim_set_keymap("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
      vim.api.nvim_set_keymap("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
    end,
  },
}
