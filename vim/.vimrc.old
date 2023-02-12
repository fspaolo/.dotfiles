call plug#begin('~/.vim/plugged')
" Plug 'vim-python/python-syntax'                                    " python support
Plug 'keith/swift.vim'                                             " swift support
Plug 'dense-analysis/ale'                                          " syntax checker
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }  " install fzf
Plug 'junegunn/fzf.vim'                                            " set fzf for vim
Plug 'itchyny/lightline.vim'                                       " power bar
" Plug 'https://github.com/boblehest/vim-quantum.git'
" Plug 'https://github.com/rakr/vim-one.git'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'romkatv/powerlevel10k'
Plug 'lifepillar/vim-mucomplete'                                   " tab completion
Plug 'yggdroot/indentline'                                         " indent vertical guides
" Plug 'davidhalter/jedi-vim'                                       " semantic completion Python
Plug 'KKPMW/vim-sendtowindow'
Plug 'psf/black'
call plug#end()

set encoding=utf-8             " file encoding
scriptencoding utf-8
set clipboard+=unnamed         " share clipboard between windows
set linespace=2                " space between lines for gvim

set number                     " show line numbers
set relativenumber
set numberwidth=5
set ruler                      " show the current row and column
set hlsearch                   " highlight all search matches
set cursorline                 " highlight current/cursor line
set linebreak                  " break at word boundaries
" set showbreak
set wrap                       " wrap long text lines 
set expandtab                  " Convert tabs to spaces
set tabstop=4                  " Set tab size in spaces (this is for manual indenting)
set shiftwidth=4               " The number of spaces inserted for a tab (used for auto indenting)
set conceallevel=0             " Show both markup and effect in text
set guifont=Menlo:h15
set hidden                     " will hide buffers when abandoned

" Set the status line to something useful
set statusline=%f\ %m\ %=L:%l/%L\ C:%c\ (%p%%)

set textwidth=79              " Force line breaks at width
set colorcolumn=80            " Make it obvious where 80 characters is
set formatoptions+=t

" Protect changes between writes. Default values of
" updatecount (200 keystrokes) and updatetime (4 seconds)
set swapfile
set directory^=~/.vim/swap//

" Make backup files
set backup
set backupdir^=~/.vim/backup//

" Protect against crash-during-write
set writebackup

" use rename-and-write-new method whenever safe
set backupcopy=auto

" persist the undo tree for each file
" set undofile
" set undodir^=~/.vim/undo//

" save the buffer whenever text is changed
" autocmd TextChanged,TextChangedI <buffer> silent write

" press return to get out of the highlighted search
nnoremap <CR> :nohlsearch<CR><CR>

" Color theme
syntax enable
colorscheme material

" Disables transparency when in vim
hi Normal ctermbg=0

" 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker'
let g:material_theme_style = 'material'

" Color theme of power bar
let g:lightline = { 'colorscheme': 'material_vim' }

" Character used for vertical guides
let g:indentLine_char = '⎸'

" Make your code look pretty
let g:python_highlight_all = 1

" netrw setup (file tree look)
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

" Display file tree at opening
"augroup ProjectDrawer
"    autocmd!
"    autocmd VimEnter * :Vexplore
"augroup END

" Navigation between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" PEP 8 indentation and length
"au Filetype python
"\ set tabstop=4 |
"\ set softtabstop=4 |
"\ set shiftwidth=4 |
"\ set textwidth=79 |
"\ set expandtab |
"\ set autoindent |
"\ set fileformat=unix

" Check Python files with flake8
let g:ale_linters = {'python': ['flake8']}

" Fix Python files with black and isort
let g:ale_fixers = { 
	\ 'python' : [
		\ 'black', 
		\ 'isort', 
		\ 'reorder-python-imports', 
		\ 'remove_trailing_lines', 
		\ 'trim_whitespace',
	\ ]
\ }

" Pass options to black
let g:ale_python_black_options = '-l 79'

" 		\ 'add_blank_lines_for_python_control_statements', 

" Change Black's default 88 line length
let g:black_linelength = 79

" Silence warning on whitespace before ':'
let g:flake8_ignore = 'E203'

" Disable line length checking
"let g:ale_python_flake8_args='--ignore=F821,E302,E501,E203'

" Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=darkred guibg=darkred
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Linelight bar to show up
set laststatus=2

" MuComplete and jedi-vim
set completeopt-=preview
set completeopt+=longest,menuone,noselect
set shortmess+=c  " shut off completion messages
set belloff+=ctrlg  " if Vim beeps during completion
" let g:mucomplete#force_manual = 1
let g:mucomplete#auto_completion = 0
" let g:jedi#popup_on_dot = 1  " It may be 1 as well

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" File protection with chmod
" --------------------------
" Command    		Meaning
" chmod 400 file    	To protect a file against accidental overwriting.
" chmod 500 directory   To protect yourself from accidentally removing, renaming or moving files from this directory.
" chmod 600 file    	A private file only changeable by the user who entered this command.
" chmod 644 file    	A publicly readable file that can only be changed by the issuing user.
" chmod 660 file    	Users belonging to your group can change this file, others don't have any access to it at all.
" chmod 700 file    	Protects a file against any access from other users, while the issuing user still has full access.
" chmod 755 directory   For files that should be readable and executable by others, but only changeable by the issuing user.
" chmod 775 file    	Standard file sharing mode for a group.
" chmod 778 file    	Everybody can do everything to this file.
