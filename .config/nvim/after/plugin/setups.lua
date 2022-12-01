require("luasnip.loaders.from_vscode").lazy_load()
require('gitsigns').setup {}
require("true-zen").setup {
  integrations = {
    tmux = true, -- hide tmux status bar in (minimalist, ataraxis)
    lualine = true -- hide nvim-lualine (ataraxis)
  },
}

require("lualine").setup({
  options = {
    section_separators = { left = "", right = "" },
    component_separators = { left = "|", right = "|" }
  }
})


require("rust-tools").setup({});

--[[
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
  }
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
--]]

local servers = { "tsserver" }

local _, nvim_lsp = pcall(require, "lspconfig")

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

for _, lsp in pairs(servers) do
    require("lspconfig")[lsp].setup {
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        }
    }
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } 

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end

