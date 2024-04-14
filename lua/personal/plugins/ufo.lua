return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		local ufo = require("ufo")

		ufo.setup({
			provider_selector = function()
				return {
					"treesitter",
					"indent",
				}
			end,
		})

		-- set keymaps
		local map = vim.keymap.set

		map("n", "zR", ufo.openAllFolds)
		map("n", "zM", ufo.closeAllFolds)
	end,
}
