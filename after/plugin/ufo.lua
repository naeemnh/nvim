local ok, ufo = pcall(require, 'ufo')
if not ok then return end

ufo.setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { 'treesitter', 'indent' }
  end
})

vim.keymap.set("n", 'zR', ufo.openAllFolds)
vim.keymap.set("n", 'zM', ufo.closeAllFolds)
