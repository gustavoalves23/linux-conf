-- tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.wo.number = true
vim.wo.relativenumber = true

-- copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

--file explorer
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

--auto-resize
vim.api.nvim_command('autocmd VimResized * wincmd =')

vim.api.nvim_set_keymap('n', '<C-w>s', '<C-w>v', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>v', '<C-w>s', { noremap = true, silent = true })

--lock scroll with cursor on center of screen
vim.api.nvim_set_keymap('n', '<leader>zz', ':let &scrolloff=999-&scrolloff<CR>', { noremap = true, silent = true })

-- Set cursor colors
vim.api.nvim_set_hl(0, 'Cursor', { foreground = '#ffffff', background = '#ffffff' })
vim.api.nvim_set_hl(0, 'iCursor', { foreground = '#ffffff', background = '#CD0058' })
vim.opt.guicursor = 'n-v-c:block-Cursor,i:block-iCursor'

--disable auto comment on newline
vim.cmd('autocmd BufEnter * set formatoptions-=o')

--copy and paste to and from the star register
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true, desc = "[Y]ank from * register" })
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, silent = true, desc = "[P]aste to * register" })

--enable cursorline
vim.opt.cursorline = true
