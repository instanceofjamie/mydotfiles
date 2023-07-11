require("core.keymaps")
require("core.plugins")
require("core.plugin_config")
local cmd = vim.cmd

-- Highlight on yank
cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end

]]
