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
-- vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
