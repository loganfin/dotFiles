local sets = {
    mouse = "a",

    guicursor = "",

    signcolumn = "yes",

    number = true,
    relativenumber = true,

    splitbelow = true,
    splitright = true,

    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,

    smartindent = true,

    incsearch = true,
    hlsearch = false,

    sidescroll = 1,
    sidescrolloff = 8,
    scrolloff = 8,
    wrap = false,

    showtabline = 2,

    -- allow for flush zoom-in of splits
    winminheight = 0,

    -- because status line displays current mode
    showmode = false
}

for k,v in pairs(sets) do
    vim.opt[k] = v
end
