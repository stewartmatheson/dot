return {
  "elentok/format-on-save.nvim",
  config = function()
    local formatters = require("format-on-save.formatters")
    require('format-on-save').setup({
      formatter_by_ft = {
        ruby = formatters.lsp,
        lua = formatters.lsp,
        javascript = {
          formatters.if_file_exists({
            pattern = ".eslintrc.*",
            formatter = function()
              vim.cmd("EslintFixAll")
            end
          })
        },
        typescript = formatters.lsp,
        go = formatters.shell({ cmd = { "goimports" } }),
        sh = formatters.shell({ cmd = { "shfmt", "-i", "2" } }),
      }
    })
  end

}
