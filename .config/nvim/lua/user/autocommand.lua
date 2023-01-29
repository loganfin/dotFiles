local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

--augroup("HighlightExtraWhitespace", {})

vim.cmd [[
    autocmd BufRead,BufNewFile *.htm,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2
]]
