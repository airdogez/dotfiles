local M = {}

M.config = function()
  local status_ok, cybu = pcall(require, "cybu")
  if not status_ok then
    return
  end
  cybu.setup {
    position = {
      relative_to = "win",
      anchor = "topright",
    },
    display_time = 1750,
    style = {
      path = "relative",
      border = "rounded",
      separator = " ",
      prefix = "…",
      padding = 1,
      hide_buffer_id = true,
      devicons = {
        enabled = true,
        colored = true,
      },
    },
  }
  vim.keymap.set("n", "<c-h>", "<Plug>(CybuPrev)")
  vim.keymap.set("n", "<c-l>", "<Plug>(CybuNext)")
end

return M
