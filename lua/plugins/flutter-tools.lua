-- {
--     'nvim-flutter/flutter-tools.nvim',
--     lazy = false,
--     dependencies = {
--         'nvim-lua/plenary.nvim',
--         'stevearc/dressing.nvim',
--     },
--     config = true,
-- }

return {
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = { border = "rounded" },
      select = { backend = { "builtin" } },
    },
  },

  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup({
        ui = { border = "rounded" },
        decorations = {
          statusline = {
            app_version = true,
            device = true,
          },
        },
        debugger = {
          enabled = true,
          run_via_dap = true,
        },
      })
    end,
  },
}
