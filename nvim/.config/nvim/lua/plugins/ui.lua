return {
  { "fei6409/log-highlight.nvim", event = "BufRead *.log", opts = {} },
  { "MagicDuck/grug-far.nvim", enabled = false },
  { "folke/trouble.nvim", enabled = false },
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
  },
}
