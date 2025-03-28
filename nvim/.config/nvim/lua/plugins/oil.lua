return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      columns = { "icon" },
      keymaps = {
        ["<C-h>"] = false,
        ["<M-h>"] = "actions.select_split",
      },
      view_options = {
        show_hidden = true,
      },
    })

    -- Open parent directory in current window
    vim.keymap.set("n", "<space>u-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

    -- Open parent directory in floating window
    vim.keymap.set("n", "<space>u=", require("oil").toggle_float, { desc = "Open in floating window" })
  end,
}
