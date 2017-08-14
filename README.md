# Configs

Personalised config files.

## i3 Window Manager
Direction key mappings vimified
S-F1 gvim
S-F2 firefox
S-F3 thunderbird

##

## vimrc
Plugin choice is now fairly stable, may add 'fugitive' git capabilities.
Vundle.vim
vdebug
base16-vim
tagbar
ack.vim
undotree
nerdtree.git
vim-signature
vim-surround
vim-airline
nerdcommenter
vim-easymotion
ultisnips
ctrlp.vim
syntastic
neocomplete.vim
vim-fugitive
vim-snippets

### Plugin Installation
0. if using a Debian based distro, install vim-nox to provide scripting language support, namely lua and python
1. move vimrc to ~/.vim/vimrc
2. create a symlink to vimrc "ln -s ~/.vim/vimrc ~/.vimrc".
3. get base16-shell and add a line to .bashrc to run your preferred script in base16-shell/scripts
4. check vim has python :echo has('python') should be 1 for your default user (may need to try 'python2' or 'python3')
5. mkdir .vim/swapfiles
6. install vundle (git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim)
7. start vim and do :PluginInstall
