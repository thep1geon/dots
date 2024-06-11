return {
    "sainnhe/everforest",

    "ellisonleao/gruvbox.nvim",

    "nvim-lua/plenary.nvim",

    {
        'nvim-lualine/lualine.nvim', name = "lualine",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = true,
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },

    {
        "numToStr/Comment.nvim",
        config = function ()
            require("Comment").setup({})
        end
    },
}
