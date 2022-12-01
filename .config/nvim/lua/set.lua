vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true
vim.opt.wrap =false

vim.g.mapleader = " "
vim.opt.guifont = { "Jetbrainsmono nerd font", ":h11" }

vim.cmd [[ 
  let g:neovide_font_hinting = 'none'
]]


vim.g.coq_settings = {
    auto_start = 'shut-up',
    keymap = {
        recommended = false,
        jump_to_mark = '<c-e>',
    },
}

local coq = require"coq"
local coq_3p = require'coq_3p'

coq_3p{
    { src = 'copilot', short_name = 'COP', accept_key = '<C-f>' },
}

