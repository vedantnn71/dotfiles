local nnoremap = require("keymap").nnoremap
local builtin = require("telescope.builtin")

nnoremap("<leader>ff", builtin.find_files, {})
nnoremap("<leader>fg", builtin.live_grep, {})
nnoremap("<leader>fb", builtin.buffers, {})
nnoremap("<leader>fh", builtin.help_tags, {})
nnoremap("<leader>ft", builtin.colorscheme, {})

nnoremap("<leader>gb", builtin.git_branches, {})


