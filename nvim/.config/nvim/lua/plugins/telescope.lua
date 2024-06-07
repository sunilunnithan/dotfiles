local Util = require("lazyvim.util")

return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ANGkeith/telescope-terraform-doc.nvim",
    },
    keys = {
      { "<leader>ctt", ":Telescope terraform_doc<cr>", desc = "terraform doc" },
      { "<leader>ctm", ":Telescope terraform_doc modules<cr>", desc = "terraform modules" },
      { "<leader>*", "<cmd>Telescope grep_string<cr>", { silent = true, desc = "Grep Word Under Cursor" } },
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>N",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep({
            cwd = vim.fn.expand("~/notes/"),
            hidden = true,
          })
        end,
        desc = "Grep notes directory",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("terraform_doc")
    end,
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-h>"] = require("telescope.actions.layout").toggle_preview,
          },
        },
        file_ignore_patterns = { ".git/", "node_modules" },
        layout_config = {
          prompt_position = "top",
        },
        path_display = { "smart" },
        prompt_position = "top",
        prompt_prefix = " ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--hidden",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim", -- add this value
        },
      },
      pickers = {
        buffers = {
          prompt_prefix = "󰸩 ",
        },
        commands = {
          prompt_prefix = " ",
        },
        command_history = {
          prompt_prefix = " ",
        },
        git_files = {
          prompt_prefix = "󰊢 ",
          show_untracked = true,
        },
        find_files = {
          prompt_prefix = " ",
          find_command = { "fd", "-H" },
        },
        live_grep = {
          prompt_prefix = "󰱽 ",
        },
        grep_string = {
          prompt_prefix = "󰱽 ",
        },
      },
    },
  },
}
