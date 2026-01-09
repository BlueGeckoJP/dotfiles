return {
	"olimorris/codecompanion.nvim",
	version = "^18.0.0",
	opts = {
		interactions = {
			chat = {
				adapter = {
					name = "copilot",
					model = "haiku-4.5",
				},
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		vim.keymap.set("n", "<leader>ai", "<cmd>CodeCompanionChat<cr>")
		require("codecompanion").setup()
	end,
}
