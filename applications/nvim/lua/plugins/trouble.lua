return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    auto_open = false,
    width = 30,
    position = 'bottom'
  },
  config = function()
    local wk = require('which-key')

    wk.add({
      { "<leader>t", ":troubletoggle<cr>", desc = "toggle trouble" },
    })
  end
}
