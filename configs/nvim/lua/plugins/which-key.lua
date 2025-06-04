return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup {
      triggers = {},  -- disables ALL automatic popups, including on <leader>
    }
  end,
}

