return {
    {
        "nvim-telescope/telescope.nvim",
        version = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local actions = require("telescope.actions")

            require("telescope").setup({
                defaults = {
                    sorting_strategy = "ascending",
                    layout_strategy = "flex",
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                        prompt_position = "top",
                    },
                    prompt_prefix = "🔍",
                    selection_caret = "",
                    entry_prefix = "",
                    dynamic_preview_title = true,
                    results_title = false,
                    file_ignore_patterns = {
                        ".git/",
                    },
                    vimgrep_arguments = {
                        -- Will be used for live_grep and grep_string
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--trim", -- Trim indentation from beginning 
                        "--hidden", -- Search also hidden files and directories 
                        -- "--no-ignore", -- Ignore files such as .gitignore, .ignore, .rgignore
                        "--fixed-strings", -- Disable regular expression matching and treat the pattern as a literal string 
                    },
                    mappings = {
                        i = {
                            ["<Esc>"] = actions.close,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        path_display = {
                            "filename_first",
                        },
                    },
                    live_grep = {
                        path_display = {
                            "filename_first",
                        },
                        disable_coordinates = true,
                    },
                    buffers = {
                        preview = false,
                        path_display = {
                            "filename_first",
                        },
                    },
                    treesitter = {
                        preview = true,
                        show_line = false,
                        -- symbols = { "method" }, -- show only methods
                    },
                    lsp_references = {
                        path_display = {
                            "filename_first",
                        },
                    },
                    lsp_document_symbols = {
                        symbol_width = 50,
                    },
                    lsp_dynamic_workspace_symbols = {
                        path_display = {
                            "filename_first",
                        },
                        fname_width = 30,
                        symbol_width = 40,
                    },
                    lsp_implementations = {
                        path_display = {
                            "filename_first",
                        },
                        show_line = false,
                    },
                },
            })
        end,
        keys = {
            {
                "<leader>ff",
                "<cmd>Telescope find_files hidden=true<cr>",
                desc = "Find files",
            },
            {
                "<leader>fg",
                mode = {"n"},
                function()
                    local opts = {
                        default_text = vim.fn.expand("<cword>"),
                    }

                    if require("nvim-tree.api").tree.is_visible() then
                        opts = {
                            cwd = require("merlin.nvim-tree").get_current_directory(),
                        }
                    end

                    require("telescope.builtin").live_grep(opts)
                end,
                desc = "Find in files",
            },
            {
                "<leader>fg",
                mode = {"v"},
                function()
                    require("telescope.builtin").live_grep({
                        default_text = require("merlin.editor").get_selected_text(),
                    })
                end,
                desc = "Find in files",
            },
            {
                "<leader>b",
                "<cmd>Telescope buffers sort_lastused=true sort_mru=true<cr>",
                desc = "Buffers",
            },
            {
                "<leader>fh",
                "<cmd>Telescope help_tags<cr>",
                desc = "Help tags"
            },
            {
                "gj",
                "<cmd>Telescope lsp_references<cr>",
                desc = "Show references",
            },
            {
                "go",
                "<cmd>Telescope lsp_document_symbols<cr>",
                desc = "File symbol (buffer)",
            },
            {
                "<leader>fs",
                "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
                desc = "Find symbol (project)",
            },
            {
                "gi",
                "<cmd>Telescope lsp_implementations<cr>",
                desc = "Show implementations",
            },
            {
                "gd",
                "<cmd>Telescope lsp_definitions<cr>",
                desc = "Go to definition",
            },
        }
    },
}
