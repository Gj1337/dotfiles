return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {},
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      -- Languages to install
      ensure_installed = {
        -- Core/Essential
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        
        -- Web Development
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",
        "vue",
        "svelte",
        "php",
        
        -- Systems Programming
        "rust",
        "go",
        "cpp",
        "c_sharp",
        "zig",
        
        -- JVM Languages
        "java",
        "kotlin",
        "scala",
        
        -- Python
        "python",
        
        -- Other Popular Languages
        "ruby",
        "haskell",
        "elixir",
        "dart",
        
        -- Data & Config
        "json",
        "yaml",
        "toml",
        "xml",
        "csv",
        
        -- Documentation
        "markdown",
        "markdown_inline",
        
        -- Shell & Scripting
        "bash",
        "fish",
        
        -- Database
        "sql",
        
        -- Infrastructure
        "dockerfile",
        "terraform",
        
        -- Build Systems
        "make",
        "cmake",
        
        -- Version Control
        "git_config",
        "gitcommit",
        "gitignore",
        
        -- Other
        "regex",
        "graphql",
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      auto_install = true,

      -- Syntax highlighting
      highlight = {
        enable = true,
        -- Disable for large files
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = false,
      },

      -- Smart indentation
      indent = {
        enable = true,
      },

      -- Incremental selection
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
