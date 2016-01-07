"------------------------------------------------------------------------------
"Vimrc Configurations 2016 
" 1. Prelimanary Configs
" 2. Plugin Configs
" 3. Codebase Configs
"-------------------------------------------------------------------------------"

" PRELIMINARY CONFIGS ----------------------------------------------------------
set laststatus=2
set showtabline=1
set noshowmode
set t_Co=256
set nocp
set noswapfile
set nocompatible              " be iMproved, required
filetype off                  " required

" PLUGINS CONFIGS -----------------------------------------------------------------

" Load vim-plug initially
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim
    https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif


"VIM-PLUG CONFGURATIONS
call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'morhetz/gruvbox'

call plug#end()


"           --------------------    "


"AIRLINE PLUGIN
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_left_sep='' "Temporaily disables arrrows due to bug issues
let g:airline_right_sep=''




"GUI THEME SETTINGS
 colorscheme gruvbox


"Synatastic configs
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
hi SignColumn ctermbg=236

"Nerdtree configurations
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"ctrlp-py matcher configurations
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp' "Uses silver_searcher for faster search
if executable('ag')
      let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif


"ACTUAL CODEBASE------------------------------------------------------------------------- 

"sets cursorLine and Line Numbering
set cursorline
hi CursorLine   cterm=NONE ctermbg=235  ctermfg=white
set number
set relativenumber
highlight LineNr ctermfg=59 ctermbg=235


"INDENTATION TABBING
"filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab



" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Basics
    set nocompatible " explicitly get out of vi-compatible mode
    set noexrc " don't use local version of .(g)vimrc, .exrc
    set background=dark " we plan to use a dark background
    set fenc=utf-8 " UTF-8
    set cpoptions=aABceFsmq
    "             |||||||||
    "             ||||||||+-- When joining lines, leave the cursor between joined lines
    "             |||||||+-- When a new match is created (showmatch) pause for .5
    "             ||||||+-- Set buffer options when entering the buffer
    "             |||||+-- :write command updates current file name automatically add <CR> to the last line when using :@r
    "             |||+-- Searching continues at the end of the match at the cursor position
    "             ||+-- A backslash has no special meaning in mappings
    "             |+-- :write updates alternative file name
    "             +-- :read updates alternative file name
    syntax on " syntax highlighting on
    let g:skip_loading_mswin=1 " Just in case :)


" Vim UI
    set incsearch " BUT do highlight as you type you search phrase
    set laststatus=2 " always show the status line
    set lazyredraw " do not redraw while running macros
    set linespace=0 " don't insert any extra pixel lines betweens rows
    set list " we do what to show tabs, to ensure we get them out of my files
    set listchars=tab:>-,trail:- " show tabs and trailing
    set matchtime=5 " how many tenths of a second to blink matching brackets for
    set nohlsearch " do not highlight searched for phrases
    set nostartofline " leave my cursor where it was
    set novisualbell " don't blink
    set number " turn on line numbers
    set numberwidth=5 " We are good up to 99999 lines
    set report=0 " tell us when anything is changed via :...
    set ruler " Always show current positions along the bottom
    set scrolloff=10 " Keep 10 lines (top/bottom) for scope
    set shortmess=aOstT " shortens messages to avoid 'press a key' prompt
    set showcmd " show the command being typed
    set showmatch " show matching brackets
    set sidescrolloff=10 " Keep 5 lines at the size
   

"MOUSE OPTIONS
map <S-Enter> O<ESC>
map <Enter> o<ESC>
set mouse=a


"SYSTEM CLIPBOARD COPY & PASTE SUPPORT
set clipboard=unnamedplus
set pastetoggle=<F2> "F2 before pasting to preserve indentation
"Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"
map <silent><C-v> :set paste<CR>o<esc>"*]p:set nopaste<cr>"


"QUICKER ESSENTIAL KEY MAPPINGS
map ; :
map ;; :w<CR>
inoremap <Nul> <C-N>
:inoremap <F1> <C-P>


" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" <c-h> is interpreted as <bs> in neovim
" This is a bandaid fix until the team decides how
" they want to handle fixing it...(https://github.com/neovim/neovim/issues/2048)
nnoremap <silent> <bs> :TmuxNavigateLeft<cr>


set clipboard=unnamedplus



