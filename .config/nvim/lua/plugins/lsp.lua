return {
    {
        "mason-org/mason-lspconfig.nvim",
        version = false,
        dependencies = {
            {
                "mason-org/mason.nvim",
                version = false,
                opts = {},
            },
            {
                "neovim/nvim-lspconfig",
                version = false,
            },
        },
        opts = {
            -- List of configs from nvim-lspconfig
            ensure_installed = {
                "lua_ls",
                "phpactor",
            },
        },
    }
}
