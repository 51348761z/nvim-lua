local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- Telescope highlights group
vim.cmd[[
  highlight TelescopeSelection      guifg=#D79921 gui=bold " Selected item
  highlight TelescopeSelectionCaret guifg=#CC241D          " Selection caret
  highlight TelescopeMultiSelection guifg=#928374          " Multisections
  highlight TelescopeNormal         guibg=#00000           " Floating windows created by telescope

  " Border highlight groups
  highlight TelescopeBorder         guifg=#ffffff
  highlight TelescopePromptBorder   guifg=#ffffff
  highlight TelescopeResultsBorder  guifg=#ffffff
  highlight TelescopePreviewBorder  guifg=#ffffff

  " Highlight characters your input matches
  highlight TelescopeMatching       guifg=blue

  " Color the prompt prefix
  highlight TelescopePromptPrefix   guifg=red
]]

