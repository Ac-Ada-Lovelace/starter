return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                ccls = {
                    init_options = {
                        cache = { directory = ".ccls-cache" },
                    },
                    capabilities = {
                        offsetEncoding = { "utf-8" },
                    },
                },
            },
        },
    },
}
