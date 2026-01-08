return {
	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				columns = {
					"icon",
					"permissions",
					"size",
					"mtime",
				},
				delete_to_trash = true,
				view_options = {
					show_hidden = true,
				},
				win_options = {
					signcolumn = "yes:2",
				},
			})

			vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory using oil.nvim" })
		end,
	},

	{
		"refractalize/oil-git-status.nvim",
		dependencies = { "stevearc/oil.nvim" },
		config = true,
	},
}
