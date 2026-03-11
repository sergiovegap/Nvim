return {
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            auto_open = true,
        },
        keys = {
            { "<leader>xx", "<cmd>TroubleToggle<cr>",                       desc = "Trouble Toggle" },
            { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
            { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics" },
            { "<leader>xl", "<cmd>TroubleToggle loclist<cr>",               desc = "Location List" },
            { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",              desc = "Quickfix List" },
        },
        config = function()
            require("trouble").setup({
                -- auto_open = false,
                auto_close = false,
                auto_preview = true,
                auto_jump = false,
                mode = "quickfix",
                severity = vim.diagnostic.severity.ERROR,
                cycle_results = false,
                -- Autocomando para abrir Trouble al iniciar Neovim
                vim.api.nvim_create_autocmd("VimEnter", {
                    callback = function()
                        -- Esperar un breve instante para que el layout se asiente
                        vim.defer_fn(function()
                            require("trouble").open("diagnostics")
                        end, 100)
                    end,
                }),
            })
        end,
    },
}
