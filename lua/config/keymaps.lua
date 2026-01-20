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
    vim.cmd('normal! oconsole.log(structuredClone({ ' .. word .. ' }))')
  elseif filetype == 'go' then
    -- vim.cmd 'normal! yiw'
    vim.cmd('normal! olog.Printf("' .. word .. ': %+v", ' .. word .. ')')
  else
    -- vim.cmd 'normal! yiw'
    vim.cmd 'normal! p'
  end
end

local function lsp_restart()
	vim.cmd ':LspStop'
	vim.defer_fn(function()
		vim.cmd ':LspStart'
	end, 500)
end

vim.keymap.set("n", "<leader>pv", "<cmd>Explore<CR>", { desc = "Explore" })
vim.keymap.set("n", "<leader><leader>", telescopebuiltin.buffers, { desc = "Buffers list" })
vim.keymap.set("n", '<leader>lw', log_word, { desc = 'Log word' })
vim.keymap.set("n", "]g", gs.next_hunk, { desc = "Next git hunk" })
vim.keymap.set("n", "[g", gs.prev_hunk, { desc= "Prev git hunk" })

vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
vim.keymap.set('n', '<leader>ts', "[[:%s/\t/  /g<CR>]", { desc = "Replace tabs with spaces" })

vim.keymap.set('n', '<leader>k', function()
  local diagnostics = vim.diagnostic.get(vim.api.nvim_get_current_buf())
  if not vim.tbl_isempty(diagnostics) then
    vim.diagnostic.open_float(nil, { border = "rounded" })
  else
    vim.notify("No diagnostics available in the current buffer.", vim.log.INFO)
  end
end, { desc = 'Show Floating Diagnostics' })

vim.keymap.set('n', '<leader>lr', lsp_restart, { desc = "Restart LSP" })

vim.keymap.set('n', '<leader>cp', '<cmd>let @+ = expand("%")<CR>', { desc = '[C]opy file [P]ath' })

local function copy_path_with_lines()
  local path = vim.fn.expand("%")
  -- Get current visual selection (works while still in visual mode)
  local start_line = vim.fn.line("v")
  local end_line = vim.fn.line(".")
  -- Ensure start is before end (selection could go upward)
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  local result
  if start_line == end_line then
    result = string.format("@%s:%d", path, start_line)
  else
    result = string.format("@%s:%d-%d", path, start_line, end_line)
  end
  vim.fn.setreg("+", result)
  vim.notify("Copied: " .. result)
end

vim.keymap.set('v', '<leader>cp', copy_path_with_lines, { desc = '[C]opy file [P]ath with lines' })

vim.api.nvim_set_keymap('n', '<leader>U', ':UndotreeToggle<CR>', {
	noremap = true,
	silent = true,
	desc = 'Toggle Undotree',
})
