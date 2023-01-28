local nnoremap = require("keymap").nnoremap

nnoremap("<leader>zn", ":TZNarrow<CR>", {})
nnoremap("<leader>zn", ":'<,'>TZNarrow<CR>", {})
nnoremap("<leader>zf", ":TZFocus<CR>", {})
nnoremap("<leader>zm", ":TZMinimalist<CR>", {})
nnoremap("<leader>za", ":TZAtaraxis<CR>", {})



