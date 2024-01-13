local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require "nvim-treesitter.configs".setup({
                ensure_installed = { 'c', "lua", "query", "vim", "vimdoc", "cpp", "ocaml", "go" },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                }
            })
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build =
                "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
            },
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            local actions = require "telescope.actions"

            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<leader>f"] = actions.close,
                            ["<leader>g"] = actions.close,
                            ["<leader>b"] = actions.close,
                            ["<leader>h"] = actions.close,
                            ["<leader>m"] = actions.close,
                            ["<leader>e"] = actions.close
                        },
                        n = {
                            ["<leader>f"] = actions.close,
                            ["<leader>g"] = actions.close,
                            ["<leader>b"] = actions.close,
                            ["<leader>h"] = actions.close,
                            ["<leader>m"] = actions.close,
                            ["<leader>e"] = actions.close,

                            ["<leader>ov"] = actions.select_vertical,
                            ["<leader>oh"] = actions.select_horizontal
                        }
                    }
                }
            })

            vim.keymap.set('n', "<leader>f", ":Telescope find_files<cr>", { noremap = true, silent = true })
            vim.keymap.set('n', "<leader>g", ":Telescope live_grep<cr>", { noremap = true, silent = true })
            vim.keymap.set('n', "<leader>b", ":Telescope buffers<cr>", { noremap = true, silent = true })
            vim.keymap.set('n', "<leader>h", ":Telescope help_tags<cr>", { noremap = true, silent = true })
            vim.keymap.set('n', "<leader>m", ":Telescope man_pages<cr>", { noremap = true, silent = true })
        end
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("telescope").setup {
                extensions = {
                    file_browser = {
                        hijack_netrw = true
                    }
                }
            }

            require("telescope").load_extension("file_browser")

            vim.keymap.set('n', "<leader>e", ":Telescope file_browser path=%:p:h<CR>", { noremap = true, silent = true })
            vim.keymap.set('n', "<leader>E", ":Telescope file_browser<CR>", { noremap = true, silent = true })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip"
        },
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions",
                callback = function()
                    local bufmap = function(mode, lhs, rhs)
                        local opts = { buffer = true }
                        vim.keymap.set(mode, lhs, rhs, opts)
                    end

                    -- Displays hover information about the symbol under the cursor
                    bufmap('n', "<leader>s", "<cmd>lua vim.lsp.buf.hover()<cr>")

                    -- Jump to the definition
                    bufmap('n', "<leader>j", "<cmd>lua vim.lsp.buf.definition()<cr>")

                    -- Jump to declaration
                    bufmap('n', "<leader>J", "<cmd>lua vim.lsp.buf.declaration()<cr>")

                    -- Show diagnostics in a floating window
                    bufmap('n', "<leader>d", "<cmd>lua vim.diagnostic.open_float()<cr>")

                    -- Lists all the references
                    -- bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

                    -- Renames all references to the symbol under the cursor
                    -- bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

                    -- Move to the previous diagnostic
                    -- bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

                    -- Move to the next diagnostic
                    -- bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

                    -- Lists all the implementations for the symbol under the cursor
                    -- bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

                    -- Jumps to the definition of the type symbol
                    -- bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

                    -- Displays a function's signature information
                    -- bufmap('n', '<leader>S', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

                    -- Selects a code action available at the current cursor position
                    -- bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
                    -- bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
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
            lspconfig.lua_ls.setup({})
            lspconfig.ocamllsp.setup({})
            lspconfig.gopls.setup({})

            local cmp = require("cmp")
            local luasnip = require("luasnip")

            local select_opts = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                sources = {
                    { name = "path" },
                    { name = "nvim_lsp", keyword_length = 1 },
                    { name = "luasnip",  keyword_length = 2 },
                    { name = "buffer",   keyword_length = 3 },
                },
                window = {
                    documentation = cmp.config.window.bordered()
                },
                formatting = {
                    fields = { "menu", "abbr", "kind" },
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
                    -- ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
                    -- ['<Down>'] = cmp.mapping.select_next_item(select_opts),

                    -- ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
                    -- ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

                    -- ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    -- ['<C-d>'] = cmp.mapping.scroll_docs(4),

                    -- ['<C-e>'] = cmp.mapping.abort(),
                    -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),

                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
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
    },
    {
        "akinsho/toggleterm.nvim",
        version = '*',
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<leader>t]],
                direction = "float",
                autochdir = true,
            })

            vim.api.nvim_set_keymap('t', "kj", [[<C-\><C-n>]], { noremap = true, silent = true })
        end
    },
    {
        "folke/zen-mode.nvim",
        config = function()
            vim.keymap.set('n', "<leader>z", ":ZenMode<cr>", { noremap = true, silent = true })
        end

    },
    {
        "EdenEast/nightfox.nvim",
        config = function()
            require("nightfox").setup({ options = { transparent = true } })

            vim.cmd("colorscheme carbonfox")
        end
    }
})
