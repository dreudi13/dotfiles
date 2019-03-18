"||||||||||||||||||||||||||||||||||||||||||||||||||||||
"
" vim configuration
"
"||||||||||||||||||||||||||||||||||||||||||||||||||||||
source $HOME/.dotfiles/config/vim/vim-configuration.vim

"||||||||||||||||||||||||||||||||||||||||||||||||||||||
"
" plugins configuration
"
" 1. nerdtree
" 2. airline
" 3. ctrlp
" 4. you complete me
" 5. tagbar
" 6. ultisnips
" 7. ctrlp
" 8. ctrlp
"
"||||||||||||||||||||||||||||||||||||||||||||||||||||||

" nerdtree ----------------------------------
source $HOME/.dotfiles/config/vim/nerdtree.vim


" airline -----------------------------------
source $HOME/.dotfiles/config/vim/airline.vim

" ctrlp -------------------------------------
source $HOME/.dotfiles/config/vim/ctrlp.vim

" you complete me ---------------------------
source $HOME/.dotfiles/config/vim/you-complete-me.vim

" tagbar ------------------------------------
source $HOME/.dotfiles/config/vim/tagbar.vim

" promptline --------------------------------
"let g:promptline_theme = 'jelly'

" ultisnips ---------------------------------
source $HOME/.dotfiles/config/vim/ultisnips.vim

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
" Expand class name
nmap <Leader>e :call phpactor#ClassExpand()<CR>
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
"let g:vcoolor_custom_picker = 'zenity --title '"custom"' --color-selection --show-palette --color '
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
let g:pdv_template_dir = $HOME."/.vim/bundle/pdv/templates_snip"
inoremap <buffer> <C-d> :call pdv#DocumentWithSnip()<CR>

"============================================
" easy align --------------------------------
"============================================
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
nmap g= gaip=<CR>

"============================================
" css color ---------------------------------
"============================================
let g:cssColorVimDoNotMessMyUpdatetime = 1
