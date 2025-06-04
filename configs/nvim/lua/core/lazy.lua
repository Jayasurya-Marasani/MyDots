local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "plugins.colorscheme" },
    { import = "plugins.lualine" },
    { import = "plugins.telescope" },
    { import = "plugins.treesitter" },
    { import = "plugins.neotree" },
    { import = "plugins.lsp-config" },
    { import = "plugins.gitsigns" },
    { import = "plugins.web-devicons" },
    { import = "plugins.comment" },
    { import = "plugins.autopairs" },
    { import = "plugins.which-key" },
    { import = "plugins.surround" },
    { import = "plugins.dashboard" },
})

