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
      { "prochri/telescope-all-recent.nvim", opts = {} },
      "AckslD/nvim-neoclip.lua",
      "natecraddock/telescope-zf-native.nvim",
      "ThePrimeagen/harpoon",
      "joshmedeski/telescope-smart-goto.nvim",
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
      },
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
      { "<leader>*", "<cmd>Telescope grep_string<cr>", { silent = true, desc = "Grep Word Under Cursor" } },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("undo")
      telescope.load_extension("file_browser")
      telescope.load_extension("terraform_doc")
      telescope.load_extension("live_grep_args")
      telescope.load_extension("harpoon")
      telescope.load_extension("neoclip")
      telescope.load_extension("zf-native")
      telescope.load_extension("live_grep_args")
      telescope.load_extension("notify")
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
      extensions = {
        ["zf-native"] = {
          file = { -- options for sorting file-like items
            enable = true, -- override default telescope file sorter
            highlight_results = true, -- highlight matching text in results
            match_filename = true, -- enable zf filename match priority
          },
          generic = { -- options for sorting all other items
            enable = true, -- override default telescope generic item sorter
            highlight_results = true, -- highlight matching text in results
            match_filename = false, -- disable zf filename match priority
          },
        },
      },
    },
  },
}
