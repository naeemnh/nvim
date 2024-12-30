vim.g.mapleader = " "

local map = vim.keymap.set -- For conciseness

map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
map("n", "<leader><leader>", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>li", "<cmd>Lazy<CR>", { desc = "Lazy Installer" })
map("n", "<leader>q", "<cmd>q<CR>")

map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment/Decrement Numbers
map("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- Increment
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- Decrement

-- Window Management
map("n", "sv", "<C-w>v", { desc = "Split window vertically" }) -- Split window vertically
map("n", "ss", "<C-w>s", { desc = "Split window horizontally" }) -- Split window horizontally
map("n", "se", "<C-w>=", { desc = "Make splits equal size" }) -- Make split windows equal width & height
map("n", "sx", "<cmd>close<CR>", { desc = "Close current split" }) -- Close current split window
map("n", "sh", "<C-w>h")
map("n", "sj", "<C-w>j")
map("n", "sk", "<C-w>k")
map("n", "sl", "<C-w>l")

-- Tab Management
map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- Open new tab
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- Close current tab
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  Go to next tab
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  Go to previous tab
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  Move current buffer to new tab

-- Moving single line
-- WinOS
map("n", "<A-w>", "<cmd>m -2<CR>", { desc = "Move line up" })
map("n", "<A-s>", "<cmd>m +1<CR>", { desc = "Move line down" })
map("v", "<A-w>", ":m '<-2<CR>gv=gv", { desc = "Move selected line(s) up" })
map("v", "<A-s>", ":m '>+1<CR>gv=gv", { desc = "Move selected line(s) down" })
-- MacOS
map("n", "∑", "<cmd>m -2<CR>", { desc = "Mac: Move line up" })
map("n", "ß", "<cmd>m +1<CR>", { desc = "Mac: Move line down" })
map("v", "∑", ":m '<-2<CR>gv=gv", { desc = "Mac: Move selected line(s) up" })
map("v", "ß", ":m '>+1<CR>gv=gv", { desc = "Mac: Move selected line(s) down" })

-- Duplicate single line
-- WinOS
map("n", "<A-S>", "yyp") -- Duplicate Up
map("n", "<A-W>", "yykp") -- Duplicate Down
-- MacOS
map("n", "„", "yykp") -- Duplicate Up
map("n", "Í", "yyp") -- Duplicate Down

-- Duplicate multiple lines
-- WinOS
-- MacOS

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
