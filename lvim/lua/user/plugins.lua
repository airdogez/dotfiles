local M = {}

M.config = function()
  local neoclip_req = { "kkharji/sqlite.lua", module = "sqlite" }
  if lvim.custom.neoclip.enable_persistent_history == false then
    neoclip_req = {}
  end
  lvim.plugins = {
    {
      "rcarriga/nvim-dap-ui",
      config = function()
        require("user.dap-ui").config()
      end
    },
    {
      "karb94/neoscroll.nvim",
      config = function()
        require("user.neoscroll").config()
      end,
      event = "BufRead",
    },
    {
      "ixru/nvim-markdown",
      config = function()
        vim.g.vim_markdown_marh = 1
        vim.g.vim_markdown_frontmatter = 1
        vim.g.vim_markdown_conceal = 2
      end
    },
    {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      ft = "markdown",
      config = function()
        vim.g.mkdp_auto_start = 1
      end,
    },
    {
      -- Plugin for quickly changing parenthesis, brackets and others
      "tpope/vim-surround",
      keys = { "c", "d", "y" }
    },
    {
      "folke/todo-comments.nvim",
      config = function()
        require("user.todo-comments").config()
      end
    },
    {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup({ "*" }, {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          rgb_fn = true, -- CSS rgb() and rgba() functions
          hsl_fn = true, -- CSS hsl() and hsla() functions
          css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        })
      end,
    },
    {
      "folke/zen-mode.nvim",
      config = function()
        require("user.zen").config()
      end
    },
    {
      "ghillb/cybu.nvim",
      config = function()
        require("user.cybu").config()
      end
    },
    --WARN:Neoclip Not working correctly
    {
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("user.neoclip").config()
      end,
      keys = "<leader>y",
      requires = neoclip_req,
      disable = not lvim.custom.neoclip.active,
    },
    -- {
    --     "folke/twilight.nvim",
    --     config = function()
    --         require("twilight").setup {
    --         }
    --     end
    -- }
    {
      "folke/trouble.nvim",
      com = "TroubleToggle",
    },
    {
      "ethanholz/nvim-lastplace",
      event = "BufRead",
      config = function()
        require("nvim-lastplace").setup({
          lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
          lastplace_ignore_filetype = {
            "gitcommit", "gitrebase", "svn", "hgcommit",
          },
          lastplace_open_folds = true,
        })
      end,
    },
    {
      "folke/persistence.nvim",
      event = "BufReadPre", -- this will only start session saving when an actual file was opened
      module = "persistence",
      config = function()
        require("user.persistence").config()
      end
    },
    { "moll/vim-bbye" },
    {
      "j-hui/fidget.nvim",
      config = function()
        require("user.fidget_spinner").config()
      end,
    },
    {
      "MattesGroeger/vim-bookmarks",
      config = function()
        require("user.bookmark").config()
      end,
    },
  }
end

return M
