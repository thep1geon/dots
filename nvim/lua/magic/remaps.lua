vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

--vim.keymap.set("n", "gr", "gd[{V%::s/<C-R>///gc<left><left><left>")
-- vim.keymap.set("n", "gr", "gD:%s/<C-R>///gc<left><left><left>")

-- Splitting the window and switching between windows

vim.keymap.set("n", "<leader>sh", "<C-w>s")
vim.keymap.set("n", "<leader>sv", "<C-w>v")

-- Tabs

vim.keymap.set("n", "<leader>t", ":tabnew<CR>")
vim.keymap.set("n", "<leader><TAB>", ":tabn<CR>")
vim.keymap.set("n", "<leader><S-TAB>", ":tabp<CR>")
