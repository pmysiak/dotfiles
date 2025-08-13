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
            -- Default diagnostic config
            vim.diagnostic.config({
                underline = true,
                virtual_text = false,
                virtual_lines = {
                    current_line = true,
                },
                update_in_insert = false,
                severity_sort = true,
            })

            -- Logging debug messages to ~/.local/state/nvim/lsp.log
            vim.lsp.set_log_level("debug")

            vim.lsp.config(
                "phpactor",
                {
                    init_options = {
                        ["language_server_configuration.auto_config"] = false,
                        ["language_server_phpstan.enabled"] = false,
                        ["language_server_psalm.enabled"] = false,
                        ["language_server_php_cs_fixer.enabled"] = false,
                        ["php_code_sniffer.enabled"] = false,
                        ["blackfire.enabled"] = false,
                        ["prophecy.enabled"] = false,
                        ["behat.enabled"] = false,
                        ["symfony.enabled"] = true,
                        ["phpunit.enabled"] = true,
                    },

                    -- cmd = vim.lsp.rpc.connect('127.0.0.1', tonumber(8888))
                    -- cmd = {"docker", "exec", "-i", "phpactor-php-1", "bin/phpactor", "language-server"},
                    cmd = {"/home/merlin/projects/phpactor/bin/phpactor", "language-server"},
                }
            )
        end
    },
}
