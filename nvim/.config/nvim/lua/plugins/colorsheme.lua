return {
	{
		"dgox16/oldworld.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local function is_dark_mode()
				-- macOS
				local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
				if handle then
					local result = handle:read("*a")
					handle:close()
					if result:match("Dark") then
						return true
					end
				end
				-- GNOME
				handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null")
				if handle then
					local result = handle:read("*a")
					handle:close()
					return result:match("dark") ~= nil
				end
				return false
			end

			if is_dark_mode() then
				require("oldworld").setup({ transparent = true })
				vim.cmd.colorscheme("oldworld")
			else
				require("github-theme").setup({
					options = { transparent = true },
				})
				vim.cmd.colorscheme("github_light")
			end

			-- Ensure transparency is applied after colorscheme loads
			vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
		end,
	},
	{ "projekt0n/github-nvim-theme",    lazy = true },
	{ "rockerBOO/boo-colorscheme-nvim", lazy = false },
}
