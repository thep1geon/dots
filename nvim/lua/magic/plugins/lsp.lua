return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "clangd",
                "rust_analyzer",
                "zls",
                "pylsp",
            },
            automatic_installation = true,
            handlers = {
                -- function(server_name) -- default handler (optional)
                --
                --     require("lspconfig")[server_name].setup {
                --         capabilities = capabilities
                --     }
                -- end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,

                ["rust_analyzer"] = function ()
                    local lspconfig = require("lspconfig")
                    lspconfig.rust_analyzer.setup({
                        capabilities = capabilities,
                    })
                end,

                ["zls"] = function ()
                    local lspconfig = require("lspconfig")
                    lspconfig.zls.setup({
                        capabilities = capabilities,
                        cmd = { "/usr/bin/zls" },
                    })
                end,

                ['clangd'] = function()
                    local lspconfig = require('lspconfig')
                    lspconfig.clangd.setup({
                        init_options = {
                            usePlaceholders = true,
                            completeUnimported = true,
                            clangdFileStatus = true,
                        },

                        cmd = {
                            "clangd",
                            -- "--background-index",
                            "--header-insertion=iwyu",
                            "--completion-style=detailed",
                            "--suggest-missing-includes",
                            -- "--function-arg-placeholders",
                            "--fallback-style=\"llvm\"",
                        },

                        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
                        root_dir = lspconfig.util.root_pattern(
                            'makefile',
                            '.clangd'
                            ,'.clang-tidy'
                            ,'.clang-format'
                            ,'compile_commands.json'
                            ,'compile_flags.txt'
                            ,'configure.ac'
                            ,'.git'
                        ),
                        single_file_support = true,
                    })
                end,

                ['jdtls'] = function ()
                    require("lspconfig").jdtls.setup({
                        cmd = { "jdtls" },
                    })
                end,

                ['pylsp'] = function ()
                    require('lspconfig').pylsp.setup({
                        settings = {
                            pylsp = {
                                plugins = {
                                    pylint = {
                                        enabled = true,
                                        args = {
                                            "--disable=C0111",
                                            "--disable=C0115",
                                            "--disable=C0116",
                                        }
                                    },
                                    rope_autoimport = {
                                        enabled = true,
                                        completions = {
                                            enabled = true,
                                        }
                                    },
                                    pydocstyle = {
                                        enabled = false,
                                    },
                                    pycodestyle = {
                                        enabled = false,
                                        ignore = {'W391'},
                                        maxLineLength = 100
                                    }
                                }
                            }
                        }
                    })
                end
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
                { name = 'path' },
                { name = 'nvim_lsp_signature_help' },
            }, {
                { name = 'buffer' },
            })
        })

        cmp.event:on(
          'confirm_done',
          cmp_autopairs.on_confirm_done()
        )

        vim.diagnostic.config({
            update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
