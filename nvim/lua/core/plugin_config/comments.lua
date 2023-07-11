require("commentary").setup({
  languages = {
    terraform = {single_line_comment = "#", multiline_comment = {"/*","*/"}, prefer_multiline = false}
  }})

--   vim.api.nvim_set_keymap("x", "<S-'>", "<Plug>commentary", { silent = true })
--    vim.api.nvim_set_keymap("n", "<c-'>", "<Plug>commentary", { silent = true })
--   vim.api.nvim_set_keymap("n", "<S-3>", "<Plug>commentary_motion", { silent = true })
-- 
