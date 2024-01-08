return {
	"folke/trouble.nvim",
	opts = {
		height = 15,
		fold_open = "▼",
		fold_closed = "▶",
		icons = false,
		use_diagnostic_signs = true,

		vim.keymap.set("n", "<leader>xx", function(opts)
			require("trouble").toggle(opts)
		end),
	},
}
