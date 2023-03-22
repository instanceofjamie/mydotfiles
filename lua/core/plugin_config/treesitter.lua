require 'nvim-treesitter.configs'.setup {
  -- A list of paser names, or "all"
  ensure_installed = { "c", "lua", "rust", "ruby", "vim", "terraform", "hcl" },

  -- Install parsers synchronously (only applied to 'ensure_installed')
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  }
}
