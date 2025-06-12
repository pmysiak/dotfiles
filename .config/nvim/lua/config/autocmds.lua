-- Highlight when yanking (copying) text
-- Try it with `yap` in normal mode
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
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
        local success, err = pcall(vim.cmd, "wall")
        if not success then
            vim.api.nvim_echo({ { "Error: " .. err } }, false, {})
        end
    end,
})
