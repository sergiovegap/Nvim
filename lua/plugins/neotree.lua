return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module 'neo-tree'
    ---@type neotree.Config
    opts = {
        window = {
            position = "left",
            width = 30,
            mapping_options = {
                noremap = true,
                nowait = true,
            },
            fixed_width = true,
        },
        filesystem = {
            follow_current_file = {
                enabled = true,
            },                             -- avoid closing the tree
            use_libuv_file_watcher = true, -- updates de tree if a doc changes
        }
    },
    config = function(_, opts)
        require("neo-tree").setup(opts)

        -- Autocomando para abrir Neo-tree al iniciar Neovim
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                -- Evita abrirlo si estamos en un commit de git o si se abrió un directorio directamente
                if vim.bo.filetype == "gitcommit" then return end

                vim.defer_fn(function()
                    -- Abrir Neo-tree
                    vim.cmd("Neotree show")
                    -- Regresar el foco al editor de código
                    vim.cmd("wincmd p")
                end, 100)
            end,
        })
    end,
}
