-- I want to use Git instead of curl for downloading the parsers
require("nvim-treesitter.install").prefer_git = true

-- I want to use a mirror instead of "https://github.com/":
for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
  config.install_info.url = config.install_info.url:gsub("https://github.com/", "https://hub.fastgit.xyz/")
end

-- I want to use a HTTP proxy for downloading the parsers
--- require("nvim-treesitter.install").command_extra_args = {
---     curl = { "--proxy", "<proxy url>" },
--- }

local configs = require("nvim-treesitter.configs")
configs.setup {
  -- ensure_installed = "all",
  ensure_installed = "all",
  sync_install = false,
  auto_install = true,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,

  },

  -- 缩进格式化，默认键‘ = ’
  indent = { enable = true, disable = { "" } },

  -- 启用增量选择
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    },
  },

  context_commentstring = {
    enable = true
  }
}

-- 开启 Folding 快捷键 ： ‘zc’ 'zo'
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
vim.wo.foldlevel = 99
