-- 主文件
-- vim.g.vscode vim的g域空间
-- g 全局变量空间 env环境变量
-- o 常规设置
-- wo 窗口
-- bo 缓冲
-- 例如vim中let g:zoom#statustext = 'Z'
-- lua 中vim.g['zoom#statustext'] = 'Z'
-- vim.opt.shiftwidth=2 --> set shiftwidth=2
-- 在lua中默认变量是全局变量
-- vim.api.nvim_set_keymap('n', '<Leader>w', ':write<CR>', {noremap = true}) noremap 非递归
-- vim.api.nvim_buf_set_keymap
if not vim.g.vscode then
    require("set")
    require("keymap")
    require("packers")
    -- 搜索core 文件,默认包含lua文件路径，类似java
end
