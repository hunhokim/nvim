colorscheme nightfox

" Tab size
set tabstop=2
set expandtab
set shiftwidth=2

autocmd Filetype go setlocal tabstop=4 shiftwidth=4

" Line number
set number
set cursorline

" map <Esc> to other keys
imap jk <Esc>
imap kj <Esc>

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

" <Esc> to remove highlight
nnoremap <Esc> :noh<CR>

" Clipboard sharing on mac
set clipboard=unnamedplus

" Vim-plug
call plug#begin()
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  Plug 'jiangmiao/auto-pairs'
call plug#end()

" Lua plugins
lua << EOF
  require'plugins'
  require'nvim-cmp'

  require'nvim-tree'.setup {
  }
  require('lualine').setup()

  require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "python", "vim", "go" },
    sync_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
EOF

source ~/.config/nvim/vim/coc.vim
source ~/.config/nvim/vim/coc-snippets.vim
