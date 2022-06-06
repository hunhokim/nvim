return require('packer').startup(function()
  -- Packer can manage itself
use 'wbthomason/packer.nvim'

use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
}

use "EdenEast/nightfox.nvim" -- Packer

use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate'
}

use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

use {
    "nanozuki/tabby.nvim",
    config = function() require("tabby").setup() end,
}

use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client

use 'dense-analysis/ale'

use 'preservim/nerdcommenter'

end)
