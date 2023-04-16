 " NEOVIM CONFIGURATION FILE                          
 
 
 " Plugins
 call plug#begin()
 Plug 'itchyny/lightline.vim'
 Plug 'dracula/vim'
 Plug 'easymotion/vim-easymotion'
 Plug 'lambdalisue/suda.vim'
 Plug 'joshdick/onedark.vim'
 " Telescope
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
 " File Explirer
 Plug 'scrooloose/nerdtree'
 Plug 'ryanoasis/vim-devicons'
 " Syntax
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
 " Colors
 Plug 'ap/vim-css-color'
 call plug#end()

 " NERDTree
 let g:NERDTreeShowHidden = 1
 nnoremap <silent> <space>n :NERDTreeToggle<CR>

 " Telescope
 nnoremap <Space>t :Telescope find_files<CR>

 " Coc Completion
 " Make <CR> to accept selected completion item or notify coc.nvim to format
 " <C-g>u breaks current undo, please make your own choice
 inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

 function! CheckBackspace() abort
   let col = col('.') - 1
   return !col || getline('.')[col - 1]  =~# '\s'
 endfunction

 " Formatting
 command! -nargs=0 Format :call CocActionAsync('format')
 nnoremap <silent><Space>r :Format<CR>
 autocmd BufWritePre * silent Format

 " Changing <Leader> key
 let mapleader = " "
 
 " Center cursor
 :set so=999
 
 " Turn line numbers on
 set number
 " Change line number coloring
 :highlight LineNr ctermfg=grey
 
 " Copy and paste to/from clipboard
 set clipboard+=unnamedplus
 
 " Press 'W' to write file with sudo privileges
 com W :execute 'SudaWrite'
 
 " Easymotion configuration
 let g:EasyMotion_off_screen_search = 0
 map <Leader>f <Plug>(easymotion-bd-w)
 map <Leader>а <Plug>(easymotion-bd-w)
 
 " Define lightline configuration
 let g:lightline = {
 \ 'colorscheme': 'dracula',
 \ 'active': { 
 \   'right': [ [ 'lineinfo' ],
 \              [ 'percent' ] ] },	
 \ }
 
 set noshowmode " remove '--insert--' from below the statusline
 
 " Clear search highlighting
 nnoremap <CR> :noh<CR>
 
 " Case insensitive search
 :set ic
 
 " Working with multiple windows
 nnoremap <Leader>w <C-w>w
 nnoremap <Leader>q <C-w>q
 nnoremap <Leader>h <C-w>h
 nnoremap <Leader>j <C-w>j
 nnoremap <Leader>k <C-w>k
 nnoremap <Leader>l <C-w>l
 
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
 "au BufEnter * if &buftype == 'terminal' | :startinsert | endif
 " open terminal on ctrl+n
 function! OpenTerminal()
   split term://zsh
   resize 10
 endfunction
 nnoremap <c-n> :call OpenTerminal()<CR>

 " Block View
 nnoremap v <C-v>

 " Neovide
 if exists("g:neovide")
	 colorscheme onedark
 endif
