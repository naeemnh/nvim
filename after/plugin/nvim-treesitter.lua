local ok, treesitterConfig = pcall(require, "nvim-treesitter.configs")
if not ok then return end

treesitterConfig.setup({
  ensure_installed = {
    "lua",
    "vim",
    "vimdoc",
    "javascript",
    "jsdoc",
    "json",
    "html",
    "typescript",
    "tsx",
    "query",
    "php",
    "css",
    "scss"
  },
  sync_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})
