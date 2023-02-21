local M = {}

function M.config()
    local dap = require("dap")
    dap.adapters.python = {
	    type = "executable",
	    --command = os.getenv("CONDA_PREFIX") .. "/bin/python",
	    command = "python",
	    args = { "-m", "debugpy.adapter" },
    }

    dap.configurations.python = {
	    {
		    type = "python",
		    request = "launch",
		    name = "Launch file",

		    program = "${file}",
		    pythonPath = function()
			    local cwd = vim.fn.getcwd()
			    if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
				    return cwd .. "/venv/bin/python"
			    elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
				    return cwd .. "/.venv/bin/python"
			    else
				    -- return os.getenv("CONDA_PREFIX") .. "/bin/python"
				    return "python"
			    end
		    end,
	    },
    }
    -- INFO: execute ~/Downloads/vscode-extensions/codelldb/extension/adapter/codelldb --port 13000

    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = '/Users/yaozhengbing/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
    }
    dap.configurations.cpp = {
	{
	    name = "Launch file",
	    type = "cppdbg",
	    request = "launch",
	    program = function()
		return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
	    end,

	    cwd = "${workspaceFolder}",
	    stopAtEntry = true,
	},
    }
    dap.configurations.c = dap.configurations.cpp
end 
return M
