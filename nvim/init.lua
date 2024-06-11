require("magic")

vim.cmd.colorscheme("everforest")

vim.cmd("let g:netrw_banner=0")

-- Start in the file tree if neovim was not opened with a file
if vim.fn.argc() == 0 then
    vim.cmd.Ex()
end
