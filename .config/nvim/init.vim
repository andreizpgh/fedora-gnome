" NEOVIM CONFIGURATION FILE                          

" Plugins
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'lambdalisue/suda.vim'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'projekt0n/github-nvim-theme'
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" File Explorer
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'preservim/nerdtree'
" Which-key
Plug 'folke/which-key.nvim'
" Multiple Cursors (Ctrl-n)
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Better Quick Fix
Plug 'stefandtw/quickfix-reflector.vim'
" Syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-eslint']
" CSS Colors 
Plug 'ap/vim-css-color'
" Git 
Plug 'NeogitOrg/neogit'
Plug 'lewis6991/gitsigns.nvim'
Plug 'itchyny/vim-gitbranch'
" Live Server
Plug 'barrett-ruth/live-server.nvim'
call plug#end()

" Changing <Leader> key
let mapleader = " "

" Coc Completion
" Some servers have issues with backup files
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved
set signcolumn=yes

" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting
"command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
"autocmd BufNew,BufEnter *.md execute "silent! CocDisable"
"autocmd InsertLeave *.css silent Prettier
"autocmd BufWritePre *.html silent :%!js-beautify --type html
"autocmd BufWritePre *.vim normal gg=G
"autocmd InsertLeave *.html silent :CocCommand prettier.forceFormatDocument
"autocmd InsertLeave *.css silent :CocCommand prettier.forceFormatDocument
"autocmd InsertLeave *.scss silent :CocCommand prettier.forceFormatDocument
"autocmd InsertLeave *.js silent :CocCommand prettier.forceFormatDocument
"autocmd InsertLeave *.ts silent :CocCommand prettier.forceFormatDocument
"autocmd InsertLeave *.tsx silent :CocCommand prettier.forceFormatDocument

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Center cursor
:set so=7

" set colorcolumn=61

" Turn line numbers on
set number
set relativenumber
" Change line number coloring
:highlight LineNr ctermfg=grey

" Copy and paste to/from clipboard
set clipboard+=unnamedplus

" Press 'W' to write file with sudo privileges
com W :execute 'SudaWrite'

" Easymotion configuration
let g:EasyMotion_off_screen_search = 0

syntax on
colorscheme github_dark_dimmed

" Define lightline configuration
let g:lightline = {
			\ 'colorscheme': 'onedark',
			\ 'active': { 
			\   'left':  [ [ 'filename' ] ],
			\   'right': [ [ 'lineinfo' ],
			\              [ 'gitbranch' ] ] },	
			\ 'component': {
			\   'lineinfo': "%{line('.') . '/' . line('$')}",
			\   'filename': "%{expand('%:p:h:h:h:t')}/%{expand('%:p:h:h:t')}/%{expand('%:p:h:t')}/%t",
			\ },
			\ 'component_function': {
	                \   'gitbranch': 'gitbranch#name',
                        \ },
			\ }

"set noshowmode " remove '--insert--' from below the statusline
"set cmdheight=0
set showtabline=0

" Case insensitive search
:set ic
" Clear search highlighting
nnoremap <CR> :noh<CR>
" Search for an exact match
nnoremap ? /\<\><left><left>
" Replace search results
nnoremap r :%s/<c-r>///g<left><left>

" Block view
nnoremap v <C-v>

" Getting russian keyboard layout to work
:set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Fixing alacritty bug
" autocmd VimEnter * :sleep 20m
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"

" Intergrated Terminal
" open new split panes to right and below
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal in the current working directory
au BufEnter * silent! lcd %:p:h
" choose shell
function! OpenTerminal()
	split term://zsh
	resize 10
endfunction

" Node autorun when .js is saved
autocmd BufWritePost ~/Programming/RSS/js-playground/* execute "!node %:p"

" Autorefresh externally changed files 
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
			\ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Highlight Cursor Line
set cursorline

" Nowrap
set nowrap

" Neovide
if exists("g:neovide")
	let g:neovide_floating_shadow = v:false
	let g:neovide_fullscreen = v:true
	let g:neovide_padding_top = 20
	map! <c-v> <C-R>+
	cnoremap <c-v> <c-r>+
	colorscheme github_dark_dimmed
endif

lua << EOF
-- Telescope
local actions = require "telescope.actions"
local fb_actions = require "telescope".extensions.file_browser.actions

require('telescope').setup {
	defaults = {
		mappings = {
			n = {
				["l"] = actions.select_default,
			}
			}
		},
	extensions = {
		file_browser = {
			theme = "ivy",
			hidden = true,
			display_stat = false,
			previewer = false,
			mappings = {
				["i"] = {
					["<C-c>"] = fb_actions.create,
					["<C-h>"] = fb_actions.toggle_hidden,
				},
				["n"] = {
					["l"] = actions.select_default,
					["h"] = fb_actions.goto_parent_dir,
				},
			},
		},
		fzf = {
			fuzzy = true,                    
			override_generic_sorter = true,  
			override_file_sorter = true,     
			case_mode = "smart_case",        
		},
	}
	}

require('telescope').load_extension "fzf"
require("telescope").load_extension "file_browser"
EOF

lua << EOF
require "whichkey"
EOF

hi WhichKeyFloat ctermbg=BLACK ctermfg=BLACK

lua << EOF
-- Move Highlighted Text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2><CR>gv=gv")
-- Replace text without yanking deleted lines
vim.keymap.set("x", "p", "\"_dP")
EOF

lua << EOF
-- Git
require('gitsigns').setup()
-- Live Server
require('live-server').setup()
EOF
