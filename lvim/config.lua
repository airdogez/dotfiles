--general
lvim.colorscheme = "tokyonight"
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.transparent_window = true
lvim.log.level = "warn"
-- vim.opt.shiftwidth = 4

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.terminal.shell = "pwsh.exe -NoLogo"
lvim.builtin.dap.active = true

lvim.builtin.project.patterns = {
  ".obsidian"
}

if lvim.builtin.dap.active then
  require("user.dap").config()
end

-- nvim-tree has some performance issues on windows, see kyazdani42/nvim-tree.lua#549
lvim.builtin.nvimtree.setup.diagnostics.enable = false
lvim.builtin.nvimtree.setup.filters.dotfiles = true
lvim.builtin.nvimtree.setup.filters.custom = {}
lvim.builtin.nvimtree.setup.git.enable = true
lvim.builtin.nvimtree.setup.update_cwd = false
lvim.builtin.nvimtree.setup.update_focused_file.update_cwd = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.highlight_git = false
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "c",
  "lua",
  "python",
  "markdown",
}

-- lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.indent.enable = true
lvim.builtin.treesitter.playground.enable = true

require("user.plugins").config()

-- Windows Config
if vim.fn.has('windows') then
  -- Enable powershell as your default shell
  vim.opt.shell = "pwsh.exe -NoLogo"
  vim.opt.shellcmdflag =
  "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  vim.cmd [[
    let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    set shellquote= shellxquote=
  ]]

  -- Set a compatible clipboard manager
  vim.g.clipboard = {
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
  }
end

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

local markdown_opts = {
  filetypes = { "markdown" },
  autostart = true
}
require("lvim.lsp.manager").setup("marksman", markdown_opts)

require("user.keys").config()
