
vim.keymap.set('n', '<leader>1', ':lua require("bufferline").go_to(1, true)<cr>')
vim.keymap.set('n', '<leader>2', ':lua require("bufferline").go_to(2, true)<cr>')
vim.keymap.set('n', '<leader>3', ':lua require("bufferline").go_to(3, true)<cr>')
vim.keymap.set('n', '<leader>4', ':lua require("bufferline").go_to(4, true)<cr>')
vim.keymap.set('n', '<leader>5', ':lua require("bufferline").go_to(5, true)<cr>')
vim.keymap.set('n', '<leader>6', ':lua require("bufferline").go_to(6, true)<cr>')
vim.keymap.set('n', '<leader>7', ':lua require("bufferline").go_to(7, true)<cr>')
vim.keymap.set('n', '<leader>8', ':lua require("bufferline").go_to(8, true)<cr>')
vim.keymap.set('n', '<leader>9', ':lua require("bufferline").go_to(9, true)<cr>')
vim.keymap.set('n', '<leader>d', ':bd<cr>')
-- vim.keymap.set('n', '<leader>$', ':lua require("bufferline").go_to(-1, true)<cr>')


vim.keymap.set('n', 'Q', ':q<cr>')
vim.keymap.set('n', 'S', ':w<cr>')
vim.keymap.set({'n', 'x'}, 'Y', '"+y')
vim.keymap.set({'n', 'x'}, 'P', '"+p')
vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set("n",'<c-l>','^v$hyIprint(\"<c-o>P: \", <c-o>A)<esc>')

vim.keymap.set('i','<c-f>','<right>')
vim.keymap.set('i','<c-b>','<left>')
vim.keymap.set('i','<c-e>','<esc>A')
vim.keymap.set('i','<c-j>','<c-o>o')
-- vim.keymap.set('n', '\\ll', '<cmd>lua require"dap".continue()<CR>') 
--vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", {silent = true, noremap = true})
    -- 跳转到定义
