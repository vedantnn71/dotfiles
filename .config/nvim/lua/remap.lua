local nnoremap = require("keymap").nnoremap

nnoremap("<C-f>", "<cmd>silent !tmux neww ~/.local/bin/tmux-sessionizer<CR>")
nnoremap("<leader>pv", "<cmd>Ex<Cr>")
