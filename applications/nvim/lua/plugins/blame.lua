return {
  "FabijanZulj/blame.nvim",
  config = function()
    local wk = require('which-key')
    wk.add({
      { "<leader>g", ":ToggleBlame<CR>", desc = "Toggle Blame" },
    })
  end
}
