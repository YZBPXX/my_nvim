local M = {}

function M.config()
     -- disable netrw at the very start of your init.lua (strongly advised)
     vim.g.loaded_netrw = 1
     vim.g.loaded_netrwPlugin = 1
     
     -- set termguicolors to enable highlight groups
     vim.opt.termguicolors = true
     vim.keymap.set("n","T",":NvimTreeToggle<cr>")
     
     -- OR setup with some options
     require("nvim-tree").setup({
       sort_by = "case_sensitive",
       view = {
	 adaptive_size = true,
	 mappings = {
	   list = {
	     { key = "T", action = "dir_up" },
	   },
	 },
       },
       renderer = {
	 group_empty = true,
       },
       filters = {
	 dotfiles = true,
       },
     })
end 
return M
