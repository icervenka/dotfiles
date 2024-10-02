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

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- plugin to move from nvim into tmux windows
    use "christoomey/vim-tmux-navigator"

    -- Icons for nvimtree
    use 'nvim-tree/nvim-web-devicons'

    -- File Explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Status Line
    use 'nvim-lualine/lualine.nvim'

    -- Bufferline for tabs
    use 'akinsho/bufferline.nvim'

    -- Git Integration
    use 'tpope/vim-fugitive'

    -- Comment plugin
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Language Server Protocol (LSP)
    use 'neovim/nvim-lspconfig'

    -- Syntax Highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Code completion and snippets
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'

    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"

    -- Plugin for working with R
    use "R-nvim/R.nvim"
    use "R-nvim/cmp-r"
    
    -- Fuzzy finder
    use 'junegunn/fzf.vim'

    -- Various lua functions
    use "nvim-lua/plenary.nvim"

    -- Fuzzy file finder
    use {'nvim-telescope/telescope.nvim', 
        tag = '0.1.8', 
        requires = 'nvim-lua/plenary.nvim' }

    -- Plugin for managing marks
    use 'chentoast/marks.nvim'

    -- Autoclose brackets and other chars
    use 'echasnovski/mini.pairs'

    -- surround text with characters
    use 'echasnovski/mini.surround'

    -- Display indentation levels (useful for python)
    use "lukas-reineke/indent-blankline.nvim"

    -- Display keymap combinations
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {}
        end
    }

    -- Nvim theme
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

