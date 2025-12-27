require("config.lazy")
require("keymaps.lsp")

-- vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.cmdheight = 0
vim.o.signcolumn = "yes"
vim.o.winborder = 'rounded'
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 15

vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
