-- Recommended by nvim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- For Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		import = "plugins",
		change_detection = {
			notify = false,
			enabled = false,
		},
	},
})

-- Etc
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true

vim.opt.clipboard:append("unnamedplus")

vim.api.nvim_create_user_command('Nvimconfig', 'edit ~/.config/nvim/init.lua', {})

vim.keymap.set('n', '<Esc>', ':noh<CR>')
vim.keymap.set('i', 'jk', '<Esc>')

vim.cmd.colorscheme("nightfox")
