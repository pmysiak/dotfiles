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
    },
    {
        "neovim/nvim-lspconfig",
        version = false,
        config = function()
            -- Logging debug messages to ~/.local/state/nvim/lsp.log
            vim.lsp.set_log_level("debug")

            vim.lsp.config(
                "phpactor",
                {
                    -- cmd = vim.lsp.rpc.connect('127.0.0.1', tonumber(8888))
                    cmd = {"docker", "exec", "-i", "phpactor-php-1", "bin/phpactor", "language-server"},
                }
            )
        end
    },
}
