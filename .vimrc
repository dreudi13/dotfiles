" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

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

"set background=light
colors Tomorrow-Night "gruvbox 
set t_Co=256

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
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

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

"============================================
" plugins
"============================================
"============================================
" ctrlp -------------------------------------
"============================================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
set wildignore+=*/tmp/*,*/vendor/*,*/node_modules/*,*.so,*.swp,*.zip,*/bower_components/*

"============================================
" airline -----------------------------------
"============================================
set laststatus=2
set ttimeoutlen=50
set guifont=Source\ Code\ Pro\ for\ Powerline:h15:cANSI
set guifont=Monaco\ 12
let g:airline_theme='luna'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"============================================
" promptline --------------------------------
"============================================
let g:promptline_theme = 'jelly'

"============================================
" nerdtree ----------------------------------
"============================================
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ "Unknown"   : "?"
            \ }

"============================================
" ultisnips ---------------------------------
"============================================
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsEditSplit="normal" 
let g:UltiSnipsSnippetsDir = "~/.vim/extensions/my-ultisnips/"
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"============================================
" you complete me ---------------------------
"============================================
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

"============================================
" tagbar ------------------------------------
"============================================
nmap <F8> :TagbarToggle<CR>

"============================================
" phpactor ----------------------------------
"============================================
" configuration
autocmd FileType php setlocal omnifunc=phpactor#Complete
let g:phpactorPhpBin = 'php'
let g:phpactorBranch = 'master'
let g:phpactorOmniError = v:true
" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>
" Invoke the context menu
nmap <F4> :call phpactor#ContextMenu()<CR>
" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>
" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>
" Transform the classes in the current file
nmap <F5> :call phpactor#Transform()<CR>
" Generate a new class (replacing the current file)
nmap <F3> :call phpactor#ClassNew()<CR>
" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
" Extract expression from selection
"vmap <silent><Leader>ee :<C-U>call phpactor#ExtractMethod(v:true)<CR>
" Invoke the navigation menu
nmap <Leader>h :call phpactor#Hover() <CR>

"============================================
" syntastic ---------------------------------
"============================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"============================================
" vcoolor -----------------------------------
"============================================
"let g:vcoolor_lowercase = 1
"let g:vcoolor_disable_mappings = 1
"let g:vcoolor_custom_picker = 'zenity --title "custom" --color-selection --show-palette --color '
"let g:vcoolor_map = '<C-c>'
"let g:vcool_ins_rgb_map = '<C-g>'        " Insert rgb color.
"let g:vcool_ins_hsl_map = '<C-s>'        " Insert hsl color.
"let g:vcool_ins_rgba_map = '<C-a>'        " Insert rgba color.

"============================================
" emmet -------------------------------------
"============================================
let g:user_emmet_leader_key='<C-e>'

"============================================
" pdv ---------------------------------------
"============================================
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip" 
nnoremap <buffer> <C-d> :call pdv#DocumentWithSnip()<CR>

"============================================
" easy align --------------------------------
"============================================
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
nmap g= gaip=<CR>

"============================================
" css color --------------------------------
"============================================
let g:cssColorVimDoNotMessMyUpdatetime = 1
