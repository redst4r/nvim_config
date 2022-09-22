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
local o = vim.opt
local g = vim.g
local vc = vim.cmd


o.number = true
o.relativenumber = true
o.autoindent= true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.mouse = "a"
o.smarttab= true
o.encoding = "utf-8"
o.clipboard = "unnamedplus"
o.showmode = false
o.termguicolors = true
o.cursorline = true

-- Plugins
-- plugins go into /home/michi/.local/share/nvim/plugged/coc.nvim
vim.call('plug#begin')
vc[[Plug 'http://github.com/tpope/vim-surround']]
vc[[Plug 'http://github.com/tpope/vim-surround']]
vc[[Plug 'https://github.com/vim-airline/vim-airline']]
vc[[Plug 'https://github.com/vim-airline/vim-airline-themes']]
vc[[Plug 'https://github.com/preservim/nerdtree']]
vc[[Plug 'https://github.com/rafi/awesome-vim-colorschemes']]
vc[[Plug 'https://github.com/ryanoasis/vim-devicons']]
vc[[Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}]]
vc[[Plug 'kyazdani42/nvim-web-devicons']]
vc[[Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }]]
vc[[Plug 'https://github.com/tc50cal/vim-terminal' ]]
vc[[Plug 'https://github.com/preservim/tagbar' ]]
vc[[Plug 'https://github.com/neoclide/coc.nvim'  ]]
vc[[Plug 'https://github.com/lewis6991/gitsigns.nvim']]
vc[[Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }]]
vc[[Plug 'mhinz/vim-startify']]
vim.call('plug#end')

vc[[colorscheme jellybeans]]

require('gitsigns').setup()
require("bufferline").setup{}
require('nvim-web-devicons').setup{}

--
-- Airline setup
vc[[
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
]]

-- Tab completion for autosuggest
vc[[
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
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

-- keys
local function map(m, k,v)
	vim.keymap.set(m, k, v, { silent = true})
end

map({'n','i','v'}, '<C-f>', ':NERDTreeFocus<CR>')
map({'n','i','v'}, '<C-t>', ':NERDTreeToggle<CR>')
--map({'n','i','v'},'<C-n>', ':NERDTree<CR>')
map({'n','i','v'},'<C-n>', ':TagbarToggle<CR>')

-- treesitter setup

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "python", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = false,


  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- TODO change those keymaps to something usefull
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}


-- startify \
vc[[
let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ ]
let g:startify_bookmarks = [
	\ { 'c': '~/.config/nvim/init.lua' },
	\ { 'z': '~/.zshrc' },
	\ '~/ms_python_packages',
	\ '~/postdoc_seattle',
	\ '~/Pics',
	\ ]

let g:startify_custom_header = ''
]]
