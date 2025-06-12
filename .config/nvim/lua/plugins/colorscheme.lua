return {
    {
        "folke/tokyonight.nvim",
        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "night",
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                },
                on_highlights = function(hl, c)
                    hl["@variable"] = "@variable.parameter"
                end,
            })
            vim.cmd([[colorscheme tokyonight]])
        end,
    }
}
