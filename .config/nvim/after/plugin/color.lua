vim.cmd.colorscheme("gruvbox")
vim.g.gruvbox_contrast_dark = "hard"
vim.opt.background = "dark"

-- set the sign column to be transparent
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

-- highlight trailing whitespace
vim.cmd([[
    highlight ExtraWhitespace ctermbg=240 guibg=#FFD9D9
    match ExtraWhitespace /\s\+$/
    au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    au InsertLeave * match ExtraWhitespace /\s\+$/
]])
