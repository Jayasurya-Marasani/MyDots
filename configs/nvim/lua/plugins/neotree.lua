return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            enable_git_status = true,
            enable_diagnostics = true,
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = true,
                },
            },
            window = {
                position = "right",
                width = 40,
            },
        })

        -- Toggle Neo-tree
        vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })

        -- Toggle focus Neo-tree
        vim.keymap.set('n', '<leader>o', function()
            local neotree_win = nil
            for _, win in ipairs(vim.api.nvim_list_wins()) do
                local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
                if bufname:match("neo%-tree") then
                    neotree_win = win
                    break
                end
            end

            if neotree_win then
                if vim.api.nvim_get_current_win() == neotree_win then
                    vim.cmd("wincmd p")
                else
                    vim.api.nvim_set_current_win(neotree_win)
                end
            else
                vim.cmd("Neotree toggle")
            end
        end, { noremap = true, silent = true })
    end,
}

