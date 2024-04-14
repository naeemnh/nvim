function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local fb_actions = require("telescope").extensions.file_browser.actions
		local transform_mod = require("telescope.actions.mt").transform_mod

		local trouble = require("trouble")
		local trouble_telescope = require("trouble.providers.telescope")

		-- or create your custom action
		local custom_actions = transform_mod({
			open_trouble_qflist = function(prompt_bufnr)
				trouble.toggle("quickfix")
			end,
		})

		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules/*",
					".yarn/*",
					".git/*",
					".idea/*",
				},
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
						["<C-t>"] = trouble_telescope.smart_open_with_trouble,
					},
				},
			},
			extensions = {
				file_browser = {
					hidden = true,
					theme = "dropdown",
					-- disables netrw add use telescope-file-browser in its place
					hijack_netrw = true,
					mappings = {
						-- your cutsom insert mode mappings
						["i"] = {
							["<C-w>"] = function()
								vim.cmd("normal vbd")
							end,
						},
						["n"] = {
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["/"] = function()
								vim.cmd("startinsert")
							end,
						},
					},
				},
				find_files = {
					theme = "dropdown",
				},
			},
		})

		telescope.load_extension("file_browser")

		-- set keymaps
		local map = vim.keymap.set -- for conciseness

		map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		map("n", "<leader>sf", function()
			vim.cmd(
				"lua require('telescope').extensions.file_browser.file_browser({ path = '%:p:h', cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = true, initial_mode = 'insert', layout_config = { height = 40 }})"
			)
		end, { desc = "Browse search file in current file directory" })
	end,
}
