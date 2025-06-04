return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "-" },
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local map = function(mode, lhs, rhs, opts)
                    opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
                    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
                end

                -- Navigation
                map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
                map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

                -- Actions
                map("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
                map("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
                map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
            end,
        }
    end,
}

