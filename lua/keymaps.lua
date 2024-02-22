vim.g.mapleader = ','

vim.keymap.set('i', "kj", "<esc>", { noremap = true, silent = true })
vim.keymap.set('n', 'U', "<C-r>", { noremap = true, silent = true })

vim.keymap.set('n', 'J', '}', { noremap = true, silent = true })
vim.keymap.set('n', 'K', '{', { noremap = true, silent = true })
vim.keymap.set('v', 'J', '}', { noremap = true, silent = true })
vim.keymap.set('v', 'K', '{', { noremap = true, silent = true })
vim.keymap.set('n', 'H', 'b', { noremap = true, silent = true })
vim.keymap.set('n', 'L', 'w', { noremap = true, silent = true })
vim.keymap.set('v', 'H', 'b', { noremap = true, silent = true })
vim.keymap.set('v', 'L', 'w', { noremap = true, silent = true })

vim.keymap.set('v', "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set('n', "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set('n', "<leader>Y", '"+yg_', { noremap = true, silent = true })
vim.keymap.set('n', "<leader>yy", '"+yy', { noremap = true, silent = true })

vim.keymap.set('v', "<leader>p", '"+p', { noremap = true, silent = true })
vim.keymap.set('v', "<leader>P", '"+P', { noremap = true, silent = true })
vim.keymap.set('n', "<leader>p", '"+p', { noremap = true, silent = true })
vim.keymap.set('n', "<leader>P", '"+P', { noremap = true, silent = true })

vim.keymap.set('n', "<BS>", "<C-6>", { noremap = true, silent = true })
