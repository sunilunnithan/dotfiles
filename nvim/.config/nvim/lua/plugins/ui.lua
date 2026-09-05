return {
  { "fei6409/log-highlight.nvim", event = "BufRead *.log", opts = {} },
  { "MagicDuck/grug-far.nvim", enabled = false },
  { "folke/trouble.nvim", enabled = false },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = { position = "right" },
      -- close the tree once a file is opened from it, so focus moving into
      -- the buffer also hides the sidebar. A background render (opened-file
      -- markers, git status, etc.) can redraw and re-show the window a few
      -- hundred ms later, so close again shortly after to win that race.
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            local function close()
              require("neo-tree.command").execute({ action = "close" })
            end
            close()
            vim.defer_fn(close, 250)
          end,
        },
      },
    },
  },
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
      ███████╗██╗   ██╗███╗   ██╗██╗██╗    ██╗   ██╗██╗███╗   ███╗
      ██╔════╝██║   ██║████╗  ██║██║██║    ██║   ██║██║████╗ ████║
      ███████╗██║   ██║██╔██╗ ██║██║██║    ██║   ██║██║██╔████╔██║
      ╚════██║██║   ██║██║╚██╗██║██║██║    ╚██╗ ██╔╝██║██║╚██╔╝██║
      ███████║╚██████╔╝██║ ╚████║██║███████╗╚████╔╝ ██║██║ ╚═╝ ██║
      ╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝╚══════╝ ╚═══╝  ╚═╝╚═╝     ╚═╝
          ]],
        },
      },
      lazygit = {
        win = {
          position = "float",
          width = 0.99,
          height = 0.99,
        },
      },
      -- Enable just the picker submodule (not LazyVim's editor.snacks_picker
      -- extra, which would replace fzf-lua as the default finder). This is
      -- only here to power Snacks.gh below; fzf-lua stays untouched.
      picker = { enabled = true },
      gh = {},
    },
    keys = {
      { "<leader>Gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
      { "<leader>GI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
      { "<leader>Gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
      { "<leader>GP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },
    },
  },
}
