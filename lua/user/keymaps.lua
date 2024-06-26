local opts = { noremap = true, silent = true }
-- local opts = { noremap = true, silent = false }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>bq", ":bdelete<CR>", opts)


-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- For wsl copy --
keymap("n", "<leader>wy", "<Plug>WslCopy", opts)
keymap("x", "<leader>wy", "<Plug>WslCopy", opts)

-- LSP plugin control  --
keymap("n", "<leader>lm", ":Mason<CR>", opts)
keymap("n", "<leader>li", ":LspInfo<CR>", opts)

-- Telescope --
keymap("n", "<leader>tf", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>tg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>tb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>th", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)

-- Packer --
keymap("n", "<leader>ps", ":PackerSync<CR>", opts)
keymap("n", "<leader>pt", ":PackerStatus<CR>", opts)
keymap("n", "<leader>pc", ":PackerClean<CR>", opts)

-- Nvim-tree --
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Tab control and window split -- 
vim.cmd [[
  noremap <silent>tn :tabnew<CR>
  noremap <silent>tq :tabclose<CR>
  noremap <silent>te :tabn<CR>
  noremap <silent>tu :tabp<CR>
  " noremap <silent><leader>t :tabnew<CR>
  " noremap <silent><leader>g :tabclose<CR>
  noremap <silent><leader>1 :tabn 1<CR>
  noremap <silent><leader>2 :tabn 2<CR>
  noremap <silent><leader>3 :tabn 3<CR>
  noremap <silent><leader>4 :tabn 4<CR>
  noremap <silent><leader>5 :tabn 5<CR>
  noremap <silent><leader>6 :tabn 6<CR>
  noremap <silent><leader>7 :tabn 7<CR>
  " noremap <silent><s-tab> :tabnext<CR>
  " noremap <silent><s-tab> <ESC>:tabnext<CR>
    "slipt window
  """"""""""""""""""""""""""""""""""
  nnoremap <silent><leader>sh :split<CR>
  nnoremap <silent><leader>sv :vsplit<CR>
]]
