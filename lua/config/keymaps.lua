-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local telescopebuiltin = require("telescope.builtin")
local gs = require("gitsigns")
local function log_word()
  local word = vim.fn.expand '<cword>'
  local filetype = vim.bo.filetype

  if filetype:match 'javascript' or filetype:match 'typescript' or filetype:match 'vue' then
    -- vim.cmd 'normal! yiw'
    vim.cmd('normal! oconsole.log({ ' .. word .. ' })')
  elseif filetype == 'go' then
    -- vim.cmd 'normal! yiw'
    vim.cmd('normal! olog.Printf("' .. word .. ': %+v", ' .. word .. ')')
  else
    -- vim.cmd 'normal! yiw'
    vim.cmd 'normal! p'
  end
end

vim.keymap.set("n", "<leader>pv", "<cmd>Explore<CR>", { desc = "Explore" })
vim.keymap.set("n", "<leader><leader>", telescopebuiltin.buffers, { desc = "Buffers list" })
vim.keymap.set("n", '<leader>lw', log_word, { desc = 'Log word' })
vim.keymap.set("n", "]g", gs.next_hunk, { desc = "Next git hunk" })
vim.keymap.set("n", "[g", gs.prev_hunk, { desc= "Prev git hunk" })

vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
vim.keymap.set('n', '<leader>ts', "[[:%s/\t/  /g<CR>]", { desc = "Replace tabs with spaces" })
