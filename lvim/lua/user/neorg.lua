local M = {}

M.config = function()
  local status_ok, neorg = pcall(require, "neorg")
  if not status_ok then
    return
  end
  -- require('neorg').setup = {
  neorg.setup {
    load = {
      ["core.defaults"] = {},
      ["core.norg.dirman"] = {
        config = {
          workspaces = {
            org = "~/docs/org",
          }
        }
      },
      ["core.gtd.base"] = {},
      ["core.norg.completion"] = {},
      ["core.norg.concealer"] = {},
      ["core.norg.journal"] = {},
    }
  }
end

return M
