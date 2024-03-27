return {
  "ThePrimeagen/harpoon",
  dependencies = "nvim-lua/plenary.nvim",
  keys = {
    {
      "<leader>ha",
      function()
        require("harpoon.mark").add_file()
      end,
      desc = "Harpoon Add File",
    },
    {
      "<leader>hm",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "Harpoon File Menu",
    },
    {
      "<leader>hc",
      function()
        require("harpoon.cmd-ui").toggle_quick_menu()
      end,
      desc = "Command Menu",
    },
    {
      "<leader>1",
      function()
        require("harpoon.ui").nav_file(1)
      end,
      desc = "Harpoon File 1",
    },
    {
      "<leader>2",
      function()
        require("harpoon.ui").nav_file(2)
      end,
      desc = "Harpoon File 2",
    },
    {
      "<leader>3",
      function()
        require("harpoon.term").gotoTerminal(1)
      end,
      desc = "Terminal 1",
    },
    {
      "<leader>4",
      function()
        require("harpoon.term").gotoTerminal(2)
      end,
      desc = "Terminal 2",
    },
    {
      "<leader>5",
      function()
        require("harpoon.term").sendCommand(1, 1)
      end,
      desc = "Command 1",
    },
    {
      "<leader>6",
      function()
        require("harpoon.term").sendCommand(1, 2)
      end,
      desc = "Command 2",
    },
  },
  opts = {
    global_settings = { mark_branch = true },
    width = vim.api.nvim_win_get_width(0) - 4,
  },
}
