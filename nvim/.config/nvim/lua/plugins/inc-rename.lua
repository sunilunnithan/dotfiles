return {
  "smjonas/inc-rename.nvim",
  config = function()
    require("inc_rename").setup()
    vim.keymap.set("n", "<leader>cR", function()
      return ":IncRename " .. vim.fn.expand("<cword>")
    end, { expr = true, desc = "Incrementally rename current word" })
  end,
}
