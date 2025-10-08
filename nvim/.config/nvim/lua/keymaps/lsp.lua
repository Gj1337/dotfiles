local function setup_lsp_keymaps(bufnr)
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

	map("n", "<leader>f", function()
		vim.lsp.buf.format({ async = true })
		vim.cmd("write")
	end, opts)
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
	callback = function(event)
		setup_lsp_keymaps(event.buf)
	end,
})
