return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "clangd", "ty", "ruff" }
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.o.winborder = 'double'
			vim.diagnostic.config({
				virtual_text = true
			})

			vim.lsp.config['lua_ls'] = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim' }
						}
					}
				}
			}

      vim.lsp.config['rust_analyzer'] = {
        settings = {
          ['rust-analyzer'] = {
            lru = {
              capacity = 64,
            },
            cachePriming = {
              enable = false,
              numThreads = 1,
            },
            numThreads = 1,
          },
        },
      }
		end
	}
}
