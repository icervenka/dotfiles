-- vim.cmd("let g:netrw_liststyle = 3")
-- disable netrw at the very start of your init.lua
-- set termguicolors
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

-- General settings
opt.number = true             -- Show line numbers
opt.relativenumber = true     -- Show relative line numbers
opt.hlsearch = true           -- Highlight search results
opt.incsearch = true          -- Incremental search
opt.ignorecase = true         -- Ignore case in search patterns
opt.smartcase = true          -- Override ignorecase if search contains uppercase
opt.hidden = true             -- Enable background buffers
opt.errorbells = false        -- Disable error bells
opt.wrap = false              -- Disable line wrapping
opt.scrolloff = 8             -- Minimum number of screen lines to keep above and below the cursor
opt.sidescrolloff = 8         -- Minimum number of screen columns to keep to the left and right of the cursor
opt.backup = false            -- Disable backup file creation
opt.writebackup = false       -- Disable backup before overwriting a file
opt.swapfile = false          -- Disable swap file creation
opt.undofile = true           -- Enable persistent undo
opt.backspace = "indent,eol,start"

-- Appearance settings
opt.termguicolors = true      -- Enable true color support
opt.cursorline = true         -- Highlight the current line
opt.colorcolumn = "80,120"    -- Show a vertical line at column 80
opt.signcolumn = "yes"        -- Always show the sign column to avoid text shifting

-- Tab and indentation settings
opt.tabstop = 4               -- Number of spaces a tab counts for
opt.softtabstop = 4           -- Number of spaces for editing
opt.shiftwidth = 4            -- Number of spaces to use for each step of (auto)indent
opt.expandtab = true          -- Use spaces instead of tabs
opt.autoindent = true         -- Copy indent from current line when starting a new line
opt.smartindent = true        -- Smart auto-indentation

-- Split window settings
opt.splitright = true         -- Vertical splits to the right
opt.splitbelow = true         -- Horizontal splits below

-- File encoding
opt.fileencoding = "utf-8"    -- The encoding written to file

-- Mouse support
opt.mouse = "a"               -- Enable mouse support

-- Clipboard
opt.clipboard:append("unnamedplus") -- Use system clipboard

opt.undofile = true
opt.undolevels = 10000


