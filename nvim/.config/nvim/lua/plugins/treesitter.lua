return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
      local swap_next, swap_prev = (function()
        local swap_objects = {
          p = "@parameter.inner",
          f = "@function.outer",
          c = "@class.outer",
        }

        local n, p = {}, {}
        for key, obj in pairs(swap_objects) do
          n[string.format("<leader>cx%s", key)] = obj
          p[string.format("<leader>cX%s", key)] = obj
        end

        return n, p
      end)()

      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "astro",
          "bash",
          "c",
          "cmake",
          "cpp",
          "css",
          "diff",
          "gitignore",
          "go",
          "graphql",
          "help",
          "html",
          "http",
          "java",
          "javascript",
          "jsdoc",
          "jsonc",
          "lua",
          "markdown",
          "markdown_inline",
          "ninja",
          "norg",
          "org",
          "python",
          "regex",
          "rust",
          "sql",
          "toml",
          "tsx",
          "typescript",
          "terraform",
          "vim",
          "yaml",
          "json",
        },
        highlight = { enable = true },
        indent = { enable = true, disable = { "python" } },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
          swap = {
            enable = true,
            swap_next = swap_next,
            swap_previous = swap_prev,
          },
          matchup = {
            enable = true,
          },
          query_linter = {
            enable = true,
            use_virtual_text = true,
            lint_events = { "BufWrite", "CursorHold" },
          },
          playground = {
            enable = true,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = true, -- Whether the query persists across vim sessions
            keybindings = {
              toggle_query_editor = "o",
              toggle_hl_groups = "i",
              toggle_injected_languages = "t",
              toggle_anonymous_nodes = "a",
              toggle_language_display = "I",
              focus_language = "f",
              unfocus_language = "F",
              update = "R",
              goto_node = "<cr>",
              show_help = "?",
            },
          },
        },
      })
    end,
  },
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

  {
    "mfussenegger/nvim-treehopper",
    keys = { { "m", mode = { "o", "x" } } },
    config = function()
      vim.cmd([[
        omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
        xnoremap <silent> m :lua require('tsht').nodes()<CR>
      ]])
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    config = true,
  },
}
