return {
    {
        "folke/noice.nvim",
        version = false,
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {
            lsp = {
                override = {
                    -- Override the default lsp markdown formatter with Noice
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    -- Override the lsp markdown formatter with Noice
                    ["vim.lsp.util.stylize_markdown"] = true,
                    -- Override cmp documentation with Noice (needs the other options to work)
                    ["cmp.entry.get_documentation"] = true,
                },
                signature = {
                    -- Disable noice argument signature cmp. We use blink cmp
                    enabled = false,
                },
            },
            -- You can enable a preset for easier configuration
            presets = {
                -- long messages will be sent to a split
                long_message_to_split = true,
            },
            messages = {
                -- Disable search count preview as virtual text
                view_search = false,
            },
            views = {
                confirm = {
                    position = {
                        row = "50%",
                        col = "50%",
                    },
                },
            },
            routes = {
                {
                    -- Turn off notifications like "8 lines yanked"
                    filter = { event = "msg_show", find = "lines yanked" },
                    opts = { skip = true },
                },
                {
                    -- Turn off notifications like "8 fewer lines"
                    filter = { event = "msg_show", find = "fewer lines" },
                    opts = { skip = true },
                },
            },
        },
    }
}
