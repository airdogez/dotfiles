local M = {}

M.config = function()
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
      end
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
    -- {
    --     "folke/twilight.nvim",
    --     config = function()
    --         require("twilight").setup {
    --         }
    --     end
    -- }
  }
end

return M
