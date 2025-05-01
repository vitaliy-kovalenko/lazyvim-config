return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "moon",
      light_style = "day",
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      day_brightness = 0.3,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = false,
      cache = true,

      on_colors = function() end,
      on_highlights = function() end,

      plugins = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = true,
        mini = true,
        indent_blankline = {
          enabled = true,
          scope_color = "",
          colored_indent_levels = false,
        },
      },
    })

    vim.cmd([[colorscheme tokyonight]])
  end,
}
