" BABY'S FIRST VIMRC
" basic config
set nocompatible
set number
set showcmd
set tabstop=2 softtabstop=2 shiftwidth=0 expandtab
set smartcase
set hlsearch
syntax enable
filetype plugin on

" change cursors on insert, replace, normal (iTerm2)
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" fuzzy find, ignore node_modules and .git
set path+=**
set wildmenu
set wildignore+=**/node_modules/**
set wildignore+=**/.git/**

" custom command to execute ctags
command! MakeTags !ctags -R --exclude=.git --exclude=node_modules --exclude=test .

" file browsing netrw
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view

" custom snippets
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" clear search highlighting with space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

