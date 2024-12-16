return {
  { "fei6409/log-highlight.nvim", event = "BufRead *.log", opts = {} },
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
    },
    keys = {
      {
        "<leader>gt",
        function()
          Snacks.terminal(
            "gh pr list && echo 'Press enter...'; read",
            { cwd = vim.fn.expand("%:p:h"), border = "rounded" }
          )
        end,
        desc = "PR list",
      },
    },
  },
}
