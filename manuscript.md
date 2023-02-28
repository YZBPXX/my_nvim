- 使用nvim命令
```lua
local api = vim.api
api.nvim_command('enew')
vim.bo[0].buftype=nofile -- 设置文件类型
vim.bo[0].bufhidden=hide
vim.bo[0].swapfile=false
- 加载模块
```
require('other_modules')
pcall(require, 'module_with_error') -- 加载模块报错
```
- 以下文件下的init.lua文件会被直接加载，不需要指定，同时如果存在vim问题将会优先加载vim文件
- 在命令中编写多行lua，每个命令中的local不共享
```
:lua << EOF
local mod = require('mymodule')
local tbl = {1, 2, 3}

for k, v in ipairs(tbl) do
    mod.method(v)
end

print(tbl)
EOF
- 查看历史输出 :echomsg
- 将lua输入到(选中)缓冲区 :luado return "hellow world"
```
:luado if linenr % 2 == 0 then return line:upper() end -- 对第2行的大写
```
- 加载lua文件(对比require()能使用lua的模块系统
    - luafile 
    - source 
    - runtime
- 从vimscript中使用lua：
    - luaeval('math.pow')
    - v:lua.print('Hello from Lua!') -- 只能调用函数
- 设置内嵌lua语法高亮 let g:vimsyn_embed = 'l'
- 从lua中调用vim：通过全局变量vim调用
vim 模块
---
api
-----
- 计算vim表达式vim.api.nvim_eval('1 + 1')
- 执行命令 vim.api.nvim_command('enew')，别名vim.api.cmd()
- 映射`vim.api.nvim_set_keymap('n', '<leader><Space>', ':set hlsearch!<CR>', { noremap = true, silent = true })`，默认是非递归的
    - vim.keymap.set('n', '>', ']', {remap = true})
- 执行vim代码
```
local result = vim.api.nvim_exec(
[[
let mytext = 'hello world'

function! MyFunction(text)
    echo a:text
endfunction

call MyFunction(mytext)
]],
true)
print(result) -- 'hello world'
```

