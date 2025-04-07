return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- Import plugins
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- Mason general setup
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- Automatic installation of LSP servers
			automatic_installation = false,
			-- List of servers to ensure are installed
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"rust_analyzer",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- Prettier formatter
				"stylua", -- lua formatter
				-- Uncomment if needed;
				-- "isort", -- Python formatter
				-- "black", -- Python formatter
				-- "pylint", -- Python linter
				"eslint_d",
			},
		})
	end,
}
