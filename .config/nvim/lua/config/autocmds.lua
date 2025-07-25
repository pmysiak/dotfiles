-- Highlight when yanking (copying) text
-- Try it with `yap` in normal mode
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Change default comment for php from /* */ to //
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"php"},
    callback = function()
        vim.opt_local.commentstring = "// %s"
    end,
})

-- Autosave all opened files
-- i.e. switch to another program or workspace
vim.api.nvim_create_autocmd("FocusLost", {
    desc = "Autosave all files on focus lost",
    callback = function()
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].modifiable
                and vim.bo[bufnr].modified then
                -- Auto commands don't trigger all events as user call
                -- i.e. write called from auto command doesn't trigger
                -- conform format_on_save
                -- so we need explicitly call conform.format()
                require("conform").format({ bufnr = bufnr })

                vim.api.nvim_buf_call(bufnr, function()
                    vim.cmd("write")
                end)
            end
        end
    end,
})
