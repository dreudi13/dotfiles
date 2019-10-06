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
" 01. nerdtree
" 02. ctrlp
" 03. you complete me
" 04. tagbar
" 05. promptline
" 06. ultisnips
" 07. nerd commenter
" 08. airline
" 09. emmet
" 10. phpactor
" 11. syntastic
" 12. vcoolor
" 13. php documentor
" 14. easy align
" 15. css color
" 16. gitgutter
" 17. seyia
"
"||||||||||||||||||||||||||||||||||||||||||||||||||||||

" nerdtree ----------------------------------
source $HOME/.dotfiles/config/vim/nerdtree.vim

" ctrlp -------------------------------------
source $HOME/.dotfiles/config/vim/ctrlp.vim

" you complete me ---------------------------
source $HOME/.dotfiles/config/vim/you-complete-me.vim

" tagbar ------------------------------------
source $HOME/.dotfiles/config/vim/tagbar.vim

" promptline --------------------------------
let g:promptline_theme = 'jelly'

" ultisnips ---------------------------------
source $HOME/.dotfiles/config/vim/ultisnips.vim

" nerd commenter ----------------------------
source $HOME/.dotfiles/config/vim/nerdcommenter.vim

" airline -----------------------------------
source $HOME/.dotfiles/config/vim/airline.vim

" emmet -------------------------------------
source $HOME/.dotfiles/config/vim/emmet.vim

" phpactor ----------------------------------
source $HOME/.dotfiles/config/vim/php-actor.vim

" syntastic ---------------------------------
source $HOME/.dotfiles/config/vim/syntastic.vim

" vcoolor -----------------------------------
source $HOME/.dotfiles/config/vim/vcoolor.vim

" php documentor ---------------------------------------
source $HOME/.dotfiles/config/vim/php-documentor.vim

" easy align --------------------------------
source $HOME/.dotfiles/config/vim/easy-align.vim

" css color ---------------------------------
let g:cssColorVimDoNotMessMyUpdatetime = 1

" gitgutter ---------------------------------
let g:gitgutter_max_signis = 500 " default value

" seyia -------------------------------------
let g:seiya_auto_enable=1

" instant markdon ---------------------------
source $HOME/.dotfiles/config/vim/instant-markdown.vim

au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &
