local ok, telescope = pcall(require, "telescope")
if not ok then return end

telescope.setup({
	defaults = {

		file_ignore_patterns = {
			"node%_modules/*",
			".yarn/*",
			".git/*",
			".idea/*",
		},		
	},
	pickers = {
		file_browser = {
			hidden = true,
			theme = "ivy",
		},
		find_files = {
			theme = "dropdown",
		}
	},
})
