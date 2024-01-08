vim.g.netrw_bufsettings = "noma nomod nowrap ro nobl nu rnu"
-- nomodified
-- nowrap
-- readonly
-- nobuflisted
-- number
-- relativenumber

-- remap h and <left> to go up a dir
-- remap l and <right> to enter a dir/file
vim.cmd([[
    au FileType netrw nmap <buffer> h -
    au FileType netrw nmap <buffer> <left> -
    au FileType netrw nmap <buffer> l <CR>
    au FileType netrw nmap <buffer> <right> <CR>
]])

--[[
-- previous attempt to convert these remaps to lua
local autocmd = vim.api.nvim_create_autocmd
autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		vim.keymap.set("n", "h", "-", { buffer = args.buf, noremap = false })
	end,
})
--]]

