return {
  {
    "folke/tokyonight.nvim",
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
        require("tokyonight").setup({ transparent = true })
        vim.cmd.colorscheme("tokyonight-night")
      else
        require("github-theme").setup({
          options = { transparent = true },
        })
        vim.cmd.colorscheme("github_light")
      end
    end,
  },
  { "projekt0n/github-nvim-theme", lazy = true },
}

