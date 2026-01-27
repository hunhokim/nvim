return {
	'windwp/nvim-autopairs',
	event = "InsertEnter",
	config = function()
		local remap = vim.api.nvim_set_keymap
		local npairs = require('nvim-autopairs')
		npairs.setup({ 
			map_cr = false,
			check_ts = true,
		})

		-- skip it, if you use another global object
		_G.MUtils = {}

		-- new version for custom pum
		MUtils.completion_confirm = function()
				return npairs.autopairs_cr()
		end

		remap('i', '<CR>', 'v:lua.MUtils.completion_confirm()', { expr = true, noremap = true })
	end
}
