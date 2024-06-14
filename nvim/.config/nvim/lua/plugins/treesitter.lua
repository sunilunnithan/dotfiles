return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "json" }, -- Ensure only json is installed
    highlight = {
      enable = true,
      disable = { "jsonc" }, -- Disable jsonc parser
    },
  },
  config = function()
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.jsonc = {
      install_info = {
        url = "https://github.com/tree-sitter/tree-sitter-json",
        files = { "src/parser.c" },
        branch = "main",
        generate_requires_npm = true,
        requires_generate_from_grammar = false,
      },
      filetype = "jsonc",
    }

    require("nvim-treesitter.configs").setup({
      ensure_installed = { "json" },
      highlight = {
        enable = true,
        disable = { "jsonc" },
      },
    })
  end,
}
