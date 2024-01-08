return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")

		-- use git_files by default and find_files if git_files fails
		vim.keymap.set("n", "<leader>pf", function()
			vim.fn.system("git rev-parse --is-inside-work-tree")
			if vim.v.shell_error == 0 then
				builtin.git_files()
			else
				builtin.find_files()
			end
		end)

		-- 1. git_files

		vim.keymap.set("n", "<c-p>", builtin.find_files, {})

		-- builtin grep functionality is dependant upon the rg executable
		vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
	end,
}
