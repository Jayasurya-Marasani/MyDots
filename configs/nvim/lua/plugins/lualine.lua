return {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
        require("lualine").setup {
            options = {
                theme = "tokyonight",
                section_separators = '',
                component_separators = '',
            },
        }
    end,
}

