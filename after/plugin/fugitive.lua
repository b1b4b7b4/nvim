vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}
        vim.keymap.set("n", "<leader>p", function()
            vim.cmd.Git('push')
        end, opts)

        -- rebase always
        vim.keymap.set("n", "<leader>P", function()
    -- Prompt the user for a branch name
        vim.ui.input({ prompt = "Enter new branch name: " }, function(branch_name)
                if branch_name and branch_name ~= "" then
                    -- Run Git commands to create and push the branch
                    vim.cmd("Git checkout -b " .. branch_name) -- Create new branch
                    vim.cmd("Git push -u origin " .. branch_name) -- Push branch to origin and set upstream
                else
                    print("Branch name cannot be empty!")
                end
            end)
        end, opts)

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
    end,
})
