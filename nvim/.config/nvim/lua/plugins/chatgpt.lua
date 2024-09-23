return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  config = function()
    local home = vim.fn.expand("$HOME")
    require("chatgpt").setup({
      api_key_cmd = "cat " .. home .. "/.secrets/chatgpt.key",
      openai_params = {
        model = "gpt-4o-mini",
        max_tokens = 4000,
        top_p = 1,
        frequency_penalty = 0,
        presence_penalty = 0,
      },
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
