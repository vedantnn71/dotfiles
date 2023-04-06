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
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/which-key.nvim",
  "folke/neodev.nvim",
  "neovim/nvim-lspconfig",
  "wakatime/vim-wakatime",
  "github/copilot.vim",
  "nvim-treesitter/nvim-treesitter",
  "windwp/nvim-ts-autotag",
  "windwp/nvim-autopairs",
  "nvim-treesitter/nvim-treesitter-context",
  "lewis6991/gitsigns.nvim",
  "andweeb/presence.nvim",
  "Pocco81/true-zen.nvim",
  "norcalli/nvim-colorizer.lua",
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",
  "ThePrimeagen/harpoon",
  "simrat39/rust-tools.nvim",
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
  "ggandor/leap.nvim",
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
  {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  },
  },
})
