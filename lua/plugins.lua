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
        config = function()
            require"lspconfig".clangd.setup{}
        end
    }

    use {
        "folke/zen-mode.nvim"
    }

    use {
        "navarasu/onedark.nvim"
    }
end)
