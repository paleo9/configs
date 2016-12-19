syntax enable
" 0 make symlink to .vim/vimrc
" ln -s ~/.vim/vimrc ~/.vimrc
" 1 Install vundle
"    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 2 use vundle to install plugins
"    :PluginInstall

" 3 Set colorscheme.
    " The terminal's colorscheme tends to override base16's colorschmes. Use
    " base16shell to set it in the bash shell instead, vim will then use it.
    " git clone https://github.com/chriskempson/base16-shell.git \
    " ~/.config/base16-shell
    " and add to bashrc the following:
    "   sh  ~/.config/base16-shell/scripts/base16-tomorrow-night.sh 
" Ack requires ack (ack-grep in debian)
" tagbar requires ctags
" ******** VUNDLE ********
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" vim-snippets        predefined snippets for UltiSnips
" ultisnips           snippets manager
" ctrlp               fuzzy search
" syntastic           syntax highlighting and linting

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree.git'
Plugin 'tpope/vim-surround'
Plugin 'mbbill/undotree'
Plugin 'easymotion/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/ShowMarks'

"Plugin 'sjl/gundo'
"Plugin 'tomtom/tlib_vim'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'digitaltoad/vim-pug'
"Plugin 'garbas/vim-snipmate'
"Plugin 'VundleVim/Vundle.vim'

call vundle#end()
filetype plugin indent on    " required
" ******** ULTISNIPS ********
" A snippet engine
" snippets are stored in ~/.vimrc/UltiSnips
" Example, to expand a snippet named left: in insert mode type
"    left <tab>
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:snips_author="Stephen Wardill"
au FileType php :UltiSnipsAddFiletypes php.html

" ******** CTRLP ********
" For a list of relevant files, hit ctrl-p. If the plugin is not installed
" correctly, ctrl-p will do standard vim text completion
" example, hit ctrl-p. A list of files appears. Enter any characters to narrow
" it down. Hit enter.
" All matching files will open, you can specify whether they will open in new
" tabs, windows or whatever by hitting ctl-o or ctrl-y.
let g:ctrlp_by_filename = 1  " search filename only, don't include path

syntax enable
" ***** Syntastic *****
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpmd', 'phpcs']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_jade_checkers = ['vim-pug']

" ******** NERDCOMMENTER ********
"all commands [count]<leader>c?
" cc        comment out lin:e
" cn        same as cc but enforces nesting
" cy        same as cc except lines are yanked first
" cl        same as cc but delimiter aligned on left side
" cb        same as cc but delimiter aligned both sides
" c<space>  toggle comment
" cu        uncomment
" ca        switch to alternate set
" ci        toggle each line individually (invert)
" cs        comment lines with pretty block format (sexy)
" cm        comment using only one set of multipart delimiters
" c$        comment from cursor to the end of the line
"

" ******** NERDTREE ********
" take a look at the docs, especially for *** BOOKMARKS *** 
map <C-n> :NERDTreeToggle<CR>

" ******** UNDOTREE or GUNDO ********
" undo timeline. Set key to f5
"nnoremap <F5> :UndotreeToggle<cr>j
nnoremap <F5> :UndotreeToggle<cr>j

" ******** BASE16 ********
"let g:base16colorspace=256

" ******** EASYMOTION ********
" default mapping \\<key>
" e.g. \\w show words, \\j show lines below

" ******** ACK ********
" FEDORA: need to install ack
" DEBIAN: need to install ack-grep
" find a word in all files, like grep for programmers
" ?    a quick summary of these keys, repeat to close
" o    to open (same as Enter)
" O    to open and close the quickfix window
" go   to preview file, open but maintain focus on ack.vim results
" t    to open in new tab
" T    to open in new tab without moving to it
" h    to open in horizontal split
" H    to open in horizontal split, keeping focus on the results
" v    to open in vertical split
" gv   to open in vertical split, keeping focus on the results
" q    to close the quickfix window"

" ******** TAGBAR ********
nmap <F8> :TagbarToggle<CR>

" ******** SHOWMARKS ********
" By default the following keymappings are defined:
   "\mt : Toggles ShowMarks on and off.
   "\mh : Hides an individual mark.
   "\ma : Hides all marks in the current buffer.
   "\mm : Places the next available mark."

" ******** MY SETTINGS ********
syntax enable
set history=1000
" ******** TABS ********
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set directory=$HOME/.vim/swapfiles//
set foldcolumn=2
set colorcolumn=80,120

" ******** KEY MAPPINGS ********
" characters to represent tab, end of line and spaces
set listchars=tab:+\ ,eol:$,space:.

nmap <leader>l :set list!<CR>
nmap <leader>a :set number!<CR>
nmap <leader>r :set relativenumber!<CR>

" ******** AUTOCORRECT ETC  ********
ia sow show
syntax enable

