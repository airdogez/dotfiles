--general
lvim.colorscheme = "tokyonight"
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.transparent_window = true
lvim.log.level = "warn"

-- Built-int Configuration
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true

if lvim.builtin.dap.active then
  require("user.dap").config()
end

lvim.builtin.project.patterns = {
  ".obsidian"
}

-- Windows Config
if vim.fn.has('windows') then
  require "user.windows"
end


-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "c",
  "cpp",
  "lua",
  "python",
  "markdown",
  "yaml"
}

lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.indent.enable = true
lvim.builtin.treesitter.playground.enable = true

-- Customization
-- Table with custom parameter for plugins
lvim.custom = {
  neoclip = { active = true, enable_persistent_history = true },
}
-- Plugins
require("user.plugins").config()


-- GUI Config
if vim.fn.exists("g:neovide") then
  vim.o.guifont = "FuraCode NF Retina"
end

-- generic LSP settings

lvim.lsp.installer.setup.ensure_installed = {
  "sumeko_lua",
  "jsonls",
  "marksman",
  "clangd",
}

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "neoclip")
end

require("user.keys").config()
