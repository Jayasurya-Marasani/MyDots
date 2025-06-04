return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- Common on_attach function to map keys after LSP attaches to buffer
            local on_attach = function(client, bufnr)
                local opts = { noremap=true, silent=true, buffer=bufnr }

                local buf_set_keymap = function(mode, lhs, rhs)
                    vim.keymap.set(mode, lhs, rhs, opts)
                end

                -- LSP-related keymaps
                buf_set_keymap("n", "gd", vim.lsp.buf.definition)            -- Go to definition
                buf_set_keymap("n", "K", vim.lsp.buf.hover)                  -- Hover documentation
                buf_set_keymap("n", "gi", vim.lsp.buf.implementation)        -- Go to implementation
                buf_set_keymap("n", "<leader>rn", vim.lsp.buf.rename)        -- Rename symbol
                buf_set_keymap("n", "<leader>ca", vim.lsp.buf.code_action)   -- Code actions
                buf_set_keymap("n", "gr", vim.lsp.buf.references)            -- References
                buf_set_keymap("n", "[d", vim.diagnostic.goto_prev)          -- Previous diagnostic
                buf_set_keymap("n", "]d", vim.diagnostic.goto_next)          -- Next diagnostic
                buf_set_keymap("n", "<leader>q", vim.diagnostic.setloclist)  -- Diagnostics list
                buf_set_keymap("n", "<leader>f", function()                  -- Format buffer
                    vim.lsp.buf.format { async = true }
                end)
            end

            -- Setup servers with the on_attach function
            local servers = {
                "lua_ls",
                "pyright",
                "clangd",
                "jdtls",
                "rust_analyzer",
                "ts_ls",  -- For Mason, still use "tsserver"
            }

            for _, server in ipairs(servers) do
                lspconfig[server].setup {
                    on_attach = on_attach,
                    -- You can add per-server settings here if needed
                }
            end
        end,
    },

    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "clangd",
                    "jdtls",
                    "rust_analyzer",
                    "ts_ls",
                },
                automatic_installation = true,
            })
        end,
    },
}
