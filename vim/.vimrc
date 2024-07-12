let skip_defaults_vim=1
set nocompatible

let mapleader = "\<space>"

" automatically indent new lines
set autoindent

" automatically write files when multiple files open
set autowrite

" activate line numbers
set number

" disable relative line numbers, remove no to sample it
set relativenumber

" show command and insert mode
set showmode

" Replace tabs with spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab                  
set smarttab      " reset autoindent after a blank line
set smartindent
set nojoinspaces " Dont add two spaces on join on ponctuaction

" break at word boundaries
set linebreak                  

" Typing behavior
set backspace=indent,eol,start
set wildmode=full
set wildmenu
set complete-=i

" SEARCH and/or REPLACE
set ignorecase          " caseless search
set smartcase           " except when using capitals
set showmatch           " show matching brackets
set wrapscan            " wrap search
set gdefault            " g flag by default on search and replace

"SYNTAX/LAYOUT
set wrap                " wrap visually
set linebreak           " don't cut my words on wrap
set matchpairs+=<:>     " super-useful for html and markdown

" Force line breaks at width
"set textwidth=79

"AUTOCOMPLETION
set infercase            " smart case inferring
set wildmode=list:longest,full
" ctags -R -f ~/.vim/systags /usr/include /usr/local/include
set tags+=~/.vim/systags

"SPELLCHECK
if filereadable($HOME . "/.vim/mthesaur.txt")
  " wget https://www.gutenberg.org/files/3202/files/mthesaur.txt
  set thesaurus+=~/.vim/mthesaur.txt
endif

" stop vim from silently fucking with files that it shouldn't 
set nofixendofline

" easier to see characters when `:set paste` is on
set listchars=tab:→\ ,eol:↲,nbsp:␣,space:·,trail:·,extends:⟩,precedes:⟨
highlight NonText guifg=bg

" Flag unnecessary whitespace
highlight BadWhitespace ctermbg=darkred guibg=darkred

" more risky, but cleaner
set nobackup
set noswapfile
set nowritebackup

set secure             " don't load shady shit

set noicon
set noemoji            " don't mess with my terminal

set fillchars+=vert:│  " sweet-looking separator
set showbreak=↳\       " Pretty line break
set noruler            " I already have my statusbar

" show where the cursor is
"set cursorline                  

" center the cursor always on the screen
"set scrolloff=999

" 5 lines margin to the cursor when moving
set scrolloff=5                 

" faster scrolling
set ttyfast

" Use line cursor in insert mode and block everywhere else
" Reference chart of values:
" Ps = 0 -> blinking block
" Ps = 1 -> blinking block (default)
" Ps = 2 -> steady block
" Ps = 3 -> blinking underline
" Ps = 4 -> steady underline
" Ps = 5 -> blinking bar (xterm)
" Ps = 6 -> steady bar (xterm)
let &t_SI = "\e[6 q"
let &t_EI = "\e[1 q"

" highlight search hits -> \+<cr> to clear 
set hlsearch
set incsearch

" avoid most of the 'Hit Enter ...' messages
set shortmess=aoOtIF

" prevents truncated yanks, deletes, etc.
set viminfo='20,<1000,s1000

" stop complaints about switching buffer with changes
set hidden

" command history
set history=100

" here because plugins and stuff need it
syntax enable

" allow sensing the filetype
filetype plugin indent on

" high contrast for streaming, etc.
set background=light

" allow italic on tmux
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" only load plugins if Plug detected
if filereadable(expand("~/.vim/autoload/plug.vim"))

  " load all the plugins
  call plug#begin('~/.vimplugins')
  Plug 'dense-analysis/ale'
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'andreypopp/vim-colors-plain'
  Plug 'overvale/vacme'
  call plug#end()

  " You might have to force true color when using regular vim inside tmux as the
  " colorscheme can appear to be grayscale with "termguicolors" option enabled.
  "if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  "  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  "  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  "endif

  " Use terminal background color over colorscheme
  "augroup vimrc
  "	autocmd!
  "	autocmd ColorScheme * hi Normal ctermbg=none
  "augroup end

  "" Enable true color on term
  "set termguicolors

  "colorscheme plain
  colorscheme vacme

  " Custom highlighting (Apply after colorscheme)
  " Based https://github.com/Preetam/Infimum
  
  hi Comment    gui=italic  cterm=italic ctermfg=244
  hi Keyword    gui=bold    cterm=bold
  hi Function   gui=bold    cterm=bold
  hi LineNr     ctermfg=240 ctermbg=NONE 
  hi Boolean    gui=italic  cterm=italic
  hi Statement  gui=bold    cterm=bold

  "hi Type       guifg=NONE guibg=NONE gui=italic cterm=italic
  "hi Identifier guifg=NONE guibg=NONE gui=bold   cterm=bold
  "hi Title cterm=NONE gui=NONE ctermfg=152
  "hi StatusLine cterm=nocombine ctermfg=152
  "hi SpellBad cterm=underline ctermfg=darkred
  "hi MatchParen               guibg=#CCCCCC

  " golang
  let g:go_fmt_command = 'gofmt'
  "let g:go_fmt_fail_silently = 0
  "let g:go_fmt_autosave = 1
  "let g:go_gopls_enabled = 1
  "let g:go_highlight_types = 1
  "let g:go_highlight_fields = 1
  "let g:go_highlight_functions = 1
  "let g:go_highlight_methods = 1
  "let g:go_highlight_function_calls = 1
  "let g:go_highlight_operators = 1
  "let g:go_highlight_extra_types = 1
  "let g:go_highlight_structs = 1
  "let g:go_highlight_variable_declarations = 1
  "let g:go_highlight_variable_assignments = 1
  "let g:go_highlight_build_constraints = 1
  "let g:go_highlight_diagnostic_errors = 1
  "let g:go_highlight_diagnostic_warnings = 1
  "let g:go_auto_type_info = 1
  "let g:go_auto_sameids = 0

  " Not working!
  "let g:go_metalinter_enabled = []
  "let g:go_metalinter_command = 'golangci-lint'
  "let g:go_metalinter_autosave = 1

  set updatetime=100
  "let g:go_gopls_analyses = { 'composites' : v:false }
  au FileType go nmap <leader>t :GoTest<CR>
  au FileType go nmap <leader>v :GoVet<CR>
  au FileType go nmap <leader>b :GoBuild<CR>
  au FileType go nmap <leader>c :GoCoverageToggle<CR>
  au FileType go nmap <leader>i :GoInfo<CR>
  au FileType go nmap <leader>l :GoMetaLinter!<CR>
  au FileType go nmap <leader>f :GoFmt<CR>

