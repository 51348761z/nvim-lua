require('packer').init({
    git = {
        default_url_format = 'git@github.com:%s'
        --[[ default_url_format = 'https://hub.fastgit.xyz:%s' ]]
    }
})
require("plugins")

require("lsp.mason-conf")
require("lsp.mason-lspconfig")
require("lsp.lspconfig-conf")

require("user.options")
require("user.keymaps")
require("user.colorscheme")
require("user.cmp")
require("user.telescope")
require("user.treesitter")
require("user.twilight")
require("user.autopairs")
require("user.comment")
require("user.gitsign")
require("user.nvim-tree")
require("user.bufferline")
