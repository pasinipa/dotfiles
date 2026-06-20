"       .__
" ___  _|__| ____________   ____
" \  \/ /  |/     \_  __ \_/ ___\
"  \   /|  |  Y Y  \  | \/\  \___
"   \_/ |__|__|_|  /__|    \___  >
"                \/            \/

" Define leader key (use the leader key to activate/disactivate features or
" plugin
let mapleader = " "

" Enable syntax highlighting "
syntax on

" Enable mouse support "
set mouse=a
" right now selecting text with the mouse enters automatically into visual
" mode, i might want to change that

" Show relative line numbers "
set number relativenumber
" Set columns to display line numbers "
set numberwidth=3

" Higlight current line and column "
set cursorcolumn
set cursorline

" Enable smart search case sensitivity "
set ignorecase
set smartcase
" Highlight search pattern "
set hlsearch

" Matches indent level when starting a new line (with some extra smart behaviour) "
set autoindent
set smartindent
" Indentation level width "
set shiftwidth=2
" Pressing <Tab> inserts 2 spaces
set softtabstop=2
" Make sure spaces don't convert into tabs "
set expandtab
  " Round << and >> line operations to closest indentation level "
set shiftround
" Set automatic hardwrapping "
set textwidth=80
" i want it to be smart when it hardwraps the text while in insert mode and
" recognize for instance to add comments if i started in a commented line.
" Again, another thing that i might want to change
" Make softwrapped lines keep the indentation level "
set breakindent
set breakindentopt=shift:2

" Show matching pairs of parentheses for 0.1 secs "
set showmatch
set matchtime=1

" Remove escape keys "
set noesckeys
" Remap cursor motions to be softwrap-friendly "
"oremap j gj
"oremap k gk
"oremap $ g$
"oremap 0 g0
" Remap vim window movements to be more economical "
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Enables color themes "
"if !has('gui_running')
" set t_Co=256
"endif
" Enable true colors support "
set termguicolors

" Automatically delete any trailing whitespace on buffer save "
autocmd BufWritePre * %s/\s\+$//e

" Keep lines folded on save
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END


" ALTRE COSE CHE DEVO ANCORA SETUPPARE
set spelllang=en,it
" I should set up dictionaries and thesauruses
set scroll=5
set smoothscroll
set scrolljump=1
set scrolloff=4
set scrollfocus
set title
set showmode
set ruler
" selecting text
" editing text
" Folding
" diff mode
" mapping
" reading and writing files
" the swap file
" command line editing
set wildmode=longest,list,full
" more about command autocompletion
" executing external commands
" running make and jumping to errors (quickfix)
" language specific
" multi-byte characters
" various

" Status Line Shenanigans?

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set laststatus=2
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\


call plug#begin()

Plug 'morhetz/gruvbox'

call plug#end()

" Set colorscheme "

autocmd vimenter * ++nested colorscheme gruvbox
set background=dark