else
  autocmd vimleavepre *.go !gofmt -w % " backup if fatih fails
endif


" netrw configuration
let g:netrw_banner=0        " disable banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_liststyle=3     " tree view
" hide gitignore'd files
let g:netrw_list_hide=netrw_gitignore#Hide()
" hide dotfiles by default (this is the string toggled by netrw-gh)
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" enable omni-completion
set omnifunc=syntaxcomplete#Complete

" force some file names to be specific file type
au bufnewfile,bufRead *.bash* set ft=sh
au bufnewfile,bufRead *.pegn set ft=config
au bufnewfile,bufRead *.profile set filetype=sh
au bufnewfile,bufRead *.crontab set filetype=crontab
au bufnewfile,bufRead *ssh/config set filetype=sshconfig
au bufnewfile,bufRead *gitconfig set filetype=gitconfig
au bufnewfile,bufRead /tmp/psql.edit.* set syntax=sql
au bufnewfile,bufRead doc.go set spell

" fun! s:DetectGo()
"     if getline(1) == 'package main'
"         set ft=go
"     endif
" endfun
" autocmd BufNewFile,BufRead * call s:DetectGo()

" displays all the syntax rules for current position, useful
" when writing vimscript syntax plugins
"function! <SID>SynStack()
"  if !exists("*synstack")
"    return
"  endif
"    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
"endfunc  

" start at last place you were editing
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"au BufWritePost ~/.vimrc so ~/.vimrc

"BINDINGS

" disable search highlighting with <C-L> when refreshing screen
nnoremap <Leader>l :nohl<CR><C-L>

" call fzf sessionizer from inside vim
nnoremap <C-f> :!tmux neww tmux-sessionizer<CR>

" call fzf + ripgrep from inside vim
nnoremap <C-o> :FZF<CR>

" call ripgrep to search current text 
nnoremap <C-/> :Rg<CR>

" make Y consitent with D and C (yank til end)
map Y y$

" functions keys
"map <F1> :set number!<CR> :set relativenumber!<CR>
"nmap <F2> :call <SID>SynStack()<CR>
"set pastetoggle=<F3>
"map <F4> :set list!<CR>
"map <F5> :set cursorline!<CR>
"map <F7> :set spell!<CR>
"map <F12> :set fdm=indent<CR>

" Paste formatted text in vim
nmap <leader>p :set paste<CR>

"s Navigate (fly) through buffers
nmap <silent> <C-h> :bprev<CR>  " <-
nmap <silent> <C-l> :bnext<CR>  " ->

" Copy selected block to the clipboard
vnoremap <C-c> "*y

" Write at the end of selected block
vnoremap <C-e> :s/$/

" disable arrow keys (vi muscle memory)
noremap <up> :echoerr "Umm, use k instead"<CR>
noremap <down> :echoerr "Umm, use j instead"<CR>
noremap <left> :echoerr "Umm, use h instead"<CR>
noremap <right> :echoerr "Umm, use l instead"<CR>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>

" read personal/private vim configuration (keep last to override)
"set rtp^=~/.vimpersonal
"set rtp^=~/.vimprivate

" Vertical column on demand 
nnoremap <Leader>cc :set colorcolumn=80<CR>
nnoremap <Leader>ncc :set colorcolumn=-80<CR>

set laststatus=2
set cmdheight=1

" CUSTOM STATUS BAR
" https://dustri.org/b/lightweight-and-sexy-status-bar-in-vim.html
"set statusline=
"set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
"set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
"set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
"set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
"set statusline+=\ %n\                      " buffer number
"set statusline+=%#Visual#                  " colour
"set statusline+=%{&paste?'\ PASTE\ ':''}
"set statusline+=%{&spell?'\ SPELL\ ':''}
"set statusline+=%#CursorIM#                " colour
"set statusline+=%R                         " readonly flag
"set statusline+=%M                         " modified [+] flag
"set statusline+=%#Cursor#                  " colour
"set statusline+=%#CursorLine#              " colour
"set statusline+=\ %t\                      " short file name
"set statusline+=%{GitStatus()}             " current git branch
"set statusline+=%=                         " right align
"set statusline+=%#CursorLine#              " colour
"set statusline+=\ %Y\                      " file type
"set statusline+=%#CursorIM#                " colour
"set statusline+=\ %3l:%-2c\                " line + column
"set statusline+=%#Cursor#                  " colour
"set statusline+=\ %3p%%\                   " percentage

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! GitStatus()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  |'.l:branchname.' ':''
endfunction
