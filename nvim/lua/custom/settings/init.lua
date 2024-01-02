-- Defaults
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.wo.number = true
vim.wo.relativenumber = true

--theme
vim.cmd.colorscheme 'dracula'
vim.cmd.highlight 'Normal guibg=none'
vim.api.nvim_set_hl(0, 'Cursor', { foreground = '#ffffff', background = '#ffffff' })
vim.api.nvim_set_hl(0, 'iCursor', { foreground = '#ffffff', background = '#CD0058' })
vim.opt.guicursor = 'n-v-c:block-Cursor,i:block-iCursor'
vim.api.nvim_set_hl(0, 'CursorLine', { background = '#220246' })
vim.api.nvim_set_hl(0, "IlluminatedWordText", { background = '#85000D' })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { background = '#85000D' })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { background = '#85000D' })

--file explorer
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

--auto-resize
vim.api.nvim_command('autocmd VimResized * wincmd =')

vim.api.nvim_set_keymap('n', '<C-w>s', '<C-w>v', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>v', '<C-w>s', { noremap = true, silent = true })

--lock scroll with cursor on center of screen
vim.api.nvim_set_keymap('n', '<leader>zz', ':let &scrolloff=999-&scrolloff<CR>', { noremap = true, silent = true })

--disable auto comment on newline
vim.cmd('autocmd BufEnter * set formatoptions-=o')

--enable cursorline
vim.opt.cursorline = true
