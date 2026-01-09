return {
	"Isrothy/neominimap.nvim",
	version = "v3.x.x",
	lazy = false,
	keys = {
		{ "<leader>mm", "<cmd>Neominimap Toggle<cr>", desc = "Toggle Neominimap " },
	},
	init = function()
		vim.opt.wrap = false
		vim.opt.sidescrolloff = 36

		vim.g.neominimap = {
			auto_enable = true,
		}
	end,
}
