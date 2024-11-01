local bufferline = require('bufferline')

bufferline.setup({
    options = {
        seperator_style = bufferline.thick,
        style_preset = bufferline.style_preset.no_italic,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end
    }
})
