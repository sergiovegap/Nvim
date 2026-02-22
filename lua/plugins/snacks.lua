return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    ---@class snacks.image.Config
    ---@field enabled? boolean enable image viewer
    ---@field wo? vim.wo|{} options for windows showing the image
    ---@field bo? vim.bo|{} options for the image buffer
    ---@field formats? string[]
    ---@field resolve? fun(file: string, src: string): string?
    ---@field convert? snacks.image.convert.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        picker = {
            enabled = true,
            preview = {
                enabled = true,
                layout = "vertical",
                position = "right",
                image = {
                    enabled = true,
                    backend = "kitty",
                    force = true,
                    scale = true,
                    relative = "cursor",
                    border = true,
                    focusable = false,
                    backdrop = false,
                    row = 1,
                    col = 1,
                    convert = {
                        cmd = "magick",
                    },
                    formats = {
                        "png",
                        "jpg",
                        "jpeg",
                        "gif",
                        "bmp",
                        "webp",
                        "tiff",
                        "heic",
                        "avif",
                        "pdf",
                        "icns",
                    },
                    doc = {
                        inline = vim.g.neovim_mode == "skitty" and true or false,
                        float = true,
                        max_width = vim.g.neovim_mode == "skitty" and 5 or 60,
                        max_height = vim.g.neovim_mode == "skitty" and 2.5 or 30,
                    },
                },
            },
        },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
}
