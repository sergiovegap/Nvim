-- Configure Node.js before loading plugins
require("config.nodejs").setup({ silent = true })

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
vim.opt.tabstop = 4      -- A tab is 4 spaces
vim.opt.shiftwidth = 4   -- Indentation is 4 spaces
vim.opt.softtabstop = 4  -- Backspace/indent works like 4 spaces
vim.opt.expandtab = true -- Use spaces instead of tabs

-- Hot reload
vim.opt.autoread = true