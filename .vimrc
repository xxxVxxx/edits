set nocompatible
set hidden
filetype indent plugin on
set autoindent
set number
set relativenumber
set showmode
set tabstop=4
set shiftwidth=4
set wildmenu
set hlsearch
set autochdir
set clipboard=unnamed
set ttimeoutlen=50
set ttyfast
set lazyredraw
set ignorecase
set smartcase
set incsearch
set mouse=a
set t_vb=
" set completeopt-=preview
set splitright
set splitbelow
set visualbell
set confirm
set laststatus=2
set ruler
set nostartofline
set autoindent
set backspace=indent,eol,start
set gcr=a:blinkon0
set synmaxcol=1200
set ffs=unix,dos
set autoread
set fillchars=vert:┃
set completeopt+=menuone
let g:netrw_localrmdir='rm -rf' " Allow netrw to remove non-empty local directories
runtime macros/matchit.vim
map Q <nop>

if has('win32') || has('win64')
	set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

set statusline=%F
set statusline+=%y
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%{g:NyanModoki()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=      "left/right separator
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file


"------------------------------------------------------------
"------------------------------------------------------------
"
call plug#begin('~/.vim/bundle')

" libraries, &c.
Plug 'xolox/vim-misc'
Plug 'junegunn/vim-pseudocl'
Plug 'kana/vim-textobj-user'
Plug 'xolox/vim-session'
Plug 'moll/vim-bbye'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'sgur/ctrlp-extensions.vim'
Plug 'tpope/vim-vinegar'
Plug 'idbrii/renamer.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" editing features
Plug 'junegunn/vim-oblique'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'tommcdo/vim-exchange'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'AndrewRadev/splitjoin.vim'
" Plug 'zweifisch/pipe2eval'
Plug 'bounceme/pipe2eval'

" syntax,indent &c.
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'lfilho/cosco.vim'
" Plug 'othree/javascript-libraries-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'scrooloose/syntastic'

" color,appearance
Plug 'ap/vim-css-color' 
Plug 'bling/vim-bufferline'
" Plug 'flazz/vim-colorschemes'
Plug 'valloric/MatchTagAlways'
Plug 'nefo-mi/nyan-modoki.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'freeo/vim-kalisi'
Plug 'junegunn/rainbow_parentheses.vim'

" autocompleting
Plug 'ervandew/supertab'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'cohama/lexima.vim'

call plug#end()

syntax on 
set background=dark
colorscheme solarized

set undodir=~/.vim/undodir
set undofile

nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Useful mappings
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
" prevent yank from moving cursor
xnoremap <silent> y ygv<Esc>
" Adding and deleting empty lines
nnoremap <silent>]x m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent>[x m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent>]<space> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent>[<space> :set paste<CR>m`O<Esc>``:set nopaste<CR>
" Bubbling
nnoremap <silent> [e   :move-2<CR>==
nnoremap <silent> ]e :move+<CR>==
xnoremap <silent> [e   :move-2<CR>gv=gv
xnoremap <silent> ]e :move'>+<CR>gv=gv
" common mistakes
cnoreabbrev E! e!
cnoreabbrev W w
cnoreabbrev Q q
" colon replacement
nnoremap <Space> :
vnoremap <Space> :
" window movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" fixcss
function! FixCSS()
    let pos = line( "." )
    silent :%s/{/{\r/g
    silent :%s/}/}\r\r/g
    silent :%s/;/;\r/g
    exe pos
endfunction
command! Fixcss call FixCSS()

" nyan
let g:nyan_modoki_select_cat_face_number = 2
let g:nayn_modoki_animation_enabled= 1

" Vim Session
let g:session_persist_colors = 0
let g:session_autoload="yes"
let g:session_autosave="yes"

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="jj"
let g:UltiSnipsJumpBackwardTrigger="kk"

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=0

" emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall

" supertab
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-x><c-u>'
autocmd FileType *
    \ if &omnifunc != '' |
    \     call SuperTabChain(&omnifunc, '<c-p>') |
    \ endif
let g:SuperTabClosePreviewOnPopupClose=1

" ctrp
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_extensions = ['funky']
nnoremap <leader>p :CtrlPYankring<cr>

" JavaScript syntax
let g:used_javascript_libs = 'jquery'

" cosco
autocmd FileType javascript,css,YOUR_LANG nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>

" rainbow parentheses
autocmd VimEnter * RainbowParentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" pipe2eval
let g:pipe2eval_map_key = '<cr>'
