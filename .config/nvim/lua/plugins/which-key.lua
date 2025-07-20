return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            expand = 5,
            delay = 1000,
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Local Keymaps (buffer)",
            },
        },
    }
}
