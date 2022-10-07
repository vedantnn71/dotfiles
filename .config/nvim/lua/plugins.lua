vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "neovim/nvim-lspconfig" 
  use "wakatime/vim-wakatime"
  use "github/copilot.vim"
  use "onsails/lspkind.nvim"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/nvim-cmp"
  use "nvim-treesitter/nvim-treesitter"
  use "windwp/nvim-ts-autotag"
  use "windwp/nvim-autopairs"
  use "nvim-telescope/telescope-file-browser.nvim"
  use "glepnir/lspsaga.nvim"
  use "lewis6991/gitsigns.nvim"
  use "Theprimeagen/harpoon"
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use ({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.0",
    requires = {{"nvim-lua/plenary.nvim"}}
  }
end)
