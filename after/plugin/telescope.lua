local ok, telescope = pcall(require, "telescope")
if not ok then return end
local actions = require('telescope.actions')

function telescope_buffer_dir()
	return vim.fn.expand('%:p:h')
end

local fb_actions = require('telescope').extensions.file_browser.actions

telescope.setup({
	defaults = {
		file_ignore_patterns = {
			"node%_modules/*",
			".yarn/*",
			".git/*",
			".idea/*",
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
				['i'] = {
					['<C-w>'] = function() vim.cmd('normal vbd') end,
				},
				['n'] = {
					['N'] = fb_actions.create,
					['h'] = fb_actions.goto_parent_dir,
					['/'] = function() vim.cmd('startinsert') end,
				},
			},
		},
		find_files = {
			theme = "dropdown",
		}
	},
})

telescope.load_extension('file_browser')
