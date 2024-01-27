local ok, kanagawa = pcall(require, "kanagawa")
if not ok then return end

kanagawa.setup({
  complie = false,
  undercurl = true,
  commentStyle = { italic = true },
  fucntionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = true,
  terminalColors = true,
  theme = "dragon",
})

vim.cmd[[colorscheme kanagawa-dragon]]
