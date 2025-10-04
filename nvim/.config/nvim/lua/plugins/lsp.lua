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


		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach = function(_, bufnr)
			local map = vim.keymap.set
			local opts = { noremap = true, silent = true, buffer = bufnr }
			map("n", "gd", vim.lsp.buf.definition, opts)
			map("n", "K", vim.lsp.buf.hover, opts)
			map("n", "gr", vim.lsp.buf.references, opts)
			map("n", "<leader>rn", vim.lsp.buf.rename, opts)
			map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			map("n", "[d", vim.diagnostic.goto_prev, opts)
			map("n", "]d", vim.diagnostic.goto_next, opts)
			map("n", "<leader>e", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
				vim.cmd("write")
			end, { noremap = true, silent = true, buffer = bufnr })
		end

		local servers = {
			"lua_ls", "ts_ls", "pyright", "rust_analyzer", "gopls", "clangd",
			"jsonls", "yamlls", "taplo", "bashls", "dockerls", "html", "cssls",
		}

		for _, server in ipairs(servers) do
			lspconfig[server].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end
	end,
}
