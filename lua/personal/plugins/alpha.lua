return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set Menu
		dashboard.section.buttons.val = {
			dashboard.button("e", " > New File", "<cmd>ene<CR>"),
			dashboard.button("SPC ee", " > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC ff", " > Find Word", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("SPC ff", "󰁯 > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
			dashboard.button("SPC ff", " > Quit NVIM", "<cmd>qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
