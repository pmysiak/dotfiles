return {
    {
        "saghen/blink.cmp",
        -- set "*" to use a latest stable release tag with pre-built binaries
        version = "*",
        opts = {
            keymap = {
                -- Insert item on enter
                preset = "enter",
            },
            completion = {
                list = {
                    -- Maximum number of items to display
                    max_items = 50,

                    selection = {
                        -- When `true`, inserts the completion item automatically
                        -- when selecting it
                        auto_insert = false,
                    },
                },
            },
            signature = {
                -- Show argument signature
                enabled = true,
            },
            cmdline = {
                -- use "inherit" to inherit mappings from top level `keymap` config
                keymap = {
                    preset = "inherit",
                },
                completion = {
                    menu = {
                        -- show the menu only when writing commands
                        auto_show = function(ctx)
                            return vim.fn.getcmdtype() == ':'
                        end,
                    },
                    ghost_text = {
                        enabled = false,
                    },
                },
            },
            sources = {
                -- add lazydev to your completion providers
                default = { "lazydev", "lsp", "path", "snippets", "buffer" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100,
                    },
                },
            },
        },
    }
}
