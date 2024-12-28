return {

    { "Marskey/telescope-sg" },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = function(_, opts)
            local telescope = require("telescope")
            telescope.setup(vim.tbl_deep_extend("force", opts, {
                extensions = {
                    ast_grep = {
                        command = {
                            "sg",
                            "--json=stream",
                        }, -- must have --json=stream
                        grep_open_files = false, -- search in opened files
                        lang = nil, -- string value, specify language for ast-grep `nil` for default
                    },
                },
            }))
        end,
        config = function(_, opts)
            require("telescope").load_extension("ast_grep")
            -- Key mapping for <leader>sA
            vim.keymap.set("n", "<leader>sA", function()
                require("telescope").extensions.ast_grep.ast_grep()
            end, { desc = "Telescope AST Grep" })
        end,
    },
}
