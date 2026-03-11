return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "folke/snacks.nvim", -- for the preview
    },
    enabled = false,
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus" },
    keys = {
        { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer (nvim-tree)" },
    },
    version = "*",
    lazy = false,
    config = function()
        require("nvim-tree").setup({
            disable_netrw = true,
            hijack_netrw = true,
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 32,
                side = "left",
            },
            renderer = {
                highlight_git = true,
                icons = {
                    show = {
                        git = true,
                        folder = true,
                        file = true,
                        folder_arrow = true,
                    },
                },
            },
            filters = {
                dotfiles = false,
            },
            git = {
                enable = true,
                ignore = false,
            },
            actions = {
                open_file = {
                    quit_on_open = false,
                },
            }
        })
        -- preview
        require("config.nvim_tree_snacks_hover")
    end,
}
