vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.g.mapleader = " "
vim.g.maplocalleader = "<Space>"

if vim.loop.os_uname().sysname == 'Windows_NT' then
  local pwsh_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
  }

  for k, v in pairs(pwsh_options) do
    vim.opt[k] = v
  end
end

require("config.vim-option")
require("config.lazy")
require("config.lsp")
-- require("config.bufferline")
require("config.keybind")

vim.cmd("language en_US")
-- vim.cmd[[set background=light]]
-- vim.cmd.colorscheme("myowncolorscheme")
vim.cmd("colorscheme mycolorscheme")
