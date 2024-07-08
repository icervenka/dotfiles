-- Tab and indentation settings
local opt = vim.opt

opt.tabstop = 2               -- Number of spaces a tab counts for
opt.softtabstop = 2           -- Number of spaces for editing
opt.shiftwidth = 2            -- Number of spaces to use for each step of (auto)indent

-- Keybindings
vim.keymap.set('i', '<M-i>', ' <- ', { buffer = 0 })
vim.keymap.set('i', '<M-p>', ' %>%', { buffer = 0 })

-- Indentation
-- Don't align indentation of function args on new line with opening `(`
vim.g.r_indent_align_args = 0
