return {
  -- svelte = {
  --   filetypes = { 'svelte' },
  --   snippets = {
  --     extends = {
  --       'typescript',
  --     },
  --   },
  -- },
  react = {
    filetypes = {
      'javascriptreact',
      'typescriptreact',
      'typescript.tsx',
    },
    snippets = {
      extends = {
        'html',
      },
      custom = function(s, t, i)
        return {
          s('cssm', {
            t 'className={S.',
            i(1),
            t '}',
          }),
        }
      end,
    },
  },
  javascript = {
    filetypes = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescript.tsx',
      'typescriptreact',
      'vue',
      'svelte',
    },
    linters = {
      'eslint_d',
    },
    formatters = {
      'eslint_d',
    },
    debug_fn = function(dap)
      dap.adapters.node2 = {
        type = 'executable',
        command = 'node',
        args = { vim.fn.stdpath 'data' .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
      }
      dap.configurations.javascript = {
        {
          name = 'Launch',
          type = 'node2',
          request = 'launch',
          program = '${file}',
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = 'inspector',
          console = 'integratedTerminal',
        },
        {
          name = 'Attach to process',
          type = 'node2',
          request = 'attach',
          processId = require('dap.utils').pick_process,
        },
      }
    end,
  },
  csharp = {
    filetypes = { 'cs' },
    debug_fn = function(dap)
      local nvim_config_dir = vim.fn.stdpath 'config'
      dap.adapters.coreclr = {
        type = 'executable',
        command = nvim_config_dir .. '/adapters/netcoredbg/netcoredbg',
        args = { '--interpreter=vscode' },
      }

      dap.configurations.cs = {
        {
          type = 'coreclr',
          name = 'launch - netcoredbg',
          request = 'launch',
          program = function()
            return vim.fn.input('DLL Location: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
          end,
        },
        {
          type = 'coreclr',
          name = 'attach - netcoredbg',
          request = 'attach',
          processId = require('dap.utils').pick_process,
        },
      }
    end,
  },
  lua = {
    filetypes = { 'lua' },
    formatters = { 'stylua' },
  },
}
