vim.opt.tgc = true -- Enable true color support
-- vim.cmd.colorscheme("catppuccin")

vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 1

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 6
vim.opt.scroll = 10

vim.opt.shell = "/bin/zsh"
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.linebreak = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.wrap = true -- No Wrap lines
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.o.clipboard = "unnamedplus"

vim.opt.swapfile = false

-- Setting timeout to type something
vim.opt.timeoutlen = 50

-- Text width and wrap lines
vim.opt.textwidth = 120
-- vim.opt.colorcolumn = "80"

vim.g.lazyvim_picker = "snacks"
vim.g.lazyvim_cmp = "blink.cmp"
