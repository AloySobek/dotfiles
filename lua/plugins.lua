vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use {
        "wbthomason/packer.nvim"
    }

    use {
        "navarasu/onedark.nvim"
    }

    use {
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("nvim-tree").setup()
        end
    }

    use {
        "nvim-lua/plenary.nvim"
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
        "neovim/nvim-lspconfig"
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }

    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    }

    use {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.2',
    }

    use {
        "jose-elias-alvarez/null-ls.nvim"
    }

    use {
        "folke/zen-mode.nvim"
    }

end)
