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
vim.opt.tabstop = 4       -- A TAB character will appear as 4 spaces on screen
vim.opt.shiftwidth = 4    -- Amount of spaces used for auto-indentation (e.g., when pressing '>>')
vim.opt.softtabstop = 4   -- Number of spaces a <Tab> counts for; useful for smart backspacing
vim.opt.expandtab = true  -- Pressing the TAB key will insert spaces instead of a TAB character

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true

vim.api.nvim_create_user_command('Nvimconfig', 'edit ~/.config/nvim/init.lua', {})

vim.keymap.set('n', '<Esc>', ':noh<CR>')
vim.keymap.set('i', 'jk', '<Esc>')

vim.cmd.colorscheme("nightfox")

vim.schedule(function()
    vim.opt.clipboard:append('unnamedplus')

    if vim.env.SSH_TTY ~= nil or vim.env.TMUX ~= nil then
        -- Custom OSC 52 Copy function for SSH + Tmux
        local function my_copy(_)
            return function(lines)
                local content = table.concat(lines, '\n')
                -- Base64 encode the content
                local base64 = vim.fn.system('base64 | tr -d "\n"', content)
                local osc = string.format("\27]52;c;%s\7", base64)
                -- If inside Tmux, wrap with passthrough escape codes
                if vim.env.TMUX ~= nil then
                    osc = string.format("\27Ptmux;\27%s\27\\", osc)
                end
                -- Write directly to stdout (console)
                io.stdout:write(osc)
                io.stdout:flush()
            end
        end

        local function my_paste(_)
            return function(_)
                local content = vim.fn.getreg('"')
                return vim.split(content, '\n')
            end
        end

        vim.g.clipboard = {
            name = 'OSC 52 Tmux',
            copy = {
                ['+'] = my_copy('+'),
                ['*'] = my_copy('*'),
            },
            paste = {
                ['+'] = my_paste('+'),
                ['*'] = my_paste('*'),
            },
        }
    end
end)
