local M = {}
function M.config()
    -- place this in one of your configuration file(s)
    require'hop'.setup { keys = 'asdfjkl;' }-- keys就是代替的字母
    local hop = require('hop')
    local directions = require('hop.hint').HintDirection
    vim.keymap.set('', 'f', function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      -- curent_line_only=true 当前行
      -- direction = directions.AFTER_CURSOR 表示在光标后
    end, {remap=true})
    vim.keymap.set('', 'F', function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
    end, {remap=true})
    vim.keymap.set('', '/', function()
      hop.hint_char1({})
    end, {remap=true})
    vim.keymap.set('', '?', function()
      hop.hint_lines({})
    end, {remap=true})
end
return M
