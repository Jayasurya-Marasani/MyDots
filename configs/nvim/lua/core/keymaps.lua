-- Map 'jk' to Escape in insert mode
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- Buffer navigation
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bp', ':bprev<CR>', { noremap = true, silent = true })

-- Exit terminal mode with jk
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { noremap = true })

-- Open terminal in vertical split
vim.keymap.set('n', '<leader>t', ':vsplit | terminal<CR>', { noremap = true })

