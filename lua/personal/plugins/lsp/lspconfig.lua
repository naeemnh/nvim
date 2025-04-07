return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		"simrat39/rust-tools.nvim",
	},
	config = function()
		-- Import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- Import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- Import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- Import rust-tools plugin
		local rust_tools = require("rust-tools")

		local map = vim.keymap.set -- For conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- Set keybinds
				opts.desc = "Show LSP references"
				map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- Show definition, references

				opts.desc = "Go to declaration"
				map("n", "gD", vim.lsp.buf.declaration, opts) -- Go to declaration

				opts.desc = "Show LSP definitions"
				map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- Show lsp definitions

				opts.desc = "Show LSP implementations"
				map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- Show lsp implementations

				opts.desc = "Show LSP type definitions"
				map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- Show lsp type definitions

				opts.desc = "See available code actions"
				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- See available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				map("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Smart rename

				opts.desc = "Show buffer diagnostics"
				map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- Show diagnostics for file

				opts.desc = "Show line diagnostics"
				map("n", "<leader>d", vim.diagnostic.open_float, opts) -- Show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				map("n", "[d", vim.diagnostic.goto_prev, opts) -- Jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				map("n", "]d", vim.diagnostic.goto_next, opts) -- Jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				map("n", "K", vim.lsp.buf.hover, opts) -- Show documentation for what is under cursor

				opts.desc = "Restart LSP"
				map("n", "<leader>rs", ":LspRestart<CR>", opts) -- Mapping to restart lsp if necessary
			end,
		})

		-- Used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in YouTube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			-- Default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["graphql"] = function()
				-- Configure graphql language server
				lspconfig["graphql"].setup({
					capabilities = capabilities,
					filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
				})
			end,
			["emmet_ls"] = function()
				-- Configure emmet language server
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
					filetypes = {
						"html",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
					},
				})
			end,
			["lua_ls"] = function()
				-- Configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- Make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			["cssls"] = function()
				-- Configure css language server
				lspconfig["cssls"].setup({
					capabilities = capabilities,
					settings = {
						css = {
							lint = {
								unknownAtRules = "ignore",
							},
						},
					},
				})
			end,
			["rust_analyzer"] = function()
				-- Configure rust language server with rust-tools
				lspconfig["rust_analyzer"].setup({
					server = {
						capabilities = capabilities,
						cmd = { "rust-analyzer" }, -- Ensure this points to the correct binary
						settings = {
							["rust-analyzer"] = {
								imports = {
									granularity = {
										group = "module",
									},
									prefix = "self",
								},
								cargo = {
									buildScripts = {
										enable = true,
									},
									allFeatures = true,
									command = "clippy",
									extraArgs = { "--no-deps" },
								},
								procMacro = {
									enable = true,
									["async-trait"] = { "async_trait" },
									["napi-derive"] = { "napi" },
									["async-recursion"] = { "async_recursion" },
								},
							},
						},
					},
					tools = {
						inlay_hints = {
							auto = true,
							only_current_line = false,
							show_parameter_hints = true,
							parameter_hints_prefix = "<- ",
							other_hints_prefix = "=> ",
							max_len_align = false,
							max_len_align_padding = 1,
							right_align = false,
							right_align_padding = 4,
							highlight = "Comment",
						},
						hover_actions = {
							auto_focus = true,
						},
					},
				})
			end,
		})
	end,
}
