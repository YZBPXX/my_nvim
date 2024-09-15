-- vim.cmd [[packadd packer.nvim]]
-- require'lspconfig'.pyright.setup{}
local use = require('packer').use
--local cmp=require('configs.cmp')
require('packer').startup({ 
    function()
	use {
        -- language
	    'wbthomason/packer.nvim',
	    'lervag/vimtex'         ,
	    'neovim/nvim-lspconfig' ,
	    'mfussenegger/nvim-dap',
	    'williamboman/mason.nvim',
	    'williamboman/mason-lspconfig.nvim',
	    "jayp0521/mason-nvim-dap.nvim",
	    -- 自动安装mason 相关工具
	    "WhoIsSethDaniel/mason-tool-installer.nvim",
	    "rcarriga/nvim-dap-ui",
	    'skywind3000/asyncrun.vim',
	    'iamcco/markdown-preview.nvim',
	    -- 'nvim-telescope/telescope-dap.nvim'
	    -- Autocompletion
	    'hrsh7th/nvim-cmp',
	    'hrsh7th/cmp-buffer',
	    'hrsh7th/cmp-path',
	    'saadparwaiz1/cmp_luasnip',
	    'hrsh7th/cmp-nvim-lsp',
	    'hrsh7th/cmp-nvim-lua',

	     -- Snippets
	    'L3MON4D3/LuaSnip',
	    'rafamadriz/friendly-snippets',

	    -- UI
	    'folke/tokyonight.nvim',
	    'nvim-tree/nvim-tree.lua',
	    'nvim-tree/nvim-web-devicons', -- optional, for file icons
	    use {'glepnir/lspsaga.nvim', commit = "b7b4777" },
            use {
               'nvim-lualine/lualine.nvim',
		  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
		},
	    'nvim-lualine/lualine.nvim',
	    -- use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'},
	    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'},

		-- move
	    --use {
	    --    'phaazon/hop.nvim',
	    --    branch = 'v2', -- optional but strongly recommended
	    --    config = function()
	    --    -- you can configure Hop the way you like here; see :h hop-config
	    --    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
	    --  end
	    --},
	    use {
	      'nvim-telescope/telescope.nvim', tag = '0.1.0',
	      requires = { {'nvim-lua/plenary.nvim'} }
	    },
	    --- chatgpt
	    -- Packer
	    use {
	      "jackMort/ChatGPT.nvim",
		config = function()
		  require("chatgpt").setup()
		end,
		requires = {
		  "MunifTanjim/nui.nvim",
		  "nvim-lua/plenary.nvim",
		  "nvim-telescope/telescope.nvim"
		}
	    },

	    -- Lazy
	    --{
	    --  "jackMort/ChatGPT.nvim",
	    --    event = "VeryLazy",
	    --    config = function()
	    --      require("chatgpt").setup()
	    --    end,
	    --    dependencies = {
	    --      "MunifTanjim/nui.nvim",
	    --      "nvim-lua/plenary.nvim",
	    --      "nvim-telescope/telescope.nvim"
	    --    }
	    --}
	}
    end,
    config = {
	ensure_dependencies = true,
	plugin_package = 'packer',
	max_jobs = nil,
	auto_clean = true,
	compile_on_sync = true,
	disable_commands = false,
	opt_default = false,
	transitive_opt = true,
	transitive_disable = true,
	auto_reload_compiled = true,
	git = {
		cmd = 'git',
		clone_timeout = 3600,
		depth = 1,
     },
 
     display = {
	 non_interactive = false,
	 open_fn = nil,
	 open_cmd = '65vnew \\[packer\\]',
	 working_sym = '⟳',
	 error_sym = '✗',
	 done_sym = '✓',
	 removed_sym = '-',
	 moved_sym = '→',
	 header_sym = '━',
	 show_all_info = true,
	 prompt_border = 'double',
	 keybindings = {
	     quit = 'q',
	     toggle_info = '<CR>',
	     diff = 'd',
	     prompt_revert = 'r'
	 }
     },
     luarocks = {python_cmd = 'python'},
     log = {level = 'warn'},
     profile = {enable = false, threshold = 1}
     }
})

vim.cmd[[colorscheme tokyonight]]
-- require('lualine').setup {
--   options = {
--     -- ... your lualine config
--     theme = 'tokyonight'
--     -- ... your lualine config
--   }
-- }
-- 添加服务，通过mason下载
-- vim.g.vimtex_view_general_viewer  = 'skim',
-- require("cmp").setup()
-- Set up nvim-cmp.
require("mason").setup()
require("mason-tool-installer").setup {
  ensure_installed = {"black", "cpplint", "debugpy", "prettier", "pyright"},
  auto_update = false,
  run_on_start = true,
}
require("configs.cmp").config()
require("configs.vimtex").config()
require("configs.nvim-tree").config()
require("configs.dap").config()
require("configs.lualine")
require("configs.markdown-preview").config()
require("configs.luasnip").config()
--require("configs.hop").config()
require("configs.bufferline").config()
require("configs.telescope").config()

