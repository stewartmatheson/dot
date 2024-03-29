return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdateSync" },
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "c", "cpp", "lua", "vim", "vimdoc", "xml", "php",
        "html", "css", "sql", "html", "bash", "ruby", "go",
        "javascript", "typescript", "markdown",
        "markdown_inline", "python"
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
