vim.g.mapleader = " "

local map = vim.keymap.set -- for conciseness

map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
map("n", "<leader><leader>", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>li", "<cmd>Lazy<CR>", { desc = "Lazy Installer" })
map("n", "<leader>q", "<cmd>q<CR>")

map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment/Decrement Numbers
map("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- Window Management
map("n", "sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
map("n", "ss", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
map("n", "se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map("n", "sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
map("n", "sh", "<C-w>h")
map("n", "sj", "<C-w>j")
map("n", "sk", "<C-w>k")
map("n", "sl", "<C-w>l")

-- Tab Management
map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Moving single line (Does not work om MacOS)
map("n", "<A-w>", "<cmd>m -2<CR>", { desc = "Move line up" })
map("n", "<A-s>", "<cmd>m +1<CR>", { desc = "Move line down" })
-- MacOS
map("n", "ß", "<cmd>m -2<CR>", { desc = "Mac: Move line up" })
map("n", "∑", "<cmd>m +1<CR>", { desc = "Mac: Move line down" })

-- Duplicate single line
map("n", "<A-S>", "yyp")
map("n", "<A-W>", "yykp")
-- MacOS
map("n", "Í", "yyp")
map("n", "„", "yykp")

-- Delete line without adding to register
map("n", "dd", '"_dd')

-- View Motions
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page down" })
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Git
map("n", "<leader>gp", ":LazyGit<cr>", { desc = "Git [P]ane" })
map("n", "<leader>gl", ":LazyGitFilter<cr>", { desc = "Git [L]og" })
