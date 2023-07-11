require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "terraformls", "tflint" }
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.fn["vsnip#get_complete_items"](vim.fn["bufnr"]())
end


local capabilities = require('cmp_nvim_lsp').default_capabilities()

require 'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

require("lspconfig").tflint.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

require("lspconfig").terraformls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "terraform", "terraform-vars" },
  flags = {
    debounce_text_changes = 0,   -- Wait 5 seconds before sending didChange
  }
}

 vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
--vim.cmd([[autocmd BufWritePre *.tf *.tfvars lua vim.lsp.buf.format()]])
--vim.api.nvim_create_autocmd("BufWritePre", {"*.tf", "*.tfvars"}, function()
--    vim.lsp.buf.format()
--end)
