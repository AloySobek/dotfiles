require("options")
require("keymaps")
require("plugins")

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

