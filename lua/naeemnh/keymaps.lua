vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<leader>q", function() vim.cmd("q") end)					-- Exit Vim
map("n", "<leader>e", function() vim.cmd("Ex") end)					-- Explorer
map("n", "<leader><leader>", function() vim.cmd("so") end)	-- Source File
map("n", "<leader>li", function()	vim.cmd("Lazy") end)			-- Lazy Installer

-- Moving single line
map('n', "<A-w>", function() vim.cmd("m -2") end)
map('n', "<A-s>", function() vim.cmd("m +1") end)

-- Duplicate single line
map('n', "<A-S>", "yyp")
map('n', "<A-W>", "yykp")

-- Moving multiple lines
-- map('v', "<A-Up>", function() vim.cmd("m -2") end)
-- map('v', "<A-Down>", function() vim.cmd("m +1") end)

--Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")	-- Find Files
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>") 	-- Find a string
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")		-- Find Buffers
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")	-- Help
map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>")		-- Find keymaps
