return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        auto_refresh = true,
        layout = {
          position = "right"
        }
      }
    })

    local wk = require('which-key')
    wk.register({
      ["<leader>"] = {
        c = {
          name = "Copilot",
          p = { ':Copilot panel<CR>', 'Open Panel' }
        }
      }
    })
  end,
}
