return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-project.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").setup{
        extensions = {
          project = {
            base_dirs = {
              "~/DATA",        -- your main projects folder
              -- "~/work",            -- maybe you keep work repos here
              -- "~/some/other/path", -- add as many as you want
            },
            hidden_files = true,    -- show hidden files in projects (like .git)
          },
        },
      }
      require("telescope").load_extension("project")

      -- keymap to open project picker
      vim.api.nvim_set_keymap(
        "n",
        "<leader>z",
        "<cmd>Telescope project<CR>",
        { noremap = true, silent = true }
      )
    end,
  },
}
