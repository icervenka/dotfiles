
require('nvim-tree').setup()

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'material',
    section_separators = '',
    component_separators = ''
  }
}

local lspconfig = require'lspconfig'
lspconfig.pyright.setup{}  -- Example for Python LSP

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
  highlight = {
    enable = true,
  },
}

local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' }
  }
})

require("catppuccin").setup({
    flavour = "mocha",
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin-mocha"
