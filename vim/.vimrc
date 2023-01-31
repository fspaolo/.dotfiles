" designed for vim 8+
" (see https://rwx.gg/vi for help)
let skip_defaults_vim=1
set nocompatible

let mapleader = "\<space>"

"####################### Vi Compatible (~/.exrc) #######################

" automatically indent new lines
set autoindent

" automatically write files when changing when multiple files open
set autowrite

" activate line numbers
set number

" turn col and row position on in bottom right
"set ruler

" show command and insert mode
set showmode

set tabstop=4

"#######################################################################

set softtabstop=4
set shiftwidth=4
set expandtab

" stop vim from silently fucking with files that it shouldn't 
set nofixendofline

" replace tabs with spaces automatically
set expandtab

" enough for line numbers + gutter within 80 standard
set textwidth=72 

" disable relative line numbers, remove no to sample it
set relativenumber

" easier to see characters when `set paste` is on
set listchars=tab:→\ ,eol:↲,nbsp:␣,space:·,trail:·,extends:⟩,precedes:⟨
highlight NonText guifg=bg

" turn on default spell checking
"set spell

" more risky, but cleaner
set nobackup
set noswapfile
set nowritebackup

"set icon

" center the cursor always on the screen
"set scrolloff=999

" highlight search hits,  \+<cr> to clear 
"set hlsearch
set incsearch
set linebreak
"map <silent> <leader><cr> :noh<cr>:redraw!<cr>

" avoid most of the 'Hit Enter ...' messages
"set shortmess=aoOtIF

" prevents truncated yanks, deletes, etc.
"set viminfo='20,<1000,s1000

" not a fan of bracket matching or folding
"let g:loaded_matchparen=1
"set noshowmatch
"set foldmethod=manual

" Just the defaults, these are changed per filetype by plugins.
" Most of the utility of all of this has been superceded by the use of
" modern simplified pandoc for capturing knowledge source instead of
" arbitrary raw text files.

"set formatoptions-=t   " don't auto-wrap text using text width
"set formatoptions+=c   " autowrap comments using textwidth with leader
"set formatoptions-=r   " don't auto-insert comment leader on enter in insert
"set formatoptions-=o   " don't auto-insert comment leader on o/O in normal
"set formatoptions+=q   " allow formatting of comments with gq
"set formatoptions-=w   " don't use trailing whitespace for paragraphs
"set formatoptions-=a   " disable auto-formatting of paragraph changes
"set formatoptions-=n   " don't recognized numbered lists
"set formatoptions+=j   " delete comment prefix when joining
"set formatoptions-=2   " don't use the indent of second paragraph line
"set formatoptions-=v   " don't use broken 'vi-compatible auto-wrapping'
"set formatoptions-=b   " don't use broken 'vi-compatible auto-wrapping'
"set formatoptions+=l   " long lines not broken in insert mode
"set formatoptions+=m   " multi-byte character line break support
"set formatoptions+=M   " don't add space before or after multi-byte char
"set formatoptions-=B   " don't add space between two multi-byte chars in join 
"set formatoptions+=1   " don't break a line after a one-letter word

" requires PLATFORM env variable set (in ~/.bashrc)
if $PLATFORM == 'mac'
  " required for mac delete to work
  set backspace=indent,eol,start
endif

" stop complaints about switching buffer with changes
set hidden

" command history
set history=100

" here because plugins and stuff need it
syntax enable

" faster scrolling
set ttyfast

" allow sensing the filetype
filetype plugin on

" Install vim-plug if not already installed
" (Yes I know about Vim 8 Plugins. They suck.)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
  echo "Don't forget to GoInstallBinaries if you're doing Go dev."
endif

" high contrast for streaming, etc.
set background=dark

