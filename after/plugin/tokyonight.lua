local ok, tokyonight = pcall(require, "tokyonight")
if not ok then
	return
end

tokyonight.setup({
	style="storm",
--	transparent = true,
	style = {
		comments = { italic = true },
		keywords = { italic = true },
		sidebars = "transparent",
		floats = "transparent",
	},
	dim_inactive = true,
	on_highlights = function(hl, c)
		hl.TelescopeNormal = {
			bg = c.bg_dark,
			fg = c.fb_dark,
		}
		hl.TelescopeBorder = {
			bg = c.bg_dark,
 			fg = c.bg_dark,
 		}
 		hl.TelescopePromptNormal = {
 			bg = c.bg_dark,
 		}
 		hl.TelescopePromptBorder = {
 			bg = c.bg_dark,
 			fg = c.bg_dark,
 		}
 		hl.TelescopePromptTitle = {
 			bg = c.bg_dark,
 			fg = c.bg_dark,
 		}
 		hl.TelescopePreviewTitle = {
 			bg = c.bg_dark,
 			fg = c.bg_dark,
 		}
 		hl.TelescopeResultsTitle = {
 			bg = c.dark5,
 			fg = c.bg_dark,
 		}
	end,
--	on_colors = function(colors)
--		colors.hint = color.orange
--		colors.error = "#ff000"
--	end
})

vim.cmd[[colorscheme tokyonight-night]]
