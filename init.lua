require("user.options")
require("user.keymaps")
require("user.colorscheme")
require("user.completion")

require('packer').init({
    git = {
        default_url_format = 'git@github.com:%s'
    }
})
require("plugins")

require("lsp.mason-conf")
require("lsp.lspconfig-conf")
require("lsp.settings.sumneko_lua")


