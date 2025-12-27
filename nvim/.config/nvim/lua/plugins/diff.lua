-- plugins.lua
return {
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("diffview").setup()

      -- Keymaps
      local opts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap("n", "<leader>dv", ":DiffviewOpen<CR>", opts)          -- Open diff view
      vim.api.nvim_set_keymap("n", "<leader>dc", ":DiffviewClose<CR>", opts)         -- Close diff view
      vim.api.nvim_set_keymap("n", "<leader>dh", ":DiffviewFileHistory<CR>", opts)   -- File history
    end,
  },
}

