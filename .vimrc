     " Note: Skip initialization for vim-tiny or vim-small.
     if 0 | endif

     if &compatible
       set nocompatible               " Be iMproved
     endif

     " Required:
     set runtimepath+=~/.vim/bundle/neobundle.vim/

     " Required:
     call neobundle#begin(expand('~/.vim/bundle/'))

     " Let NeoBundle manage NeoBundle
     " Required:
     NeoBundleFetch 'Shougo/neobundle.vim'

     " My Bundles here:
     " Refer to |:NeoBundle-examples|.
     NeoBundle 'jacoborus/tender.vim'
     " Note: You don't set neobundle setting in .gvimrc!

     call neobundle#end()

     " Required:
     filetype plugin indent on

     " If there are uninstalled bundles found on startup,
     " this will conveniently prompt you to install them.
     NeoBundleCheck


set number

colorscheme elflord 
syntax on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set title

augroup fileTypeIndent
	autocmd!
	autocmd BufNewFile, BufRead *.cpp setlocal set expandtab
	autocmd BufNewFile, BufRead *.c setlocal set expandtab
	autocmd BufNewFile, BufRead *.hpp setlocal set expandtab
	autocmd BufNewFile, BufRead *.h setlocal set expandtab
augroup END


set noswapfile
set ambiwidth=double

set autoread
