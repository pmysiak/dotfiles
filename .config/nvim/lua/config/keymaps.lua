
-- Note: Shortcuts <C-h>, <C-j>, <C-k> and <C-l> are remapped
-- to arrows in .config/alacritty/alacritty.toml

-- Clear highlights on search when pressing <Ctrl-c> in normal mode
vim.keymap.set('n', '<C-c>', '<cmd>nohlsearch<CR>')

-- Save and quit (close) all buffers
vim.keymap.set("n", "<leader>qq", "<cmd>wqall<cr>", { desc = "Save and quit all buffers" })

-- Ctrl-c to escape to normal mode
vim.keymap.set({"i", "x"}, "<C-c>", "<Esc>")

-- Scroll half-page up or down with cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Move selected lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Indent selected lines right or left (selection preserved)
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Go to start or end of line easier
vim.keymap.set({ "n", "x" }, "H", "^")
vim.keymap.set({ "n", "x" }, "L", "g_")

-- Center highlighted search term
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Don't copy to register after delete
vim.keymap.set("n", "x", '"_x')
vim.keymap.set({ "n", "x" }, "d", '"_d')

-- Resize current window
vim.keymap.set("n", "<C-up>", ":resize -3<cr>", { silent = true })
vim.keymap.set("n", "<C-down>", ":resize +3<cr>", { silent = true })
vim.keymap.set("n", "<C-left>", ":vertical resize -3<cr>", { silent = true })
vim.keymap.set("n", "<C-right>", ":vertical resize +3<cr>", { silent = true })

-- Save all files
vim.keymap.set("n", "<C-s>", "<cmd>wall<cr>")

-- Insert newline without entering insert mode (support counter)
vim.keymap.set(
    "n",
    "<leader>o",
    function()
        local count = vim.v.count > 0 and vim.v.count or 1
        local line = vim.fn.line('.')
        local empty_lines = {}
        for _ = 1, count do table.insert(empty_lines, "") end

        vim.api.nvim_buf_set_lines(0, line, line, false, empty_lines)
    end,
    { desc = "Insert newline below" }
)
vim.keymap.set(
    "n",
    "<leader>O",
    function()
        local count = vim.v.count > 0 and vim.v.count or 1
        local line = vim.fn.line('.') - 1
        local empty_lines = {}
        for _ = 1, count do table.insert(empty_lines, "") end

        vim.api.nvim_buf_set_lines(0, line, line, false, empty_lines)
    end,
    { desc = "Insert newline above" }
)

-- Remove word before cursor
-- Remap to <C-w> doesn't work in telescope prompt
vim.keymap.set("i", "<C-BS>", "<C-S-w>")
