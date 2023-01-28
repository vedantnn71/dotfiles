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

