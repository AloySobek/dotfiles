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

vim.keymap.set('n', "<leader>z", ":ZenMode<cr>", { silent = true, noremap = true })

vim.keymap.set('n', "<leader>ff", ":Telescope find_files<cr>", { noremap = true })
vim.keymap.set('n', "<leader>fg", ":Telescope live_grep<cr>", { noremap = true })
vim.keymap.set('n', "<leader>fb", ":Telescope buffers<cr>", { noremap = true })
vim.keymap.set('n', "<leader>fh", ":Telescope help_tags<cr>", { noremap = true })
vim.keymap.set('n', "<leader>fm", ":Telescope man_pages<cr>", { noremap = true })

vim.keymap.set('n', "<leader>e", ":Telescope file_browser path=%:p:h<CR>", { noremap = true })
vim.keymap.set('n', "<leader>E", ":Telescope file_browser<CR>", { noremap = true })

vim.keymap.set('n', "<leader>r", ":%s/\\<<C-r><C-w>\\>//g<left><left>", { noremap = true })

vim.keymap.set('v', "<leader>y", '"+y', { noremap = true })
vim.keymap.set('n', "<leader>y", '"+y', { noremap = true })
vim.keymap.set('n', "<leader>Y", '"+yg_', { noremap = true })
vim.keymap.set('n', "<leader>yy", '"+yy', { noremap = true })

vim.keymap.set('v', "<leader>p", '"+p', { noremap = true })
vim.keymap.set('v', "<leader>P", '"+P', { noremap = true })
vim.keymap.set('n', "<leader>p", '"+p', { noremap = true })
vim.keymap.set('n', "<leader>P", '"+P', { noremap = true })
