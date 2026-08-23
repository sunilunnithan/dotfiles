return {
  {
    "folke/sidekick.nvim",
    opts = {
      -- avoid polling for Copilot LSP status; we only use sidekick for the
      -- CLI terminal, never wired up the Copilot LSP client for NES
      copilot = {
        status = { enabled = false },
      },
      tools = (function()
        -- on the work machine, $CLI_SANDBOX_LAUNCHER (set outside this repo,
        -- e.g. in a machine-local shell profile) runs each CLI tool through
        -- the company's sandboxing/entitlement wrapper; falls back to each
        -- tool's plain default command wherever it's unset or not on PATH
        -- (e.g. at home)
        local launcher = os.getenv("CLI_SANDBOX_LAUNCHER")
        local wrapped = launcher and vim.fn.executable(launcher) == 1
        local function cmd(...)
          local args = { ... }
          return wrapped and { launcher, unpack(args) } or args
        end
        return {
          claude = { cmd = cmd("claude") },
          codex = { cmd = cmd("codex") },
          copilot = { cmd = cmd("copilot", "--banner") },
        }
      end)(),
    },
    -- stylua: ignore
    keys = {
      { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
      {
        "<c-.>",
        function()
          require("sidekick.cli").focus()
        end,
        desc = "Sidekick Focus",
        mode = { "n", "t", "i", "x" },
      },
      -- filter = { installed = true } shows only CLI tools actually on PATH
      -- (currently just claude; codex/copilot will appear automatically
      -- once those CLIs are installed)
      { "<leader>aa", function() require("sidekick.cli").toggle({ filter = { installed = true } }) end, desc = "Sidekick Toggle CLI" },
      { "<leader>as", function() require("sidekick.cli").select({ filter = { installed = true } }) end, desc = "Select CLI" },
      { "<leader>ad", function() require("sidekick.cli").close() end, desc = "Detach a CLI Session" },
      {
        "<leader>ac",
        function()
          require("sidekick.cli").toggle({ name = "claude", focus = true })
        end,
        desc = "Sidekick Toggle Claude",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      { "<leader>af", function() require("sidekick.cli").send({ msg = "{file}" }) end, desc = "Send File" },
      { "<leader>at", function() require("sidekick.cli").send({ msg = "{this}" }) end, mode = { "n", "x" }, desc = "Send This" },
      { "<leader>av", function() require("sidekick.cli").send({ msg = "{selection}" }) end, mode = { "x" }, desc = "Send Visual Selection" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jdtls = { enabled = false },
      },
    },
  },
}
