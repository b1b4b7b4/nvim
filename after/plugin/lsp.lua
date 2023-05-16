local lsp = require("lsp-zero")
local cmp = require("cmp")
local cmp_action = require('lsp-zero').cmp_action()

lsp.preset("recommended")

lsp.ensure_installed({ 'tsserver', 'lua_ls', 'html', "clangd" })

lsp.set_preferences({
    sign_icons = {}
})



lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    lsp.buffer_autoformat()

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader><leader>", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


-- complete suggestion
-- enable fukcgin snippets wtf

require('luasnip.loaders.from_vscode').lazy_load()
cmp.setup({
    -- sources = {
    --     { name = 'nvim_lsp' },
    --     { name = 'luasnip' },
    -- },
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }
})


lsp.setup()
