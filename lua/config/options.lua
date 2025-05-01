-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set transparent background
vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight NvimTreeNormal guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight MsgArea guibg=NONE ctermbg=NONE
]])

vim.g.autoformat = false

vim.opt.list = true -- Enable the display of listchars
vim.opt.listchars = {
  tab = ' _',       -- Show tabs as '> ' (you might prefer '>-' or similar)
  trail = '-',      -- Show trailing spaces as '-'
  space = '.',      -- Show spaces as '·' (a middle dot)
  nbsp = '+'        -- Show non-breaking spaces as '+'
}

vim.opt.expandtab = false -- Use real tabs
vim.opt.tabstop = 2       -- Visual width of a tab (e.g., 4 spaces)
vim.opt.shiftwidth = 2    -- Indentation width
vim.opt.softtabstop = 2   -- Optional: Tab key behavior (see explanation above)

vim.opt.showtabline = 0

vim.opt.colorcolumn = "100,120"
vim.opt.wrap = true      -- Enable soft wrapping
vim.opt.linebreak = true -- Break lines at word boundaries for better readability
-- vim.opt.whichwrap:append("<>[]{}()") -- Allow cursor keys to wrap to the next/previous line when at the end of a line.
