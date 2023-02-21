-- vim.api.nvim_set_option('number', true)
vim.api.nvim_set_option('updatetime', 6000)
vim.o.number = true
vim.o.shiftwidth=4
vim.o.termguicolors = true
-- vim.o.mapleader = ' '
vim.o.smartindent = true
vim.o.mouse = 'a'
vim.o.clipboard = "unnamedplus"
vim.cmd[[
if has("autocmd")
  augroup templates
    autocmd BufNewFile *.cpp 0r ~/.config/nvim/templates/cpp
    autocmd BufNewFile *.tex 0r ~/.config/nvim/templates/tex
  augroup END
endif
]]
-- vim.o.encodings=utf-8,gb18030,utf-16,big5
