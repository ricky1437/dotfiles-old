-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Telescope file browser
vim.keymap.set("n", "<space>fe", function()
	require("telescope").extensions.file_browser.file_browser()
end)

-- neo-tree
vim.keymap.set('n', '<leader>e', ':Neotree toggle right<CR>')

-- toggleterm & lazygit
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    direction = "float",
    hidden = true
})

function Lazygit_toggle()
    lazygit:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua Lazygit_toggle()<CR>", { noremap = true, silent = true })
