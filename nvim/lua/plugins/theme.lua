return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato", -- latte, frappe, macchiato, mocha
			lsp_styles = {
				inlay_hints = {
					background = true,
				},
			},
			auto_integrations = true,
			integrations = {
				cmp = true,
			},
		})

		vim.cmd([[colorscheme catppuccin]])
	end,
}
