" BABY'S FIRST VIMRC
" basic config
set nocompatible
set number
set showcmd
set tabstop=2 softtabstop=2 shiftwidth=0 expandtab
set autoindent
set copyindent
set smartcase
set incsearch
set hlsearch
syntax enable
filetype plugin on
set background=dark
set t_Co=256
set number relativenumber
set colorcolumn=120

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" statusline
set laststatus=2
set statusline=%#StatusLineNC#
set statusline+=\ %f%m
set statusline+=\ %y
set statusline+=%=
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %l:%c
set statusline+=\ 

" change cursors on insert, replace, normal (iTerm2)
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" change cursors on insert, repalce, normal (tmux in iTerm2)
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" fuzzy find, ignore node_modules and .git
set path+=**
set wildmenu
set wildignore+=**/node_modules/**,**/.git/**,*/tmp/*,*.so,*.swp,*.zip,*.pyc

" custom command to execute ctags
command! MakeTags !ctags -R --exclude=.git --exclude=node_modules --exclude=test .

" file browsing netrw
let g:netrw_banner    = 0 " disable annoying banner
let g:netrw_preview   = 1 " display preview with p in v split
let g:netrw_liststyle = 3 " tree display
let g:netrw_winsize   = 20 " 20 percent file browser when preview open
let g:netrw_list_hide = '**/node_modules/**' " dont index node_modules

" custom snippets
nnoremap ,cl :-1read $HOME/.vim/snippets/js/console_log.js.snippet<CR>%i
nnoremap ,pr :-1read $HOME/.vim/snippets/py/print.py.snippet<CR>%i

" ctrl p fuzzy find
nnoremap <C-p> :find */

" Set the :make cmd
"set makeprg=bin/test

" clear search highlighting with space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" list buffers with F5
nnoremap <F5> :buffers<CR>:buffer<Space>
" buffer shortcuts
map bn :bn<cr>
map bp :bp<cr>
map bd :bd<cr>

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale' " linter
Plug 'tpope/vim-commentary' " quick commenting out line
Plug 'tpope/vim-surround' " surround text
Plug 'NLKNguyen/papercolor-theme'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" Plugin config
colorscheme PaperColor
nmap <silent> \aj :ALENext<cr>
nmap <silent> \ak :ALEPrevious<cr>

" OTHER PLUGINS
" Plug 'kien/ctrlp.vim' " fuzzy finder for files
" Plug 'scrooloose/nerdtree' " tree view of project structure
" Plug 'bling/vim-bufferline' " list of buffers at bottom
" Plug 'isRuslan/vim-es6' " es6 syntax support
" Plug 'numirias/semshi', { 'do': 'UpdateRemotePlugins' } " python syntax highlighting
" Plug 'mxw/vim-jsx' " .jsx syntax support
" Plug 'ervandew/supertab' " tab autocompletion
