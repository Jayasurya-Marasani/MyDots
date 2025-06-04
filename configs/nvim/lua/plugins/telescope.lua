return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",  -- Add this dependency
    },
    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')

        telescope.setup {
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {}
                },
            },
        }

        telescope.load_extension("ui-select")  -- Load the extension

        vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true, silent = true })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { noremap = true, silent = true })
    end,
}

