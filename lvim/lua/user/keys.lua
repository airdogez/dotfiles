local M = {}


-- General Keybindings
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

  local status_ok, _ = pcall(require, "trouble")
  if status_ok then
    lvim.builtin.which_key.mappings["t"] = {
      name = "Diagnostics",
      t = { "<cmd>TroubleToggle<cr>", "trouble" },
      w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
      d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
      q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
      l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
      r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
    }
  end

  vim.api.nvim_set_keymap("n", "K", ":lua require('user.keys').show_documentation()<CR>", opts)
end


return M
