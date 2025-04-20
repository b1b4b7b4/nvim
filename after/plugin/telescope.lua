require('telescope').setup {
    defaults = {
        file_ignore_patterns = { "node_modules" },
    }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pw', function()
    local word = vim.fn.expand("<cword>")
    builtin.grep_string({ search = word })
end)

-- <C-q> quicklist

-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Telescope live grep' })

-- vim.keymap.set('n', '<leader>ps', function()
--     builtin.grep_string({ search = vim.fn.input("Grep > ") });
-- end)
