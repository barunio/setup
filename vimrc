set nocompatible  " use Vim settings, rather then Vi settings

" set up vundle
set rtp+=~/.vim/bundle/vundle/ " add to run time path
call vundle#rc()

" let Vundle manage Vundle (required!)
Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'ervandew/supertab'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-repeat'
Bundle 'vim-scripts/tComment'
Bundle 'kchmck/vim-coffee-script'

set noswapfile
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set nobackup      " don't create annoying backup files
set nowritebackup " use normal save behavior (don't create temp files)
set history=200   " remember 200 lines of history
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " always display the status line
set autoindent    " copy previous line indentation on a new line
set showmode      " show current vim mode
set splitbelow    " horizontal split should go below
set splitright    " vertical split should to go the right
set nowrap        " no automatic line wrapping
set cc=80         " show a vertical line at 80 columns
syntax enable       " Enable syntax highlighting
filetype on         " Enable filetype detection
filetype indent on  " Enable filetype-specific indenting
filetype plugin on  " Enable filetype-specific plugins

let mapleader=","


" set color scheme to Solarized Dark
set background=dark
colorscheme solarized

" text files should wrap after 78 characters
autocmd FileType text setlocal textwidth=78

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Use Ag (Silver Searcher) instead of Ack (works w/ Ack.vim)
let g:ackprg = 'ag --nogroup --nocolor --column'

" Numbers
set number
set numberwidth=4

" Tab completion options
set wildmode=list:longest,list:full
set complete=.,w,t

" Specify a set of tags we want to auto-indent on.
let g:html_indent_tags = 'li\|p'

map <space> :
set guifont=Monaco:h12

if has("gui_macvim")
  let macvim_hig_shift_movement = 1
endif

cabbrev vimrc edit ~/.vimrc
cabbrev gvimrc edit ~/.gvimrc

" `cp` copies the current file's location to the clipboard
nmap cp :let @+ = expand('%:p')<CR>

function! CloseOrEmpty()
  let l:only_one_window = (winnr('$') == 1)
  let l:only_two_windows = (winnr('$') == 2)
  let l:is_nerd_tree_window = exists("b:NERDTreeType")
  let l:nerd_tree_exists = exists("t:NERDTreeBufName")

  if l:is_nerd_tree_window
    return
  elseif l:only_one_window
    execute 'bd'
  elseif l:only_two_windows && l:nerd_tree_exists
    execute 'bd'
  else
    execute 'q'
  end
endfunction

" delete trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
