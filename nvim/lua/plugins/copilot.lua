local copilot_lua = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = {
        enabled = true,
        auto_refresh = true,
        layout = {
          position = "right"
        },
      }
    })
    require("copilot_cmp").setup()

    local wk = require('which-key')

    wk.add({
      { "<leader>cp", ":Copilot panel<CR>", desc = "Open Panel" },
    })

    --[[
    wk.register({
      ["<leader>"] = {
        c = {
          name = "Copilot",
          p = { ':Copilot panel<CR>', 'Open Panel' }
        }
      }
    })
    ]]
       --
  end,
}



local copilot_cmp = {
  "zbirenbaum/copilot-cmp",
  after = { "copilot.lua" },
  config = function()
    require("copilot_cmp").setup()
  end
}

return {
  copilot_cmp,
  copilot_lua
}
