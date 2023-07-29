vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use {
        "wbthomason/packer.nvim"
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require'nvim-treesitter.configs'.setup {
              highlight = {
                enable = true
              }
            }

            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })

            ts_update()
        end
    }

    use {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.2',
        requires = {{
                "nvim-lua/plenary.nvim"
            }, {
                "nvim-telescope/telescope-fzf-native.nvim",
                run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
            },  {
                "nvim-tree/nvim-web-devicons"
            }
        },
        config = function()
            local actions = require "telescope.actions"

            require('telescope').setup{
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
        requires = {{
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
            require("toggleterm").setup{
                open_mapping = [[<leader>t]],
                direction = "float",
                autochdir = true,
            }
        end
    }

    use {
        "neovim/nvim-lspconfig",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip"
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require('lspconfig')

            local servers = { "clangd" }

            for _, lsp in ipairs(servers) do
              lspconfig[lsp].setup {
                capabilities = capabilities,
              }
            end

            local luasnip = require 'luasnip'

            local cmp = require 'cmp'
            
            cmp.setup {
              snippet = {
                expand = function(args)
                  luasnip.lsp_expand(args.body)
                end,
              },
              mapping = cmp.mapping.preset.insert({
                ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
                ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
                -- C-b (back) C-f (forward) for snippet placeholder navigation.
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm {
                  behavior = cmp.ConfirmBehavior.Replace,
                  select = true,
                },
                ['<Tab>'] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_next_item()
                  elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                  else
                    fallback()
                  end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_prev_item()
                  elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                  else
                    fallback()
                  end
                end, { 'i', 's' }),
              }),
              sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
              },
            }
        end
    }

    use {
        "folke/zen-mode.nvim"
    }

    use {
        "navarasu/onedark.nvim"
    }
end)
