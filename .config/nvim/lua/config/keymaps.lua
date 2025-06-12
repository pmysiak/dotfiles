
-- Note: Shortcuts <C-h>, <C-j>, <C-k> and <C-l> are remapped
-- to arrows in .config/alacritty/alacritty.toml

-- Clear highlights on search when pressing <Ctrl-c> in normal mode
vim.keymap.set('n', '<C-c>', '<cmd>nohlsearch<CR>')

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!"<cr>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!"<cr>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!"<cr>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!"<cr>')

-- Save and quit (close) all windows
vim.keymap.set("n", "<leader>qq", "<cmd>wqall<cr>")

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
vim.keymap.set({ "n", "x" }, "x", '"_x')
vim.keymap.set({ "n", "x" }, "d", '"_d')

-- Resize current window
vim.keymap.set("n", "<C-up>", ":resize -3<cr>", { silent = true })
vim.keymap.set("n", "<C-down>", ":resize +3<cr>", { silent = true })
vim.keymap.set("n", "<C-left>", ":vertical resize -3<cr>", { silent = true })
vim.keymap.set("n", "<C-right>", ":vertical resize +3<cr>", { silent = true })
