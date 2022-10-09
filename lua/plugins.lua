local vc = vim.cmd

vim.call('plug#begin')
vc[[
Plug 'http://github.com/tpope/vim-surround'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
" Plug 'https://github.com/tc50cal/vim-terminal'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/neoclide/coc.nvim'
Plug 'https://github.com/lewis6991/gitsigns.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'mhinz/vim-startify'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'kartikp10/noctis.nvim'
Plug 'rktjmp/lush.nvim'  " required by noctis
Plug 'numToStr/Comment.nvim'   " comments
Plug 'folke/which-key.nvim'
Plug 'https://github.com/lunarvim/onedarker.nvim'
Plug 'dhruvasagar/vim-dotoo'
Plug 'inkarkat/vim-ShowTrailingWhitespace'
Plug 'inkarkat/vim-ingo-library'
Plug 'norcalli/nvim-colorizer.lua' "inline color display
]]
vim.call('plug#end')


require('gitsigns').setup()
require("bufferline").setup {}
require('nvim-web-devicons').setup {}
require('Comment').setup()
require("which-key").setup {}
require'colorizer'.setup()
-- require("nvim-tree").setup()
-- require("nvim-tree").setup({
--   sort_by = "case_sensitive",
--   view = {
--     adaptive_size = false,
--     mappings = {
--       list = {
--         { key = "<C-y>", action = "tabnew" },
--       },
--     },
--   },
--   renderer = {
--     group_empty = true,
--   },
--   filters = {
--     dotfiles = true,
--   },
-- })



-- doToo setup
vc[[
let g:dotoo#agenda#files=['~/Dropbox/dotoo-files/*.dotoo']
let g:dotoo#capture#refile=expand('~/Dropbox/dotoo-files/refile.dotoo')
]]

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

-- treesitter setup
require 'nvim-treesitter.configs'.setup{
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
  indent = {
    enable = true
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
	\ '~/ms_python_packages',
	\ '~/postdoc_seattle/CRUK-code',
	\ { 'n': '~/Dropbox/cruk-meetings.md'},
	\ '~/Nextcloud/blogsite/_posts',
	\ { 'ci': '~/.config/nvim/init.lua' },
	\ { 'cp': '~/.config/nvim/lua/plugins.lua' },
	\ { 'ck': '~/.config/nvim/lua/keymaps.lua' },
	\ { 'cq': '~/.config/qtile/config.py'},
	\ { 'z': '~/.zshrc' },
	\ ]

let g:startify_custom_header = ''
]]
