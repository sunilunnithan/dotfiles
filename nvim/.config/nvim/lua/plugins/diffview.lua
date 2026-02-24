return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gD", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
      { "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
      { "<leader>gF", "<cmd>DiffviewFileHistory<cr>", desc = "Branch History" },
      { "<leader>gx", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
    },
    opts = {},
  },
}
