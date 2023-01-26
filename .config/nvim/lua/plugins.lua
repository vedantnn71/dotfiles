local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"


if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "folke/neodev.nvim",
  "wbthomason/packer.nvim",
  "neovim/nvim-lspconfig",
  "wakatime/vim-wakatime",
  "github/copilot.vim",
  "onsails/lspkind.nvim",
  "nvim-treesitter/nvim-treesitter",
  "windwp/nvim-ts-autotag",
  "windwp/nvim-autopairs",
  "nvim-telescope/telescope-file-browser.nvim",
  "glepnir/lspsaga.nvim",
  "lewis6991/gitsigns.nvim",
  "simrat39/rust-tools.nvim",
  "andweeb/presence.nvim",
  "ThePrimeagen/harpoon",
  "ggandor/leap.nvim",
  "Pocco81/true-zen.nvim",
  "folke/tokyonight.nvim",
  "norcalli/nvim-colorizer.lua",
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",
  --"nvim-tree/nvim-tree.lua",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "nvim-lualine/lualine.nvim",
  "saadparwaiz1/cmp_luasnip",
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  "petertriho/cmp-git",
  "onsails/lspkind.nvim",
  "tpope/vim-fugitive",
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup()
      vim.cmd('colorscheme rose-pine')
    end
  },
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  { "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" },
  { "nvim-telescope/telescope.nvim", tag = "0.1.0" },
})
