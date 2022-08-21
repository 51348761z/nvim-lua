local npairs = require'nvim-autopairs'
local Rule = require'nvim-autopairs.rule'
local cond = require'nvim-autopairs.conds'

require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})


npairs.setup {
  check_ts = true, -- treesitter integration
  disable_filetype = { "TelescopePrompt" },
  chars = { '{', '[', '(', '"', "'" , "<"},
}

--- TODO: not working with cmp
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {})

