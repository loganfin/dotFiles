require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "c", "cpp", "lua", "rust" },
    -- Automatically install missing parsers when entering buffer
    auto_install = true,
    ignore_install = { "" },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = false,
    },
}
