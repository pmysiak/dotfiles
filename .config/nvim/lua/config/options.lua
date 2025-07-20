-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.localleader = " "

-- File encoding
vim.opt.fileencoding = "utf-8"

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Sync with system clipboard
vim.opt.clipboard = "unnamedplus"

-- Show trailing chars
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", extends = "…" }

-- Highlight current line
vim.opt.cursorline = true

-- How many lines is visible above and below cursor
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 10

-- if performing an operation that would fail due to unsaved changes
-- in the buffer (like `:q`), instead raise a dialog asking if you wish
-- to save the current file(s)
vim.opt.confirm = true

-- Disable netrw at the very start of your init.lua
-- Recommended by nvim-tree plugin
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Searching (case-insensitive) but when type some upper-case letter
-- it will be case-sensitive
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Don't wrap long lines
vim.opt.wrap = false

-- Defines the default border style of floating windows
-- NOTICE: Don't change (Telescope visual will broken)
-- https://github.com/nvim-telescope/telescope.nvim/issues/3436
vim.opt.winborder = "none"

-- Set window title to currently opened file
vim.opt.title = true

-- File changes history
vim.opt.undolevels = 10000

-- Highlight 121th column
vim.opt.colorcolumn = "121"

-- Session (recommended by rmagatti/auto-session plugin)
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

