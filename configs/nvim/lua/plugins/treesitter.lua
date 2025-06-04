return {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
        require('nvim-treesitter.configs').setup {
            highlight = {
                enable = true,
            },
        }
    end,
}

