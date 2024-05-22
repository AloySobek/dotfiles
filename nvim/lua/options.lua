vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.opt.signcolumn = "yes"
vim.opt.undofile = true
vim.opt.undodir = vim.env.HOME .. "/.vim/undodir"
vim.opt.undolevels = 2048
vim.opt.undoreload = 16384
vim.opt.wrap = false

vim.cmd("highlight clear SignColumn")
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
