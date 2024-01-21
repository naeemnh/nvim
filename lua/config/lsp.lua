local ok, lsp = pcall(require, "lspconfig")
if not ok then
	return
end

-- local protocal = require('vim.lsp.protocal')

local on_attach = function(client, bufnr)
	-- format on save
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritrePre", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function() vim.lsp.buf.formatting_seq_sync() end
		})
	end
end

-- Tyepscript
lsp.tsserver.setup({
	on_attach = on_attach,
	filetypes = {
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	cmd = { "typescript-language-server", "--studio" }
})
