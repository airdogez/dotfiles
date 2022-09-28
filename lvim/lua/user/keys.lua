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


  vim.api.nvim_set_keymap("n", "K", ":lua require('user.keys').show_documentation()<CR>", opts)

  vim.keymap.set("n", "Q", "<cmd>Bdelete!<CR>", opts)

  -- WhichKey binds
  local trouble_status_ok, _ = pcall(require, "trouble")
  if trouble_status_ok then
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

  local persistence_status_ok, _ = pcall(require, "persistence")
  if persistence_status_ok then
    lvim.builtin.which_key.mappings["S"] = {
      name = "Session",
      c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
      l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
      Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
    }
  end
end


return M
