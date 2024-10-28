require("mason").setup()
require("mason-lspconfig").setup()

require('mason-lspconfig').setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {}
        require('lspconfig').ts_ls.setup({
            on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end,
        })
    end,
}

require('mini.completion').setup()
