local nnoremap = require("keymap").nnoremap

require("true-zen").setup {
  integrations = {
    tmux = true, -- hide tmux status bar in (minimalist, ataraxis)
    lualine = true -- hide nvim-lualine (ataraxis)
  },
}

nnoremap("<leader>zn", ":TZNarrow<CR>", {})
nnoremap("<leader>zn", ":'<,'>TZNarrow<CR>", {})
nnoremap("<leader>zf", ":TZFocus<CR>", {})
nnoremap("<leader>zm", ":TZMinimalist<CR>", {})
nnoremap("<leader>za", ":TZAtaraxis<CR>", {})



