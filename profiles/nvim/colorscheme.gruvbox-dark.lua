return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      transparent_mode = true,
      overrides = {
        ["Function"] = { link = "GruvboxBlue" },
      },
      italic = {
        strings = false,
      },
    })
    vim.cmd.colorscheme "gruvbox"
  end
}
