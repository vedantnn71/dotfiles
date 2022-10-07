require("catppuccin").setup()

vim.g.catppuccin_flavour = "mocha"
vim.opt.background = "dark"

vim.cmd [[ colorscheme catppuccin ]]
vim.cmd [[ hi Normal ctermbg=NONE guibg=NONE ]]

