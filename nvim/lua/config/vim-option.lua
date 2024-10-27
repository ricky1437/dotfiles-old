local opt = vim.opt

opt.termguicolors = true
opt.number = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.ignorecase = true
opt.smartcase = true
opt.wrap = true
opt.spell = true
opt.title = true
opt.titlestring = [[%t – %{fnamemodify(getcwd(), ':t')}]]
