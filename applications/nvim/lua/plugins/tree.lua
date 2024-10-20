return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup {}

    local wk = require('which-key')
    wk.add({
      { "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle Tree" },
    })
  end
}
