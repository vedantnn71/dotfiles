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

nnoremap("<leader>hm", harpoon_mark.add_file, {})
nnoremap("<leader>hn", harpoon_ui.nav_next, {})
nnoremap("<leader>hN", harpoon_ui.nav_prev, {})
nnoremap("<leader>hq", harpoon_ui.toggle_quick_menu, {})
nnoremap("<leader>ht1", function() harpoon_tmux.gotoTerminal(1) end, {})
nnoremap("<leader>ht2", function() harpoon_tmux.gotoTerminal(2) end, {})
nnoremap("<leader>ht3", function() harpoon_tmux.gotoTerminal(3) end, {})
nnoremap("<leader>ht4", function() harpoon_tmux.gotoTerminal(4) end, {})
nnoremap("<leader>hgh", function() harpoon_ui.nav_file(1) end, {})
nnoremap("<leader>hgj", function() harpoon_ui.nav_file(2) end, {})
nnoremap("<leader>hgk", function() harpoon_ui.nav_file(3) end, {})
nnoremap("<leader>hgl", function() harpoon_ui.nav_file(4) end, {})

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  
  local bufopts = { noremap = true, silent =true, buffer = bufnr }

  nnoremap("<leader>gd", vim.lsp.buf.definition, bufopts)
  nnoremap("<leader>gi", vim.lsp.buf.implementation, bufopts)
  nnoremap("<leader>gr", vim.lsp.buf.references, bufopts)
  nnoremap("<leader>gD", vim.lsp.buf.declaration, bufopts)
  nnoremap("gt", vim.lsp.buf.type_definition, bufopts)
  nnoremap("<leader>ga", vim.lsp.buf.code_action, bufopts)
  nnoremap("<leader>gf", vim.lsp.buf.formatting, bufopts)
  nnoremap("<leader>ge", vim.diagnostic.open_float, opts)
  nnoremap("[d", vim.diagnostic.goto_prev, opts)
  nnoremap("]d", vim.diagnostic.goto_next, opts)

end

local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga {
  server_filetype_map = {
    typescript = 'typescript'
  }
}

local opts = { noremap = true, silent = true }

nnoremap('<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
nnoremap('K', '<Cmd>Lspsaga hover_doc<CR>', opts)
nnoremap('<leader>gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
inoremap('<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
nnoremap('<leader>gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
nnoremap('<leader>gR', '<Cmd>Lspsaga rename<CR>', opts)

