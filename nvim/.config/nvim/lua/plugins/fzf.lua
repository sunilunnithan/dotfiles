return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({ "fzf-native" })
  end,
  keys = {
    { "<leader>zg", "<cmd>FzfLua live_grep<cr>", desc = "Fzf Live Grep" },
    { "<leader>zb", "<cmd>FzfLua grep_curbuf<cr>", desc = "Fzf Grep Buffer" },
    { "<leader>zG", "<cmd>FzfLua live_grep_native<cr>", desc = "Fzf Live Grep Native" },
    { "<leader>zi", "<cmd>FzfLua builtin<cr>", desc = "Fzf Builtin" },
    { "<leader>zr", "<cmd>FzfLua resume<cr>", desc = "Fzf Resume" },
    { "<leader>ze", "<cmd>FzfLua buffers<cr>", desc = "Fzf Buffers" },
    { "<leader>zC", "<cmd>FzfLua commands<cr>", desc = "Fzf Commands" },
    { "<leader>zc", "<cmd>FzfLua git_commits<cr>", desc = "Fzf Git Commits" },
    { "<leader>zs", "<cmd>FzfLua git_status<cr>", desc = "Fzf Git Status" },
    { "<leader>zf", "<cmd>FzfLua files<cr>", desc = "Fzf Files" },
    { "<leader>zs", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Fzf Document Symbols" },
  },
}
