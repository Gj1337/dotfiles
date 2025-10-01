return {
  "ggandor/leap.nvim",
  dependencies = {
    "tpope/vim-repeat", -- optional but recommended
  },
  config = function()
    local leap = require("leap")
    leap.add_default_mappings()
  end,
}
