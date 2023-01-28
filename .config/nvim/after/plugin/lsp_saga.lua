local nnoremap = require("keymap").nnoremap
local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga() 

local opts = { noremap = true, silent = true }

nnoremap('gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)
nnoremap('gj', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
nnoremap('K', '<Cmd>Lspsaga hover_doc<CR>', opts)
nnoremap('gk', '<Cmd>Lspsaga signature_help<CR>', opts)
nnoremap('gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
nnoremap('ga', '<Cmd>Lspsaga code_action<CR>', opts)
nnoremap('ge', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
nnoremap("<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
nnoremap('gR', '<Cmd>Lspsaga rename<CR>', opts)
nnoremap('gF', '<Cmd>!prettier --write %<CR>', opts)


