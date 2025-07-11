-- lua/plugins/lualine.lua
return {
  "nvim-lualine/lualine.nvim", -- The name of the plugin
  opts = {
    -- This is where you put your lualine configuration options
    options = {
      -- For example, to set the theme:
      -- theme = "auto",
    },
    sections = {
      -- Customize sections. LazyVim has default sections, you can override or add to them.
      -- Example: Adding search status to lualine_x
      lualine_x = {
        -- Existing components (LazyVim will merge, but you can explicitly define if you want to control order)
        -- If you want to *add* to existing lualine_x, you might need to append.
        -- For simplicity, let's assume you're replacing/adding to what's there
        {
          function()
            local searchcount = vim.fn.searchcount()
            if searchcount.current ~= nil and searchcount.total ~= nil and searchcount.total > 0 then
              return string.format("󰈕 %s/%s", searchcount.current, searchcount.total)
            else
              return ""
            end
          end,
          cond = function()
            return vim.v.hlsearch == 1 and vim.fn.searchcount().total > 0
          end,
          color = { gui = "bold", fg = "#E0AF68" }, -- Example color
        },
        -- You can add other default LazyVim components back if you want, e.g.:
        -- "diagnostics",
        -- "filetype",
      },
      -- If you want to change other sections (e.g., lualine_a, lualine_b, etc.):
      -- lualine_a = { "mode" },
      -- lualine_b = { "branch", "diff" },
    },
    -- If you want to define specific inactive sections:
    -- inactive_sections = {
    --   lualine_a = { "filename" },
    --   lualine_b = {},
    --   lualine_c = { "macro", "searchcount" },
    --   lualine_x = { "location" },
    --   lualine_y = {},
    --   lualine_z = { "progress" },
    -- },
  },
}
