return {
    {
        "mfussenegger/nvim-lint",
        version = false,
        config = function()
            local lint = require("lint")

            lint.linters_by_ft = {
                -- php = { "php" },
            }

            vim.api.nvim_create_autocmd({ "BufReadPre", "BufWritePost", "InsertLeave" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },
}
