local ok, lualine = pcall(require, 'lualine')
if not ok then
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = 'auto',
		components_separators = { left = ' ', right = ' ' },
		section_separators = { left = ' ', right = ' ' },
		disabled_filetype ={
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		global_status = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
		sections = {
			lualine_a = {'mode'},
			lualine_b = {'branch', 'diff', 'diagnostics'},
			lualine_c = {'filename'},
			lualine_x = {'encoding', 'fileformat', 'filetype'},
			lualine_y = {'progress'},
			lualine_z = {'location'},
		},
		inactive_section = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {'filename'},
			lualine_x = {'location'},
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
		
})
