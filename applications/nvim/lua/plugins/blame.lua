return {
  "FabijanZulj/blame.nvim",
  config = function()
    local wk = require('which-key')
    require('blame').setup {}
    wk.add({
      { "<leader>g", ":BlameToggle<CR>", desc = "Toggle Blame" },
    })
  end
}
