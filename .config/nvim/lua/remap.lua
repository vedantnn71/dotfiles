local nnoremap = require("keymap").nnoremap
local inoremap = require("keymap").inoremap
local builtin = require("telescope.builtin")

nnoremap("<leader>pv", "<cmd>Ex<Cr>")
nnoremap("<leader>ff", builtin.find_files, {})
nnoremap("<leader>fg", builtin.live_grep, {})
nnoremap("<leader>fb", builtin.buffers, {})
nnoremap("<leader>fh", builtin.help_tags, {})
nnoremap("<leader>ft", builtin.colorscheme, {})

nnoremap("<leader>gb", builtin.git_branches, {})

nnoremap("<leader>mi", "<cmd>Mason<Cr>")

-- harpooning --
local harpoon_mark = require("harpoon.mark");
local harpoon_ui = require("harpoon.ui");
local harpoon_tmux = require("harpoon.tmux");

nnoremap("<leader>hq", harpoon_ui.toggle_quick_menu, {})
nnoremap("<leader>th", function() harpoon_tmux.gotoTerminal(1) end, {})
nnoremap("<leader>tj", function() harpoon_tmux.gotoTerminal(2) end, {})
nnoremap("<leader>tk", function() harpoon_tmux.gotoTerminal(3) end, {})
nnoremap("<leader>tl", function() harpoon_tmux.gotoTerminal(4) end, {})

nnoremap("<leader>a", harpoon_mark.add_file, {})
nnoremap("<C-H>", function() harpoon_ui.nav_file(1) end, {})
nnoremap("<C-J>", function() harpoon_ui.nav_file(2) end, {})
nnoremap("<C-K>", function() harpoon_ui.nav_file(3) end, {})
nnoremap("<C-L>", function() harpoon_ui.nav_file(4) end, {})
nnoremap("<C-N>", harpoon_ui.nav_next, {})
nnoremap("<C-P>", harpoon_ui.nav_prev, {})

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  
  local bufopts = { noremap = true, silent =true, buffer = bufnr }

end

local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga() 

local opts = { noremap = true, silent = true }

nnoremap('gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)
nnoremap('gj', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
nnoremap('K', '<Cmd>Lspsaga hover_doc<CR>', opts)
--nnoremap('gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
nnoremap('gk', '<Cmd>Lspsaga signature_help<CR>', opts)
nnoremap('gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
nnoremap('ga', '<Cmd>Lspsaga code_action<CR>', opts)
nnoremap('ge', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
nnoremap("<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
nnoremap('gR', '<Cmd>Lspsaga rename<CR>', opts)
-- open lazygit in lspsaga float terminal
nnoremap("<leader>d", "<cmd>Lspsaga open_floaterm lazygit<CR>", opts)
-- close floaterm
nnoremap("<leader>d", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], opts)

nnoremap('gF', '<Cmd>!prettier --write %<CR>', opts)

nnoremap("<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

local api = vim.api

nnoremap("<leader>zn", ":TZNarrow<CR>", {})
nnoremap("<leader>zn", ":'<,'>TZNarrow<CR>", {})
nnoremap("<leader>zf", ":TZFocus<CR>", {})
nnoremap("<leader>zm", ":TZMinimalist<CR>", {})
nnoremap("<leader>za", ":TZAtaraxis<CR>", {})

