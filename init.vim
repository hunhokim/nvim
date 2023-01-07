colorscheme nightfox

" Tab size
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2

" Line number
set number
set cursorline

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

" Vim-plug
call plug#begin()
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
call plug#end()

" nvim-cmp
set completeopt=menu,menuone,noselect

" Lua plugins
lua << EOF
  require'plugins'
  require'nvim-cmp'

  require'nvim-tree'.setup {
  }
  require('lualine').setup()

  require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "python", "vim" },
    sync_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
EOF

source ~/.config/nvim/vim/coc.vim
source ~/.config/nvim/vim/coc-snippets.vim
