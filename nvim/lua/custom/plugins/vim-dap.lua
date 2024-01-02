local function set_keymaps(dap)
  vim.keymap.set('n', '<F5>', function() dap.continue() end)
  vim.keymap.set('n', '<F10>', function() dap.step_over() end)
  vim.keymap.set('n', '<F11>', function() dap.step_into() end)
  vim.keymap.set('n', '<F12>', function() dap.step_out() end)
  vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
  vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
  vim.keymap.set('n', '<Leader>lp',
    function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
  vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
  vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
  vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
  end)
  vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
  end)
  vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
  end)
  vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
  end)
end

return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      set_keymaps(dap)

      dap.adapters.coreclr = {
        type = 'executable',
        command = '/home/gmiyazaki/.config/nvim/adapters/netcoredbg/netcoredbg',
        args = { '--interpreter=vscode' }
      }

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = function()
            return vim.fn.input('DLL Location: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
          end,
        },
        {
          type = "coreclr",
          name = "attach - netcoredbg",
          request = "attach",
          processId = require('dap.utils').pick_process,
        },
      }

      local dapui = require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {},
  },
  {
    "folke/neodev.nvim",
    opts = { library = { plugins = { "nvim-dap-ui" }, types = true } },
  }
}
