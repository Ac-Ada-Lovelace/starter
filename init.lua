-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.wrap = true
vim.o.scrolloff = 10
vim.o.virtualedit = "onemore"

-- set a 4 spaces tab
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.autoindent = true
vim.o.smartindent = true

-- vim.o.terminal = "xterm-256color"
vim.o.shell = "/bin/zsh"
