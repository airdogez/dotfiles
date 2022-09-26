local M = {}

M.config = function()
    lvim.leader = "space"
    lvim.keys.normal_mode["<TAB>"] = "<cmd>lua vim.lsp.buf.signature_help()<CR>"
end

return M
