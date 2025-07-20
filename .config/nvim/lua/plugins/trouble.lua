return {
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        opts = {
            focus = true,
            preview = {
                scratch = false,
            },
        },
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>xl",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xq",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    }
}
