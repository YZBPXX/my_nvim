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
