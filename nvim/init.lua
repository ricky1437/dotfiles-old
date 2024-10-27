vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.g.mapleader = " "
vim.g.maplocalleader = "<Space>"

require("config.vim-option")
require("config.lazy")
require("config.lsp")
require("config.keybind")

vim.cmd[[colorscheme onedark]]
