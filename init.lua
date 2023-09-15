require("options")
require("keymaps")
require("plugins")

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

require("nightfox").setup({ options = { transparent = true } })
