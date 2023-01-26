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

local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga() 

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

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
nnoremap('gF', '<Cmd>!prettier --write %<CR>', opts)

nnoremap("<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

local api = vim.api

nnoremap("<leader>zn", ":TZNarrow<CR>", {})
nnoremap("<leader>zn", ":'<,'>TZNarrow<CR>", {})
nnoremap("<leader>zf", ":TZFocus<CR>", {})
nnoremap("<leader>zm", ":TZMinimalist<CR>", {})
nnoremap("<leader>za", ":TZAtaraxis<CR>", {})

