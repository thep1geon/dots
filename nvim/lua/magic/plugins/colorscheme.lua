return {
    "catppuccin/nvim",
    priority  = 1000,
    name = "catppuccin",
    config = function()
        require("catppuccin").setup({
            transparent_background = true,
        })

        -- Hide semantic highlights for functions
        vim.api.nvim_set_hl(0, '@lsp.type.function', {})
        -- Hide all semantic highlights
        for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
            vim.api.nvim_set_hl(0, group, {})
        end
    end,
}
