local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'nvim-tree/nvim-web-devicons'

    -- File Explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Status Line
    use 'nvim-lualine/lualine.nvim'

    -- Bufferline for tabs
    use 'akinsho/bufferline.nvim'

    -- Git Integration
    use 'tpope/vim-fugitive'

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Language Server Protocol (LSP)
    use 'neovim/nvim-lspconfig'

    -- Syntax Highlighting
    --  use 'nvim-treesitter/nvim-treesitter'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use "nvim-lua/plenary.nvim"

    -- Fuzzy Finder
    use {'nvim-telescope/telescope.nvim', tag = '0.1.8', requires = 'nvim-lua/plenary.nvim' }

    use {'ThePrimeagen/harpoon', requires = 'nvim-lua/plenary.nvim' }

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {}
        end
    }

    use { "catppuccin/nvim", as = "catppuccin" }

    use 'junegunn/fzf.vim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

