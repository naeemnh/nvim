vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Vim Functions
map("n", "<leader>q", function() vim.cmd("q") end, { desc = "[Q]uit" })
map("n", "<leader><leader>", function() vim.cmd("w") end, { desc = "Save" })
map("n", "so", function() vim.cmd("so") end, { desc = "[so]urce" })
map("n", "<leader>li", function()	vim.cmd("Lazy") end, { desc = "LazyInstaller" })

-- Moving single line (Does not work om MacOS)
map('n', "<A-w>", function() vim.cmd("m -2") end)
map('n', "<A-s>", function() vim.cmd("m +1") end)
-- MacOS
map('n', "ß", function() vim.cmd("m +1") end)
map('n', "∑", function() vim.cmd("m -2") end)

-- Duplicate single line
map('n', "<A-S>", "yyp")
map('n', "<A-W>", "yykp")
-- MacOS
map('n', "Í", "yyp")
map('n', "„", "yykp")

-- Moving multiple lines (in development)
-- map('v', "<A-Up>", function() vim.cmd("m -2") end)
-- map('v', "<A-Down>", function() vim.cmd("m +1") end)

-- Deleting Line (wihtout adding to copying)
map('n', "dd", '"_dd')

-- New tab
map('n', "te", ":tabedit")
map('n', "<tab>", ":tabnext<Return>", opts)
map('n', "<s-tab>", ":tabprev<Return>", opts)
map('n', "tt", ":tabclose")
-- Split window
map('n', "ss", ":split<Return>", opts)
map('n', "sv", ":vsplit<Return>", opts)
-- Move window
map('n', "sh", "<C-w>h")
map('n', "sk", "<C-w>k")
map('n', "sj", "<C-w>j")
map('n', "sl", "<C-w>l")

-- Telescope
map("n", '<leader>ff', function()
	vim.cmd("lua require('telescope.builtin').find_files({no_ignore = false, hidden = true})")
end, { desc = "[F]ind"})
map("n", '<leader>fg', function()
	vim.cmd("lua require('telescope.builtin').live_grep()")
end, { desc = "[G]rep"})
map("n", '<leader>fb', function()
	vim.cmd("lua require('telescope.builtin').buffers()")
end, { desc = "[B]uffers"})
map("n", '<leader>ft', function()
	vim.cmd("lua require('telescope.builtin').help_tags()")
end, { desc = "[T]ags]"})
map("n", '<leader>fr', function()
	vim.cmd("lua require('telescope.builtin').resume()")
end, { desc = "[R]esume"})
map("n", '<leader>fd', function()
	vim.cmd("lua require('telescope.builtin').diagnostics()")
end, { desc = "[D]iagnostics"})
map("n", '<leader>sf', function()
	vim.cmd("lua require('telescope').extensions.file_browser.file_browser({ path = '%:p:h', cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = true, initial_mode = 'insert', layout_config = { height = 40 } })")
end, {desc = "File Browser"})

-- map("n", '<leader>d', vim.diagnostic.open_float)
-- map("n", '[d', vim.diagnostic.goto_prev)
-- map("n", ']d', vim.diagnostic.goto_next)
-- map("n", '<leader>ll', vim.diagnostic.setloclist)

-- Laravel
map("n", '<leader>la', ":Laravel artisan<cr>", { desc = "Laravel [A]rtisan" })
map("n", '<leader>lr', ":Laravel routes<cr>", { desc = "Laravel [R]outes" })
map("n", '<leader>lm', ":Laravel related<cr>", { desc = "Laravel Related" })

-- View Motions
map("n", '<C-d>', "<C-d>zz")
map("n", '<C-u>', "<C-u>zz")
map("n", 'n', "nzzzv")
map("n", 'N', "Nzzzv")
