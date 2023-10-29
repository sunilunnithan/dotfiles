local Util = require("lazyvim.util")

return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "ANGkeith/telescope-terraform-doc.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    keys = {
      { "<leader>fR", Util.telescope("resume"), desc = "Resume" },
      {
        "<leader>sB",
        ":Telescope file_browser file_browser path=%:p:h=%:p:h<cr>",
        desc = "Browse Files",
      },
      { "<leader>ctt", ":Telescope terraform_doc<cr>", desc = "terraform doc" },
      { "<leader>ctm", ":Telescope terraform_doc modules<cr>", desc = "terraform modules" },
    },
    config = function(_, opts)
      require("telescope").load_extension("undo")
      require("telescope").load_extension("file_browser")
      require("telescope").load_extension("terraform_doc")
      require("telescope").load_extension("live_grep_args")
    end,
  },
}
