return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")
    dap.adapters.codelldb = {
      type = 'server',
      port = "${port}",
      executable = {
        command = '/home/fallacy/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb',
        args = {"--port", "${port}"},
      }
    }
    dap.configurations.cpp = {
      {
        name = "cpp debugger",
        type = "codelldb",
        request = "launch",
        program = function()
          local fname = vim.fn.fnamemodify(vim.fn.expand('%:.h'), ':p:~:.')
          vim.api.nvim_exec2(":!echo fname", {})
          print(fname)
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }
    dap.adapters.python = {
      type = "executable",
      command = "path/to/virtualenvs/debugpy/bin/python",
      args = { "-m", "debugpy.adapter" },
    }

    dap.configurations.python = {
      {
        -- The first three options are required by nvim-dap
        type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = "launch",
        name = "Launch file",

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}", -- This configuration will launch the current file if used.
        pythonPath = function()
          -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
          -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
          -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
            return cwd .. "/venv/bin/python"
          elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
            return cwd .. "/.venv/bin/python"
          else
            return "/usr/bin/python"
          end
        end,
      },
    }
  end,
}
