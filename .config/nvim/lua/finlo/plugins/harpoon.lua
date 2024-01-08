return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({
			-- save the list when window closes
			settings = {
				save_on_toggle = true,
			},
		})

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():append()
		end)

		vim.keymap.set("n", "<leader>he", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		for i = 1, 5 do
			vim.keymap.set("n", string.format("<leader>%s", i), function()
				harpoon:list():select(i)
			end)
		end
	end,
}
