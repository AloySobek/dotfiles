require("options")
require("keymaps")
require("plugins")

-- Auto format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Theme
require("nightfox").setup({ options = { transparent = true } })
