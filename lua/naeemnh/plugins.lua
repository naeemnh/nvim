local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

local ok, lazy = pcall(require, "lazy")
if not ok then
	return
end

lazy.setup({
  "jose-elias-alvarez/null-ls.nvim",
	'rebelot/kanagawa.nvim',
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "lewis6991/gitsigns.nvim",
  -- Set Lualine as statusline
  "nvim-lualine/lualine.nvim",
	{
		"folke/tokyonight.nvim",
		enabled = false,
		lazy = true,
		priority = 1000
	},
	{
		"windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equivalent to setup({})
  },
  {
    -- LSP Configurations & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      { "j-hui/fidget.nvim", opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing
      "folke/neodev.nvim",
    },
  },
  {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Snippets Engine & its associated nvim-cmp source
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      -- Adds LSP completion capabilities
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',

      { "onsails/lspkind.nvim", lazy = true }
    },
  },
  {
    "folke/which-key.nvim",
    opts = {}
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ":TSUpdate",
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        dependencies = {
          'nvim-tree/nvim-web-devicons',
          opt = { default = true },
        }
      },
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
      "nvimtools/none-ls.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    event = { "VeryLazy" },
    config = true,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
  },
})
