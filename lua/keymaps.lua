-- keys
local function map(m, k,v)
	vim.keymap.set(m, k, v, { silent = true})
end

-- Leader key
vim.g.mapleader =" "
map({'n','i','v'}, '<C-t>', ':NERDTreeToggle<CR>')
map({'n','i','v'},'<C-n>', ':TagbarToggle<CR>')

-- map({'n','i','v'}, '<C-t>', ':NvimTreeToggle<CR>')
-- map({'n','i','v'}, '<C-f>', ':NvimTreeFocus<CR>')


-- window navigation
map({'n','i','v'},'<C-h>', '<C-w>h')
map({'n','i','v'},'<C-j>', '<C-w>j')
map({'n','i','v'},'<C-k>', '<C-w>k')
map({'n','i','v'},'<C-l>', '<C-w>l')

-- buffer/window navigation
map('n', '<leader>l', ':bnext<cr>')
map('n', '<leader>h', ':bprev<cr>')

-- ESC
map('i', 'jk', '<ESC>')

-- indentation
map('v', '>', '>gv')
map('v', '<', '<gv')

-- move text up and down
map('v', '<A-j>', ':m .+1<CR>==')
map('v', '<A-k>', ':m .-2<CR>==')
map('v', 'p', '_dP')


-- Telescope
map('n', '<leader>ff', ':Telescope find_files<cr>')
map('n', '<leader>fg', ':Telescope live_grep<cr>')
