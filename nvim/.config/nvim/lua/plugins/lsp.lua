return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp", -- just to pass capabilities
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"pyright",
				"rust_analyzer",
				"gopls",
				"clangd",
				"jsonls",
				"yamlls",
				"taplo",
				"bashls",
				"dockerls",
				"html",
				"cssls",
			},
			automatic_installation = true,
		})


		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local servers = {
			"lua_ls", "ts_ls", "pyright", "rust_analyzer", "gopls", "clangd",
			"jsonls", "yamlls", "taplo", "bashls", "dockerls", "html", "cssls",
		}

		for _, server in ipairs(servers) do
			vim.lsp.config(server, { capabilities = capabilities, on_attach = on_attach, })

			-- lspconfig[server].setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- })
		end
	end,
}