" only load plugins if Plug detected
if filereadable(expand("~/.vim/autoload/plug.vim"))

  " load all the plugins
  call plug#begin('~/.vimplugins')
  Plug 'sheerun/vim-polyglot'
  Plug 'vim-pandoc/vim-pandoc'
  "Plug 'rwxrob/vim-pandoc-syntax-simple'
  "Plug 'https://gitlab.com/rwx.gg/abnf'
  "Plug 'WolfgangMehner/bash-support' " borkish
  Plug 'cespare/vim-toml'
  "Plug 'pangloss/vim-javascript'
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
  "Plug 'PProvost/vim-ps1'
  Plug 'tpope/vim-fugitive'
  "Plug 'tpope/unimpaired'
  "Plug 'airblade/vim-gitgutter'
  Plug 'rakr/vim-one'
  call plug#end()

  "autocmd!

  colorscheme one
  hi Normal ctermbg=NONE " for transparent background
  hi SpellBad ctermbg=red " for transparent background
  hi SpellRare ctermbg=red
  hi Special ctermfg=cyan 
  au FileType pandoc hi pandocAtxHeader ctermfg=yellow cterm=bold
  au FileType pandoc hi pandocAtxHeaderMark ctermfg=yellow cterm=bold
  au FileType pandoc hi pandocAtxStart ctermfg=yellow cterm=bold

  set cursorline
  "set noshowmode
  set rulerformat=%55(%f\ %y%r\ %l:%c\ %p%%%) "55 effective max
  "set noruler
  
  " status line
  set statusline=%!MyStatusLine()
  set laststatus=2
  set cmdheight=1
  hi StatusLine ctermbg=NONE ctermfg=LightBlue

  " pandoc
  let g:pandoc#formatting#mode = 'h' " A'
  let g:pandoc#formatting#textwidth = 72

  " golang
  "let g:go_fmt_command = 'goimports'
  let g:go_fmt_command = 'gofmt'
  let g:go_fmt_fail_silently = 1
  let g:go_fmt_autosave = 1
  let g:go_gopls_enabled = 1
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_variable_declarations = 1
  let g:go_highlight_variable_assignments = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_diagnostic_errors = 1
  let g:go_highlight_diagnostic_warnings = 1
  let g:go_auto_type_info = 1
  let g:go_auto_sameids = 0

  " NOTE: Not working!
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

" make Y consitent with D and C (yank til end)
map Y y$

" better command-line completion
set wildmenu

" disable search highlighting with <C-L> when refreshing screen
nnoremap <C-L> :nohl<CR><C-L>

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
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc  

" start at last place you were editing
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"au BufWritePost ~/.vimrc so ~/.vimrc

" functions keys
"map <F1> :set number!<CR> :set relativenumber!<CR>
"nmap <F2> :call <SID>SynStack()<CR>
"set pastetoggle=<F3>
"map <F4> :set list!<CR>
"map <F5> :set cursorline!<CR>
"map <F7> :set spell!<CR>
"map <F12> :set fdm=indent<CR>

"nmap <leader>2 :set paste<CR>

" navigate (fly) through buffers
nmap <C-h> :bfirst<CR>
nmap <C-j> :bprev<CR>
nmap <C-k> :bnext<CR>
nmap <C-l> :blast<CR>

" disable arrow keys (vi muscle memory)
noremap <up> :echoerr "Umm, use k instead"<CR>
noremap <down> :echoerr "Umm, use j instead"<CR>
noremap <left> :echoerr "Umm, use h instead"<CR>
noremap <right> :echoerr "Umm, use l instead"<CR>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>

" Better page down and page up
noremap <C-n> <C-d>
noremap <C-p> <C-b>

" read personal/private vim configuration (keep last to override)
"set rtp^=~/.vimpersonal
"set rtp^=~/.vimprivate

"hi StatusLineNC term=none cterm=none gui=none
"hi StatusLine term=reverse ctermfg=LightGray cterm=nocombine 

nnoremap <Leader>cc :set colorcolumn=80<CR>
nnoremap <Leader>ncc :set colorcolumn=-80<CR>


" Custom statusline https://github.com/changemewtf/dotfiles
function! MyStatusLine()

    let statusline = " "
    " Buffer number
    let statusline .= "%n  "
    " Filename (F -> full, f -> relative)
    let statusline .= "%f "
    " Left/right separator
    let statusline .= "%="
    " Buffer flags
    let statusline .= "%( %h%1*%m%*%r%w%) "
    " Git branch
    let statusline .= GetGitBranch()
    " File format
    let statusline .= "  %{&ff} "
    " File type
    let statusline .= " %Y "
    " Character under cursor (decimal)
    "let statusline .= "%03.3b"
    " Character under cursor (hexadecimal)
    "let statusline .= "|0x%02.2B  "
    " File progress
    let statusline .= " %P/%L "
    " Line & column
    let statusline .= " %l:%v "
    return statusline
endfunction


function! GetGitBranch()
    :let s:branch_name = system("git rev-parse --abbrev-ref HEAD")
    :let s:notidx = match(s:branch_name, 'fatal: not a git repository')
    :if s:notidx == 0
        :let s:branch_name = strtrans(s:branch_name)
        :let s:branch_name = s:branch_name[:-3]
        :return 'git.' . s:branch_name . ''
    :endif
    :return ''
endfunction
