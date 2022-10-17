--[[ 
*********************************************************
to install the Plugin Manager, run thi in the shell

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

to get CoC running, we need to
1. sudo npm install -g yarn
2. cd /home/michi/.local/share/nvim/plugged/coc.nvim & yarn install
3. install the coc-language specifics via
   :CocInstall coc-pyright    # Note the coc-python is deprecated

*********************************************************
--]]
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local o = vim.opt
local g = vim.g
local vc = vim.cmd

-- general settings
o.number = true
o.relativenumber = true
o.autoindent= true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.mouse = "a"
o.smarttab= true
o.expandtab = true
o.encoding = "utf-8"
o.clipboard = "unnamedplus" -- for system clipboard interaction
o.showmode = false
o.termguicolors = true
o.cursorline = true

require "keymaps"
require "plugins"

vc[[
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
]]

-- au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

-- vc[[colorscheme jellybeans]]
-- vc[[colorscheme noctis]]
vc[[colorscheme onedark]]
-- vc[[colorscheme minimalist]]

-- Tab completion for autosuggest
vc[[
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
]]
-- addustable fontsize 
g.gui_font_default_size = 11
g.gui_font_size = g.gui_font_default_size
g.gui_font_face = "Fira Code Light"

RefreshGuiFont = function()
	o.guifont = string.format("%s:h%s",g.gui_font_face, g.gui_font_size)
end

ResizeGuiFont = function(delta)
	g.gui_font_size = g.gui_font_size + delta
	RefreshGuiFont()
end

ResetGuiFont = function()
    g.gui_font_size = g.gui_font_default_size
    RefreshGuiFont()
end

-- Call function on startup to set default value
ResetGuiFont()

-- Keymaps for resize
local opts = { noremap = true, silent = true }

vim.keymap.set({'n', 'i'}, "<C-+>", function() ResizeGuiFont(1)  end, opts)
vim.keymap.set({'n', 'i'}, "<C-->", function() ResizeGuiFont(-1) end, opts)


-- folding stuff
vim.wo.foldcolumn="auto:5" -- fold markers on the side 
vc[[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
]]

