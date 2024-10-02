return {
  "bjarneo/lazyvim-cheatsheet.nvim",
  keys = {
    {
      "<leader>ch",
      function()
        require("lazyvim-cheatsheet").show()
      end,
      desc = "Show LazyVim Cheatsheet",
    },
  },
}
