-- remap leader and explorer
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- run this file, typically with /usr/bin/env
vim.keymap.set("n", "<F9>", ':!%:p<CR>')

-- callout to formatting tools
vim.keymap.set("n", "<leader>fmb", "<CMD>!black -q -l 130 %<CR>")
vim.keymap.set("n", "<leader>fmr", "<CMD>!ruff check --fix %<CR>")
vim.keymap.set("n", "<leader>fmj", "<CMD>!jsonnetfmt -i -n 2 %<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
