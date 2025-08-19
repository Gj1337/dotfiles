return {
  'folke/tokyonight.nvim',
  priority = 1000, -- Load colorscheme before other plugins
  lazy = false, -- Load during startup
  config = function()
    -- Detect system theme mode
    local function get_system_theme()
      -- Try to detect system theme on macOS
      local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
      if handle then
        local result = handle:read("*a")
        handle:close()
        if result:match("Dark") then
          return "dark"
        else
          return "light"
        end
      end
      
      -- Try to detect GNOME theme
      handle = io.popen("gsettings get org.gnome.desktop.interface gtk-theme 2>/dev/null")
      if handle then
        local result = handle:read("*a")
        handle:close()
        if result:lower():match("dark") then
          return "dark"
        else
          return "light"
        end
      end
      
      -- Fallback: try environment variable
      local theme_env = os.getenv("THEME_MODE")
      if theme_env then
        return theme_env:lower()
      end
      
      -- Default fallback
      return "dark"
    end
    
    local system_theme = get_system_theme()
    local style = system_theme == "light" and "day" or "storm"
    
    require('tokyonight').setup({
      -- Style based on system theme
      style = style,
      
      -- Enable terminal colors integration
      terminal_colors = true,
      
      -- Make background transparent
      transparent = true,
      
      -- Change specific highlight groups
      on_highlights = function(hl, c)
        -- Example customizations:
        -- hl.Comment = { fg = c.blue5, italic = true }
        -- hl.Keyword = { fg = c.purple, bold = true }
	hl.LineNr = {fg = c.yellow}
      end,
      
      -- Additional options
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
        functions = {},
        variables = {},
        -- Background styles for sidebars, floats, etc.
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },
      
      -- Sidebar-like windows
      sidebars = { "qf", "help", "vista_kind", "terminal", "packer" },
      
      -- Day style options
      day_brightness = 0.3,
      
      -- Hide inactive statuslines and the tabline
      hide_inactive_statusline = false,
      
      -- Dim inactive windows
      dim_inactive = false,
      
      -- When true, section headers in the lualine theme will be bold
      lualine_bold = false,
    })
    
    -- Set the colorscheme
    vim.cmd('colorscheme tokyonight')
  end
}
