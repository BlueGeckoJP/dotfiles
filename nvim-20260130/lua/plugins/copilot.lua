return {
	{
		"zbirenbaum/copilot.lua",
		dependencies = {
			"copilotlsp-nvim/copilot-lsp",
			config = function()
				vim.g.copilot_nes_debounce = 500
			end,
		},
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				nes = {
					enabled = true,
					keymap = {
						accept_and_goto = "<leader>p",
						accept = false,
						dismiss = "<Esc>",
					},
				},
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},

	{
		"zbirenbaum/copilot-cmp",
		event = { "InsertEnter", "LspAttach" },
		fix_repairs = true,
		config = function()
			require("copilot_cmp").setup()
		end,
	},

	{
		"AndreM222/copilot-lualine",
	},
}
