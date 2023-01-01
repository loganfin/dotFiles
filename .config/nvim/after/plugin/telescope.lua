local builtin = require('telescope.builtin')

-- use git_files by default and find_files if git_files fails
vim.keymap.set('n', '<leader>pf', function()
    vim.fn.system('git rev-parse --is-inside-work-tree')
    if vim.v.shell_error == 0 then
        builtin.git_files(opts)
    else
        builtin.find_files(opts)
    end
end)

-- builtin grep functionality is dependant upon the rg executable
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
