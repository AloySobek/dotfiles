vim.g.mapleader = ','

vim.keymap.set('i', "kj", "<esc>", {silent = true, noremap = true})

vim.keymap.set('n', 'J', '}', {silent = true, noremap = true})
vim.keymap.set('n', 'K', '{', {silent = true, noremap = true})
vim.keymap.set('v', 'J', '}', {silent = true, noremap = true})
vim.keymap.set('v', 'K', '}', {silent = true, noremap = true})
vim.keymap.set('n', 'H', 'b', {silent = true, noremap = true})
vim.keymap.set('n', 'L', 'w', {silent = true, noremap = true})
vim.keymap.set('v', 'H', 'b', {silent = true, noremap = true})
vim.keymap.set('v', 'L', 'w', {silent = true, noremap = true})

vim.keymap.set('n', "<leader>z", ":ZenMode<cr>", {silent = true , noremap = true})

vim.keymap.set('n', "<leader>ff", ":Telescope find_files<cr>", {noremap = true})
vim.keymap.set('n', "<leader>fg", ":Telescope live_grep<cr>", {noremap = true})
vim.keymap.set('n', "<leader>fb", ":Telescope buffers<cr>", {noremap = true})
vim.keymap.set('n', "<leader>fh", ":Telescope help_tags<cr>", {noremap = true})
vim.keymap.set('n', "<leader>fm", ":Telescope man_pages<cr>", {noremap = true})

vim.keymap.set('n', "<leader>e", ":NvimTreeToggle<CR>", {noremap = true})
