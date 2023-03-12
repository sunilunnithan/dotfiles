return {
  "williamboman/mason.nvim",
  opts = {
    ui = {
      border = "double",
      icons = {
        package_installed = "﫟",
        package_pending = "﫠",
        package_uninstalled = "",
      },
    },
    ensure_installed = {
      "prettierd",
      "stylua",
      "luacheck",
      "eslint_d",
      "shellcheck",
      -- "deno",
      "shfmt",
      "black",
      "isort",
      "flake8",
    },
  },
}
