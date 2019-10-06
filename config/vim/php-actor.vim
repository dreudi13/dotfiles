autocmd FileType php setlocal omnifunc=phpactor#Complete
let g:phpactorPhpBin = 'php'
let g:phpactorBranch = 'master'
let g:phpactorOmniError = v:true
let g:phpactorOmniAutoClassImport = v:true
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
vmap <silent><Leader>em :call phpactor#ExtractMethod()<CR>
" Extract expression from selection
vmap <silent><Leader>el :call phpactor#ExtractMethod(v:true)<CR>
" Invoke the navigation menu
nmap <Leader>h :call phpactor#Hover() <CR>

