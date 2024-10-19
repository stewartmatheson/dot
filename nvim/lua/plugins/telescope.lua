-- TODO : Figure out how to lazy load this

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.2",
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      pickers = {
        find_files = {
          theme = "ivy",
        },
        live_grep = {
          theme = "ivy",
        },
        help_tags = {
          theme = "ivy",
        },
        buffers = {
          theme = "ivy",
        },
        hightlights = {
          theme = "ivy",
        },
        spell_suggest = {
          theme = "ivy",
        },
        vim_options = {
          theme = "ivy",
        },
        autocommands = {
          theme = "ivy",
        },
        git_status = {
          theme = "ivy",
        },
      },
    })

    local wk = require('which-key')
    local builtin = require('telescope.builtin')

    wk.add(
      {
        { "<leader>f",  group = "Search" },
        { "<leader>fa", builtin.autocommands,  desc = "Find Autocommands" },
        { "<leader>fb", builtin.buffers,       desc = "Find Buffers" },
        { "<leader>ff", builtin.find_files,    desc = "Find Files" },
        { "<leader>fg", builtin.git_status,    desc = "Find Chagnes" },
        { "<leader>fh", builtin.help_tags,     desc = "Find Help Tags" },
        { "<leader>fo", builtin.vim_options,   desc = "Find Options" },
        { "<leader>fs", builtin.spell_suggest, desc = "Find Spelling" },
        { "<leader>fw", builtin.live_grep,     desc = "Live Grep" },
      }
    )
  end
}
