-- General
-- lvim.colorscheme = "tokyonight"
lvim.colorscheme = "kanagawa"
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.transparent_window = true
lvim.log.level = "warn"

-- LVim Built-in Configuration
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true


if lvim.builtin.dap.active then
  require("user.dap").config()
end

lvim.builtin.project.patterns = {
  ".obsidian"
}

lvim.builtin.indentlines.options = {
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
  use_treesiter = true,
  show_foldtext = true,
}

-- Windows Config
if vim.fn.has('windows') then
  require "user.windows"
end

-- GUI Config
if vim.fn.exists("g:neovide") then
  vim.o.guifont = "FuraCode NF Retina"
  lvim.transparent_window = true
end

-- Treesitter

require 'nvim-treesitter.install'.compilers = { "clang" }
lvim.builtin.treesitter.ensure_installed = {
  "c",
  "cpp",
  "lua",
  "python",
  "markdown",
  "yaml",
  "norg",
}
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.indent.enable = true
lvim.builtin.treesitter.playground.enable = true

-- LSP settings
lvim.lsp.installer.setup.ensure_installed = {
  "sumeko_lua",
  "jsonls",
  "marksman",
  "clangd",
}

-- Telescope
lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "neoclip")
end

-- Custom variables
lvim.custom = {
  neoclip = { active = true, enable_persistent_history = true },
}

require("user.plugins").config()
require("user.keys").config()
