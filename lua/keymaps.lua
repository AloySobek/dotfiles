vim.g.mapleader = ','

vim.keymap.set('i', "kj", "<esc>", { silent = true, noremap = true })
vim.keymap.set('n', 'U', "<C-r>", { silent = true, noremap = true })

vim.keymap.set('n', 'J', '}', { silent = true, noremap = true })
vim.keymap.set('n', 'K', '{', { silent = true, noremap = true })
vim.keymap.set('v', 'J', '}', { silent = true, noremap = true })
vim.keymap.set('v', 'K', '{', { silent = true, noremap = true })
vim.keymap.set('n', 'H', 'b', { silent = true, noremap = true })
vim.keymap.set('n', 'L', 'w', { silent = true, noremap = true })
vim.keymap.set('v', 'H', 'b', { silent = true, noremap = true })
vim.keymap.set('v', 'L', 'w', { silent = true, noremap = true })

vim.keymap.set('v', "<leader>y", '"+y', { noremap = true })
vim.keymap.set('n', "<leader>y", '"+y', { noremap = true })
vim.keymap.set('n', "<leader>Y", '"+yg_', { noremap = true })
vim.keymap.set('n', "<leader>yy", '"+yy', { noremap = true })

vim.keymap.set('v', "<leader>p", '"+p', { noremap = true })
vim.keymap.set('v', "<leader>P", '"+P', { noremap = true })
vim.keymap.set('n', "<leader>p", '"+p', { noremap = true })
vim.keymap.set('n', "<leader>P", '"+P', { noremap = true })

vim.keymap.set('n', "<leader>r", ":%s/\\<<C-r><C-w>\\>//g<left><left>", { noremap = true })
