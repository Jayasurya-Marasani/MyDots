-- Map 'jk' to Escape in insert mode
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- Buffer navigation
vim.keymap.set('n', '<leader>n', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>p', ':bprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>x', ':bd<CR>', { noremap = true, silent = true })
-- Exit terminal mode with jk
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { noremap = true })

-- Open terminal in vertical split
vim.keymap.set('n', '<leader>t', ':vsplit | terminal<CR>', { noremap = true })

-- File splits
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { noremap = true, silent = true })  -- Vertical split
vim.keymap.set('n', '<leader>sh', ':split<CR>', { noremap = true, silent = true })   -- Horizontal split

-- Shifting between File Splits panes
vim.keymap.set('n', '<leader>h', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<leader>j', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<leader>k', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<leader>l', '<C-w>l', { noremap = true })

-- which key keymap
vim.keymap.set('n', '<leader>?', '<cmd>WhichKey<CR>', { desc = "Show which-key popup" })
