return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = function()
            local bufferline = require("bufferline")

            return {
                options = {
                    style_preset = bufferline.style_preset.no_italic,
                    indicator = {
                        style = "none",
                    },
                    name_formatter = function(buf)
                        -- Return relative path to working directory
                        return vim.fn.fnamemodify(buf.path, ":~:.")
                    end,
                    max_name_length = 118,
                    custom_filter = function(buf_number, buf_numbers)
                        -- Show only current buffer
                        return buf_number == vim.api.nvim_get_current_buf()
                    end,
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            text_align = "center",
                            highlight = "Directory",
                            separator = "█",
                        },
                    },
                    show_buffer_close_icons = false,
                    separator_style = "slant",
                },
            }
        end
    }
}
