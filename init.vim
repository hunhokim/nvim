colorscheme nightfox

" Tab size
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2

" Nvim-tree
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
set termguicolors " this variable must be enabled for colors to be applied properly

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" nerdcommenter
filetype plugin on

lua << EOF
require'plugins'

require'nvim-tree'.setup {
}

require('lualine').setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "python" },
  sync_install = false,
  ignore_install = { "javascript" },
  highlight = {
    enable = true,
    disable = { "c", "rust" },
    additional_vim_regex_highlighting = false,
  },
}
EOF
