vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use {
        "wbthomason/packer.nvim"
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require "nvim-treesitter.configs".setup {
                ensure_installed = { "c", "cpp", "lua", "ocaml", "vim", "vimdoc" },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                }
            }
        end
    }

    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        requires = { {
            "nvim-lua/plenary.nvim"
        }, {
            "nvim-telescope/telescope-fzf-native.nvim",
            run =
            "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
        }, {
            "nvim-tree/nvim-web-devicons"
        }
        },
        config = function()
            local actions = require "telescope.actions"

            require("telescope").setup {
                defaults = {
                    mappings = {
                        i = {
                            ["<leader>f"] = actions.close,
                            ["<leader>e"] = actions.close
                        },
                        n = {
                            ["<leader>f"] = actions.close,
                            ["<leader>e"] = actions.close,

                            ["<leader>ov"] = actions.select_vertical,
                            ["<leader>oh"] = actions.select_horizontal
                        }
                    }
                }
            }
        end
    }

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { {
            "nvim-lua/plenary.nvim"
        }, {
            "nvim-tree/nvim-web-devicons"
        }
        },
        config = function()
            require("telescope").setup {
                extensions = {
                    file_browser = {
                        hijack_netrw = true
                    }
                }
            }
            require("telescope").load_extension "file_browser"
        end
    }

    use {
        "akinsho/toggleterm.nvim", tag = '*',
        config = function()
            require("toggleterm").setup {
                open_mapping = [[<leader>t]],
                direction = "float",
                autochdir = true,
            }
        end
    }

    use {
        "neovim/nvim-lspconfig",
        requires = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip"
        },
        config = function()
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function()
                    local bufmap = function(mode, lhs, rhs)
                        local opts = { buffer = true }
                        vim.keymap.set(mode, lhs, rhs, opts)
                    end

                    -- Displays hover information about the symbol under the cursor
                    bufmap('n', '<leader>s', '<cmd>lua vim.lsp.buf.hover()<cr>')

                    -- Jump to the definition
                    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

                    -- Jump to declaration
                    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

                    -- Lists all the implementations for the symbol under the cursor
                    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

                    -- Jumps to the definition of the type symbol
                    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

                    -- Lists all the references
                    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

                    -- Displays a function's signature information
                    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

                    -- Renames all references to the symbol under the cursor
                    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

                    -- Selects a code action available at the current cursor position
                    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
                    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

                    -- Show diagnostics in a floating window
                    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

                    -- Move to the previous diagnostic
                    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

                    -- Move to the next diagnostic
                    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
                end
            })
            local lspconfig = require("lspconfig")

            local lsp_defaults = lspconfig.util.default_config

            lsp_defaults.capabilities = vim.tbl_deep_extend(
                "force",
                lsp_defaults.capabilities,
                require("cmp_nvim_lsp").default_capabilities()
            )

            lspconfig.clangd.setup({})
            lspconfig.cmake.setup({})
            lspconfig.pylsp.setup({})
            lspconfig.lua_ls.setup({})
            lspconfig.ocamllsp.setup({})

            require('luasnip.loaders.from_vscode').lazy_load()

            local cmp = require('cmp')
            local luasnip = require('luasnip')

            local select_opts = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                sources = {
                    { name = 'path' },
                    { name = 'nvim_lsp', keyword_length = 1 },
                    { name = 'buffer',   keyword_length = 3 },
                    { name = 'luasnip',  keyword_length = 2 },
                },
                window = {
                    documentation = cmp.config.window.bordered()
                },
                formatting = {
                    fields = { 'menu', 'abbr', 'kind' },
                    format = function(entry, item)
                        local menu_icon = {
                            nvim_lsp = 'λ',
                            luasnip = '⋗',
                            buffer = 'Ω',
                            path = '🖫',
                        }

                        item.menu = menu_icon[entry.source.name]
                        return item
                    end,
                },
                mapping = {
                    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
                    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

                    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
                    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),

                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),

                    ['<C-f>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),

                    ['<C-b>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),

                    ["<Tab>"] = cmp.mapping(
                        function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                            elseif luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                            else
                                fallback()
                            end
                        end,
                        { 'i', 's' }
                    ),
                    ["<S-Tab>"] = cmp.mapping(
                        function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item()
                            elseif luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                            else
                                fallback()
                            end
                        end,
                        { 'i', 's' }
                    ),
                },
            })
        end
    }

    use {
        "folke/zen-mode.nvim"
    }

    use {
        "EdenEast/nightfox.nvim",

        config = function()
            vim.cmd("colorscheme carbonfox")
        end
    }
end)
