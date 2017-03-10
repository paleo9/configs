syntax enable
" ******** Install Notes ********
" 0 make symlink to .vim/vimrc
" ln -s ~/.vim/vimrc ~/.vimrc
" 1 Install vundle
"    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 2 use vundle to install plugins
"    :PluginInstall

" 3 Set colorscheme.
" Use base16shell to set the colorscheme in the terminal and add its stuff to
" bashrc. Vim will pick up the colours.
" ******** VUNDLE ********
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" ******** Installed Plugins ********
Plugin 'VundleVim/Vundle.vim'
Plugin 'joonty/vdebug'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'mbbill/undotree'
Plugin 'scrooloose/nerdtree.git'
Plugin 'kshenoy/vim-signature'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
" Plugin 'scrooloose/nerdcommenter'
Plugin 'easymotion/vim-easymotion'
Plugin 'SirVer/ultisnips'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'Shougo/neocomplete.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdcommenter'
" ******** REJECTED PLUGINS ********
" Plugin 'chriskempson/base16-vim' use instead base16shell
" Plugin 'sjl/gundo' vundle doesn't work, use git (see project page)
" Plugin 'Valloric/YouCompleteMe' " needs make etc
" Plugin 'vim-scripts/ShowMarks' "problem
" Plugin 'tobyS/pdv' " not working, no docs, made vim slow

" ******** Plugins to check out ********
" foldsearch: folds verything except for lines relevant to your search term
" fugitive: git helper
" vim-gitgutter: shows git status in the gutter (status column)
call vundle#end()
filetype plugin indent on
" ******** MY SETTINGS ********
syntax enable
set history=1000
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

set listchars=tab:+\ ,eol:$,space:.
set directory=$HOME/.vim/swapfiles//
set backupdir=$HOME/.vim/backupdir//
if has("persistent_undo")
    set undodir=$HOME/.vim/undodir/
    set undofile
endif
set foldcolumn=2
set colorcolumn=80,120
set background=dark
" ******** AUTO ********
" remove trailing white spaces
" save folds
if has("autocmd")
    autocmd BufWritePre * :%s/\s\+$//e
    "autocmd BufWinLeave * mkview
    "autocmd BufWinEnter * silent loadview
endif

" ******** KEY MAPPINGS ********
" characters to represent tab, end of line and spaces

nmap <leader>l :set list!<CR>
nmap <leader>a :set number!<CR>
nmap <leader>r :set relativenumber!<CR>
imap ,, <ESC>:write<CR>

" ******** CtrlP ********
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" ******** NeoComplete ********
" Omni complete, requires ctags. Start typing a word, press tab to complete
" it.
let g:acp_enableAtStartup = 0
" Use neocomlplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
inoremap <C-f4> :NeoCompleteToggle

" ******** NerdCommenter ********
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1"

" ******** NerdTree ********

" ******** Nerdtree ********
map <C-n> :NERDTreeToggle<CR>

" ******** Syntastic ********

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args='--standard=PSR2'

" ******** Tagbar ********
nmap <C-F8> :TagbarToggle<CR>

" ******** UltiSnips ********
let g:UltiSnipsExpandTrigger="<c-f6>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:snips_author="Stephen Wardill <s5n.wardill@gmail.com>"
" ******** UndoTree ********
nnoremap <C-F5> :UndotreeToggle<cr>

" ******** vdebug ********
" using defaults

" ******** vim-airline ********
" using defaults

" ******** vim-easymotion ********

" ******** vim-fugitive ********
" ******** vim-signature ********
" show marks in the gutter.
map <C-m> :SignatureToggle<CR>

" ******** vim-snippets ********

" ******** vim-surround ********

" ******** vim-mustache ********

" ******** vundle ********

" ******** FUNCTIONS ********
" Show syntax highlighting groups for word under cursor
nmap <C-S-L> :call <sid>SynStack()<cr>
function! <sid>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" ******** AUTOCORRECT ETC  ********
ia sow show
syntax enable
" ******** GUI SETTINGS ********

" macros worth keeping
" @f fold phpdoc comments to show @method line only
" find //**  | down to @method | mark ' | find */ | fold to mark '
"let @f='/\/\*\*^Mjm\'/\*\/^Mzf\'\''

