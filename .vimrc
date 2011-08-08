set number
set shiftwidth=4
set tabstop=4
set expandtab
set fdm=indent
map ^] g]
autocmd BufEnter *.bsh set filetype=javascript
set hidden
au FileType * exe('setl dict+='.$VIMRUNTIME.'/syntax/'.&filetype.'.vim')
au FileType make exe('set noexpandtab | set list') 

