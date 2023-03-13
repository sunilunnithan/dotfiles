return {
  -- neodev
  {
    "folke/neodev.nvim",
    opts = {
      debug = true,
      experimental = {
        pathStrict = true,
      },
      library = {
        runtime = "~/projects/neovim/runtime/",
      },
    },
  },

  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      {
        "folke/neodev.nvim",
        opts = {
          library = { plugins = { "neotest", "nvim-dap-ui" }, types = true },
        },
      },
      { "j-hui/fidget.nvim", config = true },
      { "smjonas/inc-rename.nvim", config = true },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "jay-babu/mason-null-ls.nvim",
    },
    opts = {
      ---@type lspconfig.options
      servers = {
        -- ansiblels = {},
        azure_pipelines_ls = {},
        -- bashls = {},
        cssls = {},
        dockerls = {},
        tsserver = {},
        html = {},
        gopls = {},
        java_language_server = {},
        jsonls = {},
        pyright = {},
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              procMacro = { enable = true },
              cargo = { allFeatures = true },
            },
          },
        },
        lua_ls = {
          -- cmd = { "/home/folke/projects/lua-language-server/bin/lua-language-server" },
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {
                  "--log-level=trace",
                },
              },
              diagnostics = {
                globals = {
                  "vim",
                },
                -- enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },
        terraformls = {},
        vimls = {},
        yamlls = {},
        -- tailwindcss = {},
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
      },
    },
  },

  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      ---@diagnostic disable-next-line: no-unknown
      local nls = require("null-ls")
      nls.setup({
        debounce = 150,
        save_after_format = false,
        sources = {
          -- nls.builtins.formatting.prettierd,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.fish_indent,
          -- nls.builtins.formatting.fixjson.with({ filetypes = { "jsonc" } }),
          -- nls.builtins.formatting.eslint_d,
          -- nls.builtins.diagnostics.shellcheck,
          nls.builtins.formatting.shfmt,
          nls.builtins.diagnostics.markdownlint,
          -- nls.builtins.diagnostics.luacheck,
          nls.builtins.formatting.prettierd.with({
            filetypes = { "markdown" }, -- only runs `deno fmt` for markdown
          }),
          nls.builtins.diagnostics.selene.with({
            condition = function(utils)
              return utils.root_has_file({ "selene.toml" })
            end,
          }),
          -- nls.builtins.code_actions.gitsigns,
          nls.builtins.formatting.isort,
          nls.builtins.formatting.black,
          nls.builtins.diagnostics.flake8,
        },
        ---@diagnostic disable-next-line: no-unknown
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
      })
    end,
  },
}
