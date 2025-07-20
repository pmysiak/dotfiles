return {
    {
        "nvim-lualine/lualine.nvim",
        version = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            options = {
                globalstatus = true,
                component_separators = "",
                section_separators = "",
                always_divide_middle = false,
            },
            sections = {
                lualine_a = {"mode"},
                lualine_b = {"branch", "diff"},
                lualine_c = {"diagnostics"},
                lualine_x = {
                    {
                        require("lazy.status").updates,
                        cond = require("lazy.status").has_updates,
                        color = { fg = "#ff9e64" },
                    },
                    "filetype",
                },
                lualine_y = {
                    {
                        "progress",
                        -- Trim padded spaces
                        fmt = function(str) return str:gsub("%s+", "") end,
                    },
                    "searchcount",
                },
                lualine_z = {
                    {
                        "location",
                        -- Trim padded spaces
                        fmt = function(str) return str:gsub("%s+", "") end,
                    },
                },
            },
            -- tabline = {
            --     lualine_a = {
            --         {
            --             "filename",
            --             path = 1, -- Relative path 
            --             shorting_target = 0,
            --             icon = {""},
            --         },
            --     },
            -- },
        },
    }
}

