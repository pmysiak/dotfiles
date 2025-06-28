return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "php",
                    "regex",
                    "vim",
                    "vimdoc",
                    "html",
                },
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                        node_decremental = "<bs>",
                    },
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        version = false,
        opts = {},
    },
    {
        "windwp/nvim-ts-autotag",
        version = false,
        opts = {},
    },
}

