return {
	"iamcco/markdown-preview.nvim",
	config = function()
		vim.keymap.set("n", "<leader>mt>", vim.cmd.MarkdownPreviewToggle)
	end,
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	build = "cd app && npm install",
	ft = { "markdown" },
}
