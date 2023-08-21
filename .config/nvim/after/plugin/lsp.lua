local lsp = require("lsp-zero")

lsp.preset('lsp-compe')

lsp.ensure_installed({
    'clangd',
    'lua_ls',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

--[[
lsp.configure('clangd', {
    cmd = {
        "clangd",
        --'--query-driver="/usr/bin/clang"'
        --'--query-driver="/usr/local/bin/avr-g++"',
        '--query-driver="/usr/local/Cellar/arm-gcc-bin@8/8-2019-q3-update_2/bin/arm-none-eabi-gcc"',
    }
})
--]]

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

-- disabled tab completion
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

local cmp_config = lsp.defaults.cmp_config({
    window = {
        completion = cmp.config.window.bordered()
    },
    enabled = false,
    mapping = cmp_mappings
})

cmp.setup(cmp_config)

--[[
lsp.setup_nvim_cmp({
    completion = {
        autocomplete = false,
    },
    mapping = cmp_mappings
})
--]]

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

-- allow for the enable/disable of completion
vim.keymap.set("n", "<leader>co", function()
    require('cmp').setup.buffer {enabled = true}
    print("completion on")
end)
vim.keymap.set("n", "<leader>cf", function()
    require('cmp').setup.buffer {enabled = false}
    print("completion off")
end)
