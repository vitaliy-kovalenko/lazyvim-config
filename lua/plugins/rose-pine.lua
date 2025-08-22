return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine")
		vim.cmd([[
			highlight Normal guibg=NONE ctermbg=NONE
			highlight NormalNC guibg=NONE ctermbg=NONE
			highlight NvimTreeNormal guibg=NONE ctermbg=NONE
			highlight SignColumn guibg=NONE ctermbg=NONE
			highlight MsgArea guibg=NONE ctermbg=NONE
		]])
		require('rose-pine').setup({
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		})
	end
}
