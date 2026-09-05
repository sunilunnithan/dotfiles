return {
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      {
        "<leader>jj",
        function()
          require("treesj").join()
        end,
        desc = "Join",
      },
      {
        "<leader>js",
        function()
          require("treesj").split()
        end,
        desc = "Split",
      },
      {
        "<leader>jt",
        function()
          require("treesj").toggle()
        end,
        desc = "Toggle Join/Split",
      },
    },
    opts = {
      use_default_keymaps = false,
      max_join_length = 120,
      -- python, lua, json, javascript, yaml, html, go, bash all ship as
      -- built-in presets in lua/treesj/langs — no custom langs needed
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>j", group = "join/split" },
      },
    },
  },
}
