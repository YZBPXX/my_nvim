local M = {}

function M.config()
    require('bufferline').setup {
        options = {
            numbers = "buffer_id",
            max_name_length = 15,
            max_prefix_length = 6,
            diagnostics = "nvim_lsp",
            show_buffer_icons = true,
            show_buffer_close_icons = false,
            show_close_icon = false,
            persist_buffer_sort = true,
            enforce_regular_tabs = true,
            diagnostics_indicator = function(count, level)
              local icon = level:match("error") and "" or ""
              return icon .. count
            end,
          },
      }
end
return M

