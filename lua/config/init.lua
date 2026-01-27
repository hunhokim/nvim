vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_user_command('Neovimconfig', 'edit ~/.config/nvim/init.lua', {})

vim.keymap.set('n', '<Esc>', ':noh<CR>')
vim.keymap.set('i', 'jk', '<Esc>')
