return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		local function is_deno_project()
			local root = vim.fs.root(0, { "deno.json", "deno.jsonc", "deno.lock" })
			return root ~= nil
		end

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" },
				javascript = function()
					return is_deno_project() and { "deno_fmt" } or { "prettier" }
				end,
				typescript = function()
					return is_deno_project() and { "deno_fmt" } or { "prettier" }
				end,
				javascriptreact = function()
					return is_deno_project() and { "deno_fmt" } or { "prettier" }
				end,
				typescriptreact = function()
					return is_deno_project() and { "deno_fmt" } or { "prettier" }
				end,
				json = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range" })
	end,
}
