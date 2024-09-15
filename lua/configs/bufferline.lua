local M = {}
vim.opt.termguicolors = true
function M.config()
    local bufferline = require('bufferline')

    bufferline.setup {
        options = {
            -- style_preset = bufferline.style_preset.no_italic,
            numbers = "ordinal",
            close_icon = '',
            modified_icon = '●',
	    separator_style = "thin",
            left_trunc_marker = '',
            right_trunc_marker = '',
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "center",
                    separator = true
                }
            },

	    themable = true,
            max_name_length = 15,
            max_prefix_length = 6,
            diagnostics = "nvim_lsp",
            show_buffer_icons = true,
            show_buffer_close_icons = true,
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

