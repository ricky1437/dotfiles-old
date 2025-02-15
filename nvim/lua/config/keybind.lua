-- Telescope
local builtin = require('telescope.builtin')
local utils = require('telescope.utils')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Telescope file browser
vim.keymap.set("n", "<space>fe", function()
	require("telescope").extensions.file_browser.file_browser({cwd = utils.buffer_dir() })
end)

-- Telescope frecency
vim.keymap.set('n', '<leader>fr', "<cmd>Telescope frecency<CR>")

-- neo-tree
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle right<CR>')

-- toggleterm & lazygit
vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>LazyGit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>ToggleTerm direction=float<CR>", { noremap = true, silent = true })

-- diagnostic hover
vim.keymap.set("n", "<leader>sd", function()
    vim.diagnostic.open_float()
end)
