return {
	"sainnhe/everforest",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.everforest_background = "medium"
		vim.g.everforest_transparent_background = 0
		vim.g.everforest_better_performance = 1
		vim.g.everforest_enable_italic = 1
		vim.g.everforest_disable_italic_comment = 0
		vim.g.everforest_diagnostic_text_highlight = 0
		vim.g.everforest_diagnostic_line_hightlight = 0
		vim.g.everforest_diagnostic_virtual_text = "colored"
		vim.cmd([[colorscheme everforest]])
	end,
}
