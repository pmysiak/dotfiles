return {
    {
        "williamboman/mason.nvim",
        version = false,
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        version = false,
        config = function()
            require("mason-lspconfig").setup {
                -- List of configs from nvim-lspconfig
                ensure_installed = {
                    "lua_ls",
                    "phpactor",
                },
            }
        end
    },
    {
        "neovim/nvim-lspconfig",
        version = false,
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            -- List of configs from nvim-lspconfig
            vim.lsp.enable({
                "lua_ls",
                "phpactor",
            })
        end
    }
}
