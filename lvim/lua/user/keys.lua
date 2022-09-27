local M = {}


M.show_documentation = function()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand "<cword>")
  elseif vim.fn.expand "%:t" == "Cargo.toml" then
    require("crates").show_popup()
  else
    vim.lsp.buf.hover()
  end
end

M.config = function()

  local opts = { noremap = true, silent = true }

  lvim.leader = "space"

  lvim.keys.normal_mode["<TAB>"] = "<cmd>lua vim.lsp.buf.signature_help()<CR>"
  lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
  lvim.keys.normal_mode["<ESC><ESC>"] = ":nohlsearch<cr>"

  vim.api.nvim_set_keymap("n", "K", ":lua require('user.keys').show_documentation()<CR>", opts)
end


return M
