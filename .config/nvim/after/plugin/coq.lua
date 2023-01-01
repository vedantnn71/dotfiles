local status, lspconfig = pcall(require, "mason-lspconfig")
if (not status) then return end

vim.g.coq_settings = {
    auto_start = "shut-up",
    keymap = {
        recommended = false,
        jump_to_mark = "<c-e>",
    },
}

local coq = require("coq")
local coq_3p = require("coq_3p")
local lsp = require "lspconfig"

coq_3p {
    { src = "copilot", short_name = "COP", accept_key = "<C-f>" },
}

lspconfig.setup {
  ensure_installed = { "sumneko_lua", "tailwindcss", "tsserver", "cssls" },
}

lsp.tsserver.setup(coq.lsp_ensure_capabilities())

