local opt = vim.opt

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.number = true
opt.relativenumber = true

opt.title = true
opt.expandtab = true
opt.smarttab = true

opt.autoindent = true
opt.smartindent = true
opt.breakindent = true
opt.shiftwidth = 2
opt.breakat = "80"
opt.linebreak = true

opt.foldcolumn = '1'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

opt.hlsearch = true

opt.backup = false
opt.swapfile = false

opt.showcmd = true
opt.inccommand = "split"
opt.cmdheight = 1
opt.laststatus = 2

opt.ignorecase = true
opt.smartcase = true
opt.tabstop = 2
opt.hidden = true
opt.wrap = true
opt.backspace = { "start", "eol", "indent" }
opt.ruler = true

opt.path:append({ "**" }) -- Finding files - Search down into subfolders
opt.wildignore:append({ "*/node_modules/*" })

opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "cursor"

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m]"]])
vim.cmd([[let &t_Cs = "\e[4:0m]"]])

opt.background = "dark"
opt.termguicolors = true

opt.signcolumn = "yes"
opt.scrolloff = 8
opt.updatetime = 50
opt.colorcolumn = "80"
