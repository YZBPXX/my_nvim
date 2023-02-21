
local M = {}

function M.config()
    --require("luasnip.loaders.from_snipmate").lazy_load({ paths = { "/Users/yaozhengbing/.config/nvim/snippets" } })
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/friendly-snippets" } })
    local keymap = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }
    keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
    keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
    keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
    keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
    -- vim.keymap.set( "n", "gh", "<cmd>lua vim.lsp.buf.definition()<CR>", {silent = true, noremap = true})
    -- --  keymap.set
    -- vim.keymap.set( "n", "gj", "<cmd>lua vim.lsp.buf.hover()<CR>", {silent = true, noremap = true})
    -- --  keymap.set
    -- vim.keymap.set( "n", "gk", "<cmd>lua vim.lsp.buf.implementation()<CR>", {silent = true, noremap = true})
    -- --  keymap.set
    -- vim.keymap.set( "n", "gl", "<cmd>lua vim.lsp.buf.references()<CR>", {silent = true, noremap = true})
    -- --  keymap.set
    -- vim.keymap.set( "n", "go", "<cmd>lua vim.diagnostic.open_float()<CR>", {silent = true, noremap = true})
    -- vim.keymap.set( "n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", {silent = true, noremap = true})
    -- vim.keymap.set( "n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", {silent = true, noremap = true})
end
return M
