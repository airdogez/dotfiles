local M = {}

M.config = function()
    lvim.leader = "space"
    lvim.keys.normal_mode["<TAB>"] = "<cmd>lua vim.lsp.buf.signature_help()<CR>"
    lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
    lvim.keys.normal_mode["<ESC><ESC>"] = ":nohlsearch<cr>"
end

return M
