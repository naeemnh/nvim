vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- Encoding
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.relativenumber = true
opt.number = true

-- Tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- Copy indent from current line when starting new one
opt.smartindent = true
opt.breakindent = true

opt.wrap = false

-- Search settings
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- If you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- Turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- Colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- Show sign column so that text doesn't shift

-- Backspace
opt.backspace = "indent,eol,start" -- Allow backspace on indent, end of line or insert mode start position

-- Clipboard
opt.clipboard:append("unnamedplus") -- Use system clipboard as default register

-- Split windows
opt.splitright = true -- Split vertical window to the right
opt.splitbelow = true -- Split horizontal window to the bottom

-- Turn off swapfile
opt.swapfile = false

-- Window options
opt.title = true
opt.expandtab = true
opt.smarttab = true

-- Command options
opt.showcmd = true
opt.inccommand = "split"
opt.cmdheight = 1
opt.laststatus = 2

opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
