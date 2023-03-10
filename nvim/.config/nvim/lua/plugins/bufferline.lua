return {
  "akinsho/nvim-bufferline.lua",
  event = "VeryLazy",
  opts = {
    options = {
      mode = "tabs", -- tabs or buffers
      numbers = "buffer_id",
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      separator_style = "slant" or "padded_slant",
      show_tab_indicators = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      color_icons = true,
      enforce_regular_tabs = false,
      close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
      right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
      left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
      middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
      -- NOTE: this plugin is designed with this icon in mind,
      -- and so changing this is NOT recommended, this is intended
      -- as an escape hatch for people who cannot bear it for whatever reason
      indicator_icon = nil,
      indicator = { style = "icon", icon = "▎" },
      buffer_close_icon = "",
      -- buffer_close_icon = '',
      modified_icon = "●",
      close_icon = "",
      -- close_icon = '',
      left_trunc_marker = "",
      right_trunc_marker = "",
      --- name_formatter can be used to change the buffer's label in the bufferline.
      --- Please note some names can/will break the
      --- bufferline so use this at your discretion knowing that it has
      --- some limitations that will *NOT* be fixed.
      -- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      --   -- remove extension from markdown files for example
      --   if buf.name:match('%.md') then
      --     return vim.fn.fnamemodify(buf.name, ':t:r')
      --   end
      -- end,
      max_name_length = 30,
      max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
      tab_size = 21,
      diagnostics_update_in_insert = false,
      offsets = { { filetype = "neo-tree", text = "", padding = 1 } },
      show_buffer_icons = true,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
      custom_filter = function(buf_number, _)
        local tab_num = 0
        for _ in pairs(vim.api.nvim_list_tabpages()) do
          tab_num = tab_num + 1
        end

        if tab_num > 1 then
          if not not vim.api.nvim_buf_get_name(buf_number):find(vim.fn.getcwd(), 0, true) then
            return true
          end
        else
          return true
        end
      end,
      sort_by = function(buffer_a, buffer_b)
        local mod_a = ((vim.loop.fs_stat(buffer_a.path) or {}).mtime or {}).sec or 0
        local mod_b = ((vim.loop.fs_stat(buffer_b.path) or {}).mtime or {}).sec or 0
        return mod_a > mod_b
      end,
    },
  },
}
