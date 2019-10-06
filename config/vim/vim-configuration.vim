"============================================
" configuration -----------------------------
"============================================
execute pathogen#infect()
set nocompatible "Bye Vi :)!
set wildmode=list:full
set wildmenu

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
"runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

syntax on

set background=dark
set t_Co=256
" let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme gruvbox

" watch for changes in your .vimrc and automatically reload the config.
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
    filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set autowrite       " Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned
set mouse=a         " Enable mouse usage (all modes)

" Easier buffer switching
"set wildchar=<Tab> wildmenu wildmode=full
"set wildcharm=<C-Z>
"nnoremap <Tab> :b <C-Z>
" nnoremap <C><Right-Arrow> :wl <CR>

function! BufSel(pattern)
    let bufcount = bufnr("$")
    let currbufnr = 1
    let nummatches = 0
    let firstmatchingbufnr = 0
    while currbufnr <= bufcount
        if(bufexists(currbufnr))
            let currbufname = bufname(currbufnr)
            if(match(currbufname, a:pattern) > -1)
                echo currbufnr . ": ". bufname(currbufnr)
                let nummatches += 1
                let firstmatchingbufnr = currbufnr
            endif
        endif
        let currbufnr = currbufnr + 1
    endwhile
    if(nummatches == 1)
        execute ":buffer ". firstmatchingbufnr
    elseif(nummatches > 1)
        let desiredbufnr = input("Enter buffer number: ")
        if(strlen(desiredbufnr) != 0)
            execute ":buffer ". desiredbufnr
        endif
    else
        echo "No matching buffers"
    endif
endfunction

nnoremap <c-w> :Kwbd<cr>

nnoremap <c-Right> :bn<cr>
nnoremap <c-Left> :bp<cr>

"Bind the BufSel() function to a user-command
command! -nargs=1 Bs :call BufSel("<args>")

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif

" Tab Settings
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set smartindent
set autoindent

" folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Set to autoread when a file is changed from the outside
set autoread

syntax enable
filetype plugin on
filetype plugin indent on

set omnifunc=syntaxcomplete#Complete
set number
set relativenumber

let mapleader = ","
set nobackup
set noswapfile

" Navigate by display line
noremap j gj
noremap k gk

" Switch display split
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

