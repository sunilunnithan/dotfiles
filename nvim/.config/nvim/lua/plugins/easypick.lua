return {
  "axkirillov/easypick.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local easypick = require("easypick")

    local list = [[
    << EOF
    :Telescope find_files
    :Git blame
    EOF
    ]]

    easypick.setup({
      pickers = {
        -- list files inside current folder with default previewer
        {
          -- name for your custom picker, that can be invoked using :Easypick <name> (supports tab completion)
          name = "ls",
          -- the command to execute, output has to be a list of plain text entries
          command = "ls",
          -- specify your custom previwer, or use one of the easypick.previewers
          previewer = easypick.previewers.default(),
        },

        {
          name = "command_palette",
          command = "cat " .. list,
          -- pass a pre-configured action that runs the command
          action = easypick.actions.nvim_commandf("%s"),
          -- you can specify any theme you want, but the dropdown looks good for this example =)
          opts = require("telescope.themes").get_dropdown({}),
        },
      },
    })
  end,
}
