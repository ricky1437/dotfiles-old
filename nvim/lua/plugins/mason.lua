return {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
            "lua_ls",
            "clangd",
            "cmake",
            "gopls",
            "pylsp"
        }
    }
}
