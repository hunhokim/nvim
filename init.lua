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

vim.opt.clipboard:append("unnamedplus")

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
        -- 1. Use Neovim's built-in base64 if available (0.10+) or stick to system
        -- System base64 is fine, but ensure it's clean
        local base64 = vim.fn.system('base64 | tr -d "\n"', content)
        -- 2. Build the OSC 52 string
        local osc = string.format("\27]52;c;%s\7", base64)

        -- 3. Wrap for Tmux
        -- Note: Tmux has a limit on the length of Ptmux escape sequences.
        -- We use \27\27 to escape the ESC character inside the wrap.
        if vim.env.TMUX ~= nil then
          osc = string.format("\27Ptmux;\27%s\27\\", osc:gsub("\27", "\27\27"))
        end

        -- 4. CRITICAL: Use nvim_chan_send to bypass Lua's io.stdout buffering
        -- Channel 2 is usually stderr, which is more reliable for OOB sequences
        vim.api.nvim_chan_send(vim.v.stderr, osc)
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
