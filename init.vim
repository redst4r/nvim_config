:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set mouse=a
:set smarttab

" plugins go into /home/michi/.local/share/nvim/plugged/coc.nvim
call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
" Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/lewis6991/gitsigns.nvim'  " git highlight
" Plug 'sunjon/shade.nvim'  " shading non focused windows
call plug#end()

set encoding=UTF-8

" Shortcut for NERDtree
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

":let g:NERDTreeDirArrowExpandable="*"
":let g:NERDTreeDirArrowCollapsible="~"


:colorscheme jellybeans

" Don't forget set the airline theme as well.
" let g:airline_theme = 'simple'

" Note, the above line is ignored in Neovim 0.1.5 above, use this line instead.
set termguicolors

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



" code to get adjustable fonzie
" vim.g.gui_font_default_size = 12
" vim.g.gui_font_size = vim.g.gui_font_default_size
" vim.g.gui_font_face = "Fira Code Retina"

" RefreshGuiFont = function()
"   vim.opt.guifont = string.format("%s:h%s",vim.g.gui_font_face, vim.g.gui_font_size)
" end

" ResizeGuiFont = function(delta)
"   vim.g.gui_font_size = vim.g.gui_font_size + delta
"   RefreshGuiFont()
" end

" ResetGuiFont = function()
"   vim.g.gui_font_size = vim.g.gui_font_default_size
"   RefreshGuiFont()
" end

" -- Call function on startup to set default value
" ResetGuiFont()

" -- Keymaps

" local opts = { noremap = true, silent = true }

" vim.keymap.set({'n', 'i'}, "<C-+>", function() ResizeGuiFont(1)  end, opts)
" vim.keymap.set({'n', 'i'}, "<C-->", function() ResizeGuiFont(-1) end, opts)
"
"

" git setup
lua << EOF
require('gitsigns').setup()
EOF

" bufferline setup
set termguicolors
lua << EOF
require("bufferline").setup{}
EOF
