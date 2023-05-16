local api = require('nvim-tree.api')
local function my_on_attach(bufnr)
    local api = require('nvim-tree.api')
    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    api.config.mappings.default_on_attach(bufnr)
    -- your removals and mappings go here
    vim.keymap.del('n', '<C-t>', { buffer = bufnr })
end

require("nvim-tree").setup({
    auto_reload_on_write = true,
    disable_netrw = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    root_dirs = {},
    prefer_startup_root = false,
    sync_root_with_cwd = false,
    reload_on_bufenter = false,
    respect_buf_cwd = false,
    on_attach = my_on_attach,
    remove_keymaps = false,
    select_prompts = false,
    update_focused_file = {
        enable = false,
        update_root = false,
        ignore_list = {},
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
        icons = {
            hint = "●",
            info = "●",
            warning = "●",
            error = "●",
        },
    },
    filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
        ignore_dirs = {},
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = false,
        icons = {
            show = {
                file = false,
                folder = true,
                folder_arrow = false,
                git = false,
                modified = true,
            },
            glyphs = {
                modified = "●",
                folder = {
                    default = ">",
                    open = "-",
                    empty = "(empty) >",
                    empty_open = "(empty) -",
                    symlink = ">",
                    symlink_open = "-",
                },
            },
        },
    },
    actions = {
        open_file = {
            quit_on_open = true
        }
    },
    filters = {
        dotfiles = true,
    },
})
