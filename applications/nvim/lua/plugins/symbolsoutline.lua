return {
  'simrat39/symbols-outline.nvim',
  config = function()
    require('symbols-outline').setup({
      keymaps = {
        close = {}
      }
    })

    local wk = require('which-key')

    wk.add({
      { "<leader>s", ":SymbolsOutline<CR>", desc = "Toggle Outline" },
    })
  end
}
