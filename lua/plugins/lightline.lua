return {
	'itchyny/lightline.vim',
	config = function()
		vim.cmd [[
		function! CocCurrentFunction()
			return get(b:, 'coc_current_function', '')
		endfunction

		let g:lightline = {
						\ 'colorscheme': 'wombat',
						\ 'active': {
						\   'left': [ [ 'mode', 'paste' ],
						\             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
						\ },
						\ 'component_function': {
						\   'cocstatus': 'coc#status',
						\   'currentfunction': 'CocCurrentFunction'
						\ },
					\ }
		]]
	end
}
