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
set maxmempattern=5000

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
" clear buffer and move to next available buffer
command Bd bp | sp | bn | bd

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale' " linter
Plug 'tpope/vim-commentary' " quick commenting out line
Plug 'tpope/vim-surround' " surround text
Plug 'NLKNguyen/papercolor-theme' " good theme with clear syntax highlighting
Plug 'dracula/vim', { 'as': 'dracula' } "cool theme, but not sure how to get to have good syntax highlighting
Plug 'leafgarland/typescript-vim' " typescript tools
Plug 'pangloss/vim-javascript' " better javascript syntax
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " go tools
Plug 'jparise/vim-graphql' " gql syntax
Plug 'prettier/vim-prettier' " prettier for vim
call plug#end()

" Plugin config
colorscheme PaperColor
nmap <silent> \aj :ALENext<cr>
nmap <silent> \ak :ALEPrevious<cr>

" configure go:
let g:go_fmt_command = "goimports"
autocmd FileType go setlocal tabstop=2|setlocal shiftwidth=2|setlocal softtabstop=2|setlocal noexpandtab
autocmd FileType go compiler go
au FileType go nmap gd <Plug>(go-def)

" prettier autosave
let g:prettier#autoformat = 0
let g:prettier#config#arrow_parens = 'avoid'
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.graphql,*.md Prettier

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" optional go syntax highlighting options
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let b:ale_linters = ['govet', 'gofmt', 'tsserver', 'eslint']
