require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "javascript", "typescript", "c", "cpp", "lua" },
    sync_install = true,
    auto_install = false,
    autotag = {
        enable = true,
        filetypes = { "html", "xml", "typescriptreact" },
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

