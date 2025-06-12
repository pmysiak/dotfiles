return {
    {
        "folke/lazydev.nvim",
        version = false,
        ft = "lua",
        opts = {
            library = {
                -- Load large luvit types only when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    }
}
