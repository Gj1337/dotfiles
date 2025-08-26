return {
  "prichrd/netrw.nvim",
  config = function()
    require("netrw").setup({})
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons" -- Or another icon provider like mini.icons
  }
}
