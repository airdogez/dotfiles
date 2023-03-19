local M = {}

M.config = function()
    local status_ok, zen_mode = pcall(require, "zen-mode")
    if not status_ok then
        return
    end
    zen_mode.setup {
        window = {
            backdrop = 1,
            height = 0.9,
            width = 0.85,
            options = {
                relativenumber = false,
                signcolumn = "no",
                number = false,
            },
        },
        plugins = {
            gitsigns = { enabled = false },
            tmux = { enabled = false },
            twilight = { enabled = true },
        },
        on_open = function()
        end,
        on_close = function()
        end,
    }
end

return M
